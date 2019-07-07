USE [management]
GO
-- Create the table Alterlier --
/****** Object:  Table [dbo].[Alterlier]    Script Date: 2019/7/5 21:12:45 ******/
DROP TABLE [dbo].[Alterlier]
GO

/****** Object:  Table [dbo].[Alterlier]    Script Date: 2019/7/5 21:12:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Alterlier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idDepartment] [int] NOT NULL,
	[alterlierName] [nchar](10) NULL,
	[Propotion] [float] NULL
) ON [PRIMARY]
GO

-- Create the table Department --
/****** Object:  Table [dbo].[Department]    Script Date: 2019/7/5 21:14:13 ******/
DROP TABLE [dbo].[Department]
GO

/****** Object:  Table [dbo].[Department]    Script Date: 2019/7/5 21:14:13 ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 2019/7/5 21:14:26 ******/
DROP TABLE [dbo].[Employee]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 2019/7/5 21:14:26 ******/
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








