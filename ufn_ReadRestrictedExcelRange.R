#define data source and working directory as constant variables
data_source="C:/Users/frank/Desktop/SETS_Workload/SETs_monthly_registration_revist_trends_04022020.xlsx"
setwd("C:/Users/frank/Desktop/SETS_Workload");

#define a function called generate_restricted_range
generate_restricted_range <- function(data_source,sheet_name,specified_range,facility_mfl)
{
  #Call the library that reads Excel files
  library(readxl)
  output_data <- read_excel(data_source, sheet = sheet_name, range = specified_range)
  # make new column pre-populated with the current facility mflcode
  output_data$facility_mfl <- rep(facility_mfl,nrow(output_data)) 
  #get rid of the auto-numbered column name native in data frames
  row.names(output_data) <- NULL
  #dynamically define the name of the output file
  ResultantFileName <- paste("output_data_",facility_mfl,".csv",sep="")
  #output the final data frame to CSV
  write.csv(output_data,ResultantFileName,row.names = F);
}

#call the function above with dynamic parameters
generate_restricted_range(data_source,"SETs_monthly_trends_2019","B68:M81",13533)