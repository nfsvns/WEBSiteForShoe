USE [master]
GO
/****** Object:  Database [asm_jv5]    Script Date: 7/20/2023 1:13:53 AM ******/
CREATE DATABASE [asm_jv5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'asm_jv5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\asm_jv5.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'asm_jv5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\asm_jv5_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [asm_jv5] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [asm_jv5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [asm_jv5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [asm_jv5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [asm_jv5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [asm_jv5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [asm_jv5] SET ARITHABORT OFF 
GO
ALTER DATABASE [asm_jv5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [asm_jv5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [asm_jv5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [asm_jv5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [asm_jv5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [asm_jv5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [asm_jv5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [asm_jv5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [asm_jv5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [asm_jv5] SET  DISABLE_BROKER 
GO
ALTER DATABASE [asm_jv5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [asm_jv5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [asm_jv5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [asm_jv5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [asm_jv5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [asm_jv5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [asm_jv5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [asm_jv5] SET RECOVERY FULL 
GO
ALTER DATABASE [asm_jv5] SET  MULTI_USER 
GO
ALTER DATABASE [asm_jv5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [asm_jv5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [asm_jv5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [asm_jv5] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [asm_jv5] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'asm_jv5', N'ON'
GO
USE [asm_jv5]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 7/20/2023 1:13:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[photo] [nvarchar](50) NULL,
	[activated] [bit] NOT NULL DEFAULT ((1)),
	[admin] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/20/2023 1:13:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [char](4) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Images]    Script Date: 7/20/2023 1:13:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Images](
	[id] [varchar](50) NOT NULL,
	[product_id] [int] NULL,
	[image1] [nvarchar](max) NULL,
	[image2] [nvarchar](max) NULL,
	[image3] [nvarchar](max) NULL,
	[image4] [nvarchar](max) NULL,
	[image5] [nvarchar](max) NULL,
	[image6] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/20/2023 1:13:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [bigint] NULL,
	[product_id] [int] NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/20/2023 1:13:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[create_date] [datetime] NOT NULL,
	[address] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/20/2023 1:13:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [char](4) NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[size] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[create_date] [date] NOT NULL,
	[available] [bit] NOT NULL DEFAULT ((1)),
	[image] [nvarchar](255) NULL,
	[description] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([id])
GO
USE [master]
GO
ALTER DATABASE [asm_jv5] SET  READ_WRITE 
GO
