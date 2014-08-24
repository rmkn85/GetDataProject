require(plyr)
require(data.table)

beautifyFeatureName <- function (featureName) {
  featureName <- sub("\\(\\)$","", featureName)
  featureName <- sub("-mean$","Mean", featureName)
  featureName <- sub("-std$","StdDev", featureName)
  featureName <- sub("^t","Time ", featureName)
  featureName <- sub("^f","Freq ", featureName)
  featureName <- sub("BodyBody","Body Body ", featureName)
  featureName <- sub("Body","Body ", featureName)
  featureName <- sub("Gravity","Gravity ", featureName)
  featureName <- sub("Jerk","Jerk ", featureName)
  featureName <- sub("Acc","Acceleration ", featureName)
  featureName <- sub("Gyro","Gyroscope ", featureName)
  featureName <- sub("Mag","Magnitude ", featureName)
  return(featureName);
}

# load data
if (!exists("experiment_dt")) {
  # read raw data
  activity_labels = read.table("./activity_labels.txt", col.names = c("activity_id", "activity_label"))
  subjects = rbind(read.table("./test/subject_test.txt", col.names=c("Subject")),
                   read.table("./train/subject_train.txt", col.names=c("Subject")))
  features = read.table("./features.txt", col.names = c("feature_id", "feature_name"))
  measurements = rbind(read.table("./test/X_test.txt"), read.table("./train/X_train.txt"))  
  activities = rbind(read.table("./test/y_test.txt", col.names = c("activity_id")),
                 read.table("./train/y_train.txt", col.names = c("activity_id")))  
  
  # make nice feature names and assign to measurement columns
  features$feature_name_pretty = beautifyFeatureName(features$feature_name)
  colnames(measurements) <- features$feature_name_pretty
  
  # filter just mean and std columns from measurements
  features_choice = grep(" Mean$| StdDev$", features$feature_name_pretty)
  feautures_selected = features[features_choice,]
  measurements_selected_features = measurements[,features_choice]
  
  # get activity names instead of id
  activities_named = subset(join(activities, activity_labels, by="activity_id", type="left", match="all"), select=c("activity_label"))
  colnames(activities_named) = c("Activity")
  
  # bind columns together
  experiment_dt = data.table(cbind(subjects, activities_named, measurements_selected_features))
}

# calculate mean, grouped by subject and activity
data_sum = experiment_dt[, lapply(.SD, mean), by=c("Subject", "Activity")]

# sort final data
data_sum_sort <- data_sum[order(Subject, Activity),]

# output data
write.table(data_sum_sort, file="data_sum.txt", row.names = FALSE)
