USE [master]
GO
/****** Object:  Database [DemoWeb]    Script Date: 3/9/2023 3:12:32 AM ******/
CREATE DATABASE [DemoWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DemoWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DemoWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DemoWeb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemoWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DemoWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DemoWeb] SET  MULTI_USER 
GO
ALTER DATABASE [DemoWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemoWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DemoWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DemoWeb] SET QUERY_STORE = OFF
GO
USE [DemoWeb]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 3/9/2023 3:12:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[maloaisanpham] [nvarchar](10) NOT NULL,
	[tenloaisanpham] [nvarchar](150) NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[maloaisanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 3/9/2023 3:12:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[mansx] [nvarchar](10) NOT NULL,
	[tennsx] [nvarchar](150) NULL,
 CONSTRAINT [PK_NhSanXuat] PRIMARY KEY CLUSTERED 
(
	[mansx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 3/9/2023 3:12:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[masanpham] [nvarchar](10) NOT NULL,
	[maloaisanpham] [nvarchar](10) NULL,
	[mansx] [nvarchar](10) NULL,
	[tensanpham] [nchar](150) NULL,
	[noidung] [nvarchar](150) NULL,
	[hinhchinh] [nvarchar](50) NULL,
	[hinh1] [nvarchar](50) NULL,
	[hinh2] [nvarchar](50) NULL,
	[hinh3] [nvarchar](50) NULL,
	[hinh4] [nvarchar](50) NULL,
	[gia] [int] NULL,
	[soluongdaban] [int] NULL,
	[luotview] [int] NULL,
	[tinhtrang] [nvarchar](10) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[masanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[LoaiSanPham] ([maloaisanpham], [tenloaisanpham]) VALUES (N'LSP01', N'Giay')
INSERT [dbo].[LoaiSanPham] ([maloaisanpham], [tenloaisanpham]) VALUES (N'LSP02', N'Ao')
GO
INSERT [dbo].[NhaSanXuat] ([mansx], [tennsx]) VALUES (N'NSX01', N'VietNam')
INSERT [dbo].[NhaSanXuat] ([mansx], [tennsx]) VALUES (N'NSX02', N'China')
GO
INSERT [dbo].[SanPham] ([masanpham], [maloaisanpham], [mansx], [tensanpham], [noidung], [hinhchinh], [hinh1], [hinh2], [hinh3], [hinh4], [gia], [soluongdaban], [luotview], [tinhtrang]) VALUES (N'SP01', N'LSP01', N'NSX01', N'ao blabla                                                                                                                                             ', N'chưa có', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', 120000, 0, 0, N'1')
INSERT [dbo].[SanPham] ([masanpham], [maloaisanpham], [mansx], [tensanpham], [noidung], [hinhchinh], [hinh1], [hinh2], [hinh3], [hinh4], [gia], [soluongdaban], [luotview], [tinhtrang]) VALUES (N'SP02', N'LSP01', N'NSX01', N'ao blabla                                                                                                                                             ', N'chưa có', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', 120000, 0, 0, N'1')
INSERT [dbo].[SanPham] ([masanpham], [maloaisanpham], [mansx], [tensanpham], [noidung], [hinhchinh], [hinh1], [hinh2], [hinh3], [hinh4], [gia], [soluongdaban], [luotview], [tinhtrang]) VALUES (N'SP03', N'LSP02', N'NSX01', N'ao blabla                                                                                                                                             ', N'chưa có', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', 120000, 0, 0, N'1')
INSERT [dbo].[SanPham] ([masanpham], [maloaisanpham], [mansx], [tensanpham], [noidung], [hinhchinh], [hinh1], [hinh2], [hinh3], [hinh4], [gia], [soluongdaban], [luotview], [tinhtrang]) VALUES (N'SP04', N'LSP02', N'NSX02', N'ao blabla                                                                                                                                             ', N'chưa có', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', 120000, 0, 0, N'1')
INSERT [dbo].[SanPham] ([masanpham], [maloaisanpham], [mansx], [tensanpham], [noidung], [hinhchinh], [hinh1], [hinh2], [hinh3], [hinh4], [gia], [soluongdaban], [luotview], [tinhtrang]) VALUES (N'SP05', N'LSP02', N'NSX01', N'ao blabla                                                                                                                                             ', N'chưa có', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', 120000, 0, 0, N'1')
INSERT [dbo].[SanPham] ([masanpham], [maloaisanpham], [mansx], [tensanpham], [noidung], [hinhchinh], [hinh1], [hinh2], [hinh3], [hinh4], [gia], [soluongdaban], [luotview], [tinhtrang]) VALUES (N'SP06', N'LSP02', N'NSX02', N'ao blabla                                                                                                                                             ', N'chưa có', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', N'/Content/images/book1.jpg', 120000, 0, 0, N'1')
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_gia]  DEFAULT ((0)) FOR [gia]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_soluongdaban]  DEFAULT ((0)) FOR [soluongdaban]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_luotview]  DEFAULT ((0)) FOR [luotview]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_tinhtrang]  DEFAULT ((1)) FOR [tinhtrang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([maloaisanpham])
REFERENCES [dbo].[LoaiSanPham] ([maloaisanpham])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaSanXuat] FOREIGN KEY([mansx])
REFERENCES [dbo].[NhaSanXuat] ([mansx])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaSanXuat]
GO
USE [master]
GO
ALTER DATABASE [DemoWeb] SET  READ_WRITE 
GO
