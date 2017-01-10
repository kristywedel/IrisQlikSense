##Overview
The IrisApp.qvf calls a batch file that runs an R script. The R script loads the iris data set from a the iris.csv file. The data is split into training, testing and validation sets. A random forest model is used to predict the species from the data. The predictions of the validation set are appended to the validation data set and exported to a csv.

##Installation Steps
1.) To allow the use of absolute or relative file paths, enable legacy mode by modifying  

    Open C:\Users\{user}\Documents\Qlik\Sense\Settings.ini in a text editor
    Change StandardReload=1 to StandardReload=0
    Save the file and start Qlik Sense Desktop, which will run in legacy mode

If you don't wish to enable legacy mode, change the paths in the data load editor to use a library.

2.) To allow the execute command and run the R file, modify the settings.ini file as follows 

    Open C:\Users\{user}\Documents\Qlik\Sense\Settings.ini in a text editor
    Insert a new line and type OverrideScriptSecurity=1
	Insert an empty line at the end of the file
    Save the file and start Qlik Sense Desktop

3.) Unzip to desired location.

