data_source="C:/Users/frank/Desktop/SETS_Workload/SETs_monthly_registration_revist_trends_04022020.xlsx"

setwd("C:/Users/frank/Desktop/SETS_Workload");

generate_restricted_range <- function(data_source,sheet_name,specified_range,facility_mfl)
{
  library(readxl)
  output_data <- read_excel(data_source, sheet = sheet_name, range = specified_range)
  output_data$facility_mfl <- rep(facility_mfl,nrow(output_data)) # make new column
  row.names(visit_data) <- NULL
  ResultantFileName <- paste("output_data_",facility_mfl,".csv",sep="")
  write.csv(output_data,ResultantFileName,row.names = F);
}

generate_restricted_range(data_source,"SETs_monthly_trends_2019","B68:M81",13533)