USE [management]
GO

-- Create Alterlier table
/****** Object:  Table [dbo].[Alterlier]    Script Date: 2019/7/7 21:00:58 ******/
IF EXISTS (Select * From sysObjects Where Name ='Alterlier' And Type In ('S','U'))
BEGIN
DROP TABLE [dbo].[Alterlier]
END
ELSE 
BEGIN
/****** Object:  Table [dbo].[Alterlier]    Script Date: 2019/7/7 21:00:58 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON


CREATE TABLE [dbo].[Alterlier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idDepartment] [int] NOT NULL,
	[alterlierName] [nchar](10) NULL,
	[Propotion] [float] NULL,
 CONSTRAINT [PK_Alterlier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
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
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nchar](10) NOT NULL,
	[IsWorkShop] [bit] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


-- Create table Employee -- 
/****** Object:  Table [dbo].[Employee]    Script Date: 2019/7/7 21:08:13 ******/
IF EXISTS (Select * From sysObjects Where Name ='Department' And Type In ('S','U'))
DROP TABLE [dbo].[Employee]


ELSE
/****** Object:  Table [dbo].[Employee]    Script Date: 2019/7/7 21:08:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idAlterlier] [int] NOT NULL,
	[employeeName] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


