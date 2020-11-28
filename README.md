A MS-SQL Schema of Holiday Check

[Install & Import]
    It is run on Microsoft SQL Server 2019 for Linux.
    1. Run the schema.sql to install the schema
    2. Run the spec_20xx.sql to import the special day. the '20xx' is which year will import.

[Usage]
    For check the day of holiday, run this SQL command:
    EXECUTE [holiday].[dbo].[is_holiday] (@p_date DATE) 
    The @p_date is a parameter typed as DATE which you will check.
    The function will return: 1 for holiday or weekend, 0 of workingday.
