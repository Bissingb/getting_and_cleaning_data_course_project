#Getting and Cleaning Data Course Poject

This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

1. Downloads the dataset in the working directory
2. Reads each of the relevant files using read.table, assigns the column labels to the associated data, and merges them. 
3. Extracts data that includes only means and stds by using the grep function
4. Regenerates the overall data set with the desired columns.   
5. Reads the activity lables and assign the activity names to the data set based on on the activity value. 
7. Renames the columns so that each is descriptive
8. Creates a tidy data set by turning the data set into a data table 
