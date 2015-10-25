#Getting and Cleaning Data Course Poject

This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

Downloads the dataset in the working directory
Reads each of the relevant files using read.table, assigns the column labels to the associated data, and merges them. 
Extracts data that includes only means and stds by using the grep function
Regenerates the overall data set with the desired columns.   
Reads the activity lables and assign the activity names to the data set based on on the activity value. 
Renames the columns so that each is descriptive
Creates a tidy data set by turning the data set into a data table 
