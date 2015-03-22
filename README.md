# "getdata" course project #
course project for "Getting And Cleaning Data" course.

## repo structure: ##

1. **run_analisys.r**

	- **merge.UCI.HAR()**

		main function that creates merged test and train dataframe
	- **getDFofMeans(total)**
	
		input: total - dataframe, as returned by *merge.UCI.HAR()*
		
		output: Dataframe with the average value of each variable for each couple of (activity, subject)	 

2. **totalMean.txt**

	dataframe created by *getDFofMeans(total)*

3. **codebook.md**

	discription on transformations made by *run_analisys.r* on the source files
