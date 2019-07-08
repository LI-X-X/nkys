USE [management]
GO

-- Create Alterlier table --

/****** Object:  Table [dbo].[Alterlier]    Script Date: 2019/7/7 21:00:58 ******/
IF EXISTS (Select * From sysObjects Where Name ='Alterlier' And Type In ('S','U'))
BEGIN
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Altelier', @level2type=N'CONSTRAINT',@level2name=N'FK_Altelier_Department'
GO

ALTER TABLE [dbo].[Altelier] DROP CONSTRAINT [FK_Altelier_Department]
GO
/****** Object:  Table [dbo].[Altelier]    Script Date: 2019/7/8 23:42:34 ******/
DROP TABLE [dbo].[Altelier]
GO
END
ELSE 
BEGIN

/****** Object:  Table [dbo].[Altelier]    Script Date: 2019/7/8 23:42:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Altelier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[AlterlierName] [nchar](10) NULL,
	[Propotion] [float] NULL,
 CONSTRAINT [PK_Altelier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Altelier]  WITH CHECK ADD  CONSTRAINT [FK_Altelier_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO

ALTER TABLE [dbo].[Altelier] CHECK CONSTRAINT [FK_Altelier_Department]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Every department compose one or more altelier
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Altelier', @level2type=N'CONSTRAINT',@level2name=N'FK_Altelier_Department'
GO




-- Create the table Department --

/****** Object:  Table [dbo].[Department]    Script Date: 2019/7/7 21:06:42 ******/
IF EXISTS (Select * From sysObjects Where Name ='Department' And Type In ('S','U'))
DROP TABLE [dbo].[Department]

ELSE 
/****** Object:  Table [dbo].[Department]    Script Date: 2019/7/7 21:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nchar](10) NOT NULL,
	[IsWorkingAltelier] [bit] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create table Employee -- 

/****** Object:  Table [dbo].[Employee]    Script Date: 2019/7/7 21:08:13 ******/
IF EXISTS (Select * From sysObjects Where Name ='Department' And Type In ('S','U'))
DROP TABLE [dbo].[Employee]EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'CONSTRAINT',@level2name=N'FK_Employee_Altelier'
GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_Employee_Altelier]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2019/7/8 23:40:05 ******/
DROP TABLE [dbo].[Employee]
GO

ELSE
/****** Object:  Table [dbo].[Employee]    Script Date: 2019/7/7 21:08:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdAltelier] [int] NOT NULL,
	[EmployeeName] [nchar](10) NOT NULL,
	[Dorm] [bit] NULL,
	[SecuSocial] [bit] NULL,
	[HouseAccumulation] [bit] NULL,
	[ExperiencedOfficial] [bit] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Altelier] FOREIGN KEY([IdAltelier])
REFERENCES [dbo].[Altelier] ([Id])
GO

ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Altelier]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Every altelier compose at least one employee
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'CONSTRAINT',@level2name=N'FK_Employee_Altelier'
GO


-- Salary table -- 
IF EXISTS (Select * From sysObjects Where Name ='Salary' And Type In ('S','U'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Salary', @level2type=N'CONSTRAINT',@level2name=N'FK_Salary_Employee'
GO

ALTER TABLE [dbo].[Salary] DROP CONSTRAINT [FK_Salary_Employee]
GO
/****** Object:  Table [dbo].[Salary]    Script Date: 2019/7/8 23:44:19 ******/
DROP TABLE [dbo].[Salary]
GO

ELSE
/****** Object:  Table [dbo].[Salary]    Script Date: 2019/7/8 23:44:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Salary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[DayWorkingTime] [float] NOT NULL,
	[NightWorkingTime] [float] NOT NULL,
	[HolidayWorkingTime] [float] NOT NULL,
	[Score] [int] NULL,
	[FixSalary] [float] NULL,
 CONSTRAINT [PK_Salary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO

ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Employee]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Every employee can have one and only one salary every month for every year(m et y)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Salary', @level2type=N'CONSTRAINT',@level2name=N'FK_Salary_Employee'
GO


-- ExternalFee table -- 
IF EXISTS (Select * From sysObjects Where Name ='ExternalFee' And Type In ('S','U'))
ALTER TABLE [dbo].[ExternalFee] DROP CONSTRAINT [FK_ExternalFee_Salary]
GO
/****** Object:  Table [dbo].[ExternalFee]    Script Date: 2019/7/8 23:45:30 ******/
DROP TABLE [dbo].[ExternalFee]
GO

ELSE
/****** Object:  Table [dbo].[ExternalFee]    Script Date: 2019/7/8 23:45:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ExternalFee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalaryId] [int] NOT NULL,
	[DormFee] [float] NULL,
	[Reduction] [float] NULL,
 CONSTRAINT [PK_ExternalFee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ExternalFee]  WITH CHECK ADD  CONSTRAINT [FK_ExternalFee_Salary] FOREIGN KEY([SalaryId])
REFERENCES [dbo].[Salary] ([Id])
GO

ALTER TABLE [dbo].[ExternalFee] CHECK CONSTRAINT [FK_ExternalFee_Salary]
GO


-- Revenue table -- 
/****** Object:  Table [dbo].[Revenue]    Script Date: 2019/7/8 23:46:37 ******/
IF EXISTS (SELECT * From sysObjects = 'Revenue' And Type In ('S','U'))
DROP TABLE [dbo].[Revenue]
GO
ELSE
/****** Object:  Table [dbo].[Revenue]    Script Date: 2019/7/8 23:46:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Revenue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Revenue] [float] NULL,
 CONSTRAINT [PK_Revenue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
