
USE master
GO

IF DB_NAME() <> N'master' SET NOEXEC ON

--
-- Создать базу данных "Company"
--
PRINT (N'Создать базу данных "Company"')
GO
IF DB_ID('Company') IS NULL
CREATE DATABASE Company
ON PRIMARY(
    NAME = N'Company',
    FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Company.mdf',
    SIZE = 4288KB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 1024KB
)
LOG ON(
    NAME = N'Company_log',
    FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Company.ldf',
    SIZE = 1024KB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 10%
)
GO

--
-- Изменить базу данных
--
PRINT (N'Изменить базу данных')
GO
ALTER DATABASE Company
  SET
    ANSI_NULL_DEFAULT ON,
    ANSI_NULLS ON,
    ANSI_PADDING ON,
    ANSI_WARNINGS ON,
    ARITHABORT ON,
    AUTO_CLOSE OFF,
    AUTO_CREATE_STATISTICS ON,
    AUTO_SHRINK OFF,
    AUTO_UPDATE_STATISTICS ON,
    AUTO_UPDATE_STATISTICS_ASYNC OFF,
    COMPATIBILITY_LEVEL = 120,
    CONCAT_NULL_YIELDS_NULL ON,
    CURSOR_CLOSE_ON_COMMIT OFF,
    CURSOR_DEFAULT LOCAL,
    DATE_CORRELATION_OPTIMIZATION OFF,
    DB_CHAINING OFF,
    HONOR_BROKER_PRIORITY OFF,
    MULTI_USER,
    NESTED_TRIGGERS = ON,
    NUMERIC_ROUNDABORT OFF,
    PAGE_VERIFY CHECKSUM,
    PARAMETERIZATION SIMPLE,
    QUOTED_IDENTIFIER ON,
    READ_COMMITTED_SNAPSHOT OFF,
    RECOVERY FULL,
    RECURSIVE_TRIGGERS OFF,
    TRANSFORM_NOISE_WORDS = OFF,
    TRUSTWORTHY OFF
    WITH ROLLBACK IMMEDIATE
GO

ALTER DATABASE Company
  COLLATE Cyrillic_General_CI_AS
GO

ALTER DATABASE Company
  SET DISABLE_BROKER
GO

ALTER DATABASE Company
  SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE Company
  SET FILESTREAM (NON_TRANSACTED_ACCESS = OFF)
GO

--
-- Изменить владельца защищаемой сущности "Company" (база данных)
--
PRINT (N'Изменить владельца защищаемой сущности "Company" (база данных)')
GO
ALTER AUTHORIZATION ON DATABASE :: Company TO [Samsung\Ольга]
GO

