USE [master]
GO
/****** Object:  Database [StockManagementSystem]    Script Date: 8/11/2018 9:32:36 AM ******/
CREATE DATABASE [StockManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\StockManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StockManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\StockManagementSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StockManagementSystem] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockManagementSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockManagementSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockManagementSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [StockManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [StockManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockManagementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StockManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StockManagementSystem', N'ON'
GO
ALTER DATABASE [StockManagementSystem] SET QUERY_STORE = OFF
GO
USE [StockManagementSystem]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [StockManagementSystem]
GO
/****** Object:  Table [dbo].[Company_tbl]    Script Date: 8/11/2018 9:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
 CONSTRAINT [PK_Company_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item_tbl]    Script Date: 8/11/2018 9:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](450) NULL,
	[Reorderlvl] [int] NULL,
	[CategoryId] [int] NULL,
	[CompanyId] [int] NULL,
 CONSTRAINT [PK_Item_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StockChart]    Script Date: 8/11/2018 9:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[StockChart] as
select it.Id ID,it.Name Item , ct.Name Company 
from Item_tbl it join Company_tbl ct on it.CompanyId=ct.Id 
GO
/****** Object:  Table [dbo].[Category_tbl]    Script Date: 8/11/2018 9:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
 CONSTRAINT [PK_Category_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellHistory_tbl]    Script Date: 8/11/2018 9:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellHistory_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Quantity] [int] NULL,
	[ItemId] [int] NULL,
 CONSTRAINT [PK_SellHistory_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock_tbl]    Script Date: 8/11/2018 9:32:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[ItemId] [int] NULL,
	[CompantId] [int] NULL,
 CONSTRAINT [PK_Stock_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [StockManagementSystem] SET  READ_WRITE 
GO
