
# Getting and Cleaning Data - course project

--------------------------------------------------------------------
## Submitted files

The submission consists of the following files. 

- run_analysis.R (R script for the assignment)
- README.txt (this file)
- Copybook.txt (provides description of teh otput)

--------------------------------------------------------------------
## Files needed for running the program

All file locations are relative to the current working directory.

- run_analysis.R

Additional files expected to be available for this program to work
(these are from the original data that were part of teh problem statement)

- features.txt (for seed column names)
- test\subject_test.txt
- test\y_test.txt
- test\X_test.txt
- train\subject_train.txt
- train\y_train.txt
- train\X_train.txt

--------------------------------------------------------------------
## Running the program

- please ensure all files above are available
- start R
- set working directory
- source("run_analysis.R")
- run_analysis()

--------------------------------------------------------------------
## Some notes on what the program does

- The script produces a wide output of 180 rows and 81 columns.
  - 180 rows: 30 subjects * 6 activities)
  - the output is a normalized value in the range [-1, 1]
- The first 2 columns are the subject_id and activity_name.
- The remaining 79 columns contain mean values of the observations for (subject, activity).
- The output (outputfile.txt) was uploaded to the coursera page.

--------------------------------------------------------------------
**Based on**
Human Activity Recognition Using Smartphones Dataset
version 1.0

--------------------------------------------------------------------
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

**Acknowledgments**
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

--------------------------------------------------------------------