--
-- Создать учетную запись "TestMan"
--
PRINT (N'Создать учетную запись "TestMan"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'TestMan')
CREATE LOGIN TestMan
WITH 
PASSWORD = 0x0200E6FC25B652E991598D31B90FE49CAF096D5FE17F67D8E1E17937FCCA6B2B96937EAD74335E3F892721D4045E235BEFECDA13D9C4464AA8ACF57EB872688AC24CE9C17223 HASHED
,SID = 0xE8957D9B4355C64CBC9D0C64D122D8CF
,DEFAULT_DATABASE = master
,DEFAULT_LANGUAGE = us_english
GO

--
-- Создать учетную запись "TestAdm"
--
PRINT (N'Создать учетную запись "TestAdm"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'TestAdm')
CREATE LOGIN TestAdm
WITH 
PASSWORD = 0x0200C3EEAC9C5AF7DB18A85BC025B47BE9A1D378105C1D8BB75BEB2DAD172ADF865CB032E5693C4BB74CB5C89BD734D75EEA04C9B4C39E158363C947AE04416AE96D2A79F51B HASHED
,SID = 0x1CDC2E26FE2A0949A2AE81C544270F24
,DEFAULT_DATABASE = master
,DEFAULT_LANGUAGE = us_english
GO

--
-- Создать учетную запись "[Samsung\Ольга]"
--
PRINT (N'Создать учетную запись "[Samsung\Ольга]"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'Samsung\Ольга')
CREATE LOGIN [Samsung\Ольга]
FROM WINDOWS
WITH 
DEFAULT_DATABASE = master
,DEFAULT_LANGUAGE = us_english
GO

--
-- Создать учетную запись "Public_user"
--
PRINT (N'Создать учетную запись "Public_user"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'Public_user')
CREATE LOGIN Public_user
WITH 
PASSWORD = 0x02001F490BF9B87730E9CD35FF5E1E730E22C4ADDE9224C3EE1BECEEBD6D0D977C50E164B3FA55F44789AA0BCBA34C7F8CC2C37DFCBFE5239E66F1E04054693CBF357E4736E7 HASHED
,SID = 0xDCB665E1CADCCC4997F6481D439D0041
,DEFAULT_DATABASE = master
,DEFAULT_LANGUAGE = us_english
GO

--
-- Создать учетную запись "[NT SERVICE\Winmgmt]"
--
PRINT (N'Создать учетную запись "[NT SERVICE\Winmgmt]"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'NT SERVICE\Winmgmt')
CREATE LOGIN [NT SERVICE\Winmgmt]
FROM WINDOWS
WITH 
DEFAULT_DATABASE = master
,DEFAULT_LANGUAGE = us_english
GO

--
-- Создать учетную запись "[NT SERVICE\SQLWriter]"
--
PRINT (N'Создать учетную запись "[NT SERVICE\SQLWriter]"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'NT SERVICE\SQLWriter')
CREATE LOGIN [NT SERVICE\SQLWriter]
FROM WINDOWS
WITH 
DEFAULT_DATABASE = master
,DEFAULT_LANGUAGE = us_english
GO

--
-- Создать учетную запись "[NT SERVICE\ReportServer$SQLEXPRESS]"
--
PRINT (N'Создать учетную запись "[NT SERVICE\ReportServer$SQLEXPRESS]"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'NT SERVICE\ReportServer$SQLEXPRESS')
CREATE LOGIN [NT SERVICE\ReportServer$SQLEXPRESS]
FROM WINDOWS
WITH 
DEFAULT_DATABASE = master
,DEFAULT_LANGUAGE = us_english
GO

--
-- Создать учетную запись "[NT Service\MSSQL$SQLEXPRESS]"
--
PRINT (N'Создать учетную запись "[NT Service\MSSQL$SQLEXPRESS]"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'NT Service\MSSQL$SQLEXPRESS')
CREATE LOGIN [NT Service\MSSQL$SQLEXPRESS]
FROM WINDOWS
WITH 
DEFAULT_DATABASE = master
,DEFAULT_LANGUAGE = us_english
GO

--
-- Создать учетную запись "[NT AUTHORITY\СИСТЕМА]"
--
PRINT (N'Создать учетную запись "[NT AUTHORITY\СИСТЕМА]"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'NT AUTHORITY\СИСТЕМА')
CREATE LOGIN [NT AUTHORITY\СИСТЕМА]
FROM WINDOWS
WITH 
DEFAULT_DATABASE = master
,DEFAULT_LANGUAGE = us_english
GO

--
-- Создать учетную запись "Manager_user"
--
PRINT (N'Создать учетную запись "Manager_user"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'Manager_user')
CREATE LOGIN Manager_user
WITH 
PASSWORD = 0x02000E4776BDA2371DFA68964CC0D5CBC9B218554C636A4E295A52BBE8516F6B9EEFBAEF4937C658813120E37B12CE5B18F2811220BD6161802B73459D7FDB3FB9624781A149 HASHED
,SID = 0x4888F707B2E26A4F91D0AAE587112F3A
,DEFAULT_DATABASE = master
,DEFAULT_LANGUAGE = us_english
GO

--
-- Создать учетную запись "Manager_admin"
--
PRINT (N'Создать учетную запись "Manager_admin"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'Manager_admin')
CREATE LOGIN Manager_admin
WITH 
PASSWORD = 0x02005735409D78FAE2809A9B9866342D97A3ADFF7879C17017865FE790CD2B4336E492D30ABC6E3AF280D55D6E4EE061638FD1290537E9FFF63C7090C393CD3F4D43CE6DD0A5 HASHED
,SID = 0xA040222D4C04304E8CD02B7D3D9F6659
,DEFAULT_DATABASE = master
,DEFAULT_LANGUAGE = us_english
GO

--
-- Создать учетную запись "LoginovSI"
--
PRINT (N'Создать учетную запись "LoginovSI"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'LoginovSI')
CREATE LOGIN LoginovSI
WITH 
PASSWORD = 0x0200A622A983A4D0488905B959D6E9DDC624FB8B1765FAF56450518E78C9D25DFB76AD22A77D59AF8ECF3B8E0623D0AB7353DB4692D8242619E33262D9B1727D58CF023962D1 HASHED
,SID = 0xDFB3C3F7E5BF254E987B97773269C57F
,DEFAULT_DATABASE = master
,DEFAULT_LANGUAGE = us_english
GO

--
-- Создать учетную запись "KirovaEN"
--
PRINT (N'Создать учетную запись "KirovaEN"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'KirovaEN')
CREATE LOGIN KirovaEN
WITH 
PASSWORD = 0x02000D25894FFD08FD0FA087E06E1D688073067B9161D0E33111F7EE44E70CB083FA7557191BDA0F5A8BD8DB8E5D5B5CBE0E0CB56558E25DE62D3189F8C6FE8F8BD5ED162678 HASHED
,SID = 0xC214258302673E45A38F47632C8C4DEE
,DEFAULT_DATABASE = master
,DEFAULT_LANGUAGE = us_english
GO

--
-- Создать учетную запись "DibenkoDA"
--
PRINT (N'Создать учетную запись "DibenkoDA"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'DibenkoDA')
CREATE LOGIN DibenkoDA
WITH 
PASSWORD = 0x0200A670E5430FC82FB3B734A3666E45BE03C80CDC70AC8E65D7B5DAFFC980F4108EADCD5D53E1B5081FBDC171866007A8583F247B7847F28BF31A0936D1E67457A8E51E2079 HASHED
,SID = 0x70DFA8D58B636B499F9B962773084E9F
,DEFAULT_DATABASE = master
,DEFAULT_LANGUAGE = us_english
GO

--
-- Создать учетную запись "aaa"
--
PRINT (N'Создать учетную запись "aaa"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'aaa')
CREATE LOGIN aaa
WITH 
PASSWORD = 0x0200F36C8D4BE89852CF03928917EB8A307C1636D1E13E616434F1901A64C99BC20F4A7A408530D76004CC8DB523DD58A20036DFB9031A3355BC6F0ADBA556C582F62530AC44 HASHED
,SID = 0x04364C401674EE4BB5634E743DC14C63
,DEFAULT_DATABASE = master
,DEFAULT_LANGUAGE = us_english
GO

--
-- Изменить серверные разрешения для "aaa"
--
PRINT (N'Изменить серверные разрешения для "aaa"')
GO
 GRANT CONNECT SQL TO aaa
GO

--
-- Создать учетную запись "##MS_SQLResourceSigningCertificate##"
--
PRINT (N'Создать учетную запись "##MS_SQLResourceSigningCertificate##"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'##MS_SQLResourceSigningCertificate##')
CREATE LOGIN ##MS_SQLResourceSigningCertificate##
FROM CERTIFICATE ##MS_SQLResourceSigningCertificate##
GO

--
-- Изменить серверные разрешения для "##MS_SQLResourceSigningCertificate##"
--
PRINT (N'Изменить серверные разрешения для "##MS_SQLResourceSigningCertificate##"')
GO
 GRANT VIEW ANY DEFINITION TO ##MS_SQLResourceSigningCertificate##
GO

--
-- Создать учетную запись "##MS_SQLReplicationSigningCertificate##"
--
PRINT (N'Создать учетную запись "##MS_SQLReplicationSigningCertificate##"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'##MS_SQLReplicationSigningCertificate##')
CREATE LOGIN ##MS_SQLReplicationSigningCertificate##
FROM CERTIFICATE ##MS_SQLReplicationSigningCertificate##
GO

--
-- Изменить серверные разрешения для "##MS_SQLReplicationSigningCertificate##"
--
PRINT (N'Изменить серверные разрешения для "##MS_SQLReplicationSigningCertificate##"')
GO
 GRANT
  AUTHENTICATE SERVER,
  VIEW ANY DEFINITION,
  VIEW SERVER STATE TO ##MS_SQLReplicationSigningCertificate##
GO

--
-- Создать учетную запись "##MS_SQLAuthenticatorCertificate##"
--
PRINT (N'Создать учетную запись "##MS_SQLAuthenticatorCertificate##"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'##MS_SQLAuthenticatorCertificate##')
CREATE LOGIN ##MS_SQLAuthenticatorCertificate##
FROM CERTIFICATE ##MS_SQLAuthenticatorCertificate##
GO

--
-- Изменить серверные разрешения для "##MS_SQLAuthenticatorCertificate##"
--
PRINT (N'Изменить серверные разрешения для "##MS_SQLAuthenticatorCertificate##"')
GO
 GRANT AUTHENTICATE SERVER TO ##MS_SQLAuthenticatorCertificate##
GO

--
-- Создать учетную запись "##MS_SmoExtendedSigningCertificate##"
--
PRINT (N'Создать учетную запись "##MS_SmoExtendedSigningCertificate##"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'##MS_SmoExtendedSigningCertificate##')
CREATE LOGIN ##MS_SmoExtendedSigningCertificate##
FROM CERTIFICATE ##MS_SmoExtendedSigningCertificate##
GO

--
-- Изменить серверные разрешения для "##MS_SmoExtendedSigningCertificate##"
--
PRINT (N'Изменить серверные разрешения для "##MS_SmoExtendedSigningCertificate##"')
GO
 GRANT VIEW ANY DEFINITION TO ##MS_SmoExtendedSigningCertificate##
GO

--
-- Создать учетную запись "##MS_PolicyTsqlExecutionLogin##"
--
PRINT (N'Создать учетную запись "##MS_PolicyTsqlExecutionLogin##"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN ##MS_PolicyTsqlExecutionLogin##
WITH 
PASSWORD = 0x02005AFAB23F42B14BAD6767B3A76243D1A3C5DC321D141B1E189CCBD4690C5F98F464AADEC8D2C4882F3EE5D6F04B60A1FDF2A622C1319051DEF6E873346A5CBB30E72DBF9C HASHED
,SID = 0xA9EEB439F4762546BD90D163703F6DA1
,DEFAULT_DATABASE = master
,DEFAULT_LANGUAGE = us_english
GO

--
-- Изменить серверные разрешения для "##MS_PolicyTsqlExecutionLogin##"
--
PRINT (N'Изменить серверные разрешения для "##MS_PolicyTsqlExecutionLogin##"')
GO
 GRANT
  CONNECT SQL,
  VIEW ANY DEFINITION,
  VIEW SERVER STATE TO ##MS_PolicyTsqlExecutionLogin##
GO

--
-- Создать учетную запись "##MS_PolicySigningCertificate##"
--
PRINT (N'Создать учетную запись "##MS_PolicySigningCertificate##"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'##MS_PolicySigningCertificate##')
CREATE LOGIN ##MS_PolicySigningCertificate##
FROM CERTIFICATE ##MS_PolicySigningCertificate##
GO

--
-- Изменить серверные разрешения для "##MS_PolicySigningCertificate##"
--
PRINT (N'Изменить серверные разрешения для "##MS_PolicySigningCertificate##"')
GO
 GRANT
  CONTROL SERVER,
  VIEW ANY DEFINITION TO ##MS_PolicySigningCertificate##
GO

--
-- Создать учетную запись "##MS_PolicyEventProcessingLogin##"
--
PRINT (N'Создать учетную запись "##MS_PolicyEventProcessingLogin##"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN ##MS_PolicyEventProcessingLogin##
WITH 
PASSWORD = 0x02000D4C78A4C82C6183F645E9C7B942630BC270B2F8867A108003CDA3E708A7DC0D0DFD56697E7584C15DCF377A769E89BA38E8B00B143248D9FC7668EDDD6B6E2443AD9C86 HASHED
,SID = 0x51D095ECDC6C164C9B6047F5838CAAA0
,DEFAULT_DATABASE = master
,DEFAULT_LANGUAGE = us_english
GO

--
-- Изменить серверные разрешения для "##MS_PolicyEventProcessingLogin##"
--
PRINT (N'Изменить серверные разрешения для "##MS_PolicyEventProcessingLogin##"')
GO
 GRANT CONNECT SQL TO ##MS_PolicyEventProcessingLogin##
GO

--
-- Создать учетную запись "##MS_AgentSigningCertificate##"
--
PRINT (N'Создать учетную запись "##MS_AgentSigningCertificate##"')
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'##MS_AgentSigningCertificate##')
CREATE LOGIN ##MS_AgentSigningCertificate##
FROM CERTIFICATE ##MS_AgentSigningCertificate##
GO

--
-- Изменить серверные разрешения для "##MS_AgentSigningCertificate##"
--
PRINT (N'Изменить серверные разрешения для "##MS_AgentSigningCertificate##"')
GO
 GRANT CONNECT SQL TO ##MS_AgentSigningCertificate##
GO

USE Company
GO

IF DB_NAME() <> N'Company' SET NOEXEC ON
GO

--
-- Создать пользователя "TestMan"
--
PRINT (N'Создать пользователя "TestMan"')
GO
IF DATABASE_PRINCIPAL_ID(N'TestMan') IS NULL
CREATE USER TestMan
  WITHOUT LOGIN
GO

--
-- Создать пользователя "TestAdm"
--
PRINT (N'Создать пользователя "TestAdm"')
GO
IF DATABASE_PRINCIPAL_ID(N'TestAdm') IS NULL
CREATE USER TestAdm
  WITHOUT LOGIN
GO

--
-- Создать роль "Manager_admin"
--
PRINT (N'Создать роль "Manager_admin"')
GO
IF DATABASE_PRINCIPAL_ID(N'Manager_admin') IS NULL
CREATE ROLE Manager_admin
GO

--
-- Добавить члены в роль "Manager_admin"
--
PRINT (N'Добавить члены в роль "Manager_admin"')
GO
EXEC sp_addrolemember N'Manager_admin', N'TestAdm'
GO

--
-- Создать роль "Manager_admin"
--
PRINT (N'Создать роль "Manager_admin"')
GO
IF DATABASE_PRINCIPAL_ID(N'Manager_admin') IS NULL
CREATE ROLE Manager_admin
GO

--
-- Добавить члены в роль "Manager_admin"
--
PRINT (N'Добавить члены в роль "Manager_admin"')
GO
EXEC sp_addrolemember N'Manager_admin', N'TestAdm'
GO

--
-- Создать пользователя "Public_user"
--
PRINT (N'Создать пользователя "Public_user"')
GO
IF DATABASE_PRINCIPAL_ID(N'Public_user') IS NULL
CREATE USER Public_user
  WITHOUT LOGIN
GO

--
-- Создать пользователя "NewTest12"
--
PRINT (N'Создать пользователя "NewTest12"')
GO
IF DATABASE_PRINCIPAL_ID(N'NewTest12') IS NULL
CREATE USER NewTest12
  WITHOUT LOGIN
GO

--
-- Создать пользователя "Madmin"
--
PRINT (N'Создать пользователя "Madmin"')
GO
IF DATABASE_PRINCIPAL_ID(N'Madmin') IS NULL
CREATE USER Madmin
  WITHOUT LOGIN
GO

--
-- Создать пользователя "LoginovSI"
--
PRINT (N'Создать пользователя "LoginovSI"')
GO
IF DATABASE_PRINCIPAL_ID(N'LoginovSI') IS NULL
CREATE USER LoginovSI
  WITHOUT LOGIN
GO

--
-- Создать пользователя "KirovaEN"
--
PRINT (N'Создать пользователя "KirovaEN"')
GO
IF DATABASE_PRINCIPAL_ID(N'KirovaEN') IS NULL
CREATE USER KirovaEN
  WITHOUT LOGIN
GO

--
-- Создать пользователя "DibenkoDA"
--
PRINT (N'Создать пользователя "DibenkoDA"')
GO
IF DATABASE_PRINCIPAL_ID(N'DibenkoDA') IS NULL
CREATE USER DibenkoDA
  WITHOUT LOGIN
GO

--
-- Создать пользователя "aaa"
--
PRINT (N'Создать пользователя "aaa"')
GO
IF DATABASE_PRINCIPAL_ID(N'aaa') IS NULL
CREATE USER aaa
  WITHOUT LOGIN
GO

--
-- Создать таблицу "dbo.Worker"
--
PRINT (N'Создать таблицу "dbo.Worker"')
GO
IF OBJECT_ID(N'dbo.Worker', 'U') IS NULL
CREATE TABLE dbo.Worker (
  First_name varchar(20) COLLATE Cyrillic_General_CI_AS NOT NULL,
  Second_name varchar(20) COLLATE Cyrillic_General_CI_AS NOT NULL,
  Patronomic varchar(max) COLLATE Cyrillic_General_CI_AS NULL,
  WorkerType int NOT NULL DEFAULT (1),
  Worker_user varchar(50) COLLATE Cyrillic_General_CI_AS NOT NULL,
  CONSTRAINT PK_Worker PRIMARY KEY CLUSTERED (Worker_user),
  CONSTRAINT WorkerFirstNameCheck CHECK ([First_name]<>''),
  CONSTRAINT WorkerPatronomicCheck CHECK ([Patronomic]<>''),
  CONSTRAINT WorkerSecondNameCheck CHECK ([Second_name]<>'')
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--
-- Создать процедуру "dbo.deleteUser"
--
GO
PRINT (N'Создать процедуру "dbo.deleteUser"')
GO
IF OBJECT_ID(N'dbo.deleteUser', 'P') IS NULL
EXEC sp_executesql N'CREATE PROCEDURE dbo.deleteUser
  @login VARCHAR(50)
AS
  DECLARE @Sql NVARCHAR(512)

  DELETE FROM Worker
  WHERE Worker_user = @login

  SET @Sql = ''drop LOGIN ['' + @login + '']''
  EXEC (@Sql)
  SET @Sql = ''drop user ['' + @login + '']''
  EXEC (@Sql)

'
GO

--
-- Создать процедуру "dbo.CreateUser"
--
GO
PRINT (N'Создать процедуру "dbo.CreateUser"')
GO
IF OBJECT_ID(N'dbo.CreateUser', 'P') IS NULL
EXEC sp_executesql N'CREATE PROCEDURE dbo.CreateUser 
@Username VARCHAR(128),
@Password VARCHAR(128),
@Usertype INT,
@Name VARCHAR(40),
@LastName VARCHAR(40),
@Pat VARCHAR(MAX)

AS
  IF (NOT @Usertype IN (1, 2))
  BEGIN
    RAISERROR (''INVALID ARGUMENT @Usertype'', 16, 1)
    RETURN 1
  END

  DECLARE @Sql NVARCHAR(512)

  SET @Sql = ''CREATE LOGIN ['' + @Username + ''] WITH PASSWORD = '''''' + @Password + ''''''''
  EXEC (@Sql)

  SET @Sql = ''CREATE USER ['' + @Username + ''] FOR LOGIN ['' + @Username + '']''
  EXEC (@Sql)

  INSERT INTO Worker (First_name, Second_name, Patronomic, WorkerType, Worker_user)
  VALUES (@Name, @LastName, @Pat, CAST(@Usertype AS INT), @Username);
 
  IF (@Usertype = 1)
  BEGIN
    EXEC sp_addrolemember ''Manager_user'',@Username
  END
  ELSE
  IF (@Usertype = 2)
  BEGIN
    EXEC sp_addrolemember N''Manager_admin'',@Username
    EXEC sp_addrolemember N''db_owner'' ,@Username
    EXEC sp_addrolemember N''db_securityadmin '' ,@Username
    EXEC sp_addsrvrolemember @Username ,N''securityadmin''
  END
'
GO

--
-- Создать таблицу "dbo.sysdiagrams"
--
PRINT (N'Создать таблицу "dbo.sysdiagrams"')
GO
IF OBJECT_ID(N'dbo.sysdiagrams', 'U') IS NULL
CREATE TABLE dbo.sysdiagrams (
  name sysname NOT NULL,
  principal_id int NOT NULL,
  diagram_id int IDENTITY,
  version int NULL,
  definition varbinary(max) NULL,
  PRIMARY KEY CLUSTERED (diagram_id),
  CONSTRAINT UK_principal_name UNIQUE (principal_id, name)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

--
-- Создать таблицу "dbo.Model"
--
PRINT (N'Создать таблицу "dbo.Model"')
GO
IF OBJECT_ID(N'dbo.Model', 'U') IS NULL
CREATE TABLE dbo.Model (
  Id_model int IDENTITY,
  Name varchar(18) COLLATE Cyrillic_General_CI_AS NOT NULL,
  Id_brand int NOT NULL,
  CONSTRAINT XPKModel PRIMARY KEY CLUSTERED (Id_model),
  CONSTRAINT UniqueId_model UNIQUE (Id_brand, Name),
  UNIQUE (Name),
  CONSTRAINT ModelNameCheck CHECK ([Name]<>'')
)
ON [PRIMARY]
GO

--
-- Создать таблицу "dbo.Deels"
--
PRINT (N'Создать таблицу "dbo.Deels"')
GO
IF OBJECT_ID(N'dbo.Deels', 'U') IS NULL
CREATE TABLE dbo.Deels (
  Id_Deel int IDENTITY,
  Date_deel date NOT NULL,
  Id_auto int NOT NULL,
  Id_client_buy int NOT NULL,
  Worker_user varchar(50) COLLATE Cyrillic_General_CI_AS NOT NULL,
  CONSTRAINT XPKDeels PRIMARY KEY CLUSTERED (Id_Deel)
)
ON [PRIMARY]
GO

--
-- Создать таблицу "dbo.Company_builder"
--
PRINT (N'Создать таблицу "dbo.Company_builder"')
GO
IF OBJECT_ID(N'dbo.Company_builder', 'U') IS NULL
CREATE TABLE dbo.Company_builder (
  Name varchar(20) COLLATE Cyrillic_General_CI_AS NOT NULL,
  Id_company int IDENTITY,
  CONSTRAINT XPKCompany_builder PRIMARY KEY CLUSTERED (Id_company),
  CONSTRAINT CompanyBuilderNameCheck CHECK ([Name]<>'')
)
ON [PRIMARY]
GO

--
-- Создать таблицу "dbo.Client"
--
PRINT (N'Создать таблицу "dbo.Client"')
GO
IF OBJECT_ID(N'dbo.Client', 'U') IS NULL
CREATE TABLE dbo.Client (
  Second_name varchar(20) COLLATE Cyrillic_General_CI_AS NOT NULL,
  First_name varchar(20) COLLATE Cyrillic_General_CI_AS NOT NULL,
  Patronymic varchar(20) COLLATE Cyrillic_General_CI_AS NULL,
  Pasport_Id varchar(20) COLLATE Cyrillic_General_CI_AS NOT NULL,
  Id_client int IDENTITY,
  Birthday date NOT NULL,
  Sex bit NOT NULL,
  CONSTRAINT XPKClient PRIMARY KEY CLUSTERED (Id_client),
  CONSTRAINT ClientFirstNameCheck CHECK ([First_name]<>''),
  CONSTRAINT ClientPasportIdCheck CHECK ([Pasport_Id]<>''),
  CONSTRAINT ClientPatronymicCheck CHECK ([Patronymic]<>''),
  CONSTRAINT ClientSecondNameCheck CHECK ([Second_name]<>'')
)
ON [PRIMARY]
GO

--
-- Создать таблицу "dbo.Brand"
--
PRINT (N'Создать таблицу "dbo.Brand"')
GO
IF OBJECT_ID(N'dbo.Brand', 'U') IS NULL
CREATE TABLE dbo.Brand (
  Id_brand int IDENTITY,
  Id_company int NOT NULL,
  Name varchar(20) COLLATE Cyrillic_General_CI_AS NOT NULL,
  CONSTRAINT XPKBrand PRIMARY KEY CLUSTERED (Id_brand),
  CONSTRAINT BrandNameCheck CHECK ([Name]<>'')
)
ON [PRIMARY]
GO

--
-- Создать таблицу "dbo.Auto"
--
PRINT (N'Создать таблицу "dbo.Auto"')
GO
IF OBJECT_ID(N'dbo.Auto', 'U') IS NULL
CREATE TABLE dbo.Auto (
  Id_auto int IDENTITY,
  Serial varchar(20) COLLATE Cyrillic_General_CI_AS NOT NULL,
  Data_build date NOT NULL,
  Id_model int NOT NULL,
  Price bigint NOT NULL,
  Distance int NOT NULL,
  Sell_status bit NOT NULL,
  CONSTRAINT XPKAuto000 PRIMARY KEY CLUSTERED (Id_auto),
  CONSTRAINT AutoDistanseChek CHECK ([Distance]>=(0)),
  CONSTRAINT AutoPriceCheck CHECK ([Price]>=(0)),
  CONSTRAINT AutoSerialChek CHECK ([Serial]<>'')
)
ON [PRIMARY]
GO

--
-- Создать процедуру "dbo.addNewAuto"
--
GO
PRINT (N'Создать процедуру "dbo.addNewAuto"')
GO
IF OBJECT_ID(N'dbo.addNewAuto', 'P') IS NULL
EXEC sp_executesql N'CREATE PROCEDURE dbo.addNewAuto
  @Company VARCHAR(20),
  @Brand VARCHAR(20),
  @Model VARCHAR(20),
  @Serial VARCHAR(20),
  @Data datetime ,
  @Distanse INT,
  @Price BIGINT 
  

AS 
  INSERT INTO Brand (Id_company, Name)
  VALUES ((SELECT cb.Id_company FROM Company_builder cb WHERE cb.Name = @Company) , @Brand);
  
  INSERT INTO Model (Name, Id_brand)
  VALUES (@Model, (SELECT b.Id_brand FROM Brand b WHERE b.Name = @Brand));

INSERT INTO Auto (Serial, Data_build, Id_model, Price, Distance, Sell_status)
  VALUES (@serial, @Data, (SELECT m.Id_model FROM Model m WHERE m.Name = @Model), @Price, @Distanse, 0);


'
GO

--
-- Создать представление "dbo.ViewDeels"
--
GO
PRINT (N'Создать представление "dbo.ViewDeels"')
GO
IF OBJECT_ID(N'dbo.ViewDeels', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW dbo.ViewDeels
AS
SELECT        dbo.Deels.Id_Deel, dbo.Deels.Date_deel, dbo.Auto.Serial, dbo.Company_builder.Name, dbo.Brand.Name AS Expr1, dbo.Model.Name AS Expr2, dbo.Auto.Data_build, dbo.Client.Second_name, 
                         dbo.Client.First_name, dbo.Client.Pasport_Id, dbo.Auto.Price, dbo.Deels.Worker_user, dbo.Worker.First_name AS Expr3, dbo.Worker.Second_name AS Expr4, dbo.Worker.Patronomic
FROM            dbo.Deels INNER JOIN
                         dbo.Worker ON dbo.Deels.Worker_user = dbo.Worker.Worker_user INNER JOIN
                         dbo.Auto ON dbo.Deels.Id_auto = dbo.Auto.Id_auto INNER JOIN
                         dbo.Client ON dbo.Deels.Id_client_buy = dbo.Client.Id_client INNER JOIN
                         dbo.Model ON dbo.Auto.Id_model = dbo.Model.Id_model INNER JOIN
                         dbo.Brand ON dbo.Model.Id_brand = dbo.Brand.Id_brand INNER JOIN
                         dbo.Company_builder ON dbo.Brand.Id_company = dbo.Company_builder.Id_company
'
GO

--
-- Добавить расширенное свойство "MS_DiagramPane1" для "dbo.ViewDeels" (представление)
--
PRINT (N'Добавить расширенное свойство "MS_DiagramPane1" для "dbo.ViewDeels" (представление)')
GO
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'TABLE', N'ViewDeels', NULL, NULL))
EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[29] 2[22] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Deels"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Worker"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Auto"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Client"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Model"
            Begin Extent = 
               Top = 138
               Left = 454
               Bottom = 251
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Brand"
            Begin Extent = 
               Top = 208
               Left = 222
               Bottom = 321
               Right = 392
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Company_builder"
            Begin Extent = 
               Top = 121
               Left = 262
               Bottom = 217
               Right = 432
            End
            DisplayFlags = 280
   ', 'SCHEMA', N'dbo', 'VIEW', N'ViewDeels'
GO

--
-- Добавить расширенное свойство "MS_DiagramPane2" для "dbo.ViewDeels" (представление)
--
PRINT (N'Добавить расширенное свойство "MS_DiagramPane2" для "dbo.ViewDeels" (представление)')
GO
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty(N'MS_DiagramPane2', 'SCHEMA', N'dbo', 'TABLE', N'ViewDeels', NULL, NULL))
EXEC sys.sp_addextendedproperty N'MS_DiagramPane2', N'         TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'ViewDeels'
GO

--
-- Добавить расширенное свойство "MS_DiagramPaneCount" для "dbo.ViewDeels" (представление)
--
PRINT (N'Добавить расширенное свойство "MS_DiagramPaneCount" для "dbo.ViewDeels" (представление)')
GO
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'TABLE', N'ViewDeels', NULL, NULL))
EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 2, 'SCHEMA', N'dbo', 'VIEW', N'ViewDeels'
GO

--
-- Создать представление "dbo.AutoInfoView"
--
GO
PRINT (N'Создать представление "dbo.AutoInfoView"')
GO
IF OBJECT_ID(N'dbo.AutoInfoView', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW dbo.AutoInfoView
AS
SELECT        dbo.Auto.Serial, dbo.Auto.Data_build AS [Data_build], dbo.Auto.Price, dbo.Auto.Distance AS Distanse, dbo.Brand.Name AS Name_Brand, dbo.Company_builder.Name AS Name_company, 
                         dbo.Model.Name AS Name_model, dbo.Auto.Id_model, dbo.Auto.Id_auto
FROM            dbo.Company_builder INNER JOIN
                         dbo.Brand ON dbo.Company_builder.Id_company = dbo.Brand.Id_company INNER JOIN
                         dbo.Model ON dbo.Brand.Id_brand = dbo.Model.Id_brand INNER JOIN
                         dbo.Auto ON dbo.Model.Id_model = dbo.Auto.Id_model
WHERE        (dbo.Auto.Sell_status = 0)
'
GO

--
-- Добавить расширенное свойство "MS_DiagramPane1" для "dbo.AutoInfoView" (представление)
--
PRINT (N'Добавить расширенное свойство "MS_DiagramPane1" для "dbo.AutoInfoView" (представление)')
GO
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'TABLE', N'AutoInfoView', NULL, NULL))
EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[27] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Company_builder"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Brand"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Model"
            Begin Extent = 
               Top = 102
               Left = 454
               Bottom = 215
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Auto"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
  ', 'SCHEMA', N'dbo', 'VIEW', N'AutoInfoView'
GO

--
-- Добавить расширенное свойство "MS_DiagramPane2" для "dbo.AutoInfoView" (представление)
--
PRINT (N'Добавить расширенное свойство "MS_DiagramPane2" для "dbo.AutoInfoView" (представление)')
GO
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty(N'MS_DiagramPane2', 'SCHEMA', N'dbo', 'TABLE', N'AutoInfoView', NULL, NULL))
EXEC sys.sp_addextendedproperty N'MS_DiagramPane2', N' End
End
', 'SCHEMA', N'dbo', 'VIEW', N'AutoInfoView'
GO

--
-- Добавить расширенное свойство "MS_DiagramPaneCount" для "dbo.AutoInfoView" (представление)
--
PRINT (N'Добавить расширенное свойство "MS_DiagramPaneCount" для "dbo.AutoInfoView" (представление)')
GO
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'TABLE', N'AutoInfoView', NULL, NULL))
EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 2, 'SCHEMA', N'dbo', 'VIEW', N'AutoInfoView'
GO

--
-- Создать роль приложения "Manager"
--
PRINT (N'Создать роль приложения "Manager"')
GO
IF DATABASE_PRINCIPAL_ID(N'Manager') IS NULL
CREATE APPLICATION ROLE Manager
  WITH PASSWORD = 'passw0rd'
GO

--
-- Создать роль "Manager_user"
--
PRINT (N'Создать роль "Manager_user"')
GO
IF DATABASE_PRINCIPAL_ID(N'Manager_user') IS NULL
CREATE ROLE Manager_user
GO

--
-- Добавить члены в роль "Manager_user"
--
PRINT (N'Добавить члены в роль "Manager_user"')
GO
EXEC sp_addrolemember N'Manager_user', N'aaa'
GO

EXEC sp_addrolemember N'Manager_user', N'DibenkoDA'
GO

EXEC sp_addrolemember N'Manager_user', N'KirovaEN'
GO

EXEC sp_addrolemember N'Manager_user', N'LoginovSI'
GO

EXEC sp_addrolemember N'Manager_user', N'Manager'
GO

EXEC sp_addrolemember N'Manager_user', N'NewTest12'
GO

EXEC sp_addrolemember N'Manager_user', N'Public_user'
GO

EXEC sp_addrolemember N'Manager_user', N'TestMan'
GO

--
-- Создать роль "Manager_user"
--
PRINT (N'Создать роль "Manager_user"')
GO
IF DATABASE_PRINCIPAL_ID(N'Manager_user') IS NULL
CREATE ROLE Manager_user
GO

--
-- Добавить члены в роль "Manager_user"
--
PRINT (N'Добавить члены в роль "Manager_user"')
GO
EXEC sp_addrolemember N'Manager_user', N'aaa'
GO

EXEC sp_addrolemember N'Manager_user', N'DibenkoDA'
GO

EXEC sp_addrolemember N'Manager_user', N'KirovaEN'
GO

EXEC sp_addrolemember N'Manager_user', N'LoginovSI'
GO

EXEC sp_addrolemember N'Manager_user', N'Manager'
GO

EXEC sp_addrolemember N'Manager_user', N'NewTest12'
GO

EXEC sp_addrolemember N'Manager_user', N'Public_user'
GO

EXEC sp_addrolemember N'Manager_user', N'TestMan'
GO

--
-- Создать процедуру "dbo.OpenViewDeels"
--
GO
PRINT (N'Создать процедуру "dbo.OpenViewDeels"')
GO
IF OBJECT_ID(N'dbo.OpenViewDeels', 'P') IS NULL
EXEC sp_executesql N'CREATE PROCEDURE dbo.OpenViewDeels
	(
	@Worker_user VARCHAR(50)
	)
AS
select  * from dbo.ViewDeels where ViewDeels.Worker_user = @Worker_user 
'
GO

--
-- Предоставить разрешения на "dbo.OpenViewDeels"
--
PRINT (N'Предоставить разрешения на "dbo.OpenViewDeels"')
GO
IF OBJECT_ID(N'dbo.OpenViewDeels', 'P') IS NOT NULL

  AND DATABASE_PRINCIPAL_ID(N'Manager_user') IS NOT NULL
GRANT EXECUTE ON dbo.OpenViewDeels TO Manager_user
GO

--
-- Создать процедуру "dbo.CreateDeel"
--
GO
PRINT (N'Создать процедуру "dbo.CreateDeel"')
GO
IF OBJECT_ID(N'dbo.CreateDeel', 'P') IS NULL
EXEC sp_executesql N'CREATE PROCEDURE dbo.CreateDeel 
(
	 @Worker_user VARCHAR(50) ,
	 @id_client int ,
	 @id_auto int 
)	
AS
BEGIN
if (select Sell_status from Auto where Id_auto = @id_auto) = 0  
begin

insert into dbo.Deels( Date_deel,Id_auto , Id_client_buy,Worker_user )
values (CURRENT_TIMESTAMP, @id_auto,@id_client,@Worker_user)

update Auto
set auto.Sell_status = 1 
where Id_auto = @id_auto 

end
else THROW 50001, ''Автомобиль уже продан '', 1;  
END
'
GO

--
-- Предоставить разрешения на "dbo.CreateDeel"
--
PRINT (N'Предоставить разрешения на "dbo.CreateDeel"')
GO
IF OBJECT_ID(N'dbo.CreateDeel', 'P') IS NOT NULL

  AND DATABASE_PRINCIPAL_ID(N'Manager_user') IS NOT NULL
GRANT EXECUTE ON dbo.CreateDeel TO Manager_user
GO

--
-- Создать процедуру "dbo.Chek_Permisson"
--
GO
PRINT (N'Создать процедуру "dbo.Chek_Permisson"')
GO
IF OBJECT_ID(N'dbo.Chek_Permisson', 'P') IS NULL
EXEC sp_executesql N'

CREATE PROCEDURE dbo.Chek_Permisson
	@Login NVARCHAR(256)
as
DECLARE  @user NVARCHAR(256);
EXECUTE AS LOGIN = @login;

SELECT @login = login_name FROM sys.dm_exec_sessions WHERE session_id = @@SPID;

SELECT @user = d.name
  FROM sys.database_principals AS d
  INNER JOIN sys.server_principals AS s
  ON d.sid = s.sid
  WHERE s.name = @login;

SELECT u.name, r.name
  FROM sys.database_role_members AS m
  INNER JOIN sys.database_principals AS r
  ON m.role_principal_id = r.principal_id
  INNER JOIN sys.database_principals AS u
  ON u.principal_id = m.member_principal_id
  WHERE u.name = @user;

--SELECT class_desc, major_id, permission_name, state_desc
--  FROM sys.database_permissions
--  WHERE grantee_principal_id = USER_ID(@user);

REVERT;'
GO

--
-- Предоставить разрешения на "dbo.Chek_Permisson"
--
PRINT (N'Предоставить разрешения на "dbo.Chek_Permisson"')
GO
IF OBJECT_ID(N'dbo.Chek_Permisson', 'P') IS NOT NULL

  AND DATABASE_PRINCIPAL_ID(N'Manager_user') IS NOT NULL
GRANT EXECUTE ON dbo.Chek_Permisson TO Manager_user
GO

--
-- Создать процедуру "dbo.CallBackDataWorker"
--
GO
PRINT (N'Создать процедуру "dbo.CallBackDataWorker"')
GO
IF OBJECT_ID(N'dbo.CallBackDataWorker', 'P') IS NULL
EXEC sp_executesql N'CREATE PROCEDURE dbo.CallBackDataWorker
AS 
  SELECT * FROM Worker WHERE Worker_user= (SELECT CURRENT_USER ) 
'
GO

--
-- Предоставить разрешения на "dbo.CallBackDataWorker"
--
PRINT (N'Предоставить разрешения на "dbo.CallBackDataWorker"')
GO
IF OBJECT_ID(N'dbo.CallBackDataWorker', 'P') IS NOT NULL

  AND DATABASE_PRINCIPAL_ID(N'Manager_user') IS NOT NULL
GRANT EXECUTE ON dbo.CallBackDataWorker TO Manager_user
GO

--
-- Создать процедуру "dbo.AddNewClient"
--
GO
PRINT (N'Создать процедуру "dbo.AddNewClient"')
GO
IF OBJECT_ID(N'dbo.AddNewClient', 'P') IS NULL
EXEC sp_executesql N'
Create PROCEDURE dbo.AddNewClient
(
	@Name char(20) , 
	@Last_name char(20) ,
	@Patronymic char(20) ,
	@Birthday datetime ,
	@Sex Bit ,
	@PasportId char (20)
)

AS
BEGIN
insert into dbo.Client (First_name,Second_name,Patronymic,Birthday,sex,Pasport_Id)
values (@name , @Last_name ,@Patronymic , @Birthday,@sex,@PasportId)
	
END'
GO

--
-- Предоставить разрешения на "dbo.AddNewClient"
--
PRINT (N'Предоставить разрешения на "dbo.AddNewClient"')
GO
IF OBJECT_ID(N'dbo.AddNewClient', 'P') IS NOT NULL

  AND DATABASE_PRINCIPAL_ID(N'Manager_user') IS NOT NULL
GRANT EXECUTE ON dbo.AddNewClient TO Manager_user
GO

--
-- Создать функцию "dbo.fn_diagramobjects"
--
GO
PRINT (N'Создать функцию "dbo.fn_diagramobjects"')
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.fn_diagramobjects') AND type IN ('IF', 'FN', 'TF'))
EXEC sp_executesql N'
	CREATE FUNCTION dbo.fn_diagramobjects() 
	RETURNS int
	WITH EXECUTE AS N''dbo''
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N''dbo.sp_upgraddiagrams''),
			@id_sysdiagrams = object_id(N''dbo.sysdiagrams''),
			@id_helpdiagrams = object_id(N''dbo.sp_helpdiagrams''),
			@id_helpdiagramdefinition = object_id(N''dbo.sp_helpdiagramdefinition''),
			@id_creatediagram = object_id(N''dbo.sp_creatediagram''),
			@id_renamediagram = object_id(N''dbo.sp_renamediagram''),
			@id_alterdiagram = object_id(N''dbo.sp_alterdiagram''), 
			@id_dropdiagram = object_id(N''dbo.sp_dropdiagram'')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	'
GO

--
-- Предоставить разрешения на "dbo.fn_diagramobjects"
--
PRINT (N'Предоставить разрешения на "dbo.fn_diagramobjects"')
GO
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.fn_diagramobjects') AND type IN ('IF', 'FN', 'TF'))

  AND DATABASE_PRINCIPAL_ID(N'guest') IS NOT NULL
DENY EXECUTE ON dbo.fn_diagramobjects TO guest
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.fn_diagramobjects') AND type IN ('IF', 'FN', 'TF'))

  AND DATABASE_PRINCIPAL_ID(N'public') IS NOT NULL
GRANT EXECUTE ON dbo.fn_diagramobjects TO [public]
GO

--
-- Создать роль приложения "Manager"
--
PRINT (N'Создать роль приложения "Manager"')
GO
IF DATABASE_PRINCIPAL_ID(N'Manager') IS NULL
CREATE APPLICATION ROLE Manager
  WITH PASSWORD = 'passw0rd'
GO
-- 
-- Вывод данных для таблицы Auto
--
SET IDENTITY_INSERT dbo.Auto ON
GO
INSERT dbo.Auto(Id_auto, Serial, Data_build, Id_model, Price, Distance, Sell_status) VALUES (2, N'1PLX19', '1998-01-01', 3, 15500500, 140000, CONVERT(bit, 'True'))
INSERT dbo.Auto(Id_auto, Serial, Data_build, Id_model, Price, Distance, Sell_status) VALUES (8, N'2XM49', '2000-01-01', 2, 20000000, 768890, CONVERT(bit, 'False'))
INSERT dbo.Auto(Id_auto, Serial, Data_build, Id_model, Price, Distance, Sell_status) VALUES (12, N'2KKO54', '2015-01-01', 5, 30049332, 234554, CONVERT(bit, 'True'))
INSERT dbo.Auto(Id_auto, Serial, Data_build, Id_model, Price, Distance, Sell_status) VALUES (13, N'2OHE88', '2002-01-01', 6, 98765673, 2345, CONVERT(bit, 'False'))
INSERT dbo.Auto(Id_auto, Serial, Data_build, Id_model, Price, Distance, Sell_status) VALUES (17, N'jhjkiu8', '2016-05-10', 3, 2345432, 2345432, CONVERT(bit, 'False'))
INSERT dbo.Auto(Id_auto, Serial, Data_build, Id_model, Price, Distance, Sell_status) VALUES (23, N'qqq2', '2016-05-11', 21, 123, 123, CONVERT(bit, 'False'))
INSERT dbo.Auto(Id_auto, Serial, Data_build, Id_model, Price, Distance, Sell_status) VALUES (24, N'123s', '2016-05-11', 22, 123, 123, CONVERT(bit, 'False'))
INSERT dbo.Auto(Id_auto, Serial, Data_build, Id_model, Price, Distance, Sell_status) VALUES (25, N'12345', '2016-05-22', 23, 1234, 234, CONVERT(bit, 'True'))
GO
SET IDENTITY_INSERT dbo.Auto OFF
GO
-- 
-- Вывод данных для таблицы Brand
--
SET IDENTITY_INSERT dbo.Brand ON
GO
INSERT dbo.Brand(Id_brand, Id_company, Name) VALUES (1, 1, N'S-klasse')
INSERT dbo.Brand(Id_brand, Id_company, Name) VALUES (2, 1, N'E-Klasse')
INSERT dbo.Brand(Id_brand, Id_company, Name) VALUES (4, 2, N'XC90')
INSERT dbo.Brand(Id_brand, Id_company, Name) VALUES (5, 2, N'S60')
INSERT dbo.Brand(Id_brand, Id_company, Name) VALUES (6, 3, N'Astra')
INSERT dbo.Brand(Id_brand, Id_company, Name) VALUES (7, 3, N'Zafira')
INSERT dbo.Brand(Id_brand, Id_company, Name) VALUES (8, 4, N'X6')
INSERT dbo.Brand(Id_brand, Id_company, Name) VALUES (9, 4, N'X5')
INSERT dbo.Brand(Id_brand, Id_company, Name) VALUES (10, 4, N'qqq')
INSERT dbo.Brand(Id_brand, Id_company, Name) VALUES (11, 5, N'qqq')
INSERT dbo.Brand(Id_brand, Id_company, Name) VALUES (12, 5, N'qqq')
INSERT dbo.Brand(Id_brand, Id_company, Name) VALUES (13, 5, N'qqq')
INSERT dbo.Brand(Id_brand, Id_company, Name) VALUES (14, 6, N'qqq')
INSERT dbo.Brand(Id_brand, Id_company, Name) VALUES (15, 6, N'qqq22')
INSERT dbo.Brand(Id_brand, Id_company, Name) VALUES (16, 5, N'qqq22wqe')
INSERT dbo.Brand(Id_brand, Id_company, Name) VALUES (17, 5, N'1234')
GO
SET IDENTITY_INSERT dbo.Brand OFF
GO
-- 
-- Вывод данных для таблицы Client
--
SET IDENTITY_INSERT dbo.Client ON
GO
INSERT dbo.Client(Second_name, First_name, Patronymic, Pasport_Id, Id_client, Birthday, Sex) VALUES (N'Иван', N'Иванов', N'Иванович', N'00199943', 1, '1960-01-04', CONVERT(bit, 'True'))
INSERT dbo.Client(Second_name, First_name, Patronymic, Pasport_Id, Id_client, Birthday, Sex) VALUES (N'Дмитрий', N'Дыбенко', N'Юрьевич', N'00299301', 2, '1970-03-05', CONVERT(bit, 'True'))
INSERT dbo.Client(Second_name, First_name, Patronymic, Pasport_Id, Id_client, Birthday, Sex) VALUES (N'Екатерина', N'Либрикова', N'Олеговна', N'33040032', 3, '1990-05-21', CONVERT(bit, 'False'))
GO
SET IDENTITY_INSERT dbo.Client OFF
GO
-- 
-- Вывод данных для таблицы Company_builder
--
SET IDENTITY_INSERT dbo.Company_builder ON
GO
INSERT dbo.Company_builder(Name, Id_company) VALUES (N'Mersedes', 1)
INSERT dbo.Company_builder(Name, Id_company) VALUES (N'Volvo', 2)
INSERT dbo.Company_builder(Name, Id_company) VALUES (N'Opel', 3)
INSERT dbo.Company_builder(Name, Id_company) VALUES (N'BMW', 4)
INSERT dbo.Company_builder(Name, Id_company) VALUES (N'Lada', 5)
INSERT dbo.Company_builder(Name, Id_company) VALUES (N'Kia', 6)
INSERT dbo.Company_builder(Name, Id_company) VALUES (N'Hyundai', 7)
INSERT dbo.Company_builder(Name, Id_company) VALUES (N'Renault', 8)
INSERT dbo.Company_builder(Name, Id_company) VALUES (N'Toyota', 9)
INSERT dbo.Company_builder(Name, Id_company) VALUES (N'Nissan', 10)
INSERT dbo.Company_builder(Name, Id_company) VALUES (N'Volkswagen', 11)
INSERT dbo.Company_builder(Name, Id_company) VALUES (N'Skoda', 13)
INSERT dbo.Company_builder(Name, Id_company) VALUES (N'CHevrolet', 14)
GO
SET IDENTITY_INSERT dbo.Company_builder OFF
GO
-- 
-- Вывод данных для таблицы Deels
--
SET IDENTITY_INSERT dbo.Deels ON
GO
INSERT dbo.Deels(Id_Deel, Date_deel, Id_auto, Id_client_buy, Worker_user) VALUES (1005, '2016-05-29', 2, 1, N'TestAdm')
INSERT dbo.Deels(Id_Deel, Date_deel, Id_auto, Id_client_buy, Worker_user) VALUES (1006, '2016-05-30', 25, 1, N'TestAdm')
GO
SET IDENTITY_INSERT dbo.Deels OFF
GO
-- 
-- Вывод данных для таблицы Model
--
SET IDENTITY_INSERT dbo.Model ON
GO
INSERT dbo.Model(Id_model, Name, Id_brand) VALUES (2, N'W222', 1)
INSERT dbo.Model(Id_model, Name, Id_brand) VALUES (3, N'W211', 2)
INSERT dbo.Model(Id_model, Name, Id_brand) VALUES (5, N'I', 4)
INSERT dbo.Model(Id_model, Name, Id_brand) VALUES (6, N'II', 5)
INSERT dbo.Model(Id_model, Name, Id_brand) VALUES (7, N'J', 6)
INSERT dbo.Model(Id_model, Name, Id_brand) VALUES (8, N'B', 7)
INSERT dbo.Model(Id_model, Name, Id_brand) VALUES (9, N'E71', 8)
INSERT dbo.Model(Id_model, Name, Id_brand) VALUES (15, N'E70', 9)
INSERT dbo.Model(Id_model, Name, Id_brand) VALUES (16, N'qqq', 10)
INSERT dbo.Model(Id_model, Name, Id_brand) VALUES (21, N'qqq2', 15)
INSERT dbo.Model(Id_model, Name, Id_brand) VALUES (22, N'2231', 16)
INSERT dbo.Model(Id_model, Name, Id_brand) VALUES (23, N'1234', 17)
GO
SET IDENTITY_INSERT dbo.Model OFF
GO
-- 
-- Вывод данных для таблицы sysdiagrams
--
SET IDENTITY_INSERT dbo.sysdiagrams ON
GO
EXEC(N'INSERT dbo.sysdiagrams(name, principal_id, diagram_id, version, definition) VALUES (N''Diagram_0'', 1, 1, 1, 0xD0CF11E0A1B11AE1000000000000000000000000000000003E000300FEFF0900060000000000000000000000010000000100000000000000001000000200000001000000FEFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF12000000FEFFFFFF0400000005000000110000000700000008000000090000000A0000000B0000000C0000000D0000000E0000000F00000010000000FEFFFFFF1C000000FEFFFFFF1400000015000000160000001700000018000000190000001A0000001B000000FEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52006F006F007400200045006E00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500FFFFFFFFFFFFFFFF0200000000000000000000000000000000000000000000000000000000000000909FD07A67B8D10103000000000A0000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000201FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000000000000BE050000000000006F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040002010100000004000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000006000000E615000000000000010043006F006D0070004F0062006A0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000170000005F000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A0000000B0000000C0000000D0000000E0000000F00000010000000110000001200000013000000140000001500000016000000FEFFFFFF18000000FEFFFFFFFEFFFFFF1B0000001C0000001D0000001E0000001F00000020000000210000002200000023000000240000002500000026000000FEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF'
+ N'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000430000A1E100C05000080130000000F00FFFF13000000007D0000C3480000E93A000052850000225E0000DFE3FFFFF6170000DE805B10F195D011B0A000AA00BDCB5C0000080030000000000200000300000038002B00000009000000D9E6B0E91C81D011AD5100A0C90F5739F43B7F847F61C74385352986E1D552F8A0327DB2D86295428D98273C25A2DA2D00002C0043200000000000000000000053444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C00002C0043200000000000000000000051444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C13000000C80400000093010F00002C00A509000007000080010000009A02000000800000040000805363684772696400000000003A2000004175746F00003000A509000007000080020000009C02000000800000050000805363684772696400EA2400000C3000004272616E6469640000003000A509000007000080030000009E020000008000000600008053636847726964003831000074400000436C69656E74640000003800A50900000700008004000000B0020000008000000F000080536368477269640026340000D0200000436F6D70616E795F6275696C6465720000006400A50900000700008005000000520000000180000039000080436F6E74726F6C003F370000162A000052656C6174696F6E736869702027525F333727206265747765656E2027436F6D70616E795F6275696C6465722720616E6420274272616E642700000000002800B50100000700008006000000310000003B00000002800000436F6E74726F6C0057350000C02D000000003000A509000007000080070000009C0200000080000005000080536368477269640068100000CC4200004465656C7369640000005800A5090000070000800800000062000000018000002E000080436F6E74726F6C00210A00005B34000052656C6174696F6E736869702027525F323927206265747765656E20274175746F2720616E6420274465656C7327000000002800B50100000700008009000000310000003B00000002800000436F6E74726F6C00531200003139000000005800A5090000070000800A000000520000000180000030000080436F6E74726F6C007D260000574C000052656C6174696F6E736869702027525F343227206265747765656E2027436C69656E742720616E6420274465656C732700002800B5010000070000800B000000310000003B00000002800000436F6E74726F6C003D2B0000E74B000000003000A5090000070000800C0000009C020000008000000500008053636847726964005E1A0000D02000004D6F64656C69640000005800A5090000070000800D00000052000000018000002F000080436F6E74726F6C00E9230000012B000052656C6174696F6E736869702027525F333827206265747765656E20274272616E642720616E6420274D6F64656C272700002800B5010000070000800E000000310000003B00000002800000436F6E74726F6C002F260000452E000000005800A5090000070000800F00000052000000018000002E000080436F6E74726F6C0015160000BD22000052656C6174696F6E736869702027525F333927206265747765656E20274D6F64656C2720616E6420274175746F27000000002800B50100000700008010000000310000003B00000002800000436F6E74726F6C006B1700004D22000000003000A509000007000080110000009E0200000080000006000080536368477269640040EDFFFFCC420000576F726B6572640000007000A50900000700008012000000520000000180000047000080436F6E74726F6C0055030000DB4F000052656C6174696F6E736869702027464B5F4465656C735F576F726B65725F576F726B65725F7573657227206265747765656E2027576F726B65722720616E6420274465656C73270000002800B50100000700008013000000310000006900000002800000436F6E74726F6C00F90100006B4F000000000100FEFF030A0000FFFFFFFF00000000000000000000000000000000170000004D6963726F736F66742044445320466F726D20322E300010000000456D626564214334120800000041170000D81600007856341207000000140100004100750074006F000000A90F20C8C00F0A000000A84ABF0F00000000A84ABF0FB09FB10F0600000000000000060000000000000000000000000100000001000000000000846FB1739870B1730070B1733C61BA739870B173BC6FB173F9F9FAFFFAFAFBFFFAFBFBFFFBFCFCFFFCFCFDFFFCFDFDFFFDFEFEFFB5B5B5FF000000000000000000000000B8B8B8FFF6F7F8FFF7F8F9FFF8F9F9FFF9F9FAFFFAFAFBFFFAFBFCFFFBFCFCFFFCFCFDFFFCFDFDFFFDFEFEFFFDFEFEFFB8B8B8FF000000000000000000000000BABABAFFF7F8F9FFF8F9FAFFF9FAFAFFFAFAFBFFFAFBFCFFFBFCFCFFFCFDFDFFFCFDFDFFFCFD000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A7290000C51A0000000000002D010000090000000C000000070000001C010000F70800005307000039030000'
+ N'0B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000D816000000000000070000000700000002000000020000001C010000E60A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005200000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000050000004100750074006F000000214334120800000041170000EC0C00007856341207000000140100004200720061006E006400000000000000FC61B173FC61B173B4C0BA73B4C0BA7340C1BA7340C1BA733862B1733862B1739071B1739071B17320C1BA7320C1BA7350C1BA7350C1BA73F8C0BA73F8C0BA7318C1BA7318C1BA731872B1731872B173ACC0BA73ACC0BA7348C1BA7348C1BA737CC0BA737CC0BA7388C0BA7388C0BA7394C0BA7394C0BA73A0C0BA73A0C0BA73BCC0BA73BCC0BA73C8C0BA73C8C0BA73D4C0BA73D4C0BA73E0C0BA73E0C0BA73ECC0BA73ECC0BA7300C1BA7300C1BA730CC1BA730CC1BA7328C1BA7328C1BA7334C1BA7334C1BA7358C1BA7358C1BA7364C1BA7364C1BA7370C1BA7370C1000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000EC0C000000000000030000000300000002000000020000001C010000E60A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000060000004200720061006E0064000000214334120800000041170000D816000078563412070000001401000043006C00690065006E0074000000C00F09000000E026C70F00000000E026C70F20A4B10F07000000000000000E0000000000000000000000000100000001000000000000846FB1739870B1730070B1733C61BA730CB0E510D8E7BB731C61BA733C61BA73CCD8E510D8E7BB731C61BA733C61BA739870B173BC6FB173000000001A040000F21300001A04000000000000B0040000F2130000B00400000000000046050000F21300004605000000000000DC050000F2130000DC0500000000000072060000F2130000720600000000000008070000F213000008070000000000009E070000F21300009E0700000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A7290000C51A0000000000002D010000090000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000D816000000000000070000000700000002000000020000001C010000E60A00000000000001000000F21300004E06000000000000010000000100000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000700000043006C00690065006E007400000021433412080000005C170000FD0B000078563412070000001401000043006F006D00700061006E0079005F006200750069006C0064006500720000002000460069006C00650073002000280078003800360029002F004D006900630072006F0073006F00660074002000530051004C0020005300650072007600650072002F003100320030002F0054006F006F006C0073002F00420069006E006E002F004D0061006E006100670065006D0065006E007400530074007500640069006F002F004900440045002F0043006F006D006D006F006E0045007800740065006E00730069006F006E0073002F004D006900630072006F0073006F00660074002F00540065006D0070006C006100000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F70800005'
+ N'3070000390300000B040000D0020000DD04000018060000A203000018060000BC0700004605000000000000010000005C170000FD0B000000000000020000000200000002000000020000001C010000F50A00000000000001000000F21300004E06000000000000010000000100000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000001000000043006F006D00700061006E0079005F006200750069006C00640065007200000002000B00D6380000CD2C0000D63800000C3000000000000002000000F0F0F0000000000000000000000000000000000001000000060000000000000057350000C02D0000D00200005801000032000000010000020000D002000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61040052005F0033003700214334120800000041170000E21100007856341207000000140100004400650065006C007300000043003A002F00500072006F006700720061006D002000460069006C00650073002000280078003800360029002F004D006900630072006F0073006F00660074002000530051004C0020005300650072007600650072002F003100320030002F0054006F006F006C0073002F00420069006E006E002F004D0061006E006100670065006D0065006E007400530074007500640069006F002F004900440045002F0053007400610072007400500061006700650041007300730065006D0062006C006900650073002F0065006E002F004D006900630072006F0073006F00660074002E00000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000E211000000000000050000000500000002000000020000001C010000E60A00000000000001000000F2130000200D000000000000040000000400000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000060000004400650065006C007300000004000B00B80B000012370000B80B000082380000201C000082380000201C0000CC4200000000000002000000F0F0F000000000000000000000000000000000000100000009000000000000005312000031390000D00200005801000029000000010000020000D002000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61040052005F003200390002000B0038310000EE4D0000A9270000EE4D00000000000002000000F0F0F00001000000000000000000000000000000010000000B000000000000003D2B0000E74B0000D0020000580100002F000000010000020000D002000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61040052005F0034003200214334120800000041170000EC0C00007856341207000000140100004D006F00640065006C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000EC0C000000000000030000000300000002000000020000001C010000E60A00000000000001000000F2130000DA0A000000000000030000000300000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D0000000400'
+ N'0000040000001C010000F70800009B0A00008106000078563412040000005400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000060000004D006F00640065006C00000002000B00802500000C30000080250000BC2D00000000000002000000F0F0F00000000000000000000000000000000000010000000E000000000000002F260000452E0000D0020000580100002C000000010000020000D002000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61040052005F003300380002000B005E1A00005424000041170000542400000000000002000000F0F0F000000000000000000000000000000000000100000010000000000000006B1700004D220000D0020000580100002D000000010000020000D002000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61040052005F0033003900214334120800000041170000E211000078563412070000001401000057006F0072006B0065007200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000520049004D0041005200590000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000E211000000000000050000000500000002000000020000001C010000E60A00000000000001000000F21300004E06000000000000010000000100000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000700000057006F0072006B0065007200000002000B00810400007251000068100000725100000000000002000000F0F0F00000000000000000000000000000000000010000001300000000000000F90100006B4F00003C110000580100002F0000000100000200003C11000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611B0046004B005F004400650065006C0073005F0057006F0072006B00650072005F0057006F0072006B00650072005F0075007300650072000000000000000000000000000000000000000000000000000000646564204F626A6563740000000000F439B271000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B0000004E61BC00000000000000000000000000000000000000000000000000000000000000000000000000000000000000DBE6B0E91C81D011AD5100A0C90F573900000200B029C77A67B8D101020200001048450000000000000000000000000000000000740100004400610074006100200053006F0075007200630065003D00530041004D00530055004E0047005C00530051004C0045005800500052004500530053003B0049006E0069007400690061006C00200043006100740061006C006F0067003D0043006F006D00700061006E0079003B0049006E00740065006700720061007400650064002000530065006300750072006900740079003D0054007200750065003B004D0075006C007400690070006C00650041006300740069007600650052006500730075006C00740053006500740073003D00460061006C00730065003B005000610063006B00650074002000530069007A0065003D0034003000390036003B004100700070006C00690063006100740069006F006E0020004E0061006D0065003D0022004D006900630072006F0073006F00660074002000530051004C00200053006500720076000300440064007300530074007200650061006D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160002000300000006000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000013000000C21100000000000053006300680065006D00610020005500440056002000440065006600610075006C0074000000000000000000000000000000000000000000000000000000000026000200FFFFFFFFFFF'
+ N'FFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000190000001600000000000000440053005200450046002D0053004300480045004D0041002D0043004F004E00540045004E0054005300000000000000000000000000000000000000000000002C0002010500000007000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000001A000000260300000000000053006300680065006D00610020005500440056002000440065006600610075006C007400200050006F007300740020005600360000000000000000000000000036000200FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000002700000012000000000000000C000000DFE3FFFFF61700000100260000007300630068005F006C006100620065006C0073005F00760069007300690062006C0065000000010000000B0000001E000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000010000000100000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C0031003600360035000000020000000200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C0031003600360035000000030000000300000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C003100'
+ N'3600360035000000040000000400000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000000500000005000000000000001A0000000116D36B01000000640062006F00000052005F003300370000000000000000000000C40200000000060000000600000005000000080000000119AC0FB819AC0F0000000000000000AD0F0000010000070000000700000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000000800000008000000000000001A0000000116D36B01000000640062006F00000052005F003200390000000000000000000000C402000000000900000009000000080000000800000001AC220820AC22080000000000000000AD0F00000100000A0000000A000000000000001A0000000116D36B01000000640062006F00000052005F003400320000000000000000000000C402000000000B0000000B0000000A0000000800000001CACA0F20CACA0F0000000000000000AD0F00000100000C0000000C00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000000D0000000D000000000000001A0000000116D36B01000000640062006F00000052005F003300380000000000000000000000C402000000000E0000000E0000000D0000000800000001C7CA0FA0C7CA0F0000000000000000AD0F00000100000F0000000F000000000000001A000000016A165C010000006'
+ N'40062006F00000052005F003300390000000000000000000000C4020000000010000000100000000F0000000800000001C5CA0FE0C5CA0F0000000000000000AD0F0000010000110000001100000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C003100360036003500000012000000120000000000000048000000013CD67101000000640062006F00000046004B005F004400650065006C0073005F0057006F0072006B00650072005F0057006F0072006B00650072005F00750073006500720000000000000000000000C402000000001300000013000000120000000800000001C4CA0FA0C4CA0F0000000000000000AD0F00000100001E00000008000000010000000700000027000000260000000D000000020000000C00000000000000250000000A000000030000000700000078000000710000000500000004000000020000000F000000420000000F0000000C0000000100000056000000590000001200000011000000070000007D0000007C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006500720020004D0061006E006100670065006D0065006E0074002000530074007500640069006F002200000000800500140000004400690061006700720061006D005F0030000000000226000A0000004100750074006F00000008000000640062006F000000000226000C0000004200720061006E006400000008000000640062006F000000000226000E00000043006C00690065006E007400000008000000640062006F000000000226002000000043006F006D00700061006E0079005F006200750069006C00640065007200000008000000640062006F000000000226000C0000004400650065006C007300000008000000640062006F000000000226000C0000004D006F00640065006C00000008000000640062006F000000000224000E00000057006F0072006B0065007200000008000000640062006F00000001000000D68509B3BB6BF2459AB8371664F0327008004E0000007B00310036003300340043004400440037002D0030003800380038002D0034003200450033002D0039004600410032002D004200360044003300320035003600330042003900310044007D0000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062885214)')
GO
SET IDENTITY_INSERT dbo.sysdiagrams OFF
GO
-- 
-- Вывод данных для таблицы Worker
--
INSERT dbo.Worker(First_name, Second_name, Patronomic, WorkerType, Worker_user) VALUES (N'2', N'1', N'3', 1, N'aaa')
INSERT dbo.Worker(First_name, Second_name, Patronomic, WorkerType, Worker_user) VALUES (N'Дмитрий', N'Дыбенко', N'Алексеевич', 1, N'DibenkoDA')
INSERT dbo.Worker(First_name, Second_name, Patronomic, WorkerType, Worker_user) VALUES (N'Елена', N'Кирова', N'Николаевна', 1, N'KirovaEN')
INSERT dbo.Worker(First_name, Second_name, Patronomic, WorkerType, Worker_user) VALUES (N'Сергей', N'Логинов', N'Иванович', 1, N'LoginovSI')
INSERT dbo.Worker(First_name, Second_name, Patronomic, WorkerType, Worker_user) VALUES (N'александр', N'мельдианов', N'алексеевич', 2, N'TestAdm')
GO

USE Company
GO

IF DB_NAME() <> N'Company' SET NOEXEC ON
GO

--
-- Создать внешний ключ "R_37" для объекта типа таблица "dbo.Brand"
--
PRINT (N'Создать внешний ключ "R_37" для объекта типа таблица "dbo.Brand"')
GO
IF OBJECT_ID('dbo.R_37', 'F') IS NULL
  AND OBJECT_ID('dbo.Brand', 'U') IS NOT NULL
  AND OBJECT_ID('dbo.Company_builder', 'U') IS NOT NULL
  AND COL_LENGTH(N'dbo.Brand', N'Id_company') IS NOT NULL
  AND COL_LENGTH(N'dbo.Company_builder', N'Id_company') IS NOT NULL
ALTER TABLE dbo.Brand
  ADD CONSTRAINT R_37 FOREIGN KEY (Id_company) REFERENCES dbo.Company_builder (Id_company) ON DELETE CASCADE ON UPDATE CASCADE
GO

--
-- Создать внешний ключ "R_38" для объекта типа таблица "dbo.Model"
--
PRINT (N'Создать внешний ключ "R_38" для объекта типа таблица "dbo.Model"')
GO
IF OBJECT_ID('dbo.R_38', 'F') IS NULL
  AND OBJECT_ID('dbo.Model', 'U') IS NOT NULL
  AND OBJECT_ID('dbo.Brand', 'U') IS NOT NULL
  AND COL_LENGTH(N'dbo.Model', N'Id_brand') IS NOT NULL
  AND COL_LENGTH(N'dbo.Brand', N'Id_brand') IS NOT NULL
ALTER TABLE dbo.Model
  ADD CONSTRAINT R_38 FOREIGN KEY (Id_brand) REFERENCES dbo.Brand (Id_brand) ON DELETE CASCADE ON UPDATE CASCADE
GO

--
-- Создать внешний ключ "R_39" для объекта типа таблица "dbo.Auto"
--
PRINT (N'Создать внешний ключ "R_39" для объекта типа таблица "dbo.Auto"')
GO
IF OBJECT_ID('dbo.R_39', 'F') IS NULL
  AND OBJECT_ID('dbo.Auto', 'U') IS NOT NULL
  AND OBJECT_ID('dbo.Model', 'U') IS NOT NULL
  AND COL_LENGTH(N'dbo.Auto', N'Id_model') IS NOT NULL
  AND COL_LENGTH(N'dbo.Model', N'Id_model') IS NOT NULL
ALTER TABLE dbo.Auto
  ADD CONSTRAINT R_39 FOREIGN KEY (Id_model) REFERENCES dbo.Model (Id_model) ON DELETE CASCADE ON UPDATE CASCADE
GO

--
-- Создать внешний ключ "FK_Deels_Worker_Worker_user" для объекта типа таблица "dbo.Deels"
--
PRINT (N'Создать внешний ключ "FK_Deels_Worker_Worker_user" для объекта типа таблица "dbo.Deels"')
GO
IF OBJECT_ID('dbo.FK_Deels_Worker_Worker_user', 'F') IS NULL
  AND OBJECT_ID('dbo.Deels', 'U') IS NOT NULL
  AND OBJECT_ID('dbo.Worker', 'U') IS NOT NULL
  AND COL_LENGTH(N'dbo.Deels', N'Worker_user') IS NOT NULL
  AND COL_LENGTH(N'dbo.Worker', N'Worker_user') IS NOT NULL
ALTER TABLE dbo.Deels
  ADD CONSTRAINT FK_Deels_Worker_Worker_user FOREIGN KEY (Worker_user) REFERENCES dbo.Worker (Worker_user) ON DELETE CASCADE ON UPDATE CASCADE
GO

--
-- Создать внешний ключ "R_29" для объекта типа таблица "dbo.Deels"
--
PRINT (N'Создать внешний ключ "R_29" для объекта типа таблица "dbo.Deels"')
GO
IF OBJECT_ID('dbo.R_29', 'F') IS NULL
  AND OBJECT_ID('dbo.Deels', 'U') IS NOT NULL
  AND OBJECT_ID('dbo.Auto', 'U') IS NOT NULL
  AND COL_LENGTH(N'dbo.Deels', N'Id_auto') IS NOT NULL
  AND COL_LENGTH(N'dbo.Auto', N'Id_auto') IS NOT NULL
ALTER TABLE dbo.Deels
  ADD CONSTRAINT R_29 FOREIGN KEY (Id_auto) REFERENCES dbo.Auto (Id_auto) ON DELETE CASCADE ON UPDATE CASCADE
GO

--
-- Создать внешний ключ "R_42" для объекта типа таблица "dbo.Deels"
--
PRINT (N'Создать внешний ключ "R_42" для объекта типа таблица "dbo.Deels"')
GO
IF OBJECT_ID('dbo.R_42', 'F') IS NULL
  AND OBJECT_ID('dbo.Deels', 'U') IS NOT NULL
  AND OBJECT_ID('dbo.Client', 'U') IS NOT NULL
  AND COL_LENGTH(N'dbo.Deels', N'Id_client_buy') IS NOT NULL
  AND COL_LENGTH(N'dbo.Client', N'Id_client') IS NOT NULL
ALTER TABLE dbo.Deels WITH NOCHECK
  ADD CONSTRAINT R_42 FOREIGN KEY (Id_client_buy) REFERENCES dbo.Client (Id_client) ON DELETE CASCADE ON UPDATE CASCADE
GO

--
-- Выключить внешний ключ "R_42" для объекта типа таблица "dbo.Deels"
--
PRINT (N'Выключить внешний ключ "R_42" для объекта типа таблица "dbo.Deels"')
GO
ALTER TABLE dbo.Deels
  NOCHECK CONSTRAINT R_42
GO
SET NOEXEC OFF
GO


