---
title: "Getting and Cleaning Data Course Project"
author: "Romi Kuntsman"
date: "08/23/2014"
output: html_document
---

# Code Book

1. Subject
2. Activity
3. Time Body Acceleration Magnitude Mean
4. Time Body Acceleration Magnitude StdDev
5. Time Gravity Acceleration Magnitude Mean
6. Time Gravity Acceleration Magnitude StdDev
7. Time Body Acceleration Jerk Magnitude Mean
8. Time Body Acceleration Jerk Magnitude StdDev
9. Time Body Gyroscope Magnitude Mean
10. Time Body Gyroscope Magnitude StdDev
11. Time Body Gyroscope Jerk Magnitude Mean
12. Time Body Gyroscope Jerk Magnitude StdDev
13. Freq Body Acceleration Magnitude Mean
14. Freq Body Acceleration Magnitude StdDev
15. Freq Body Body Acceleration Jerk Magnitude Mean
16. Freq Body Body Acceleration Jerk Magnitude StdDev
17. Freq Body Body Gyroscope Magnitude Mean
18. Freq Body Body Gyroscope Magnitude StdDev
19. Freq Body Body Gyroscope Jerk Magnitude Mean
20. Freq Body Body Gyroscope Jerk Magnitude StdDev

## Variables
* **1**: Subject - participant number from 1 to 30
* **2**: Activity during measurement, one of: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
* **3-20**: Average of measurements per subject and activity

# Instruction List

1. Load activity labels, subjects, features, measurements and activities
2. Make the feature names more readable
3. Filter out only Mean and StdDev featurees
4. Get activity names instead of id
5. Merge activity names, subjects and measurements data
6. Calculate mean, grouped by Subject and Activity
7. Sort dataset by Subject and Activity
8. Write result to data_sum.txt
