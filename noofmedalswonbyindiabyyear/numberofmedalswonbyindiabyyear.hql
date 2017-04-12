-- create a database custom
create database custom;

-- entering to database custom
use custom;

-- create table OLYMPIC
create table olympic 
(athlete string,age int,country string,year int,closingdate date,sport string,goldmedals int,silvermedals int,bronzemedals int, totalmedals int)
row format serde 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties (
"separatorChar"="\t","quoteChar" = "'","escapeChar" ="\\"
) stored as textfile;

create table olympic 
(athlete string,age int,country string,year int,closingdate date,sport string,goldmedals int,silvermedals int,bronzemedals int, totalmedals int)
row format serde 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
stored as textfile;

-- load data into OLYMPIC
load data local inpath '/home/acadgild/Downloads/olympix_data.csv' into table olympic;


-- no of medals won by india by year

select country,year,sum(goldmedals+silvermedals+bronzemedals) from olympic where country = 'India' group by year,country;
