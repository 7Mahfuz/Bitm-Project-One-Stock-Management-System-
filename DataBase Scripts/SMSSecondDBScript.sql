USE [master]
GO
/****** Object:  Database [StockManagementSystem]    Script Date: 8/13/2018 8:20:50 AM ******/
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
/****** Object:  Table [dbo].[Company_tbl]    Script Date: 8/13/2018 8:20:53 AM ******/
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
/****** Object:  Table [dbo].[Item_tbl]    Script Date: 8/13/2018 8:20:54 AM ******/
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
/****** Object:  View [dbo].[StockChart]    Script Date: 8/13/2018 8:20:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StockChart]
AS
SELECT        it.Id AS ID, it.Name AS Item, ct.Name AS Company, ct.Id AS CID
FROM            dbo.Item_tbl AS it INNER JOIN
                         dbo.Company_tbl AS ct ON it.CompanyId = ct.Id
GO
/****** Object:  Table [dbo].[Stock_tbl]    Script Date: 8/13/2018 8:20:54 AM ******/
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
/****** Object:  View [dbo].[SearchItem]    Script Date: 8/13/2018 8:20:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[SearchItem] as
select it.Name Item,it.CategoryId, it.CompanyId,ct.Name Company, st.Quantity Quantity,
it.Reorderlvl
 from Item_tbl it join Company_tbl ct on it.CompanyId=ct.Id 
join Stock_tbl st on st.ItemId=it.Id
GO
/****** Object:  Table [dbo].[SellHistory_tbl]    Script Date: 8/13/2018 8:20:54 AM ******/
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
/****** Object:  View [dbo].[SearchByDate]    Script Date: 8/13/2018 8:20:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[SearchByDate] as
select it.Name Item, st.Quantity,st.Date from Item_tbl it join SellHistory_tbl st on 
st.ItemId=it.id
GO
/****** Object:  Table [dbo].[Category_tbl]    Script Date: 8/13/2018 8:20:54 AM ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "it"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ct"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StockChart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StockChart'
GO
USE [master]
GO
ALTER DATABASE [StockManagementSystem] SET  READ_WRITE 
GO
