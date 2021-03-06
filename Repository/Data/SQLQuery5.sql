USE [test2]
GO
/****** Object:  DatabaseRole [aspnet_Membership_BasicAccess]    Script Date: 29-09-2017 13:36:50 ******/
CREATE ROLE [aspnet_Membership_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_FullAccess]    Script Date: 29-09-2017 13:36:50 ******/
CREATE ROLE [aspnet_Membership_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_ReportingAccess]    Script Date: 29-09-2017 13:36:50 ******/
CREATE ROLE [aspnet_Membership_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_BasicAccess]    Script Date: 29-09-2017 13:36:50 ******/
CREATE ROLE [aspnet_Personalization_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_FullAccess]    Script Date: 29-09-2017 13:36:50 ******/
CREATE ROLE [aspnet_Personalization_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_ReportingAccess]    Script Date: 29-09-2017 13:36:50 ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_BasicAccess]    Script Date: 29-09-2017 13:36:50 ******/
CREATE ROLE [aspnet_Profile_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_FullAccess]    Script Date: 29-09-2017 13:36:50 ******/
CREATE ROLE [aspnet_Profile_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_ReportingAccess]    Script Date: 29-09-2017 13:36:50 ******/
CREATE ROLE [aspnet_Profile_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_BasicAccess]    Script Date: 29-09-2017 13:36:50 ******/
CREATE ROLE [aspnet_Roles_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_FullAccess]    Script Date: 29-09-2017 13:36:50 ******/
CREATE ROLE [aspnet_Roles_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_ReportingAccess]    Script Date: 29-09-2017 13:36:50 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_WebEvent_FullAccess]    Script Date: 29-09-2017 13:36:50 ******/
CREATE ROLE [aspnet_WebEvent_FullAccess]
GO
ALTER ROLE [aspnet_Membership_ReportingAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
ALTER ROLE [aspnet_Membership_BasicAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_ReportingAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_BasicAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Profile_ReportingAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Profile_BasicAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Roles_ReportingAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Roles_BasicAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 29-09-2017 13:36:51 ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 29-09-2017 13:36:51 ******/
CREATE SCHEMA [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 29-09-2017 13:36:51 ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 29-09-2017 13:36:51 ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 29-09-2017 13:36:51 ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 29-09-2017 13:36:51 ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 29-09-2017 13:36:51 ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 29-09-2017 13:36:51 ******/
CREATE SCHEMA [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 29-09-2017 13:36:51 ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 29-09-2017 13:36:51 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 29-09-2017 13:36:51 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 29-09-2017 13:36:51 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 29-09-2017 13:36:51 ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess]
GO
/****** Object:  UserDefinedFunction [dbo].[createInsertSP]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[createInsertSP]
(
 @spSchema varchar(200), -- desired schema
 @spTable varchar(200) -- desired table
)
RETURNS varchar(max)
AS
BEGIN

 declare @SQL_DROP varchar(max)
 declare @SQL varchar(max)
 declare @COLUMNS varchar(max)
 declare @PK_COLUMN varchar(200)

 set @SQL = ''
 set @SQL_DROP = ''
 set @COLUMNS = ''

 -- step 1: generate the drop statement and then the create statement
 set @SQL_DROP = @SQL_DROP + 'IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[' + @spSchema + '].[insert' + @spTable + ']'') AND type in (N''P'', N''PC''))' + char(13)
 set @SQL_DROP = @SQL_DROP + 'DROP PROCEDURE [' + @spSchema + '].[insert' + @spTable + ']'

 set @SQL = @SQL + 'CREATE PROC [' + @spSchema + '].[insert' + @spTable + ']' + char(13)
 set @SQL = @SQL + '(' + char(13)

 -- step 2: ascertain what the primary key column for the table is
 set @PK_COLUMN = 
 (
 select c.column_name
 from information_schema.table_constraints pk 
 inner join information_schema.key_column_usage c 
 on c.table_name = pk.table_name 
 and c.constraint_name = pk.constraint_name
 where pk.TABLE_SCHEMA = @spSchema
 and pk.TABLE_NAME = @spTable
 and pk.constraint_type = 'primary key'
 and c.column_name in
 (
 select COLUMN_NAME
 from INFORMATION_SCHEMA.COLUMNS
 where columnproperty(object_id(quotename(@spSchema) + '.' + 
 quotename(@spTable)), COLUMN_NAME, 'IsIdentity') = 1 -- ensure the primary key is an identity column
 group by COLUMN_NAME
 )
 group by column_name
 having COUNT(column_name) = 1 -- ensure there is only one primary key
 )

 -- step 3: now put all the table columns in bar the primary key (as this is an insert and it is an identity column)
 select @COLUMNS = @COLUMNS + '@' + COLUMN_NAME 
 + ' as ' 
 + (case DATA_TYPE when 'numeric' then DATA_TYPE + '(' + convert(varchar(10), NUMERIC_PRECISION) + ',' + convert(varchar(10), NUMERIC_SCALE) + ')' else DATA_TYPE end)
 + (case when CHARACTER_MAXIMUM_LENGTH is not null then '(' + case when CONVERT(varchar(10), CHARACTER_MAXIMUM_LENGTH) = '-1' then 'max' else CONVERT(varchar(10), CHARACTER_MAXIMUM_LENGTH) end + ')' else '' end)
 + (case 
 when IS_NULLABLE = 'YES'
 then
 case when COLUMN_DEFAULT is null
 then ' = Null'
 else ''
 end
 else
 case when COLUMN_DEFAULT is null
 then ''
 else
 case when COLUMN_NAME = @PK_COLUMN
 then ''
 else ' = ' + replace(replace(COLUMN_DEFAULT, '(', ''), ')', '')
 end
 end
 end)
 + ',' + char(13) 
 from INFORMATION_SCHEMA.COLUMNS
 where TABLE_SCHEMA = @spSchema 
 and TABLE_NAME = @spTable
 and COLUMN_NAME <> @PK_COLUMN
 order by ORDINAL_POSITION

 set @SQL = @SQL + left(@COLUMNS, len(@COLUMNS) - 2) + char(13)

 set @SQL = @SQL + ')' + char(13)
 set @SQL = @SQL + 'AS' + char(13)
 set @SQL = @SQL + '' + char(13)

 -- step 4: add a modifications section
 set @SQL = @SQL + '-- Author: Auto' + char(13)
 set @SQL = @SQL + '-- Created: ' + convert(varchar(11), getdate(), 106) + char(13)
 set @SQL = @SQL + '-- Function: Inserts a ' + @spSchema + '.' + @spTable + ' table record' + char(13)
 set @SQL = @SQL + '' + char(13)
 set @SQL = @SQL + '-- Modifications:' + char(13)
 set @SQL = @SQL + '' + char(13)

 -- body here

 -- step 5: begins a transaction
 set @SQL = @SQL + 'begin transaction' + char(13) + char(13)

 -- step 6: begin a try
 set @SQL = @SQL + 'begin try' + char(13) + char(13) 

 set @SQL = @SQL + '-- insert' + char(13)

 -- step 7: code the insert
 set @COLUMNS = ''

 select @COLUMNS = @COLUMNS + '@' + COLUMN_NAME + ','
 from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = @spTable
 and COLUMN_NAME <> @PK_COLUMN
 order by ORDINAL_POSITION

 set @COLUMNS = left(@COLUMNS, len(@COLUMNS) -1) -- trim off the last comma

 set @SQL = @SQL + 'insert [' + @spSchema + '].[' + @spTable + '] (' + replace(@COLUMNS, '@', '') + ')' + char(13)
 set @SQL = @SQL + 'values (' + @COLUMNS + ')' + char(13)
 set @SQL = @SQL + char(13) + char(13)
 set @SQL = @SQL + '-- Return the new ID' + char(13)
 set @SQL = @SQL + 'select SCOPE_IDENTITY();' + char(13) + char(13)

 -- step 8: commit the transaction
 set @SQL = @SQL + 'commit transaction' + char(13) + char(13)

 -- step 9: end the try
 set @SQL = @SQL + 'end try' + char(13) + char(13)

 -- step 10: begin a catch
 set @SQL = @SQL + 'begin catch' + char(13) + char(13) 

 -- step 11: raise the error
 set @SQL = @SQL + ' declare @ErrorMessage NVARCHAR(4000);' + char(13)
 set @SQL = @SQL + ' declare @ErrorSeverity INT;' + char(13)
 set @SQL = @SQL + ' declare @ErrorState INT;' + char(13) + char(13)
 set @SQL = @SQL + ' select @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();' + char(13) + char(13)
 set @SQL = @SQL + ' raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);' + char(13) + char(13)
 set @SQL = @SQL + ' rollback transaction' + char(13) + char(13)

 -- step 11: end the catch
 set @SQL = @SQL + 'end catch;' + char(13) + char(13)

 -- step 12: return both the drop and create statements
 RETURN @SQL_DROP + '||' + @SQL

END
GO
/****** Object:  UserDefinedFunction [dbo].[fnCleanDefaultValue]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnCleanDefaultValue](@sDefaultValue varchar(4000))
RETURNS varchar(4000)
AS
BEGIN
	RETURN SubString(@sDefaultValue, 2, DataLength(@sDefaultValue)-2)
END



GO
/****** Object:  UserDefinedFunction [dbo].[fnColumnDefault]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnColumnDefault](@sTableName varchar(128), @sColumnName varchar(128))
RETURNS varchar(4000)
AS
BEGIN
	DECLARE @sDefaultValue varchar(4000)

	SELECT	@sDefaultValue = dbo.fnCleanDefaultValue(COLUMN_DEFAULT)
	FROM	INFORMATION_SCHEMA.COLUMNS
	WHERE	TABLE_NAME = @sTableName
	 AND 	COLUMN_NAME = @sColumnName

	RETURN 	@sDefaultValue

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsColumnPrimaryKey]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE   FUNCTION [dbo].[fnIsColumnPrimaryKey](@sTableName varchar(128), @nColumnName varchar(128))
RETURNS bit
AS
BEGIN
	DECLARE @nTableID int,
		@nIndexID int,
		@i int
	
	SET 	@nTableID = OBJECT_ID(@sTableName)
	
	SELECT 	@nIndexID = indid
	FROM 	sysindexes
	WHERE 	id = @nTableID
	 AND 	indid BETWEEN 1 And 254 
	 AND 	(status & 2048) = 2048
	
	IF @nIndexID Is Null
		RETURN 0
	
	IF @nColumnName IN
		(SELECT sc.[name]
		FROM 	sysindexkeys sik
			INNER JOIN syscolumns sc ON sik.id = sc.id AND sik.colid = sc.colid
		WHERE 	sik.id = @nTableID
		 AND 	sik.indid = @nIndexID)
	 BEGIN
		RETURN 1
	 END


	RETURN 0
END







GO
/****** Object:  UserDefinedFunction [dbo].[fnTableHasPrimaryKey]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnTableHasPrimaryKey](@sTableName varchar(128))
RETURNS bit
AS
BEGIN
	DECLARE @nTableID int,
		@nIndexID int
	
	SET 	@nTableID = OBJECT_ID(@sTableName)
	
	SELECT 	@nIndexID = indid
	FROM 	sysindexes
	WHERE 	id = @nTableID
	 AND 	indid BETWEEN 1 And 254 
	 AND 	(status & 2048) = 2048
	
	IF @nIndexID IS NOT Null
		RETURN 1
	
	RETURN 0
END


GO
/****** Object:  UserDefinedFunction [dbo].[ufn_GetAge]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufn_GetAge] ( @pDateOfBirth    DATETIME, 
                                     @pAsOfDate       DATETIME )
RETURNS INT
AS
BEGIN

    DECLARE @vAge         INT
    
    IF @pDateOfBirth >= @pAsOfDate
        RETURN 0

    SET @vAge = DATEDIFF(YY, @pDateOfBirth, @pAsOfDate)

    IF MONTH(@pDateOfBirth) > MONTH(@pAsOfDate) OR
      (MONTH(@pDateOfBirth) = MONTH(@pAsOfDate) AND
       DAY(@pDateOfBirth)   > DAY(@pAsOfDate))
        SET @vAge = @vAge - 1

    RETURN @vAge
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnTableColumnInfo]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE       FUNCTION [dbo].[fnTableColumnInfo](@sTableName varchar(128))
RETURNS TABLE
AS
	RETURN
	SELECT	c.name AS sColumnName,
		c.colid AS nColumnID,
		dbo.fnIsColumnPrimaryKey(@sTableName, c.name) AS bPrimaryKeyColumn,
		CASE 	WHEN t.name IN ('char', 'varchar', 'binary', 'varbinary', 'nchar', 'nvarchar') THEN 1
			WHEN t.name IN ('decimal', 'numeric') THEN 2
			ELSE 0
		END AS nAlternateType,
		c.length AS nColumnLength,
		c.prec AS nColumnPrecision,
		c.scale AS nColumnScale, 
		c.IsNullable, 
		SIGN(c.status & 128) AS IsIdentity,
		t.name as sTypeName,
		dbo.fnColumnDefault(@sTableName, c.name) AS sDefaultValue
	FROM	syscolumns c 
		INNER JOIN systypes t ON c.xtype = t.xtype and c.usertype = t.usertype
	WHERE	c.id = OBJECT_ID(@sTableName)








GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
  
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
  
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
  
GO
/****** Object:  Table [dbo].[AcceptMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcceptMaster](
	[Id] [int] NULL,
	[Name] [varchar](50) NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CasteMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasteMaster](
	[Name] [varchar](50) NULL,
	[Status] [bit] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[ID] [int] NULL,
	[UserId] [varchar](50) NULL,
	[ConcernType] [varchar](50) NULL,
	[Message] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountryMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryMaster](
	[name] [nvarchar](255) NULL,
	[Id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DietMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DietMaster](
	[name] [varchar](50) NULL,
	[status] [bit] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrinkMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrinkMaster](
	[name] [varchar](50) NULL,
	[Status] [bit] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenderMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenderMaster](
	[name] [varchar](50) NULL,
	[status] [bit] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroundHogDayTable]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroundHogDayTable](
	[TheName] [varchar](100) NULL,
	[TheDate] [date] NULL,
	[Column1]  AS (CONVERT([bigint],hashbytes('SHA1',[TheName]+CONVERT([varchar](10),[theDate],(101))))) PERSISTED,
	[Id]  AS (newid())
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncomeMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomeMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterestShown]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterestShown](
	[InterestId] [int] IDENTITY(1,1) NOT NULL,
	[CommunicatorUserId] [varchar](100) NULL,
	[ResponderUserId] [varchar](100) NULL,
	[ResponseStatus] [varchar](50) NULL,
	[ResponseMessage] [varchar](200) NULL,
	[ChildInterestId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobMaster](
	[name] [varchar](50) NULL,
	[status] [bit] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LanguageMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageMaster](
	[name] [varchar](50) NULL,
	[status] [bit] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOOKUP_CODE_MASTER]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOOKUP_CODE_MASTER](
	[LOOKUP_ID] [int] IDENTITY(1,1) NOT NULL,
	[LOOKUP_NAME] [varchar](200) NOT NULL,
	[CREATED_ON]  AS (getdate()),
	[CREATED_BY] [varchar](20) NULL,
	[MODIFIED_ON] [datetime] NULL,
	[MODIFIED_BY] [varchar](20) NULL,
	[STATUS] [bit] NOT NULL,
 CONSTRAINT [PK_LOOKUP_CODE_MASTER] PRIMARY KEY CLUSTERED 
(
	[LOOKUP_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOOKUP_VALUE]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOOKUP_VALUE](
	[VALUE_ID] [int] NULL,
	[LOOKUP_ID] [int] NULL,
	[VALUE1] [varchar](50) NULL,
	[VALUE2] [nvarchar](255) NULL,
	[VALUE3] [nvarchar](255) NULL,
	[VALUE4] [nvarchar](255) NULL,
	[VALUE5] [nvarchar](255) NULL,
	[VALUE6] [nvarchar](255) NULL,
	[VALUE7] [nvarchar](255) NULL,
	[CREATED_ON] [datetime] NULL,
	[CREATED_BY] [nvarchar](255) NULL,
	[MODIFIED_ON] [nvarchar](255) NULL,
	[MODIFIED_BY] [nvarchar](255) NULL,
	[STATUS] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaritialStatusMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaritialStatusMaster](
	[name] [varchar](50) NULL,
	[status] [bit] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MotherToungeMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotherToungeMaster](
	[Id] [int] NULL,
	[name] [varchar](100) NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfileCreatedByMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileCreatedByMaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RashiMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RashiMaster](
	[name] [varchar](50) NULL,
	[status] [bit] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReligionMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReligionMaster](
	[name] [varchar](50) NULL,
	[status] [bit] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaryMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryMaster](
	[name] [varchar](50) NULL,
	[status] [bit] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SEARCH_SAVED]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEARCH_SAVED](
	[ID] [int] NOT NULL,
	[PROFILE_ID] [varchar](50) NULL,
	[SEARCH_RESULT] [varchar](50) NULL,
	[CREATED_BY] [varchar](20) NOT NULL,
	[CREATED_ON]  AS (getdate()),
	[MODIFIED_BY] [varchar](20) NULL,
	[MODIFIED_ON] [datetime] NULL,
	[STATUS] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmokingMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmokingMaster](
	[name] [varchar](50) NULL,
	[status] [bit] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateMaster](
	[name] [varchar](50) NULL,
	[status] [bit] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUCCESS_STORY]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUCCESS_STORY](
	[ID]  AS (newid()),
	[USER_ID] [int] NOT NULL,
	[PARTNER_ID] [int] NOT NULL,
	[USER_PROFLE_EMAIL_ID] [varchar](80) NOT NULL,
	[PARTNER_PROFLE_EMAIL_ID] [varchar](80) NOT NULL,
	[SUCCESS_STORY] [varchar](500) NOT NULL,
	[CREATED_BY] [varchar](20) NOT NULL,
	[CREATED_ON]  AS (getdate()),
	[MODIFIED_BY] [varchar](20) NULL,
	[MODIFIED_ON] [datetime] NULL,
	[STATUS] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[id]  AS (newid()),
	[name] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Pics]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Pics](
	[PicID] [int] IDENTITY(1,1) NOT NULL,
	[USER_ID] [int] NOT NULL,
	[PicName] [varchar](300) NOT NULL,
	[PicFilePath] [varchar](500) NULL,
	[PicText] [varchar](50) NULL,
	[IsProfilePic] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User_Pics_1] PRIMARY KEY CLUSTERED 
(
	[USER_ID] ASC,
	[PicName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER_PROFILE]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_PROFILE](
	[USER_ID]  AS (CONVERT([bigint],hashbytes('SHA1',[F_NAME]+CONVERT([varchar](10),[DOB],(101))))) PERSISTED,
	[USER_PEROFILE_ID] [int] IDENTITY(1,1) NOT NULL,
	[PROFILE_CREATED_BY] [int] NULL,
	[F_NAME] [varchar](30) NOT NULL,
	[L_NAME] [varchar](30) NULL,
	[M_NAME] [varchar](30) NULL,
	[FULL_NAME]  AS ((((isnull([F_NAME],'')+' ')+isnull([M_NAME],''))+' ')+isnull([L_NAME],'')),
	[GENDER] [varchar](10) NULL,
	[COUNTRY_ID] [varchar](10) NULL,
	[CITY_ID] [varchar](10) NULL,
	[ADDRESS] [varchar](80) NULL,
	[E_MAIL] [varchar](80) NOT NULL,
	[PASSWORD] [varchar](20) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[TIME] [varchar](50) NOT NULL,
	[PLACE_OF_BIRTH] [varchar](20) NOT NULL,
	[CALCULATED_AGE]  AS ([dbo].[ufn_GetAge]([DOB],getdate())),
	[MY_RELIGION] [varchar](20) NULL,
	[MY_MOTHER_TOUNG] [varchar](20) NULL,
	[MY_SUB_CASTE] [varchar](15) NOT NULL,
	[MY_RASHI] [varchar](20) NULL,
	[MY_GOTHRA] [varchar](20) NULL,
	[MY_NATIVE_PLACE] [varchar](20) NULL,
	[MY_HORO_MATCH] [varchar](20) NULL,
	[PHONE_NO1] [varchar](15) NOT NULL,
	[PHONE_NO2] [varchar](20) NULL,
	[MOBILE_NO1] [varchar](15) NOT NULL,
	[MARITIAL_STATUS] [varchar](20) NOT NULL,
	[ABOUT_ME] [varchar](500) NULL,
	[ABOUT_MY_FAMILY] [varchar](500) NULL,
	[ABOUT_MY_EDUCATION] [varchar](200) NULL,
	[ABOUT_MY_PROFESSION] [varchar](200) NULL,
	[MY_HIGHEST_DEGREE] [varchar](20) NULL,
	[MY_MIN_INCOME] [varchar](20) NULL,
	[MY_MAX_INCOME] [varchar](20) NULL,
	[MY_WORK_STATUS] [varchar](20) NULL,
	[DIET_STATUS] [varchar](20) NOT NULL,
	[SMOKE_STATUS] [varchar](20) NOT NULL,
	[DRINK_STATUS] [varchar](20) NOT NULL,
	[HEIGHT] [varchar](3) NOT NULL,
	[WEIGHT] [varchar](3) NOT NULL,
	[FACEBOOK_ID] [varchar](300) NULL,
	[TWITTER_ID] [varchar](300) NULL,
	[LINKEDIN_ID] [varchar](300) NULL,
	[UPDATE_PROFILE_ID] [varchar](20) NULL,
	[CREATED_BY] [varchar](20) NULL,
	[CREATED_ON]  AS (getdate()),
	[MODIFIED_BY] [varchar](20) NULL,
	[MODIFIED_ON] [datetime] NULL,
	[ACTIVE] [varchar](10) NULL,
	[STATUS] [varchar](20) NOT NULL,
	[JSONObject] [varchar](max) NULL,
	[LastLogin] [datetime] NULL,
 CONSTRAINT [PK_USER_PROFILE] PRIMARY KEY CLUSTERED 
(
	[E_MAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER_SUCCESS_STORY]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_SUCCESS_STORY](
	[ID]  AS (newid()),
	[USER_PROFLE_EMAIL_ID] [varchar](80) NOT NULL,
	[PARTNER_PROFLE_EMAIL_ID] [varchar](80) NOT NULL,
	[SUCCESS_STORY] [varchar](500) NOT NULL,
	[CREATED_BY] [varchar](20) NOT NULL,
	[CREATED_ON]  AS (getdate()),
	[MODIFIED_BY] [varchar](20) NULL,
	[MODIFIED_ON] [datetime] NULL,
	[STATUS] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMessagesLog]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMessagesLog](
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[InterestId] [int] NULL,
	[Message] [varchar](1000) NULL,
	[ContactEmailId] [varchar](300) NULL,
	[ContactPhoneNumber] [varchar](20) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VisitorDetails]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitorDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MyID] [int] NOT NULL,
	[VisitorID] [int] NOT NULL,
	[VisitorDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_VisitorDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AcceptMaster] ([Id], [Name], [Status]) VALUES (1, N'Accept', 1)
GO
INSERT [dbo].[AcceptMaster] ([Id], [Name], [Status]) VALUES (2, N'Reject', 1)
GO
INSERT [dbo].[AcceptMaster] ([Id], [Name], [Status]) VALUES (3, N'Interest Send', 1)
GO
SET IDENTITY_INSERT [dbo].[CasteMaster] ON 
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Brahimin', 1, 1)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Brahmin ', 1, 2)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Sunni ', 1, 3)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Kayastha ', 1, 4)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Rajput ', 1, 5)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Maratha ', 1, 6)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Khatri ', 1, 7)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Aggarwal ', 1, 8)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Arora ', 1, 9)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Kshatriya ', 1, 10)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Shwetamber ', 1, 11)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Yadav ', 1, 12)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Sindhi ', 1, 13)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Bania ', 1, 14)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Scheduled Caste', 1, 15)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Nair', 1, 16)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Lingayat', 1, 17)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Jat', 1, 18)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Patel', 1, 19)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Digamber', 1, 20)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Sikh-Jat', 1, 21)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Gupta', 1, 22)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Catholic', 1, 23)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Teli', 1, 24)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Vishwakarma', 1, 25)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Iyer', 1, 26)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Vaishnav', 1, 27)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Jaiswal', 1, 28)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Gujjar', 1, 29)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Syrian', 1, 30)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Dravida', 1, 31)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Arya ', 1, 32)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Bhandari', 1, 33)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Billava', 1, 34)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Anavil', 1, 35)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Goswami', 1, 36)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Kumaoni', 1, 37)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Madhwa', 1, 38)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Nagar', 1, 39)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Smartha', 1, 40)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Vaidiki', 1, 41)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Viswa', 1, 42)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Bunt', 1, 43)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Chambhar', 1, 44)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Chaurasia', 1, 45)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Chettiar', 1, 46)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Devanga', 1, 47)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Dhangar', 1, 48)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Ezhavas', 1, 49)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Goud', 1, 50)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Gowda', 1, 51)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Iyengar', 1, 52)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Marwari', 1, 53)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Jatav', 1, 54)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Kamma', 1, 55)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Kapu', 1, 56)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Khandayat', 1, 57)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Koli', 1, 58)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Koshti', 1, 59)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Kunbi', 1, 60)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Kuruba', 1, 61)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Kushwaha', 1, 62)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Patidar', 1, 63)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Lohana', 1, 64)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Maheshwari', 1, 65)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Mahisya', 1, 66)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Mali', 1, 67)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Maurya', 1, 68)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Menon', 1, 69)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Mogaveera', 1, 70)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Nadar', 1, 71)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Nambiar', 1, 72)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Nepali', 1, 73)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Padmashali', 1, 74)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Patil', 1, 75)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Pillai', 1, 76)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Prajapati', 1, 77)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Reddy', 1, 78)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Sadgope', 1, 79)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Shimpi', 1, 80)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Somvanshi', 1, 81)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Sonar', 1, 82)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Sutar', 1, 83)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Swarnkar', 1, 84)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Thevar', 1, 85)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Thiyya', 1, 86)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Vaish', 1, 87)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Vaishya', 1, 88)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Vanniyar', 1, 89)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Varshney', 1, 90)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Veerashaiva', 1, 91)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Vellalar', 1, 92)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Vysya', 1, 93)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Gursikh', 1, 94)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Ramgarhia', 1, 95)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Saini', 1, 96)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Mallah', 1, 97)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Shah', 1, 98)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Dhobi', 1, 99)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Kalar', 1, 100)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Kamboj', 1, 101)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Kashmiri Pandit', 1, 102)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Rigvedi', 1, 103)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Bhavasar Kshatriya', 1, 104)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Agnikula ', 1, 105)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Audichya ', 1, 106)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Baidya ', 1, 107)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Baishya ', 1, 108)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Bhumihar ', 1, 109)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Bohra ', 1, 110)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Chamar ', 1, 111)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Chasa ', 1, 112)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Chaudhary ', 1, 113)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Chhetri ', 1, 114)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Dhiman ', 1, 115)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Garhwali ', 1, 116)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Gudia ', 1, 117)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Havyaka ', 1, 118)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Kammavar ', 1, 119)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Karana ', 1, 120)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Khandelwal ', 1, 121)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Knanaya ', 1, 122)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Kumbhar ', 1, 123)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Mahajan ', 1, 124)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Mukkulathor ', 1, 125)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Pareek ', 1, 126)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Sourashtra ', 1, 127)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Tanti ', 1, 128)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Thakur ', 1, 129)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Vanjari ', 1, 130)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Vokkaliga ', 1, 131)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Daivadnya ', 1, 132)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Kashyap ', 1, 133)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Kutchi ', 1, 134)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'OBC', 1, 135)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Mudaliar', 1, 136)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Naidu', 1, 137)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Vokkaliga', 1, 138)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Joshi', 1, 139)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Pant', 1, 140)
GO
INSERT [dbo].[CasteMaster] ([Name], [Status], [Id]) VALUES (N'Pandey', 1, 141)
GO
SET IDENTITY_INSERT [dbo].[CasteMaster] OFF
GO
INSERT [dbo].[CountryMaster] ([name], [Id]) VALUES (N'India', 1)
GO
SET IDENTITY_INSERT [dbo].[DietMaster] ON 
GO
INSERT [dbo].[DietMaster] ([name], [status], [Id]) VALUES (N'Veg', 1, 1)
GO
INSERT [dbo].[DietMaster] ([name], [status], [Id]) VALUES (N'Non-Veg', 1, 2)
GO
INSERT [dbo].[DietMaster] ([name], [status], [Id]) VALUES (N'Eggetarian', 1, 3)
GO
INSERT [dbo].[DietMaster] ([name], [status], [Id]) VALUES (N'Other', 1, 4)
GO
SET IDENTITY_INSERT [dbo].[DietMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[DrinkMaster] ON 
GO
INSERT [dbo].[DrinkMaster] ([name], [Status], [id]) VALUES (N'Daily', 1, 1)
GO
INSERT [dbo].[DrinkMaster] ([name], [Status], [id]) VALUES (N'Occational', 1, 2)
GO
INSERT [dbo].[DrinkMaster] ([name], [Status], [id]) VALUES (N'Never', 1, 3)
GO
SET IDENTITY_INSERT [dbo].[DrinkMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[GenderMaster] ON 
GO
INSERT [dbo].[GenderMaster] ([name], [status], [Id]) VALUES (N'Male', 1, 1)
GO
INSERT [dbo].[GenderMaster] ([name], [status], [Id]) VALUES (N'Female', 1, 2)
GO
SET IDENTITY_INSERT [dbo].[GenderMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[IncomeMaster] ON 
GO
INSERT [dbo].[IncomeMaster] ([Id], [name], [status]) VALUES (1, N'Not Disclosed', 1)
GO
INSERT [dbo].[IncomeMaster] ([Id], [name], [status]) VALUES (2, N'0 - 1,00,000', 1)
GO
INSERT [dbo].[IncomeMaster] ([Id], [name], [status]) VALUES (3, N'1,00,000 - 3,00,000', 1)
GO
INSERT [dbo].[IncomeMaster] ([Id], [name], [status]) VALUES (4, N'3,00,000 - 5,00,000', 1)
GO
INSERT [dbo].[IncomeMaster] ([Id], [name], [status]) VALUES (5, N'5,00,000 - 8,00,000', 1)
GO
INSERT [dbo].[IncomeMaster] ([Id], [name], [status]) VALUES (6, N'8,00,000 - 10,00,000', 1)
GO
INSERT [dbo].[IncomeMaster] ([Id], [name], [status]) VALUES (7, N'10,00,000 - 13,00,000', 1)
GO
INSERT [dbo].[IncomeMaster] ([Id], [name], [status]) VALUES (8, N'13,00,000 - 15,00,000', 1)
GO
INSERT [dbo].[IncomeMaster] ([Id], [name], [status]) VALUES (9, N'15,00,000 - 18,00,000', 1)
GO
INSERT [dbo].[IncomeMaster] ([Id], [name], [status]) VALUES (10, N'18,00,000 - above 18,00,000', 1)
GO
SET IDENTITY_INSERT [dbo].[IncomeMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[InterestShown] ON 
GO
INSERT [dbo].[InterestShown] ([InterestId], [CommunicatorUserId], [ResponderUserId], [ResponseStatus], [ResponseMessage], [ChildInterestId], [CreatedOn], [CreatedBy], [Status]) VALUES (1, N'4', N'10', N'3', NULL, NULL, CAST(N'2017-09-19T20:51:03.253' AS DateTime), NULL, 1)
GO
INSERT [dbo].[InterestShown] ([InterestId], [CommunicatorUserId], [ResponderUserId], [ResponseStatus], [ResponseMessage], [ChildInterestId], [CreatedOn], [CreatedBy], [Status]) VALUES (2, N'4', N'7', N'3', NULL, NULL, CAST(N'2017-09-19T20:51:28.490' AS DateTime), NULL, 1)
GO
INSERT [dbo].[InterestShown] ([InterestId], [CommunicatorUserId], [ResponderUserId], [ResponseStatus], [ResponseMessage], [ChildInterestId], [CreatedOn], [CreatedBy], [Status]) VALUES (3, N'9', N'6', N'3', NULL, NULL, CAST(N'2017-09-19T20:51:51.630' AS DateTime), NULL, 1)
GO
INSERT [dbo].[InterestShown] ([InterestId], [CommunicatorUserId], [ResponderUserId], [ResponseStatus], [ResponseMessage], [ChildInterestId], [CreatedOn], [CreatedBy], [Status]) VALUES (4, N'9', N'8', N'3', NULL, NULL, CAST(N'2017-09-19T20:52:11.490' AS DateTime), NULL, 1)
GO
INSERT [dbo].[InterestShown] ([InterestId], [CommunicatorUserId], [ResponderUserId], [ResponseStatus], [ResponseMessage], [ChildInterestId], [CreatedOn], [CreatedBy], [Status]) VALUES (5, N'10', N'4', N'1', NULL, NULL, CAST(N'2017-09-19T20:52:37.830' AS DateTime), NULL, 1)
GO
INSERT [dbo].[InterestShown] ([InterestId], [CommunicatorUserId], [ResponderUserId], [ResponseStatus], [ResponseMessage], [ChildInterestId], [CreatedOn], [CreatedBy], [Status]) VALUES (6, N'6', N'9', N'2', NULL, NULL, CAST(N'2017-09-19T20:53:12.220' AS DateTime), NULL, 1)
GO
INSERT [dbo].[InterestShown] ([InterestId], [CommunicatorUserId], [ResponderUserId], [ResponseStatus], [ResponseMessage], [ChildInterestId], [CreatedOn], [CreatedBy], [Status]) VALUES (7, N'7', N'4', N'3', NULL, NULL, CAST(N'2017-09-19T20:53:35.413' AS DateTime), NULL, 1)
GO
INSERT [dbo].[InterestShown] ([InterestId], [CommunicatorUserId], [ResponderUserId], [ResponseStatus], [ResponseMessage], [ChildInterestId], [CreatedOn], [CreatedBy], [Status]) VALUES (8, N'4', N'6', N'2', NULL, NULL, CAST(N'2017-09-19T22:36:53.473' AS DateTime), NULL, 1)
GO
INSERT [dbo].[InterestShown] ([InterestId], [CommunicatorUserId], [ResponderUserId], [ResponseStatus], [ResponseMessage], [ChildInterestId], [CreatedOn], [CreatedBy], [Status]) VALUES (9, N'6', N'4', N'2', NULL, NULL, CAST(N'2017-09-19T22:37:03.390' AS DateTime), NULL, 1)
GO
INSERT [dbo].[InterestShown] ([InterestId], [CommunicatorUserId], [ResponderUserId], [ResponseStatus], [ResponseMessage], [ChildInterestId], [CreatedOn], [CreatedBy], [Status]) VALUES (10, N'9', N'4', N'3', NULL, NULL, CAST(N'2017-09-20T14:28:24.467' AS DateTime), NULL, 1)
GO
INSERT [dbo].[InterestShown] ([InterestId], [CommunicatorUserId], [ResponderUserId], [ResponseStatus], [ResponseMessage], [ChildInterestId], [CreatedOn], [CreatedBy], [Status]) VALUES (11, N'4', N'7', N'1', NULL, NULL, CAST(N'2017-09-24T15:13:31.353' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InterestShown] ([InterestId], [CommunicatorUserId], [ResponderUserId], [ResponseStatus], [ResponseMessage], [ChildInterestId], [CreatedOn], [CreatedBy], [Status]) VALUES (12, N'24', N'9', N'', NULL, NULL, CAST(N'2017-09-27T12:45:21.517' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InterestShown] ([InterestId], [CommunicatorUserId], [ResponderUserId], [ResponseStatus], [ResponseMessage], [ChildInterestId], [CreatedOn], [CreatedBy], [Status]) VALUES (13, N'24', N'9', N'', NULL, NULL, CAST(N'2017-09-27T12:47:21.390' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InterestShown] ([InterestId], [CommunicatorUserId], [ResponderUserId], [ResponseStatus], [ResponseMessage], [ChildInterestId], [CreatedOn], [CreatedBy], [Status]) VALUES (14, N'24', N'9', N'2', NULL, NULL, CAST(N'2017-09-27T12:47:36.513' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InterestShown] ([InterestId], [CommunicatorUserId], [ResponderUserId], [ResponseStatus], [ResponseMessage], [ChildInterestId], [CreatedOn], [CreatedBy], [Status]) VALUES (16, N'24', N'10', N'1', NULL, NULL, CAST(N'2017-09-27T13:29:09.727' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InterestShown] ([InterestId], [CommunicatorUserId], [ResponderUserId], [ResponseStatus], [ResponseMessage], [ChildInterestId], [CreatedOn], [CreatedBy], [Status]) VALUES (17, N'24', N'7', N'1', NULL, NULL, CAST(N'2017-09-28T14:56:14.983' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InterestShown] ([InterestId], [CommunicatorUserId], [ResponderUserId], [ResponseStatus], [ResponseMessage], [ChildInterestId], [CreatedOn], [CreatedBy], [Status]) VALUES (15, N'24', N'9', N'1', NULL, NULL, CAST(N'2017-09-27T12:47:45.413' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[InterestShown] OFF
GO
SET IDENTITY_INSERT [dbo].[JobMaster] ON 
GO
INSERT [dbo].[JobMaster] ([name], [status], [Id]) VALUES (N'Working in Govt Organisation', 1, 1)
GO
INSERT [dbo].[JobMaster] ([name], [status], [Id]) VALUES (N'Working in Semi-Govt Organisation', 1, 2)
GO
INSERT [dbo].[JobMaster] ([name], [status], [Id]) VALUES (N'Working in Pvt Organisation', 1, 3)
GO
INSERT [dbo].[JobMaster] ([name], [status], [Id]) VALUES (N'Non-Working', 1, 4)
GO
INSERT [dbo].[JobMaster] ([name], [status], [Id]) VALUES (N'Own Business', 1, 5)
GO
INSERT [dbo].[JobMaster] ([name], [status], [Id]) VALUES (N'Other', 1, 6)
GO
SET IDENTITY_INSERT [dbo].[JobMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[LanguageMaster] ON 
GO
INSERT [dbo].[LanguageMaster] ([name], [status], [Id]) VALUES (N'Marathi ', 1, 1)
GO
INSERT [dbo].[LanguageMaster] ([name], [status], [Id]) VALUES (N'Punjabi ', 1, 2)
GO
INSERT [dbo].[LanguageMaster] ([name], [status], [Id]) VALUES (N'Telugu ', 1, 3)
GO
INSERT [dbo].[LanguageMaster] ([name], [status], [Id]) VALUES (N'Bengali ', 1, 4)
GO
INSERT [dbo].[LanguageMaster] ([name], [status], [Id]) VALUES (N'Tamil ', 1, 5)
GO
INSERT [dbo].[LanguageMaster] ([name], [status], [Id]) VALUES (N'Gujarati ', 1, 6)
GO
INSERT [dbo].[LanguageMaster] ([name], [status], [Id]) VALUES (N'Malayalam ', 1, 7)
GO
INSERT [dbo].[LanguageMaster] ([name], [status], [Id]) VALUES (N'Kannada ', 1, 8)
GO
INSERT [dbo].[LanguageMaster] ([name], [status], [Id]) VALUES (N'Bihari ', 1, 9)
GO
INSERT [dbo].[LanguageMaster] ([name], [status], [Id]) VALUES (N'Rajasthani', 1, 10)
GO
INSERT [dbo].[LanguageMaster] ([name], [status], [Id]) VALUES (N'Oriya', 1, 11)
GO
INSERT [dbo].[LanguageMaster] ([name], [status], [Id]) VALUES (N'Konkani', 1, 12)
GO
INSERT [dbo].[LanguageMaster] ([name], [status], [Id]) VALUES (N'Himachali', 1, 13)
GO
INSERT [dbo].[LanguageMaster] ([name], [status], [Id]) VALUES (N'Haryanvi', 1, 14)
GO
INSERT [dbo].[LanguageMaster] ([name], [status], [Id]) VALUES (N'Assamese', 1, 15)
GO
INSERT [dbo].[LanguageMaster] ([name], [status], [Id]) VALUES (N'Kashmiri', 1, 16)
GO
INSERT [dbo].[LanguageMaster] ([name], [status], [Id]) VALUES (N'Sikkim/Nepali', 1, 17)
GO
SET IDENTITY_INSERT [dbo].[LanguageMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[LOOKUP_CODE_MASTER] ON 
GO
INSERT [dbo].[LOOKUP_CODE_MASTER] ([LOOKUP_ID], [LOOKUP_NAME], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS]) VALUES (12, N'cityStatusList', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[LOOKUP_CODE_MASTER] ([LOOKUP_ID], [LOOKUP_NAME], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS]) VALUES (11, N'countryStatusList', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[LOOKUP_CODE_MASTER] ([LOOKUP_ID], [LOOKUP_NAME], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS]) VALUES (3, N'CTCIncomeList', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[LOOKUP_CODE_MASTER] ([LOOKUP_ID], [LOOKUP_NAME], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS]) VALUES (5, N'dietStatusList', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[LOOKUP_CODE_MASTER] ([LOOKUP_ID], [LOOKUP_NAME], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS]) VALUES (13, N'drinkStatusList', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[LOOKUP_CODE_MASTER] ([LOOKUP_ID], [LOOKUP_NAME], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS]) VALUES (1, N'genderList', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[LOOKUP_CODE_MASTER] ([LOOKUP_ID], [LOOKUP_NAME], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS]) VALUES (16, N'interestList', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[LOOKUP_CODE_MASTER] ([LOOKUP_ID], [LOOKUP_NAME], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS]) VALUES (15, N'languageList', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[LOOKUP_CODE_MASTER] ([LOOKUP_ID], [LOOKUP_NAME], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS]) VALUES (2, N'maritalStatusList', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[LOOKUP_CODE_MASTER] ([LOOKUP_ID], [LOOKUP_NAME], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS]) VALUES (8, N'motherToungeList', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[LOOKUP_CODE_MASTER] ([LOOKUP_ID], [LOOKUP_NAME], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS]) VALUES (14, N'profileCreatedBy', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[LOOKUP_CODE_MASTER] ([LOOKUP_ID], [LOOKUP_NAME], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS]) VALUES (10, N'rashiStatusList', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[LOOKUP_CODE_MASTER] ([LOOKUP_ID], [LOOKUP_NAME], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS]) VALUES (7, N'religionStatusList', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[LOOKUP_CODE_MASTER] ([LOOKUP_ID], [LOOKUP_NAME], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS]) VALUES (4, N'smokeStatusList', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[LOOKUP_CODE_MASTER] ([LOOKUP_ID], [LOOKUP_NAME], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS]) VALUES (9, N'subCasteStatusList', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[LOOKUP_CODE_MASTER] ([LOOKUP_ID], [LOOKUP_NAME], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS]) VALUES (6, N'workStatusList', NULL, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[LOOKUP_CODE_MASTER] OFF
GO
SET IDENTITY_INSERT [dbo].[LOOKUP_VALUE] ON 
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (100, 1, N'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (101, 1, N'Female', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (200, 2, N'Single', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (201, 2, N'Divorced', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (202, 2, N'Other', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (300, 3, N'0 - 1,00,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (301, 3, N'1,00,000 - 3,00,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 7)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (302, 3, N'3,00,000 - 5,00,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 8)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (303, 3, N'5,00,000 - 8,00,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 9)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (304, 3, N'8,00,000 - 10,00,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 10)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (305, 3, N'10,00,000 - 13,00,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 11)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (306, 3, N'13,00,000 - 15,00,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 12)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (307, 3, N'15,00,000 - 18,00,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 13)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (308, 3, N'18,00,000 - above 18,00,000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 14)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (309, 3, N'No Value', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 15)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (400, 4, N'Smoking', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 16)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (401, 4, N'Non-Smoking', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 17)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (500, 5, N'Veg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 18)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (501, 5, N'Non-Veg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 19)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (502, 5, N'Eggetarian', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 20)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (503, 5, N'Other', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 21)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (600, 6, N'Working in Govt Organisation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 22)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (601, 6, N'Working in Semi-Govt Organisation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 23)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (602, 6, N'Working in Pvt Organisation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 24)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (603, 6, N'Non-Working', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 25)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (604, 6, N'Own Business', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 26)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (605, 6, N'Other', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 27)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (700, 7, N'Brahimin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 28)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (900, 9, N'Joshi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 29)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (901, 9, N'Pant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 30)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (902, 9, N'Pandey', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 31)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1000, 10, N'Mesa / Mesh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 32)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1001, 10, N'Vrishabha / Vrushabh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 33)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1002, 10, N'Mithuna / Mithun', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 34)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1003, 10, N'Karka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 35)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1004, 10, N'Simha / Sinh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 36)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1005, 10, N'Kanya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 37)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1006, 10, N'Tula', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 38)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1007, 10, N'Vrischika / Vrushchik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 39)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1008, 10, N'Dhanu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 40)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1009, 10, N'Makar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 41)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1010, 10, N'Kumbha', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 42)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1011, 10, N'Mina / Meen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 43)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1100, 11, N'India', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 44)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1300, 13, N'Daily', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 46)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1301, 13, N'Occational', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 47)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1302, 13, N'Never', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 48)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3000, 14, N'Self', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 49)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3001, 14, N'Relatiuve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 50)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3002, 14, N'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 51)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3003, 14, N'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 52)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3004, 14, N'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 53)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3005, 14, N'Mother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 54)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3006, 14, N'Friend', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 55)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3007, 14, N'Others', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 56)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (700, 7, N'Brahmin ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 57)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (701, 7, N'Sunni ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 58)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (702, 7, N'Kayastha ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 59)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (703, 7, N'Rajput ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 60)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (704, 7, N'Maratha ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 61)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (705, 7, N'Khatri ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 62)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (706, 7, N'Aggarwal ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 63)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (707, 7, N'Arora ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 64)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (708, 7, N'Kshatriya ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 65)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (709, 7, N'Shwetamber ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 66)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (710, 7, N'Yadav ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 67)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (711, 7, N'Sindhi ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 68)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (712, 7, N'Bania ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 69)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (713, 7, N'Scheduled Caste', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 70)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (714, 7, N'Nair', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 71)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (715, 7, N'Lingayat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 72)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (716, 7, N'Jat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 73)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (717, 7, N'Patel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 74)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (718, 7, N'Digamber', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 75)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (719, 7, N'Sikh-Jat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 76)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (720, 7, N'Gupta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 77)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (721, 7, N'Catholic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 78)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (722, 7, N'Teli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 79)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (723, 7, N'Vishwakarma', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 80)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (724, 7, N'Iyer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 81)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (725, 7, N'Vaishnav', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 82)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (726, 7, N'Jaiswal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 83)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (727, 7, N'Gujjar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 84)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (728, 7, N'Syrian', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 85)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (729, 7, N'Dravida', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 86)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (730, 7, N'Arya ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 87)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (731, 7, N'Bhandari', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 88)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (732, 7, N'Billava', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 89)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (733, 7, N'Anavil', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 90)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (734, 7, N'Goswami', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 91)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (735, 7, N'Kumaoni', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 92)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (736, 7, N'Madhwa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 93)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (737, 7, N'Nagar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 94)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (738, 7, N'Smartha', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 95)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (739, 7, N'Vaidiki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 96)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (740, 7, N'Viswa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 97)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (741, 7, N'Bunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 98)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (742, 7, N'Chambhar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 99)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (743, 7, N'Chaurasia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 100)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (744, 7, N'Chettiar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 101)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (745, 7, N'Devanga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 102)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (746, 7, N'Dhangar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 103)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (747, 7, N'Ezhavas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 104)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (748, 7, N'Goud', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 105)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (749, 7, N'Gowda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 106)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (750, 7, N'Iyengar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 107)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (751, 7, N'Marwari', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 108)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (752, 7, N'Jatav', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 109)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (753, 7, N'Kamma', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 110)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (754, 7, N'Kapu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 111)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (755, 7, N'Khandayat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 112)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (756, 7, N'Koli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 113)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (757, 7, N'Koshti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 114)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (758, 7, N'Kunbi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (759, 7, N'Kuruba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 116)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (760, 7, N'Kushwaha', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 117)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (761, 7, N'Patidar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 118)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (762, 7, N'Lohana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 119)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (763, 7, N'Maheshwari', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 120)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (764, 7, N'Mahisya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 121)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (765, 7, N'Mali', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 122)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (766, 7, N'Maurya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 123)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (767, 7, N'Menon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 124)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (834, 7, N'Mudaliar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 125)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (768, 7, N'Mogaveera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 126)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (769, 7, N'Nadar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 127)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (835, 7, N'Naidu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 128)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (770, 7, N'Nambiar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 129)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (771, 7, N'Nepali', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 130)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (772, 7, N'Padmashali', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 131)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (773, 7, N'Patil', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 132)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (774, 7, N'Pillai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 133)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (775, 7, N'Prajapati', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 134)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (776, 7, N'Reddy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 135)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (777, 7, N'Sadgope', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 136)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (778, 7, N'Shimpi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 137)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (779, 7, N'Somvanshi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 138)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (780, 7, N'Sonar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 139)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (781, 7, N'Sutar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 140)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (782, 7, N'Swarnkar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 141)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (783, 7, N'Thevar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 142)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (784, 7, N'Thiyya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 143)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (785, 7, N'Vaish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 144)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (786, 7, N'Vaishya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 145)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (787, 7, N'Vanniyar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 146)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (788, 7, N'Varshney', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 147)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (789, 7, N'Veerashaiva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 148)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (790, 7, N'Vellalar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 149)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (791, 7, N'Vysya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 150)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (792, 7, N'Gursikh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 151)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (793, 7, N'Ramgarhia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 152)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (794, 7, N'Saini', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 153)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (795, 7, N'Mallah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 154)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (796, 7, N'Shah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 155)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (797, 7, N'Dhobi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 156)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (798, 7, N'Kalar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 157)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (799, 7, N'Kamboj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 158)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (800, 7, N'Kashmiri Pandit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 159)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (801, 7, N'Rigvedi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 160)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (836, 7, N'Vokkaliga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 161)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (802, 7, N'Bhavasar Kshatriya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 162)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (803, 7, N'Agnikula ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 163)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (804, 7, N'Audichya ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 164)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (805, 7, N'Baidya ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 165)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (806, 7, N'Baishya ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 166)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (807, 7, N'Bhumihar ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 167)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (808, 7, N'Bohra ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 168)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3100, 15, N'Marathi ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 169)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3101, 15, N'Punjabi ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 170)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3102, 15, N'Telugu ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 171)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3103, 15, N'Bengali ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 172)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3104, 15, N'Tamil ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 173)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3105, 15, N'Gujarati ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 174)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3106, 15, N'Malayalam ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 175)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3107, 15, N'Kannada ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 176)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3108, 15, N'Bihari ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 177)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3109, 15, N'Rajasthani', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 178)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3110, 15, N'Oriya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 179)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3111, 15, N'Konkani', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 180)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3112, 15, N'Himachali', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 181)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3113, 15, N'Haryanvi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 182)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3114, 15, N'Assamese', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 183)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3115, 15, N'Kashmiri', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 184)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (3116, 15, N'Sikkim/Nepali', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 185)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (809, 7, N'Chamar ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 186)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (810, 7, N'Chasa ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 187)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (811, 7, N'Chaudhary ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 188)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (812, 7, N'Chhetri ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 189)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (813, 7, N'Dhiman ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 190)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (814, 7, N'Garhwali ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 191)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (815, 7, N'Gudia ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 192)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (816, 7, N'Havyaka ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 193)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (817, 7, N'Kammavar ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 194)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (818, 7, N'Karana ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 195)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (819, 7, N'Khandelwal ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 196)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (820, 7, N'Knanaya ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 197)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (821, 7, N'Kumbhar ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 198)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (822, 7, N'Mahajan ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 199)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (823, 7, N'Mukkulathor ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 200)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (824, 7, N'Pareek ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 201)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (825, 7, N'Sourashtra ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 202)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (826, 7, N'Tanti ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 203)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (827, 7, N'Thakur ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 204)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (828, 7, N'Vanjari ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 205)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (829, 7, N'Vokkaliga ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 206)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (830, 7, N'Daivadnya ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 207)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (831, 7, N'Kashyap ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 208)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (832, 7, N'Kutchi ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 209)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (833, 7, N'OBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 210)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1800, 8, N'Hindu ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 211)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1801, 8, N'Muslim ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 212)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1802, 8, N'Christian ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 213)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1803, 8, N'Sikh ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 214)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1804, 8, N'Jain ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 215)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1805, 8, N'Buddhist ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 216)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1806, 8, N'Parsi ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 217)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1807, 8, N'Jewish ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 218)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1200, 12, N'New Delhi', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 219)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1201, 12, N'Mumbai ', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 220)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1202, 12, N'Bangalore ', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 221)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1203, 12, N'Pune ', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 222)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1204, 12, N'Hyderabad ', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 223)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1205, 12, N'Kolkata ', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 224)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1206, 12, N'Chennai', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 225)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1207, 12, N'Lucknow ', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 226)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1208, 12, N'Ahmedabad ', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 227)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1209, 12, N'Chandigarh ', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 228)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1210, 12, N'Nagpur ', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 229)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1211, 12, N'Jaipur', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 230)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1212, 12, N'Gurgaon', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 231)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1213, 12, N'Bhopal', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 232)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1214, 12, N'Noida', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 233)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1215, 12, N'Indore', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 234)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1216, 12, N'Patna', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 235)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1217, 12, N'Bhubaneshwar', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 236)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1218, 12, N'Ghaziabad', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 237)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1219, 12, N'Kanpur', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 238)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1220, 12, N'Faridabad', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 239)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1221, 12, N'Ludhiana', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 240)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1222, 12, N'Thane', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 241)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1223, 12, N'Maharashtra ', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 242)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1224, 12, N'Uttar Pradesh', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 243)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1225, 12, N'Karnataka ', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 244)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1226, 12, N'Andhra Pradesh ', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 245)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1227, 12, N'Tamil Nadu', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 246)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1228, 12, N'Andaman and Nicobar Islands', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 247)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1229, 12, N'Maharashtra ', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 248)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1230, 12, N'Uttar Pradesh', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 249)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1231, 12, N'Karnataka ', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 250)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1232, 12, N'Andhra Pradesh ', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 251)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1233, 12, N'Tamil Nadu', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 252)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1234, 12, N'West Bengal', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 253)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1235, 12, N'Andhra Pradesh', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 254)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1236, 12, N' Arunachal Pradesh', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 255)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1237, 12, N'Assam, Bihar', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 256)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1238, 12, N'Chandigarh', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 257)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1239, 12, N' Chhattisgarh', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 258)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1240, 12, N'Dadra and Nagar Haveli', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 259)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1241, 12, N' Daman and Diu', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 260)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1242, 12, N'NCR', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 261)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1243, 12, N'Goa', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 262)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1244, 12, N'Gujarat', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 263)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1245, 12, N'Haryana', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 264)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1246, 12, N'Himachal Pradesh', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 265)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1247, 12, N' Jammu and Kashmir', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 266)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1248, 12, N'Jharkhand', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 267)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1249, 12, N'Karnataka', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 268)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1250, 12, N'Kerala', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 269)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1251, 12, N'Lakshadweep', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 270)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1252, 12, N'Odisha', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 271)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1253, 12, N'Rajasthan', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 272)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1254, 12, N' Sikkim', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 273)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1255, 12, N'Tamil Nadu', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 274)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1256, 12, N'Telangana', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 275)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1257, 12, N'Madhya Pradesh', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 276)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1258, 12, N'Maharashtra', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 277)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1259, 12, N'Manipur', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 278)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1260, 12, N'Meghalaya', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 279)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1261, 12, N'Mizoram', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 280)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1262, 12, N'Puducherry', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 281)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1263, 12, N' Punjab', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 282)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1264, 12, N'Tripura', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 283)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1265, 12, N'Uttar Pradesh', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 284)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1266, 12, N'Uttarakhand', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T11:21:15.097' AS DateTime), NULL, NULL, NULL, 1, 285)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (1, 16, N'Accept', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T16:03:50.443' AS DateTime), NULL, NULL, NULL, 1, 286)
GO
INSERT [dbo].[LOOKUP_VALUE] ([VALUE_ID], [LOOKUP_ID], [VALUE1], [VALUE2], [VALUE3], [VALUE4], [VALUE5], [VALUE6], [VALUE7], [CREATED_ON], [CREATED_BY], [MODIFIED_ON], [MODIFIED_BY], [STATUS], [id]) VALUES (2, 16, N'Reject', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-09-05T16:04:03.467' AS DateTime), NULL, NULL, NULL, 1, 287)
GO
SET IDENTITY_INSERT [dbo].[LOOKUP_VALUE] OFF
GO
SET IDENTITY_INSERT [dbo].[MaritialStatusMaster] ON 
GO
INSERT [dbo].[MaritialStatusMaster] ([name], [status], [Id]) VALUES (N'Single', 1, 1)
GO
INSERT [dbo].[MaritialStatusMaster] ([name], [status], [Id]) VALUES (N'Divorced', 1, 2)
GO
INSERT [dbo].[MaritialStatusMaster] ([name], [status], [Id]) VALUES (N'Other', 1, 3)
GO
SET IDENTITY_INSERT [dbo].[MaritialStatusMaster] OFF
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (1, N'Bhojpuri', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (2, N'Rajasthani', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (3, N'Magadh/Magahi', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (4, N'Chhattisgarhi', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (5, N'Haryanvi', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (6, N'Marwari', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (7, N'Malvi', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (8, N'Mewari', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (9, N'Khorth/Khotta', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (10, N'Bundeli/Bundelkhan', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (11, N'Bagheli/Baghel Khan', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (12, N'Pahari', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (13, N'Laman/Lambadi', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (14, N'Awadhi', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (15, N'Harauti', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (16, N'Garhwali', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (17, N'Nimadi', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (18, N'Sadan/Sadri', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (19, N'Kumauni', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (20, N'Dhundhari', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (21, N'Surgujia', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (22, N'Bagri Rajasthani', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (23, N'Banjari', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (24, N'Nagpuria (Varhadi)', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (25, N'Surajpuri', 1)
GO
INSERT [dbo].[MotherToungeMaster] ([Id], [name], [Status]) VALUES (26, N'Kangri', 1)
GO
SET IDENTITY_INSERT [dbo].[ProfileCreatedByMaster] ON 
GO
INSERT [dbo].[ProfileCreatedByMaster] ([id], [name], [status]) VALUES (1, N'Self', 1)
GO
INSERT [dbo].[ProfileCreatedByMaster] ([id], [name], [status]) VALUES (2, N'Relatiuve', 1)
GO
INSERT [dbo].[ProfileCreatedByMaster] ([id], [name], [status]) VALUES (3, N'Brother', 1)
GO
INSERT [dbo].[ProfileCreatedByMaster] ([id], [name], [status]) VALUES (4, N'Sister', 1)
GO
INSERT [dbo].[ProfileCreatedByMaster] ([id], [name], [status]) VALUES (5, N'Father', 1)
GO
INSERT [dbo].[ProfileCreatedByMaster] ([id], [name], [status]) VALUES (6, N'Mother', 1)
GO
INSERT [dbo].[ProfileCreatedByMaster] ([id], [name], [status]) VALUES (7, N'Friend', 1)
GO
INSERT [dbo].[ProfileCreatedByMaster] ([id], [name], [status]) VALUES (8, N'Others', 1)
GO
SET IDENTITY_INSERT [dbo].[ProfileCreatedByMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[RashiMaster] ON 
GO
INSERT [dbo].[RashiMaster] ([name], [status], [Id]) VALUES (N'Mesa / Mesh', 1, 1)
GO
INSERT [dbo].[RashiMaster] ([name], [status], [Id]) VALUES (N'Vrishabha / Vrushabh', 1, 2)
GO
INSERT [dbo].[RashiMaster] ([name], [status], [Id]) VALUES (N'Mithuna / Mithun', 1, 3)
GO
INSERT [dbo].[RashiMaster] ([name], [status], [Id]) VALUES (N'Karka', 1, 4)
GO
INSERT [dbo].[RashiMaster] ([name], [status], [Id]) VALUES (N'Simha / Sinh', 1, 5)
GO
INSERT [dbo].[RashiMaster] ([name], [status], [Id]) VALUES (N'Kanya', 1, 6)
GO
INSERT [dbo].[RashiMaster] ([name], [status], [Id]) VALUES (N'Tula', 1, 7)
GO
INSERT [dbo].[RashiMaster] ([name], [status], [Id]) VALUES (N'Vrischika / Vrushchik', 1, 8)
GO
INSERT [dbo].[RashiMaster] ([name], [status], [Id]) VALUES (N'Dhanu', 1, 9)
GO
INSERT [dbo].[RashiMaster] ([name], [status], [Id]) VALUES (N'Makar', 1, 10)
GO
INSERT [dbo].[RashiMaster] ([name], [status], [Id]) VALUES (N'Kumbha', 1, 11)
GO
INSERT [dbo].[RashiMaster] ([name], [status], [Id]) VALUES (N'Mina / Meen', 1, 12)
GO
SET IDENTITY_INSERT [dbo].[RashiMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[ReligionMaster] ON 
GO
INSERT [dbo].[ReligionMaster] ([name], [status], [Id]) VALUES (N'Hindu ', 1, 1)
GO
INSERT [dbo].[ReligionMaster] ([name], [status], [Id]) VALUES (N'Muslim ', 1, 2)
GO
INSERT [dbo].[ReligionMaster] ([name], [status], [Id]) VALUES (N'Christian ', 1, 3)
GO
INSERT [dbo].[ReligionMaster] ([name], [status], [Id]) VALUES (N'Sikh ', 1, 4)
GO
INSERT [dbo].[ReligionMaster] ([name], [status], [Id]) VALUES (N'Jain ', 1, 5)
GO
INSERT [dbo].[ReligionMaster] ([name], [status], [Id]) VALUES (N'Buddhist ', 1, 6)
GO
INSERT [dbo].[ReligionMaster] ([name], [status], [Id]) VALUES (N'Parsi ', 1, 7)
GO
INSERT [dbo].[ReligionMaster] ([name], [status], [Id]) VALUES (N'Jewish ', 1, 8)
GO
SET IDENTITY_INSERT [dbo].[ReligionMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[SalaryMaster] ON 
GO
INSERT [dbo].[SalaryMaster] ([name], [status], [Id]) VALUES (N'0 - 1,00,000', 1, 1)
GO
INSERT [dbo].[SalaryMaster] ([name], [status], [Id]) VALUES (N'1,00,000 - 3,00,000', 1, 2)
GO
INSERT [dbo].[SalaryMaster] ([name], [status], [Id]) VALUES (N'3,00,000 - 5,00,000', 1, 3)
GO
INSERT [dbo].[SalaryMaster] ([name], [status], [Id]) VALUES (N'5,00,000 - 8,00,000', 1, 4)
GO
INSERT [dbo].[SalaryMaster] ([name], [status], [Id]) VALUES (N'8,00,000 - 10,00,000', 1, 5)
GO
INSERT [dbo].[SalaryMaster] ([name], [status], [Id]) VALUES (N'10,00,000 - 13,00,000', 1, 6)
GO
INSERT [dbo].[SalaryMaster] ([name], [status], [Id]) VALUES (N'13,00,000 - 15,00,000', 1, 7)
GO
INSERT [dbo].[SalaryMaster] ([name], [status], [Id]) VALUES (N'15,00,000 - 18,00,000', 1, 8)
GO
INSERT [dbo].[SalaryMaster] ([name], [status], [Id]) VALUES (N'18,00,000 - above 18,00,000', 1, 9)
GO
INSERT [dbo].[SalaryMaster] ([name], [status], [Id]) VALUES (N'No Value', 1, 10)
GO
SET IDENTITY_INSERT [dbo].[SalaryMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[SmokingMaster] ON 
GO
INSERT [dbo].[SmokingMaster] ([name], [status], [Id]) VALUES (N'Smoking', 1, 1)
GO
INSERT [dbo].[SmokingMaster] ([name], [status], [Id]) VALUES (N'Non-Smoking', 1, 2)
GO
SET IDENTITY_INSERT [dbo].[SmokingMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[StateMaster] ON 
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'New Delhi', 1, 1)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Mumbai ', 1, 2)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Bangalore ', 1, 3)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Pune ', 1, 4)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Hyderabad ', 1, 5)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Kolkata ', 1, 6)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Chennai', 1, 7)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Lucknow ', 1, 8)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Ahmedabad ', 1, 9)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Chandigarh ', 1, 10)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Nagpur ', 1, 11)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Jaipur', 1, 12)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Gurgaon', 1, 13)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Bhopal', 1, 14)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Noida', 1, 15)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Indore', 1, 16)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Patna', 1, 17)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Bhubaneshwar', 1, 18)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Ghaziabad', 1, 19)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Kanpur', 1, 20)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Faridabad', 1, 21)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Ludhiana', 1, 22)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Thane', 1, 23)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Maharashtra ', 1, 24)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Uttar Pradesh', 1, 25)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Karnataka ', 1, 26)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Andhra Pradesh ', 1, 27)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Tamil Nadu', 1, 28)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Andaman and Nicobar Islands', 1, 29)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Maharashtra ', 1, 30)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Uttar Pradesh', 1, 31)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Karnataka ', 1, 32)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Andhra Pradesh ', 1, 33)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Tamil Nadu', 1, 34)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'West Bengal', 1, 35)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Andhra Pradesh', 1, 36)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N' Arunachal Pradesh', 1, 37)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Assam, Bihar', 1, 38)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Chandigarh', 1, 39)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N' Chhattisgarh', 1, 40)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Dadra and Nagar Haveli', 1, 41)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N' Daman and Diu', 1, 42)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'NCR', 1, 43)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Goa', 1, 44)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Gujarat', 1, 45)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Haryana', 1, 46)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Himachal Pradesh', 1, 47)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N' Jammu and Kashmir', 1, 48)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Jharkhand', 1, 49)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Karnataka', 1, 50)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Kerala', 1, 51)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Lakshadweep', 1, 52)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Odisha', 1, 53)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Rajasthan', 1, 54)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N' Sikkim', 1, 55)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Tamil Nadu', 1, 56)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Telangana', 1, 57)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Madhya Pradesh', 1, 58)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Maharashtra', 1, 59)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Manipur', 1, 60)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Meghalaya', 1, 61)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Mizoram', 1, 62)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Puducherry', 1, 63)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N' Punjab', 1, 64)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Tripura', 1, 65)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Uttar Pradesh', 1, 66)
GO
INSERT [dbo].[StateMaster] ([name], [status], [Id]) VALUES (N'Uttarakhand', 1, 67)
GO
SET IDENTITY_INSERT [dbo].[StateMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Pics] ON 
GO
INSERT [dbo].[User_Pics] ([PicID], [USER_ID], [PicName], [PicFilePath], [PicText], [IsProfilePic], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status]) VALUES (21, 24, N'DJBBill_640464537348.pdf', N'Profile', NULL, 1, CAST(N'2017-09-28T12:15:13.400' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[User_Pics] ([PicID], [USER_ID], [PicName], [PicFilePath], [PicText], [IsProfilePic], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status]) VALUES (6, 24, N'Home.JPG', N'sss', NULL, 0, CAST(N'2017-09-27T18:09:13.157' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[User_Pics] ([PicID], [USER_ID], [PicName], [PicFilePath], [PicText], [IsProfilePic], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status]) VALUES (1, 24, N'HomeSelection.JPG', NULL, NULL, 0, CAST(N'2017-09-27T17:10:07.147' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[User_Pics] ([PicID], [USER_ID], [PicName], [PicFilePath], [PicText], [IsProfilePic], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status]) VALUES (3, 24, N'ShowInterest.JPG', N'sss', NULL, 0, CAST(N'2017-09-27T17:43:51.560' AS DateTime), NULL, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[User_Pics] OFF
GO
SET IDENTITY_INSERT [dbo].[USER_PROFILE] ON 
GO
INSERT [dbo].[USER_PROFILE] ([USER_PEROFILE_ID], [PROFILE_CREATED_BY], [F_NAME], [L_NAME], [M_NAME], [GENDER], [COUNTRY_ID], [CITY_ID], [ADDRESS], [E_MAIL], [PASSWORD], [DOB], [TIME], [PLACE_OF_BIRTH], [MY_RELIGION], [MY_MOTHER_TOUNG], [MY_SUB_CASTE], [MY_RASHI], [MY_GOTHRA], [MY_NATIVE_PLACE], [MY_HORO_MATCH], [PHONE_NO1], [PHONE_NO2], [MOBILE_NO1], [MARITIAL_STATUS], [ABOUT_ME], [ABOUT_MY_FAMILY], [ABOUT_MY_EDUCATION], [ABOUT_MY_PROFESSION], [MY_HIGHEST_DEGREE], [MY_MIN_INCOME], [MY_MAX_INCOME], [MY_WORK_STATUS], [DIET_STATUS], [SMOKE_STATUS], [DRINK_STATUS], [HEIGHT], [WEIGHT], [FACEBOOK_ID], [TWITTER_ID], [LINKEDIN_ID], [UPDATE_PROFILE_ID], [CREATED_BY], [MODIFIED_BY], [MODIFIED_ON], [ACTIVE], [STATUS], [JSONObject], [LastLogin]) VALUES (8, NULL, N'Rakesh', N'Singh', N'', N'1', N'1', N'2', N'sdfgsd', N'a!@a.co', N'123', CAST(N'1994-08-09T00:00:00.000' AS DateTime), N'12:6:6', N'Delhi', N'7', N'16', N'Joshi', N'4', N'asdasd', N'Rohini', N'', N'3424234234', N'3424234234', N'2342342342', N'1', N'fgdfgdfsg', N'', N'wsefsdad', N'fgsdfg', N'wsefsdad', N'6', N'6', N'4', N'2', N'2', N'2', N'33', N'33', NULL, NULL, NULL, N'', N'', N'', NULL, NULL, N'1', N'{"USER_ID":null,"firstName":"asdasd","lastName":"asd","landline":"3424234234","phone":null,"gender":"1","maritalstatus":"1","gotra":"asdasd","dob":{"date":{"year":"1994","month":"9","day":"8"},"jsdate":"1994-09-07T18:30:00.000Z","formatted":"08-09-1994","epoc":"778962600"},"birthplace":"wer","time":{"hh":"12","min":"6","sec":"6"},"password":"123","confirmPassword":"123","height":"33","weight":"33","incomerange":"6","smokestatus":"2","dietstatus":"2","workstatus":"2","drinkstatus":"2","religion":"7","mothertounge":"16","rashi":"4","education":"wsefsdad","profession":"fgsdfg","address":"sdfgsd","country":"1","city":"2","place":"sdfgs","zip":"234234234","about":"fgdfgdfsg","mySubCaste":"werw","recaptcha":"03AOmkcwJ2mqhROJc87Col3Sk6i7wNotDC-O-0Ou35c6LXZAORMIFRc9vjVy5FyBpoI0IrdQFEeCH0M10SsmhslqMHDPnaYWlg6G6Mn3aKBpKK18btL1R_27ZGZ3ll7IsXOHT74M338z4eRFtvwhnHZkhmKwtkcMmu--z1SFJeiJVveaHlnIEFGJUXrDouoCoQkmWamcKX-Q-_zML9Dspz22DMH3lz78aLkr0GtpUtFBigtAfSBlrd4rKhNODVDM3V_umbncrZ8gLNDsjzZIrxetrtf3_FsLNpS2PvDwXbgAOzIvBmaDT6-xwoC-SP0uM1TkndpsVm01cVJ93YuhW8ppJaYkjcrCLGhinZj0Tq_8m3fmLS9wOxHTL_lEw00yj5t83CUDCvC9AUthvxBMUxeeaub8xRcpLfKxJ43l0kVRoVzPROuGyI6LMjMGegYDtFx56rbJuvvp5mzyPc9r_lB5XOf1bmcbCZTQ","email":"a!@a.co","nativeplace":"werw","mobile":"2342342342","JsonRawData":null,"USER_PEROFILE_ID":0}', NULL)
GO
INSERT [dbo].[USER_PROFILE] ([USER_PEROFILE_ID], [PROFILE_CREATED_BY], [F_NAME], [L_NAME], [M_NAME], [GENDER], [COUNTRY_ID], [CITY_ID], [ADDRESS], [E_MAIL], [PASSWORD], [DOB], [TIME], [PLACE_OF_BIRTH], [MY_RELIGION], [MY_MOTHER_TOUNG], [MY_SUB_CASTE], [MY_RASHI], [MY_GOTHRA], [MY_NATIVE_PLACE], [MY_HORO_MATCH], [PHONE_NO1], [PHONE_NO2], [MOBILE_NO1], [MARITIAL_STATUS], [ABOUT_ME], [ABOUT_MY_FAMILY], [ABOUT_MY_EDUCATION], [ABOUT_MY_PROFESSION], [MY_HIGHEST_DEGREE], [MY_MIN_INCOME], [MY_MAX_INCOME], [MY_WORK_STATUS], [DIET_STATUS], [SMOKE_STATUS], [DRINK_STATUS], [HEIGHT], [WEIGHT], [FACEBOOK_ID], [TWITTER_ID], [LINKEDIN_ID], [UPDATE_PROFILE_ID], [CREATED_BY], [MODIFIED_BY], [MODIFIED_ON], [ACTIVE], [STATUS], [JSONObject], [LastLogin]) VALUES (9, NULL, N'Tina', N'Joshi', NULL, N'2', N'1', N'2', N'sdfgsd', N'a!1@a.co', N'123', CAST(N'1994-08-09T00:00:00.000' AS DateTime), N'12:6:6', N'Delhi', N'7', N'16', N'Pant', N'4', N'asdasd', N'PitamPura', NULL, N'3424234234', N'3424234234', N'2342342342', N'1', N'fgdfgdfsg', NULL, N'wsefsdad', N'fgsdfg', N'wsefsdad', N'6', N'6', N'2', N'2', N'2', N'2', N'33', N'33', NULL, NULL, NULL, N'', N'', N'', NULL, NULL, N'1', N'{"USER_ID":null,"firstName":"asdasd","lastName":"asd","landline":"3424234234","phone":null,"gender":"1","maritalstatus":"1","gotra":"asdasd","dob":{"date":{"year":"1994","month":"9","day":"8"},"jsdate":"1994-09-07T18:30:00.000Z","formatted":"08-09-1994","epoc":"778962600"},"birthplace":"wer","time":{"hh":"12","min":"6","sec":"6"},"password":"123","confirmPassword":"123","height":"33","weight":"33","incomerange":"6","smokestatus":"2","dietstatus":"2","workstatus":"2","drinkstatus":"2","religion":"7","mothertounge":"16","rashi":"4","education":"wsefsdad","profession":"fgsdfg","address":"sdfgsd","country":"1","city":"2","place":"sdfgs","zip":"234234234","about":"fgdfgdfsg","mySubCaste":"werw","recaptcha":"03AOmkcwLY7LrDRok0zdUFhkRpRbLr1tlVnJ7D2tLLbEOaPWXQJNYjztsUaE-yCyhM2tKf1ONYNtyYTrAwfBNXO1VRy5gejyferDhxLHDydODi0uCpWY3-XTR6aoukWOYhY_B7PFLO0e1R0zhvtMSjFsgnj94tMUwTenX5rwEcVZ9I_aS-cdGUUtNB58mQ23OtrDq89s-7ekT-u303UFsv8Fg2V-Gq8eg69ULKsdNWF-lgNvNy-XES1f_RH6SVtK__ley2_5e0HujoPI09jjOetFJsGilTPNRAOjKAsUd1g-Pj3qIdOJXlQEzgy5W0ijGi1AgEWNMlrk5I2J-PHclTJRDZ0d589BYO8tEVVbuBsjnfusEJfZBRv0w0Os3lAOQI0n5Lkcn25MLoGya_CVhZKI3m_2_v_zls7M6QA9k_7JuSs6u0KTehEed98FpUaRCApzR3l5Qo_SpJI3k1vmhMTXhQ5Z6ofGGJNQ","email":"a!1@a.co","nativeplace":"werw","mobile":"2342342342","JsonRawData":null,"USER_PEROFILE_ID":0}', NULL)
GO
INSERT [dbo].[USER_PROFILE] ([USER_PEROFILE_ID], [PROFILE_CREATED_BY], [F_NAME], [L_NAME], [M_NAME], [GENDER], [COUNTRY_ID], [CITY_ID], [ADDRESS], [E_MAIL], [PASSWORD], [DOB], [TIME], [PLACE_OF_BIRTH], [MY_RELIGION], [MY_MOTHER_TOUNG], [MY_SUB_CASTE], [MY_RASHI], [MY_GOTHRA], [MY_NATIVE_PLACE], [MY_HORO_MATCH], [PHONE_NO1], [PHONE_NO2], [MOBILE_NO1], [MARITIAL_STATUS], [ABOUT_ME], [ABOUT_MY_FAMILY], [ABOUT_MY_EDUCATION], [ABOUT_MY_PROFESSION], [MY_HIGHEST_DEGREE], [MY_MIN_INCOME], [MY_MAX_INCOME], [MY_WORK_STATUS], [DIET_STATUS], [SMOKE_STATUS], [DRINK_STATUS], [HEIGHT], [WEIGHT], [FACEBOOK_ID], [TWITTER_ID], [LINKEDIN_ID], [UPDATE_PROFILE_ID], [CREATED_BY], [MODIFIED_BY], [MODIFIED_ON], [ACTIVE], [STATUS], [JSONObject], [LastLogin]) VALUES (10, NULL, N'Rina', N'Bisht', NULL, N'2', N'1', N'2', N'sdfgsd', N'a!221@a.co', N'123', CAST(N'1994-08-09T00:00:00.000' AS DateTime), N'12:6:6', N'Delhi', N'7', N'16', N'Pandey', N'4', N'asdasd', N'Dumkabanger', NULL, N'3424234234', N'3424234234', N'2342342342', N'1', N'fgdfgdfsg', NULL, N'wsefsdad', N'fgsdfg', N'wsefsdad', N'6', N'6', N'3', N'2', N'2', N'2', N'33', N'33', NULL, NULL, NULL, N'', N'', N'', NULL, NULL, N'1', N'{"USER_ID":null,"firstName":"asdasd","lastName":"asd","landline":"3424234234","phone":null,"gender":"1","maritalstatus":"1","gotra":"asdasd","dob":{"date":{"year":"1994","month":"9","day":"8"},"jsdate":"1994-09-07T18:30:00.000Z","formatted":"08-09-1994","epoc":"778962600"},"birthplace":"wer","time":{"hh":"12","min":"6","sec":"6"},"password":"123","confirmPassword":"123","height":"33","weight":"33","incomerange":"6","smokestatus":"2","dietstatus":"2","workstatus":"2","drinkstatus":"2","religion":"7","mothertounge":"16","rashi":"4","education":"wsefsdad","profession":"fgsdfg","address":"sdfgsd","country":"1","city":"2","place":"sdfgs","zip":"234234234","about":"fgdfgdfsg","mySubCaste":"werw","recaptcha":"03AOmkcwL9wf_URcIH-DZSd5aUQkRitIzbQDPtfLwK32LNW6IpDX5Tl4CkMMzxru1grTs7c1Dpr4OwOUk7JYnn3yTiuyTuIuOlKXYMBV7qC27bbcGdO5O2lcIWzBH48fW8rFN5m4keuyb3wPZGCL2C5GFtZvJcGgIuSC6qcMM2x9nlGkX0_eozIYms6QQNxtsDuPoon9rNKxHpfnCReAsNUPh0vF2PAipzIjwrrWHBb0OacduSHgyANW-Y-RrcTn65mSFDOk5AcBi_d7fYoiCaW3_9Ts3bnl_wdIuMM_ST-EwpJwRtP2DXkt8LJJJbAVJ8o6CxTyiKLOBCsJoxiJBDJlqTkxlhhRdM9Nh3MC0iTg_EUAAXOavA99ClU2Rf0PLY2OlDJQTlNDx9N6a4zPa2rcAtRlQ2mKy-LbrdX-aQokenBhCmnmfvOvJZE1RE9ZW0sw4uk4qiTrhNYwaa7kK7QBh9a_Jl1STUxA","email":"a!221@a.co","nativeplace":"werw","mobile":"2342342342","JsonRawData":null,"USER_PEROFILE_ID":0}', NULL)
GO
INSERT [dbo].[USER_PROFILE] ([USER_PEROFILE_ID], [PROFILE_CREATED_BY], [F_NAME], [L_NAME], [M_NAME], [GENDER], [COUNTRY_ID], [CITY_ID], [ADDRESS], [E_MAIL], [PASSWORD], [DOB], [TIME], [PLACE_OF_BIRTH], [MY_RELIGION], [MY_MOTHER_TOUNG], [MY_SUB_CASTE], [MY_RASHI], [MY_GOTHRA], [MY_NATIVE_PLACE], [MY_HORO_MATCH], [PHONE_NO1], [PHONE_NO2], [MOBILE_NO1], [MARITIAL_STATUS], [ABOUT_ME], [ABOUT_MY_FAMILY], [ABOUT_MY_EDUCATION], [ABOUT_MY_PROFESSION], [MY_HIGHEST_DEGREE], [MY_MIN_INCOME], [MY_MAX_INCOME], [MY_WORK_STATUS], [DIET_STATUS], [SMOKE_STATUS], [DRINK_STATUS], [HEIGHT], [WEIGHT], [FACEBOOK_ID], [TWITTER_ID], [LINKEDIN_ID], [UPDATE_PROFILE_ID], [CREATED_BY], [MODIFIED_BY], [MODIFIED_ON], [ACTIVE], [STATUS], [JSONObject], [LastLogin]) VALUES (6, 2, N'Amit', N'Jain', NULL, N'1', N'1', N'1', N'Delhi', N'amit@gmail.com', N'123', CAST(N'1979-04-25T00:00:00.000' AS DateTime), N'12:20', N'Delhi', N'1', N'1', N'Bhatt', N'2', N'Kaushik', N'ShalimarBagh', N'4', N'223423', N'7678', N'68768767887', N'2', N'hgfhjfh', N'fhjfhg', N'fgf', N'gggf', N'NIIT', N'3', N'2', N'1', N'2', N'1', N'2', N'2', N'22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL)
GO
INSERT [dbo].[USER_PROFILE] ([USER_PEROFILE_ID], [PROFILE_CREATED_BY], [F_NAME], [L_NAME], [M_NAME], [GENDER], [COUNTRY_ID], [CITY_ID], [ADDRESS], [E_MAIL], [PASSWORD], [DOB], [TIME], [PLACE_OF_BIRTH], [MY_RELIGION], [MY_MOTHER_TOUNG], [MY_SUB_CASTE], [MY_RASHI], [MY_GOTHRA], [MY_NATIVE_PLACE], [MY_HORO_MATCH], [PHONE_NO1], [PHONE_NO2], [MOBILE_NO1], [MARITIAL_STATUS], [ABOUT_ME], [ABOUT_MY_FAMILY], [ABOUT_MY_EDUCATION], [ABOUT_MY_PROFESSION], [MY_HIGHEST_DEGREE], [MY_MIN_INCOME], [MY_MAX_INCOME], [MY_WORK_STATUS], [DIET_STATUS], [SMOKE_STATUS], [DRINK_STATUS], [HEIGHT], [WEIGHT], [FACEBOOK_ID], [TWITTER_ID], [LINKEDIN_ID], [UPDATE_PROFILE_ID], [CREATED_BY], [MODIFIED_BY], [MODIFIED_ON], [ACTIVE], [STATUS], [JSONObject], [LastLogin]) VALUES (7, 3, N'Sina', N'Jain', NULL, N'2', N'1', N'3', N'Nioida', N'anita@gmail.com', N'123', CAST(N'1988-04-23T00:00:00.000' AS DateTime), N'1:20', N'Delhi', N'1', N'2', N'Raj', N'3', N'Gautra', N'Lucknow central', N'2', N'22222', N'2222', N'222222', N'1', N'qwwww', N'wsw', N'sss2', N'uyug', N'hghgh', N'1', N'2', N'3', N'2', N'1', N'1', N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, CAST(N'2017-09-27T11:28:09.470' AS DateTime))
GO
INSERT [dbo].[USER_PROFILE] ([USER_PEROFILE_ID], [PROFILE_CREATED_BY], [F_NAME], [L_NAME], [M_NAME], [GENDER], [COUNTRY_ID], [CITY_ID], [ADDRESS], [E_MAIL], [PASSWORD], [DOB], [TIME], [PLACE_OF_BIRTH], [MY_RELIGION], [MY_MOTHER_TOUNG], [MY_SUB_CASTE], [MY_RASHI], [MY_GOTHRA], [MY_NATIVE_PLACE], [MY_HORO_MATCH], [PHONE_NO1], [PHONE_NO2], [MOBILE_NO1], [MARITIAL_STATUS], [ABOUT_ME], [ABOUT_MY_FAMILY], [ABOUT_MY_EDUCATION], [ABOUT_MY_PROFESSION], [MY_HIGHEST_DEGREE], [MY_MIN_INCOME], [MY_MAX_INCOME], [MY_WORK_STATUS], [DIET_STATUS], [SMOKE_STATUS], [DRINK_STATUS], [HEIGHT], [WEIGHT], [FACEBOOK_ID], [TWITTER_ID], [LINKEDIN_ID], [UPDATE_PROFILE_ID], [CREATED_BY], [MODIFIED_BY], [MODIFIED_ON], [ACTIVE], [STATUS], [JSONObject], [LastLogin]) VALUES (20, NULL, N'sumit', N'joshi', NULL, N'1', N'1', N'1', N'Rohini Delhi', N'sumit.joshij@gmail.com', N'Lovelove@1', CAST(N'1999-09-09T00:00:00.000' AS DateTime), N'0:1:1', N'Delhi', N'1', N'16', N'Pant', N'5', N'Kaushik', N'Delhi', NULL, N'0127850127', N'0127850127', N'9650899699', N'3', N'Will tell u later', NULL, N'I did MBA from Delhi University', N'I am a software developer', N'I did MBA from Delhi', N'4', N'4', N'3', N'1', N'2', N'2', N'5.6', N'85', N'www.facebook.com/sumit.joshij', N'www.twitter.com', N'www.linkdin.com', N'', N'', N'', NULL, NULL, N'1', N'', NULL)
GO
INSERT [dbo].[USER_PROFILE] ([USER_PEROFILE_ID], [PROFILE_CREATED_BY], [F_NAME], [L_NAME], [M_NAME], [GENDER], [COUNTRY_ID], [CITY_ID], [ADDRESS], [E_MAIL], [PASSWORD], [DOB], [TIME], [PLACE_OF_BIRTH], [MY_RELIGION], [MY_MOTHER_TOUNG], [MY_SUB_CASTE], [MY_RASHI], [MY_GOTHRA], [MY_NATIVE_PLACE], [MY_HORO_MATCH], [PHONE_NO1], [PHONE_NO2], [MOBILE_NO1], [MARITIAL_STATUS], [ABOUT_ME], [ABOUT_MY_FAMILY], [ABOUT_MY_EDUCATION], [ABOUT_MY_PROFESSION], [MY_HIGHEST_DEGREE], [MY_MIN_INCOME], [MY_MAX_INCOME], [MY_WORK_STATUS], [DIET_STATUS], [SMOKE_STATUS], [DRINK_STATUS], [HEIGHT], [WEIGHT], [FACEBOOK_ID], [TWITTER_ID], [LINKEDIN_ID], [UPDATE_PROFILE_ID], [CREATED_BY], [MODIFIED_BY], [MODIFIED_ON], [ACTIVE], [STATUS], [JSONObject], [LastLogin]) VALUES (22, NULL, N'Sumit', N'Joshi', NULL, N'1', N'1', N'1', N'Delhi', N'sumit@a.com', N'123', CAST(N'1999-09-09T00:00:00.000' AS DateTime), N'1:1:2', N'Delhi', N'1', N'1', N'Pant', N'2', N'Brahiman', N'Delhi', NULL, N'2313123123', N'2313123123', N'2342342342', N'1', N'Tell u later about my self', NULL, N'Tell u later about education', N'Tell u later about Prof', N'Tell u later about e', N'4', N'4', N'1', N'1', N'2', N'1', N'7.7', N'189', N'www.facebook.com/sumit.joshij', N'Twitter', N'linkdin', N'', N'', N'', NULL, NULL, N'1', N'', NULL)
GO
INSERT [dbo].[USER_PROFILE] ([USER_PEROFILE_ID], [PROFILE_CREATED_BY], [F_NAME], [L_NAME], [M_NAME], [GENDER], [COUNTRY_ID], [CITY_ID], [ADDRESS], [E_MAIL], [PASSWORD], [DOB], [TIME], [PLACE_OF_BIRTH], [MY_RELIGION], [MY_MOTHER_TOUNG], [MY_SUB_CASTE], [MY_RASHI], [MY_GOTHRA], [MY_NATIVE_PLACE], [MY_HORO_MATCH], [PHONE_NO1], [PHONE_NO2], [MOBILE_NO1], [MARITIAL_STATUS], [ABOUT_ME], [ABOUT_MY_FAMILY], [ABOUT_MY_EDUCATION], [ABOUT_MY_PROFESSION], [MY_HIGHEST_DEGREE], [MY_MIN_INCOME], [MY_MAX_INCOME], [MY_WORK_STATUS], [DIET_STATUS], [SMOKE_STATUS], [DRINK_STATUS], [HEIGHT], [WEIGHT], [FACEBOOK_ID], [TWITTER_ID], [LINKEDIN_ID], [UPDATE_PROFILE_ID], [CREATED_BY], [MODIFIED_BY], [MODIFIED_ON], [ACTIVE], [STATUS], [JSONObject], [LastLogin]) VALUES (4, 1, N'Sumit', N'Joshi', NULL, N'1', N'1', N'1', N'Hyd', N'sumit@gmail.com', N'123', CAST(N'1978-05-28T00:00:00.000' AS DateTime), N'16:20', N'Delhi', N'2', N'1', N'Pandey', N'6', N'Gautra2', N'Charbagh', N'3', N'123123', N'1231', N'32323434', N'1', N'Nothing', N'Tell u later', N'MIT', N'Job', N'MIT', N'1', N'1', N'1', N'1', N'1', N'2', N'5', N'78', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, CAST(N'2017-09-25T12:10:16.833' AS DateTime))
GO
INSERT [dbo].[USER_PROFILE] ([USER_PEROFILE_ID], [PROFILE_CREATED_BY], [F_NAME], [L_NAME], [M_NAME], [GENDER], [COUNTRY_ID], [CITY_ID], [ADDRESS], [E_MAIL], [PASSWORD], [DOB], [TIME], [PLACE_OF_BIRTH], [MY_RELIGION], [MY_MOTHER_TOUNG], [MY_SUB_CASTE], [MY_RASHI], [MY_GOTHRA], [MY_NATIVE_PLACE], [MY_HORO_MATCH], [PHONE_NO1], [PHONE_NO2], [MOBILE_NO1], [MARITIAL_STATUS], [ABOUT_ME], [ABOUT_MY_FAMILY], [ABOUT_MY_EDUCATION], [ABOUT_MY_PROFESSION], [MY_HIGHEST_DEGREE], [MY_MIN_INCOME], [MY_MAX_INCOME], [MY_WORK_STATUS], [DIET_STATUS], [SMOKE_STATUS], [DRINK_STATUS], [HEIGHT], [WEIGHT], [FACEBOOK_ID], [TWITTER_ID], [LINKEDIN_ID], [UPDATE_PROFILE_ID], [CREATED_BY], [MODIFIED_BY], [MODIFIED_ON], [ACTIVE], [STATUS], [JSONObject], [LastLogin]) VALUES (23, NULL, N'Sumit', N'Joshi', NULL, N'1', N'1', N'1', N'Delhi', N'sumit1@a.com', N'123', CAST(N'1999-09-09T00:00:00.000' AS DateTime), N'1:1:2', N'Delhi', N'1', N'1', N'Pant', N'2', N'Brahiman', N'Delhi', NULL, N'2313123123', N'2313123123', N'2342342342', N'1', N'Tell u later about my self', NULL, N'Tell u later about education', N'Tell u later about Prof', N'Tell u later about e', N'4', N'4', N'1', N'1', N'2', N'1', N'7.7', N'189', N'www.facebook.com/sumit.joshij', N'Twitter', N'linkdin', N'', N'', N'', NULL, NULL, N'1', N'', NULL)
GO
INSERT [dbo].[USER_PROFILE] ([USER_PEROFILE_ID], [PROFILE_CREATED_BY], [F_NAME], [L_NAME], [M_NAME], [GENDER], [COUNTRY_ID], [CITY_ID], [ADDRESS], [E_MAIL], [PASSWORD], [DOB], [TIME], [PLACE_OF_BIRTH], [MY_RELIGION], [MY_MOTHER_TOUNG], [MY_SUB_CASTE], [MY_RASHI], [MY_GOTHRA], [MY_NATIVE_PLACE], [MY_HORO_MATCH], [PHONE_NO1], [PHONE_NO2], [MOBILE_NO1], [MARITIAL_STATUS], [ABOUT_ME], [ABOUT_MY_FAMILY], [ABOUT_MY_EDUCATION], [ABOUT_MY_PROFESSION], [MY_HIGHEST_DEGREE], [MY_MIN_INCOME], [MY_MAX_INCOME], [MY_WORK_STATUS], [DIET_STATUS], [SMOKE_STATUS], [DRINK_STATUS], [HEIGHT], [WEIGHT], [FACEBOOK_ID], [TWITTER_ID], [LINKEDIN_ID], [UPDATE_PROFILE_ID], [CREATED_BY], [MODIFIED_BY], [MODIFIED_ON], [ACTIVE], [STATUS], [JSONObject], [LastLogin]) VALUES (24, 1, N'Sumit', N'Joshi', NULL, N'1', N'1', N'1', N'Delhi', N'sumit12@a.com', N'123', CAST(N'1999-09-09T00:00:00.000' AS DateTime), N'1:1:2', N'Delhi', N'1', N'1', N'Pant', N'2', N'Brahiman', N'Delhi', NULL, N'2313123123', N'2313123123', N'2342342342', N'1', N'Tell u later about my self', NULL, N'Tell u later about education', N'Tell u later about Prof', N'Tell u later about e', N'4', N'4', N'1', N'1', N'2', N'1', N'7.7', N'189', N'www.facebook.com/sumit.joshij', N'Twitter', N'linkdin', N'', N'', N'', NULL, NULL, N'1', N'', CAST(N'2017-09-29T13:33:20.173' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[USER_PROFILE] OFF
GO
SET IDENTITY_INSERT [dbo].[UserMessagesLog] ON 
GO
INSERT [dbo].[UserMessagesLog] ([MessageId], [InterestId], [Message], [ContactEmailId], [ContactPhoneNumber], [CreatedOn], [CreatedBy], [status]) VALUES (1, 1, N'Hello, First Msg From ID 4 to 10', NULL, NULL, CAST(N'2017-09-19T20:54:09.060' AS DateTime), NULL, 1)
GO
INSERT [dbo].[UserMessagesLog] ([MessageId], [InterestId], [Message], [ContactEmailId], [ContactPhoneNumber], [CreatedOn], [CreatedBy], [status]) VALUES (2, 2, N'Hello, First Msg From ID 4 to 7', NULL, NULL, CAST(N'2017-09-19T20:54:25.557' AS DateTime), NULL, 1)
GO
INSERT [dbo].[UserMessagesLog] ([MessageId], [InterestId], [Message], [ContactEmailId], [ContactPhoneNumber], [CreatedOn], [CreatedBy], [status]) VALUES (3, 3, N'Hello, First Msg From ID 9', NULL, NULL, CAST(N'2017-09-19T20:54:40.403' AS DateTime), NULL, 1)
GO
INSERT [dbo].[UserMessagesLog] ([MessageId], [InterestId], [Message], [ContactEmailId], [ContactPhoneNumber], [CreatedOn], [CreatedBy], [status]) VALUES (4, 4, N'Hello, First Msg From ID 9', NULL, NULL, CAST(N'2017-09-19T20:54:51.220' AS DateTime), NULL, 1)
GO
INSERT [dbo].[UserMessagesLog] ([MessageId], [InterestId], [Message], [ContactEmailId], [ContactPhoneNumber], [CreatedOn], [CreatedBy], [status]) VALUES (5, 5, N'Hello, First Msg From ID 10', NULL, NULL, CAST(N'2017-09-19T20:55:02.700' AS DateTime), NULL, 1)
GO
INSERT [dbo].[UserMessagesLog] ([MessageId], [InterestId], [Message], [ContactEmailId], [ContactPhoneNumber], [CreatedOn], [CreatedBy], [status]) VALUES (6, 6, N'Hello, First Msg From ID 6', NULL, NULL, CAST(N'2017-09-19T20:55:13.123' AS DateTime), NULL, 1)
GO
INSERT [dbo].[UserMessagesLog] ([MessageId], [InterestId], [Message], [ContactEmailId], [ContactPhoneNumber], [CreatedOn], [CreatedBy], [status]) VALUES (7, 7, N'Hello, First Msg From ID 7', NULL, NULL, CAST(N'2017-09-19T20:55:22.610' AS DateTime), NULL, 1)
GO
INSERT [dbo].[UserMessagesLog] ([MessageId], [InterestId], [Message], [ContactEmailId], [ContactPhoneNumber], [CreatedOn], [CreatedBy], [status]) VALUES (8, 9, N'rejected', NULL, NULL, CAST(N'2017-09-20T14:14:12.277' AS DateTime), NULL, 1)
GO
INSERT [dbo].[UserMessagesLog] ([MessageId], [InterestId], [Message], [ContactEmailId], [ContactPhoneNumber], [CreatedOn], [CreatedBy], [status]) VALUES (9, 10, N'Req Senmd', NULL, NULL, CAST(N'2017-09-20T14:28:42.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[UserMessagesLog] ([MessageId], [InterestId], [Message], [ContactEmailId], [ContactPhoneNumber], [CreatedOn], [CreatedBy], [status]) VALUES (10, 11, N'adasd', N'1', N'3456456464564564654', CAST(N'2017-09-24T15:13:31.400' AS DateTime), NULL, 1)
GO
INSERT [dbo].[UserMessagesLog] ([MessageId], [InterestId], [Message], [ContactEmailId], [ContactPhoneNumber], [CreatedOn], [CreatedBy], [status]) VALUES (11, 12, N'dfgdf', N'', N'34534', CAST(N'2017-09-27T12:45:21.517' AS DateTime), NULL, 1)
GO
INSERT [dbo].[UserMessagesLog] ([MessageId], [InterestId], [Message], [ContactEmailId], [ContactPhoneNumber], [CreatedOn], [CreatedBy], [status]) VALUES (12, 13, N'dfgdf', N'', N'34534', CAST(N'2017-09-27T12:47:21.390' AS DateTime), NULL, 1)
GO
INSERT [dbo].[UserMessagesLog] ([MessageId], [InterestId], [Message], [ContactEmailId], [ContactPhoneNumber], [CreatedOn], [CreatedBy], [status]) VALUES (13, 14, N'dfgdf', N'2', N'6666', CAST(N'2017-09-27T12:47:36.513' AS DateTime), NULL, 1)
GO
INSERT [dbo].[UserMessagesLog] ([MessageId], [InterestId], [Message], [ContactEmailId], [ContactPhoneNumber], [CreatedOn], [CreatedBy], [status]) VALUES (15, 16, N'sdfsdf', N'1', N'55555555', CAST(N'2017-09-27T13:29:09.737' AS DateTime), NULL, 1)
GO
INSERT [dbo].[UserMessagesLog] ([MessageId], [InterestId], [Message], [ContactEmailId], [ContactPhoneNumber], [CreatedOn], [CreatedBy], [status]) VALUES (16, 17, N'dfgdfg', N'1', N'345345345345', CAST(N'2017-09-28T14:56:14.993' AS DateTime), NULL, 1)
GO
INSERT [dbo].[UserMessagesLog] ([MessageId], [InterestId], [Message], [ContactEmailId], [ContactPhoneNumber], [CreatedOn], [CreatedBy], [status]) VALUES (14, 15, N'dfgdf', N'1', N'6666', CAST(N'2017-09-27T12:47:45.413' AS DateTime), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[UserMessagesLog] OFF
GO
SET IDENTITY_INSERT [dbo].[VisitorDetails] ON 
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (1, 7, 4, CAST(N'2017-09-22T12:25:01.890' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (2, 10, 4, CAST(N'2017-09-22T12:28:14.597' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (3, 9, 4, CAST(N'2017-09-22T12:28:19.353' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (4, 4, 7, CAST(N'2017-09-22T12:33:15.550' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (5, 7, 4, CAST(N'2017-09-22T12:35:01.837' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (6, 4, 9, CAST(N'2017-09-22T12:35:57.980' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (7, 9, 4, CAST(N'2017-09-22T14:31:36.080' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (8, 9, 4, CAST(N'2017-09-22T14:44:52.443' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (9, 9, 4, CAST(N'2017-09-22T15:28:40.333' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (10, 9, 4, CAST(N'2017-09-22T15:29:07.650' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (11, 9, 4, CAST(N'2017-09-22T15:29:25.683' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (12, 9, 4, CAST(N'2017-09-22T15:29:32.447' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (13, 9, 4, CAST(N'2017-09-22T15:30:05.630' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (14, 9, 4, CAST(N'2017-09-22T15:30:18.420' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (15, 9, 4, CAST(N'2017-09-22T15:30:28.250' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (16, 9, 4, CAST(N'2017-09-22T15:30:39.560' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (17, 9, 4, CAST(N'2017-09-22T15:30:53.213' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (18, 9, 4, CAST(N'2017-09-22T15:30:58.733' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (19, 9, 4, CAST(N'2017-09-22T17:57:42.097' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (20, 9, 4, CAST(N'2017-09-22T17:58:48.143' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (21, 4, 7, CAST(N'2017-09-22T18:01:08.127' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (22, 8, 7, CAST(N'2017-09-22T18:05:50.210' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (23, 6, 7, CAST(N'2017-09-22T18:06:02.493' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (24, 4, 7, CAST(N'2017-09-22T18:06:06.990' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (25, 7, 8, CAST(N'2017-09-22T18:06:46.487' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (26, 8, 7, CAST(N'2017-09-22T18:10:27.530' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (27, 6, 7, CAST(N'2017-09-22T18:12:11.420' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (28, 4, 7, CAST(N'2017-09-22T18:12:42.170' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (29, 4, 7, CAST(N'2017-09-23T15:36:24.640' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (30, 4, 7, CAST(N'2017-09-23T15:37:54.240' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (31, 4, 7, CAST(N'2017-09-23T15:38:17.987' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (32, 4, 7, CAST(N'2017-09-23T15:38:55.307' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (33, 4, 7, CAST(N'2017-09-23T15:39:09.200' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (34, 4, 7, CAST(N'2017-09-23T15:40:12.970' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (35, 4, 7, CAST(N'2017-09-23T15:41:08.500' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (37, 7, 4, CAST(N'2017-09-24T14:54:12.613' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (38, 7, 4, CAST(N'2017-09-24T15:10:13.637' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (39, 7, 4, CAST(N'2017-09-24T15:10:57.287' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (40, 7, 4, CAST(N'2017-09-24T15:11:40.980' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (41, 7, 4, CAST(N'2017-09-24T15:11:53.390' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (42, 7, 4, CAST(N'2017-09-24T15:15:42.413' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (43, 7, 4, CAST(N'2017-09-24T15:15:51.740' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (44, 7, 4, CAST(N'2017-09-24T16:11:39.483' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (45, 7, 4, CAST(N'2017-09-24T16:21:17.520' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (46, 9, 4, CAST(N'2017-09-24T16:21:38.367' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (47, 7, 4, CAST(N'2017-09-24T16:27:37.963' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (48, 9, 4, CAST(N'2017-09-25T11:40:51.810' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (49, 7, 4, CAST(N'2017-09-25T11:41:06.190' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (50, 7, 4, CAST(N'2017-09-25T12:04:20.840' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (51, 7, 4, CAST(N'2017-09-25T12:18:37.513' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (52, 7, 4, CAST(N'2017-09-25T12:20:10.920' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (53, 7, 4, CAST(N'2017-09-25T12:20:20.593' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (56, 24, 7, CAST(N'2017-09-26T19:47:43.467' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (57, 22, 7, CAST(N'2017-09-26T19:48:15.880' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (58, 9, 24, CAST(N'2017-09-27T12:44:58.247' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (59, 10, 24, CAST(N'2017-09-27T13:28:55.017' AS DateTime), 1)
GO
INSERT [dbo].[VisitorDetails] ([ID], [MyID], [VisitorID], [VisitorDate], [Status]) VALUES (60, 7, 24, CAST(N'2017-09-28T14:55:58.240' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[VisitorDetails] OFF
GO
ALTER TABLE [dbo].[IncomeMaster] ADD  CONSTRAINT [DF_IncomeMaster_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[InterestShown] ADD  CONSTRAINT [DF_InterestShown_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[LOOKUP_CODE_MASTER] ADD  CONSTRAINT [DF_LOOKUP_CODE_MASTER_STATUS]  DEFAULT ((1)) FOR [STATUS]
GO
ALTER TABLE [dbo].[LOOKUP_VALUE] ADD  CONSTRAINT [DF_LOOKUP_VALUE_CREATED_ON]  DEFAULT (getdate()) FOR [CREATED_ON]
GO
ALTER TABLE [dbo].[SEARCH_SAVED] ADD  CONSTRAINT [DF_SEARCH_SAVED_STATUS]  DEFAULT ((1)) FOR [STATUS]
GO
ALTER TABLE [dbo].[User_Pics] ADD  CONSTRAINT [DF_User_Pics_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[User_Pics] ADD  CONSTRAINT [DF_User_Pics_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[USER_PROFILE] ADD  CONSTRAINT [DF_USER_PROFILE_PROFILE_CREATED_BY]  DEFAULT ((3001)) FOR [PROFILE_CREATED_BY]
GO
ALTER TABLE [dbo].[USER_PROFILE] ADD  CONSTRAINT [DF_USER_PROFILE_STATUS]  DEFAULT ((1)) FOR [STATUS]
GO
ALTER TABLE [dbo].[USER_PROFILE] ADD  CONSTRAINT [DF_USER_PROFILE_JSONObject]  DEFAULT ((1)) FOR [JSONObject]
GO
ALTER TABLE [dbo].[UserMessagesLog] ADD  CONSTRAINT [DF_UserMessagesLog_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[UserMessagesLog] ADD  CONSTRAINT [DF_UserMessagesLog_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[VisitorDetails] ADD  CONSTRAINT [DF_VisitorDetails_VisitorDate]  DEFAULT (getdate()) FOR [VisitorDate]
GO
ALTER TABLE [dbo].[VisitorDetails] ADD  CONSTRAINT [DF_VisitorDetails_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUserPic]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[DeleteUserPic]
(
	@PicID int
)
AS
	SET NOCOUNT OFF;
declare @userid int
select @userid = USER_ID from User_Pics where PicID =   @PicID
select @userid

UPDATE User_Pics SET status  = 0 WHERE PicID = @PicID AND USER_ID = @userid
GO
/****** Object:  StoredProcedure [dbo].[GetAcceptMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAcceptMaster]
AS
	SET NOCOUNT ON;
SELECT        AcceptMaster.*
FROM            AcceptMaster
GO
/****** Object:  StoredProcedure [dbo].[GetBasicProfileDetails]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetBasicProfileDetails]
(
	@emailId varchar(200) 
)
as
select F_NAME as firstName, L_NAME as lastName, GENDER as gender, PHONE_NO1 as landline, MOBILE_NO1 as phone  from USER_PROFILE
where E_MAIL = @emailId
GO
/****** Object:  StoredProcedure [dbo].[GetCasteMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCasteMaster]
AS
	SET NOCOUNT ON;
SELECT        Id, Name, Status
FROM            CasteMaster
GO
/****** Object:  StoredProcedure [dbo].[GetCountOfPendingResponseByEmailId]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCountOfPendingResponseByEmailId]
@E_MAIL varchar(200)
AS  
SET NOCOUNT ON;  
declare @id as int
select  @id = USER_PEROFILE_ID from [USER_PROFILE] where E_MAIL = @E_MAIL
declare @commcount as int
declare @respcount as int
declare @reqpendingcount as int
SELECT @commcount = count([CommunicatorUserId]) FROM [InterestShown] where status = 1 and ResponderUserId= @id
--select @commcount
SELECT @respcount = count([ResponderUserId]) FROM [InterestShown] where status = 1 and CommunicatorUserId=@id
--select @respcount
select @reqpendingcount = @commcount - @respcount

if(@reqpendingcount <= 0)
	set @reqpendingcount =0

select @reqpendingcount
GO
/****** Object:  StoredProcedure [dbo].[GetDrinkMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetDrinkMaster]
AS
	SET NOCOUNT ON;
SELECT        Id, name, Status
FROM            DrinkMaster
GO
/****** Object:  StoredProcedure [dbo].[GetForgetPassword]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetForgetPassword]
@Useremailid varchar(80)

AS  
 SET NOCOUNT ON;  
SELECT   PASSWORD as password, FULL_NAME as name, E_MAIL as email from USER_PROFILE
where E_MAIL = @Useremailid  
GO
/****** Object:  StoredProcedure [dbo].[GetGenderMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetGenderMaster]
AS
	SET NOCOUNT ON;
SELECT        Id, status, name
FROM            GenderMaster
GO
/****** Object:  StoredProcedure [dbo].[GetInterestedProfiles]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInterestedProfiles]
@E_MAIL varchar(200)
AS  
 SET NOCOUNT ON;  
select ins.ResponseMessage as message, 
up.USER_PEROFILE_ID as profileid,  up.FULL_NAME as name, am.Name as status,
up.E_MAIL as email
 from [dbo].[InterestShown] ins
join [dbo].[USER_PROFILE] up
on ins.ResponderUserId = up.USER_PEROFILE_ID
--and ins.ResponderUserId = up.USER_PEROFILE_ID
join [AcceptMaster] am
on am.id = ins.ResponseStatus
where up.E_MAIL = @E_MAIL
order by ins.CreatedOn desc



GO
/****** Object:  StoredProcedure [dbo].[GetInterestedProfilesByEmailId]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInterestedProfilesByEmailId]
@E_MAIL varchar(200)
AS  
 SET NOCOUNT ON;  
declare @id as int
select  @id = USER_PEROFILE_ID from [USER_PROFILE] where E_MAIL = @E_MAIL
--select @id
select  distinct up.FULL_NAME as name, am.Name as status,  ins.CommunicatorUserId as profileid ,
ins.CreatedOn as communicationDate, up.E_MAIL as E_MAIL
from InterestShown ins
--join InterestShown ins1 on ins1.ResponderUserId = ins.CommunicatorUserId 
join USER_PROFILE up on ins.CommunicatorUserId = up.USER_PEROFILE_ID 
join AcceptMaster am on am.Id = ins.ResponseStatus
where ins.ResponderUserId=@id and ins.CommunicatorUserId <> @id
and ins.ResponseStatus <> 2 order by ins.CreatedOn desc 




GO
/****** Object:  StoredProcedure [dbo].[GetJobMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetJobMaster]
AS
	SET NOCOUNT ON;
SELECT        Id, name, status
FROM            JobMaster
GO
/****** Object:  StoredProcedure [dbo].[GetLanguageMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetLanguageMaster]
AS
	SET NOCOUNT ON;
SELECT        Id, name, status
FROM            LanguageMaster
GO
/****** Object:  StoredProcedure [dbo].[GetLogin]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbo].[GetLogin]  
@UK_useremailid varchar(80),
@UK_PASSWORD varchar(20)
AS  
 SET NOCOUNT ON;  
SELECT    USER_ID as Code from [USER_PROFILE]
where E_MAIL = @UK_useremailid and PASSWORD = @UK_PASSWORD
and status=1

update USER_PROFILE set LastLogin = getdate() where E_MAIL = @UK_useremailid and PASSWORD = @UK_PASSWORD
GO
/****** Object:  StoredProcedure [dbo].[GetMaritialStatusMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetMaritialStatusMaster]
AS
	SET NOCOUNT ON;
SELECT        Id, name, status
FROM            MaritialStatusMaster
GO
/****** Object:  StoredProcedure [dbo].[GetMasterData]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

  CREATE PROCEDURE [dbo].[GetMasterData]
AS
	SET NOCOUNT ON;
SELECT [VALUE_ID] as id ,[VALUE1] as name , LOOKUP_ID FROM LOOKUP_VALUE   where status = 1 
order by LOOKUP_ID, value1
GO
/****** Object:  StoredProcedure [dbo].[GetMotherToungeMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[GetMotherToungeMaster]
AS
	SET NOCOUNT ON;
SELECT        Id, name, status
FROM MotherToungeMaster where  status =1
GO
/****** Object:  StoredProcedure [dbo].[GetProfileById]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbo].[GetProfileById]  
@USER_PEROFILE_ID varchar(200)
AS  
 SET NOCOUNT ON;  
SELECT        JsonObject as JsonRawData, USER_ID, USER_PEROFILE_ID from USER_PROFILE
where USER_PEROFILE_ID = @USER_PEROFILE_ID

GO
/****** Object:  StoredProcedure [dbo].[GetProfileCreatedByMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetProfileCreatedByMaster]
AS
	SET NOCOUNT ON;
SELECT        Id, status, name
FROM            ProfileCreatedByMaster
GO
/****** Object:  StoredProcedure [dbo].[GetProfileDetailByUniqueId]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProfileDetailByUniqueId] 
@User_Id varchar(500)
AS  
 SET NOCOUNT ON; 
SELECT [USER_ID],[USER_PEROFILE_ID] ,[PROFILE_CREATED_BY] ,[F_NAME] ,[L_NAME] ,[M_NAME],[FULL_NAME],gender.name as [GENDER],
		[COUNTRY_ID]
      ,city.name as [CITY_ID],[ADDRESS],[E_MAIL],
	 CONVERT(VARCHAR(12),[DOB], 107) as DOB,
	  [TIME],[CALCULATED_AGE], religion.name as MY_RELIGION,
	  mothertoung.name as [MY_MOTHER_TOUNG],
	  [MY_SUB_CASTE], rashi.name as [MY_RASHI]
      ,[MY_GOTHRA],[MY_NATIVE_PLACE],[PHONE_NO1],[PHONE_NO2],[MOBILE_NO1]
	  ,  MatrialStatus.name as  [MARITIAL_STATUS]
      ,[ABOUT_MY_EDUCATION],[ABOUT_MY_PROFESSION], im.name as [MY_MIN_INCOME],[MY_MAX_INCOME],
	  jm.name as [MY_WORK_STATUS], diet.name as [DIET_STATUS]
      ,sm.name as [SMOKE_STATUS], dm.name as [DRINK_STATUS],[HEIGHT],[WEIGHT],up.[CREATED_BY],up.[CREATED_ON],up.[STATUS]
	  , ABOUT_ME, up.FACEBOOK_ID, up.TWITTER_ID, up.LINKEDIN_ID, mtm.name as MY_MOTHER_TOUNG
	  , cm.name as COUNTRY, state.name as CITY, address, ABOUT_MY_EDUCATION, TIME,
	  LastLogin as lastLogin
     FROM USER_PROFILE as up
	 
	 join [dbo].[GenderMaster] gender on 	 gender.id = up.GENDER 
	 join [dbo].[StateMaster]  city on city.id = up.CITY_ID 
	 join [dbo].[DietMaster] diet on diet.id = up.DIET_STATUS
	 join [dbo].[ReligionMaster] religion on 	 religion.id = up.MY_RELIGION 
	 join [dbo].[LanguageMaster] mothertoung on mothertoung.Id = up.MY_MOTHER_TOUNG
	 join [dbo].[RashiMaster] rashi on rashi.id = up.MY_RASHI
	 join IncomeMaster im on im.Id = up.MY_MAX_INCOME
	 join [dbo].[MaritialStatusMaster] MatrialStatus on MatrialStatus.id = up.MARITIAL_STATUS
	 join [dbo].[SmokingMaster]sm on sm.Id= up.SMOKE_STATUS
	 join [dbo].[DietMaster] dm on dm.Id = up.DIET_STATUS
	 join [dbo].[MotherToungeMaster] mtm on mtm.Id= up.MY_MOTHER_TOUNG
	 join [dbo].[JobMaster] jm on jm.Id = up.MY_WORK_STATUS
	 join [dbo].[CountryMaster] cm on cm.id = up.COUNTRY_ID
	 join [dbo].[StateMaster] state on state.Id = up.CITY_ID
	 where E_MAIL = @User_Id and up.status = 1

GO
/****** Object:  StoredProcedure [dbo].[GetProfileDetails]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[GetProfileDetails]
@emailid varchar(500)
AS  
 SET NOCOUNT ON; 
SELECT [USER_ID],[USER_PEROFILE_ID] ,[PROFILE_CREATED_BY] ,[F_NAME] ,[L_NAME] ,[M_NAME],[FULL_NAME],gender.name as [GENDER],
		[COUNTRY_ID]
      ,city.name as [CITY_ID],[ADDRESS],[E_MAIL],[DOB],[TIME],[CALCULATED_AGE],--religion.name as MY_RELIGION,
	  mothertoung.name as [MY_MOTHER_TOUNG],
	  [MY_SUB_CASTE], rashi.name as [MY_RASHI]
      ,[MY_GOTHRA],[MY_NATIVE_PLACE],[PHONE_NO1],[PHONE_NO2],[MOBILE_NO1],[MOBILE_NO1_IDENTITY]
	  ,  MatrialStatus.name as  [MARITIAL_STATUS]
      ,[ABOUT_MY_EDUCATION],[ABOUT_MY_PROFESSION],[MY_OCCUPTION],[MY_MIN_INCOME],[MY_MAX_INCOME],
	  [MY_WORK_STATUS], diet.name as [DIET_STATUS]
      ,[SMOKE_STATUS],[DRINK_STATUS],[BODY_TYPE],[HEIGHT],[WEIGHT],up.[CREATED_BY],up.[CREATED_ON],up.[STATUS]
     FROM USER_PROFILE as up
	 
	 join [dbo].[GenderMaster] gender on 	 gender.id = up.GENDER 
	 join [dbo].[StateMaster]  city on city.id = up.CITY_ID 
	 join [dbo].[DietMaster] diet on diet.id = up.DIET_STATUS
	 join [dbo].[ReligionMaster] religion on 	 religion.id = up.MY_RELIGION 
	 join [dbo].[LanguageMaster] mothertoung on mothertoung.Id = up.MY_MOTHER_TOUNG
	 join [dbo].[RashiMaster] rashi on rashi.id = up.MY_RASHI

	 join [dbo].[MaritialStatusMaster] MatrialStatus on MatrialStatus.id = up.MARITIAL_STATUS

	 where E_MAIL = @emailid and up.status = 1
GO
/****** Object:  StoredProcedure [dbo].[GetProfiles]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetProfiles]
@emailid as varchar(100)
AS
	SET NOCOUNT ON;
	declare @gender as int
	 select @gender = gender from USER_PROFILE
	 where E_MAIL = @emailid and status = 1

SELECT USER_ID, MY_SUB_CASTE, rm.name as MY_RELIGION, USER_PEROFILE_ID, FULL_NAME, E_MAIL,
CONVERT ( varchar(30), up.DOB, 106 ) as dob 
 , up.CALCULATED_AGE as CALCULATED_AGE, 
gm.name as GENDER, MY_GOTHRA, jm.name as MY_OCCUPTION
 FROM USER_PROFILE up
 join GenderMaster gm on gm.Id = up.GENDER
 join JobMaster jm on jm.Id = up.MY_WORK_STATUS
 join ReligionMaster as rm on rm.Id = up.MY_RELIGION
where up.status=1 and up.GENDER != @gender


--exec [GetProfiles] 'sumit@gmail.com'
GO
/****** Object:  StoredProcedure [dbo].[GetRashiMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetRashiMaster]
AS
	SET NOCOUNT ON;
SELECT        Id, name, status
FROM            RashiMaster
GO
/****** Object:  StoredProcedure [dbo].[GetReligionMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetReligionMaster]
AS
	SET NOCOUNT ON;
SELECT        Id, name, status
FROM            ReligionMaster
GO
/****** Object:  StoredProcedure [dbo].[GetSalaryMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetSalaryMaster]
AS
	SET NOCOUNT ON;
SELECT        Id, name, status
FROM            SalaryMaster
GO
/****** Object:  StoredProcedure [dbo].[GetShowInterest]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Those who send the Message to the login person  ******/
CREATE PROCEDURE [dbo].[GetShowInterest] --'anita@gmail.com'
@ResponderEmailId varchar(200)

AS  
 SET NOCOUNT ON; 
  declare @id as int

select  @id = USER_PEROFILE_ID from [USER_PROFILE] where E_MAIL = @ResponderEmailId
SELECT   [Message] as message
				,uml.[CreatedOn] as message_send_date
				,up.FULL_NAME as message_sender
				FROM UserMessagesLog uml
				join InterestShown ins on ins.InterestId = uml.InterestId
				join USER_PROFILE up on up.USER_PEROFILE_ID = ins.ResponderUserId
				where uml.status = 1 and ins.ResponderUserId  = @id

GO
/****** Object:  StoredProcedure [dbo].[GetSmokingMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetSmokingMaster]
AS
	SET NOCOUNT ON;
SELECT        Id, name, status
FROM            SmokingMaster
GO
/****** Object:  StoredProcedure [dbo].[GetStateMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetStateMaster]
AS
	SET NOCOUNT ON;
SELECT        Id, name, status
FROM            StateMaster
GO
/****** Object:  StoredProcedure [dbo].[GetUserLogReqPendingMessages]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserLogReqPendingMessages]
@E_MAIL varchar(200)
AS  
SET NOCOUNT ON; 
declare @id as int
select  @id = USER_PEROFILE_ID from [USER_PROFILE] where E_MAIL = @E_MAIL
--Total person to whom I communicated
SELECT  ResponderUserId, InterestId into #tbl1 FROM [InterestShown] where status = 1 and CommunicatorUserId= @id and ResponseStatus=3
--Total person from I received the communication
SELECT  CommunicatorUserId, InterestId  into #tbl2 FROM [InterestShown] where status = 1 and ResponderUserId=@id and ResponseStatus=3

SELECT distinct  [Message] as message ,uml.[CreatedOn] as message_send_date ,up.FULL_NAME as message_sender
				FROM UserMessagesLog uml
				join InterestShown ins on ins.InterestId = uml.InterestId
				join USER_PROFILE up on up.USER_PEROFILE_ID = ins.CommunicatorUserId
				where uml.status = 1 and ins.InterestId in 
				(select t2.InterestId from #tbl1 t1 
					right join #tbl2 t2 on t1.ResponderUserId = t2.CommunicatorUserId where ResponderUserId is null)
				and ins.ResponseStatus =3
order by uml.[CreatedOn] desc
GO
/****** Object:  StoredProcedure [dbo].[GetUserLogReqReceivedMessages]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Those who send the Message to the login person  ******/
CREATE PROCEDURE [dbo].[GetUserLogReqReceivedMessages] --'sumit@gmail.com'
@ResponderEmailId varchar(200)

AS  
 SET NOCOUNT ON; 
  declare @id as int
 
select  @id = USER_PEROFILE_ID from [USER_PROFILE] where E_MAIL = @ResponderEmailId
SELECT   [Message] as message
				,uml.[CreatedOn] as message_send_date
				,up.FULL_NAME as message_sender
				FROM UserMessagesLog uml
				join InterestShown ins on ins.InterestId = uml.InterestId
				join USER_PROFILE up on up.USER_PEROFILE_ID = ins.CommunicatorUserId
				where uml.status = 1 and ins.ResponderUserId  = @id
				 and ins.ResponseStatus<>2 order by uml.[CreatedOn] desc
GO
/****** Object:  StoredProcedure [dbo].[GetUserLogReqRejectedMessages]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Those who send the Message to the login person  ******/
CREATE PROCEDURE [dbo].[GetUserLogReqRejectedMessages] --'sumit@gmail.com'
@ResponderEmailId varchar(200)

AS  
 SET NOCOUNT ON; 
  declare @id as int
 
select  @id = USER_PEROFILE_ID from [USER_PROFILE] where E_MAIL = @ResponderEmailId
SELECT   [Message] as message
				,uml.[CreatedOn] as message_send_date
				,up.FULL_NAME as message_sender
				FROM UserMessagesLog uml
				join InterestShown ins on ins.InterestId = uml.InterestId
				join USER_PROFILE up on up.USER_PEROFILE_ID = ins.CommunicatorUserId
				where uml.status = 1 and ins.ResponderUserId  = @id and ins.ResponseStatus=2
				order by uml.[CreatedOn] desc
GO
/****** Object:  StoredProcedure [dbo].[GetUserLogReqSendMessages]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Those who send the Message to the login person  ******/
CREATE PROCEDURE [dbo].[GetUserLogReqSendMessages] --'sumit@gmail.com'
@ResponderEmailId varchar(200)

AS  
 SET NOCOUNT ON; 
  declare @id as int
 
select  @id = USER_PEROFILE_ID from [USER_PROFILE] where E_MAIL = @ResponderEmailId

SELECT     [Message] as message
				,uml.[CreatedOn] as message_send_date
				,up.FULL_NAME as message_sender
				FROM UserMessagesLog uml
				join InterestShown ins on ins.InterestId = uml.InterestId
				join USER_PROFILE up on up.USER_PEROFILE_ID = ins.ResponderUserId
				where uml.status = 1 and ins.CommunicatorUserId  = @id
				and ins.ResponseStatus <> 2 order by uml.[CreatedOn] desc
GO
/****** Object:  StoredProcedure [dbo].[GetUserMessage]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Those who send the Message to the login person  ******/
CREATE PROCEDURE [dbo].[GetUserMessage] --'sumit@gmail.com','1'
@ResponderEmailId varchar(200)

AS  
 SET NOCOUNT ON; 
  declare @id as int
 
select  @id = USER_PEROFILE_ID from [USER_PROFILE] where E_MAIL = @ResponderEmailId
SELECT   [Message] as message
				,uml.[CreatedOn] as message_send_date
				,up.FULL_NAME as message_sender
				FROM UserMessagesLog uml
				join InterestShown ins on ins.InterestId = uml.InterestId
				join USER_PROFILE up on up.USER_PEROFILE_ID = ins.ResponderUserId
				where uml.status = 1 and ins.ResponderUserId  = @id
GO
/****** Object:  StoredProcedure [dbo].[GetUserPics]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserPics]
@emailid as varchar(200)
AS
	SET NOCOUNT ON;
declare @userid varchar(200)

select @userid =  USER_PEROFILE_ID from USER_PROFILE where E_MAIL = @emailid
select picid as id, PicText as text, ISNULL(PicFilePath, '') + '/' + ISNULL(PicName , '')  as src, 
PicName,  isprofilepic from User_Pics where status = 1 

and USER_ID = @userid
GO
/****** Object:  StoredProcedure [dbo].[GetUserRequestsCounts]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserRequestsCounts] --'sumit@gmail.com'

@E_MAIL varchar(200)
AS  
 SET NOCOUNT ON;  
declare @id as int
declare @TotalPendingResponseCount as int
declare @TotalRequestSendCount as int
declare @TotalRequestReceivedCount as int
declare @TotalRequestRejectCount as int
declare @TotalVisitorCount as int

select  @id = USER_PEROFILE_ID from [USER_PROFILE] where E_MAIL = @E_MAIL
select  @TotalRequestSendCount = count(ins.CommunicatorUserId) 
from InterestShown ins
--join InterestShown ins1 on ins1.ResponderUserId = ins.CommunicatorUserId 
join USER_PROFILE up on ins.CommunicatorUserId = up.USER_PEROFILE_ID 
join AcceptMaster am on am.Id = ins.ResponseStatus
where ins.CommunicatorUserId=@id
and ins.Status=1 and ins.ResponseStatus=3
select @TotalRequestSendCount

exec @TotalPendingResponseCount =  GetCountOfPendingResponseByEmailId @E_MAIL
--select @TotalPendingResponseCount

select @TotalRequestReceivedCount = count(ins.ResponderUserId) 
from InterestShown ins 
join USER_PROFILE up on ins.CommunicatorUserId = up.USER_PEROFILE_ID 
join AcceptMaster am on am.Id = ins.ResponseStatus where ins.ResponderUserId=@id and ins.Status=1
and ins.ResponseStatus <>2
select @TotalRequestReceivedCount

select @TotalRequestRejectCount = count(ins.ResponseStatus)
from InterestShown ins 
join USER_PROFILE up on ins.CommunicatorUserId = up.USER_PEROFILE_ID 
join AcceptMaster am on am.Id = ins.ResponseStatus where ins.ResponderUserId=@id and ins.Status=1
and ins.ResponseStatus=2
select @TotalRequestRejectCount

SELECT @TotalVisitorCount = count(distinct up1.E_MAIL)
FROM VisitorDetails vd
join USER_PROFILE up on up.USER_PEROFILE_ID = vd.MyID
join USER_PROFILE up1 on up1.USER_PEROFILE_ID = vd.VisitorID
where up.E_MAIL =@E_MAIL and up1.status =1 
SELECT @TotalVisitorCount
GO
/****** Object:  StoredProcedure [dbo].[GetVegMaster]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetVegMaster]
AS
	SET NOCOUNT ON;
SELECT        Id, name, status
FROM            VegMaster
GO
/****** Object:  StoredProcedure [dbo].[GetVisitorDetails]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetVisitorDetails] --'sumit@gmail.com'
@UserEmailId varchar(200)
AS
	SET NOCOUNT ON;
SELECT distinct up.USER_PEROFILE_ID as visitorid, up1.FULL_NAME as FULL_NAME,  up1.E_MAIL as EmailId, up1.CALCULATED_AGE as age,
 msm.name as maritialstatus, 
up1.MY_GOTHRA as gotra, rm.name as religion , CONVERT(varchar(50), VisitorDate, 106) as visitordate
,  jm.name as MY_OCCUPTION, up1.MY_SUB_CASTE 
FROM VisitorDetails vd
join USER_PROFILE up on up.USER_PEROFILE_ID = vd.MyID
join USER_PROFILE up1 on up1.USER_PEROFILE_ID = vd.VisitorID
join MaritialStatusMaster as msm on msm.Id = up1.MARITIAL_STATUS
join ReligionMaster as rm on rm.Id = up1.MY_RELIGION
join JobMaster jm  on jm.Id = up.MY_WORK_STATUS
where up.E_MAIL =@UserEmailId and up1.status =1 
order by CONVERT(varchar(50), VisitorDate, 106)  desc
--select * from USER_PROFILE
GO
/****** Object:  StoredProcedure [dbo].[InsertProfile]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertProfile]
(
	@PROFILE_CREATED_BY int = null,
	@F_NAME varchar(30),
	@L_NAME varchar(30),
	@GENDER varchar(10),
	@COUNTRY_ID varchar(10),
	@CITY_ID varchar(10),
	@ADDRESS varchar(80),
	@E_MAIL varchar(80),
	@PASSWORD varchar(20),
	@DOB datetime,
	@TIME varchar(50),
	@Placeofbirth varchar(20),
	@MY_RELIGION varchar(20),
	@MY_MOTHER_TOUNG varchar(20),
	@MY_SUB_CASTE varchar(20),
	@MY_RASHI varchar(20),
	@MY_GOTHRA varchar(20),
	@MY_NATIVE_PLACE varchar(20),
	@PHONE_NO1 varchar(20),
	@PHONE_NO2 varchar(20),
	@MOBILE_NO1 varchar(20),
	@MARITIAL_STATUS varchar(20),
	@ABOUT_ME varchar(500),
	@ABOUT_MY_EDUCATION varchar(200),
	@ABOUT_MY_PROFESSION varchar(200),
	@MY_HIGHEST_DEGREE varchar(20),
	@MY_MIN_INCOME varchar(20),
	@MY_MAX_INCOME varchar(20),
	@MY_WORK_STATUS varchar(20),
	@DIET_STATUS varchar(20),
	@SMOKE_STATUS varchar(20),
	@DRINK_STATUS varchar(20),
	@HEIGHT varchar(3),
	@WEIGHT varchar(3),
	@UPDATE_PROFILE_ID varchar(20),
	@CREATED_BY varchar(20),
	@MODIFIED_BY varchar(20),
	@STATUS varchar(20),
	@FACEBOOK_ID varchar(300),
	@TWITTER_ID varchar(300),
	@LINKEDIN_ID varchar(300),
	@JSONObject text
)
AS
	SET NOCOUNT OFF;
INSERT INTO [USER_PROFILE] 
([PROFILE_CREATED_BY], [F_NAME], [L_NAME],  [GENDER], [COUNTRY_ID], [CITY_ID], [ADDRESS], [E_MAIL], 
[PASSWORD], [DOB], [TIME], PLACE_OF_BIRTH , [MY_RELIGION], [MY_MOTHER_TOUNG], [MY_SUB_CASTE], [MY_RASHI], [MY_GOTHRA], [MY_NATIVE_PLACE], 
[PHONE_NO1],  [PHONE_NO2], [MOBILE_NO1], [MARITIAL_STATUS], [ABOUT_ME],  
[ABOUT_MY_EDUCATION], [ABOUT_MY_PROFESSION],  [MY_HIGHEST_DEGREE], 
  [MY_MIN_INCOME], [MY_MAX_INCOME], [MY_WORK_STATUS], [DIET_STATUS], [SMOKE_STATUS],
  [DRINK_STATUS],   [HEIGHT], [WEIGHT],[UPDATE_PROFILE_ID], [CREATED_BY], [MODIFIED_BY],  [STATUS], 
  FACEBOOK_ID, TWITTER_ID, LINKEDIN_ID,
   JSONObject) 
VALUES (
@PROFILE_CREATED_BY, @F_NAME, @L_NAME,  @GENDER, @COUNTRY_ID, @CITY_ID, @ADDRESS, @E_MAIL, 
@PASSWORD, @DOB, @TIME, @Placeofbirth, @MY_RELIGION, @MY_MOTHER_TOUNG, @MY_SUB_CASTE, @MY_RASHI, @MY_GOTHRA, @MY_NATIVE_PLACE, 
@PHONE_NO1,  @PHONE_NO2, @MOBILE_NO1, @MARITIAL_STATUS, @ABOUT_ME,  
@ABOUT_MY_EDUCATION, @ABOUT_MY_PROFESSION,  @MY_HIGHEST_DEGREE, 
  @MY_MIN_INCOME, @MY_MAX_INCOME, @MY_WORK_STATUS, @DIET_STATUS, @SMOKE_STATUS,
  @DRINK_STATUS,   @HEIGHT, @WEIGHT,@UPDATE_PROFILE_ID, @CREATED_BY, @MODIFIED_BY,  @STATUS, 
   @FACEBOOK_ID, @TWITTER_ID, @LINKEDIN_ID,
   @JSONObject

);

GO
/****** Object:  StoredProcedure [dbo].[InsertProfileRegistrationBasic]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertProfileRegistrationBasic]
(
	@PROFILE_CREATED_BY int ,
	@F_NAME varchar(30),
	@L_NAME varchar(30),
	@GENDER varchar(10),
	@E_MAIL varchar(80),
	@PASSWORD varchar(20),
	@PHONE_NO1 varchar(20),
	@MOBILE_NO1 varchar(20),
	@CREATED_BY varchar(20),
	@MODIFIED_BY varchar(20),
	@ACTIVE varchar(20)
	
)
AS
	SET NOCOUNT OFF;
INSERT INTO [USER_PROFILE] 
([PROFILE_CREATED_BY], [F_NAME], [L_NAME],  [GENDER], [E_MAIL], 
[PASSWORD], [PHONE_NO1],  [MOBILE_NO1], [CREATED_BY], [MODIFIED_BY],  [ACTIVE]
) 
VALUES (
@PROFILE_CREATED_BY, @F_NAME, @L_NAME,  @GENDER, @E_MAIL, 
@PASSWORD, @PHONE_NO1,  @MOBILE_NO1, @CREATED_BY, @MODIFIED_BY,  @ACTIVE
   
);

GO
/****** Object:  StoredProcedure [dbo].[InsertUserInterestShown]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUserInterestShown]
(
	@CommunicatorUserEmailId varchar(100),
	@ResponderUserId varchar(100),
	@ResponseStatus varchar(50),
	@Message varchar (200),
	@ContactEmailId varchar (300),
	@ContactPhoneNumber varchar (20)
)
AS
	SET NOCOUNT OFF;
Declare @CommunicatorUserId varchar(300)

select @CommunicatorUserId = USER_PEROFILE_ID from USER_PROFILE where E_MAIL = @CommunicatorUserEmailId

INSERT INTO [InterestShown] ([CommunicatorUserId], [ResponderUserId], [ResponseStatus]) 
VALUES (@CommunicatorUserId, @ResponderUserId, @ResponseStatus)

INSERT INTO [UserMessagesLog] ([InterestId], [Message], ContactEmailId , ContactPhoneNumber) VALUES ( SCOPE_IDENTITY(), @Message, @ContactEmailId,
@ContactPhoneNumber
)

GO
/****** Object:  StoredProcedure [dbo].[InsertUserPics]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUserPics]
(
	@UserEmail_ID varchar(200),
	@PicName varchar(500),
	@PicFilePath varchar(500),
	@IsProfilePic varchar(2),
	@CREATED_BY varchar(50)
)
AS
SET NOCOUNT OFF;
declare @USER_ID int
select @USER_ID =  USER_PEROFILE_ID from USER_PROFILE where e_mail = @UserEmail_ID
INSERT INTO [User_Pics] ( [USER_ID], [PicName],  [PicFilePath], [CreatedBy], IsProfilePic) 
VALUES ( @USER_ID, @PicName,  @PicFilePath, @CREATED_BY, @IsProfilePic)

return 1
GO
/****** Object:  StoredProcedure [dbo].[InsertVisitorDetails]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertVisitorDetails]
(
	@UserEmailId varchar(200),
	@VisitorEmailID varchar(200)
)
AS
	SET NOCOUNT OFF;
declare @MyID int
declare @VisitorID int
select @MyID = USER_PEROFILE_ID from USER_PROFILE where E_MAIL=@UserEmailId
select @VisitorID = USER_PEROFILE_ID from USER_PROFILE where E_MAIL=@VisitorEmailID


--This is because I am visiting to other person so MyId will be treated as a visitorId  for other one.
--thats why we need to same REVERSE PROCESS as MyID= @VisitorID and [VisitorID]=@MyID
INSERT INTO [VisitorDetails] ([MyID], [VisitorID]) VALUES (@VisitorID, @MyID); 
	
--SELECT ID, MyID, VisitorID, VisitorDate FROM VisitorDetails WHERE (ID = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserPics]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUserPics]
(
	@PicID int,
	 @USER_ID varchar(200),
		@Status bit
	
)
AS
	SET NOCOUNT OFF;
UPDATE User_Pics SET Status = 0 WHERE PicID = @PicID AND USER_ID = @USER_ID
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserProfilePic]    Script Date: 29-09-2017 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[UpdateUserProfilePic]
(
	@PicID int
)
AS
	SET NOCOUNT OFF;
declare @userid int
select @userid = USER_ID from User_Pics where PicID =   @PicID
select @userid

UPDATE User_Pics SET isProfilePic  = 0 WHERE USER_ID = @userid

UPDATE User_Pics SET isProfilePic  = 1 WHERE PicID = @PicID AND USER_ID = @userid

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CURRENT ONE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_PROFILE', @level2type=N'COLUMN',@level2name=N'UPDATE_PROFILE_ID'
GO
