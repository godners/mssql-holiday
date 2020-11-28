CREATE DATABASE [holiday]
USE [holiday]

CREATE TABLE [dbo].[t_specday](
	[c_id] [int] NOT NULL,
	[c_date] [date] NOT NULL,
	[c_holiday] [bit] NOT NULL,
	CONSTRAINT [PK_specday_id] 
		PRIMARY KEY CLUSTERED ([c_id] ASC)
)

ALTER TABLE [dbo].[t_specday] 
	ADD CONSTRAINT [UQ_specday_holiday]
		UNIQUE NONCLUSTERED ([c_date] ASC)


CREATE FUNCTION [dbo].[is_holiday] (@p_date DATE)
RETURNS BIT AS BEGIN	
	DECLARE @v_oup BIT = 0
	DECLARE @v_tmp INT
	SET @v_tmp = DATEPART(WEEKDAY, @p_date)
	IF @v_tmp IN (1, 7) SET @v_oup = 1
	SELECT @v_tmp = COUNT(1) FROM t_specday WHERE c_date = @p_date
	IF @v_tmp = 1 SELECT @v_oup = c_holiday FROM t_specday WHERE c_date = @p_date
	RETURN @v_oup
END


