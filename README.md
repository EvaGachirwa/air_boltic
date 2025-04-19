## Raw Data
The raw data has been downloaded from the shared files online into the data folder.
This is with the assumption that authentication against google drive is not necessary. I would expect the datasets would be in S3 and can be read through python in databricks or other interface.
## Data Exploration
The python notebooks were used for data exploration. This is to ensure that data can be read as expected using standard libraries.
The exploration identifies:
- Data inconsistencies that should be cleared. E.g Some customers are missing customer groups. In this case one can decide to fix the null values or ignore the column when performing analytics. There is also a customer_group_id 10 in customer table but that id doesnt exist as a primary key in customer-group table
- Understanding data ingestion, some datasets are in json file and other in csv files, this influences how the data is read.
## Extract
In ELT folder an extract file is added to extract data from the various sources including the csvs and json file
## Load
The data is then loaded into an sqlite database. Choosing Sqlite database was done because this is a development environment. It is also a quick solution to demostrate skills in handling structured data. In a production environment I would consider using a datawarehouse e.g. Bigquery or Snowflake. I would also bulk load the data using csv dump and/or json dump to save on memory space to process data, bulk load would also minimise the amount of inserts into the database, saving on cost.