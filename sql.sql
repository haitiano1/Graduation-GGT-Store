USE [master]
GO
/****** Object:  Database [DATN]    Script Date: 12/21/2021 8:20:50 PM ******/
CREATE DATABASE [DATN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DATN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\DATN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DATN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\DATN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DATN] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DATN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DATN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DATN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DATN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DATN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DATN] SET ARITHABORT OFF 
GO
ALTER DATABASE [DATN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DATN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DATN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DATN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DATN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DATN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DATN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DATN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DATN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DATN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DATN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DATN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DATN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DATN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DATN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DATN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DATN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DATN] SET RECOVERY FULL 
GO
ALTER DATABASE [DATN] SET  MULTI_USER 
GO
ALTER DATABASE [DATN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DATN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DATN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DATN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DATN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DATN] SET QUERY_STORE = OFF
GO
USE [DATN]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[username] [varchar](255) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[gender] [bit] NOT NULL,
	[image] [varchar](255) NULL,
	[is_edit] [bit] NULL,
	[password] [varchar](255) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[register_date] [date] NULL,
 CONSTRAINT [PK__accounts__F3DBC5733615F22A] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[accounts_favorite_products]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts_favorite_products](
	[account_username] [varchar](255) NOT NULL,
	[favorite_products_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[address]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address_line1] [nvarchar](64) NOT NULL,
	[address_line2] [nvarchar](64) NOT NULL,
	[city] [nvarchar](64) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[phone_number] [varchar](15) NOT NULL,
	[postal_code] [varchar](10) NOT NULL,
	[state] [varchar](45) NOT NULL,
	[username] [varchar](255) NULL,
 CONSTRAINT [PK__address__3213E83F8D44F8C4] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authorities]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authorities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NULL,
	[roleid] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [varchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[image] [varchar](255) NULL,
 CONSTRAINT [PK__categori__3213E83F718E1EFB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category_report]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_report](
	[category] [varbinary](255) NOT NULL,
	[gross_revenue] [float] NULL,
	[quantity] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [varchar](255) NOT NULL,
	[username] [varchar](255) NULL,
	[productid] [int] NULL,
	[createdate] [date] NULL,
	[com] [nvarchar](500) NULL,
	[is_edit] [bit] NULL,
	[flashsaleid] [int] NULL,
 CONSTRAINT [PK__comments__3213E83FCBAD5EEA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discounts]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discounts](
	[id] [varchar](255) NOT NULL,
	[name_discount] [nvarchar](255) NOT NULL,
	[create_date] [date] NOT NULL,
	[percents] [float] NOT NULL,
 CONSTRAINT [PK__discount__3213E83FE35C2AEC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favorite_detail_product]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favorite_detail_product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[status] [int] NULL,
	[favoriteid] [bigint] NULL,
	[productid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favorite_products]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favorite_products](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdate] [date] NULL,
	[username] [varchar](255) NULL,
	[productid] [int] NULL,
	[flashsaleid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flash_sales]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flash_sales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[available] [bit] NULL,
	[createdate] [date] NULL,
	[desciption] [nvarchar](4000) NOT NULL,
	[image] [varchar](255) NOT NULL,
	[insurance] [bit] NULL,
	[name] [varchar](255) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[categoryid] [varchar](255) NULL,
	[discountid] [varchar](255) NULL,
	[producerid] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flash_sales_favorite_products]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flash_sales_favorite_products](
	[flash_sale_id] [int] NOT NULL,
	[favorite_products_id] [bigint] NOT NULL,
	[flash_sale_idfs] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetails]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetails](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[orderid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[status] [int] NULL,
	[flash_saleid] [int] NULL,
 CONSTRAINT [PK__orderdet__3213E83FCD8A9D76] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[createdate] [date] NULL,
	[username] [varchar](255) NULL,
	[status] [bit] NULL,
	[note] [nvarchar](500) NULL,
	[city] [nvarchar](100) NOT NULL,
	[district] [nvarchar](100) NOT NULL,
	[ward] [nvarchar](100) NOT NULL,
	[zipcode] [varchar](6) NULL,
 CONSTRAINT [PK__orders__3213E83F2C5E3B7F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producers]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producers](
	[id] [varchar](255) NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_producers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[available] [bit] NOT NULL,
	[createdate] [date] NOT NULL,
	[desciption] [nvarchar](4000) NULL,
	[image] [varchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[categoryid] [varchar](255) NOT NULL,
	[insurance] [bit] NULL,
	[producerid] [varchar](255) NULL,
	[commentid] [int] NULL,
	[discountid] [varchar](255) NULL,
 CONSTRAINT [PK__products__3213E83F5E417232] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products_favorite_products]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products_favorite_products](
	[product_id] [int] NOT NULL,
	[favorite_products_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report](
	[name] [varbinary](255) NOT NULL,
	[doanhthu] [float] NULL,
	[so_luong] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 12/21/2021 8:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [varchar](255) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[accounts] ([username], [address], [email], [fullname], [gender], [image], [is_edit], [password], [phone], [register_date]) VALUES (N'hoaithuong', N'daklak', N'ht2522001@gmail.com', N'Hoài Thương', 0, N'5b5b66d0.jpg', 0, N'$2a$10$rnT.CyiKf7KA6L9T2//jKuD/Y8TI9jhPD3Zc93N/xjXGa.hAUeurW', N'0945346501', NULL)
INSERT [dbo].[accounts] ([username], [address], [email], [fullname], [gender], [image], [is_edit], [password], [phone], [register_date]) VALUES (N'k3', N'102 nguyen trai', N'nvngon2604@gmail.com', N'van hoang', 1, N'ce121fdf.jpg', 0, N'$2a$10$GhQhcLxPFGZmRsBiFNnhgOhZ4crBxSUG5tViLgq4epIXZ315NBhuy', N'0769337836', NULL)
INSERT [dbo].[accounts] ([username], [address], [email], [fullname], [gender], [image], [is_edit], [password], [phone], [register_date]) VALUES (N'k5', N'hoang dieu', N'hoang@gmail.com', N'trinh hoang', 1, N'68f6b380.jpg', 0, N'$2a$10$eUN2W1JE8htAwoq15MWXw.8.qJHbsbWTfrFPslmzG8P.x2LLaPkx6', N'0943620196', NULL)
INSERT [dbo].[accounts] ([username], [address], [email], [fullname], [gender], [image], [is_edit], [password], [phone], [register_date]) VALUES (N'ngonnv', N'26 Ha noi', N'webcnp01@gmail.com', N'Nguyễn Văn Ngôn', 1, N'723c90c3.jpg', 0, N'$2a$10$Msmcpw0XS1aIyQI9eMSFVO3ErfwEQ9cXpx5k/imtowxPh28aiCWd2', N'0943620196', NULL)
INSERT [dbo].[accounts] ([username], [address], [email], [fullname], [gender], [image], [is_edit], [password], [phone], [register_date]) VALUES (N'nvngon', N'da nang', N'ngon@gmail.com', N'Văn Ngôn', 1, N'5ad7481d.jpg', NULL, N'$2a$10$2Y3wRxnr2AL07Z6Bekm3zeEoQc2m9nVNZQXfrjOA09lcpqsSAT5s6', N'0123456789', CAST(N'2021-09-09' AS Date))
INSERT [dbo].[accounts] ([username], [address], [email], [fullname], [gender], [image], [is_edit], [password], [phone], [register_date]) VALUES (N'Yuki', N'Tân Tiến, KrongPak, Daklak', N'thuongbthpd03828@fpt.edu.vn', N'mèo mèo', 1, N'c4dfafdd.jpg', 0, N'$2a$10$FnU9tg44gQMgRxt9V6IYO.6yaYNQCHrI7StledJq4y0LJHYQv2SVi', N'0945346501', NULL)
GO
SET IDENTITY_INSERT [dbo].[authorities] ON 

INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (1042, N'hoaithuong', N'CUST')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (30, N'hoaithuong', N'DIRE')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (20, N'hoaithuong', N'STAF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (21, N'k5', N'CUST')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (1039, N'k5', N'DIRE')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (1038, N'k5', N'STAF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (7, N'ngonnv', N'DIRE')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (6, N'ngonnv', N'STAF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (1, N'nvngon', N'CUST')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (1043, N'Yuki', N'CUST')
SET IDENTITY_INSERT [dbo].[authorities] OFF
GO
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (N'1', N'Ốp Điện Thoại', N'dd4aba9d.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (N'2', N'Tai Nghe', N'd90d624d.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (N'3', N'Sạc Dự Phòng', N'a8e7a6b6.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (N'4', N'Củ Sạc', N'2bb03b45.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (N'5', N'Sạc Bộ', N'cb21e5b4.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (N'6', N'Cáp Sạc', N'82c3d5fe.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (N'7', N'Loa, Mic Bluetooth', N'Loa bluetooth i.value BT117 price 590.jfif')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (N'8', N'Quạt Mini', N'd1a00024.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (N'9', N'Jack Chuyển', N'8391f2fc.png')
GO
INSERT [dbo].[comments] ([id], [username], [productid], [createdate], [com], [is_edit], [flashsaleid]) VALUES (N'1', N'k5', 46, CAST(N'2021-10-17' AS Date), N'Sản phẩm đẹp lắm, triệu like', NULL, NULL)
INSERT [dbo].[comments] ([id], [username], [productid], [createdate], [com], [is_edit], [flashsaleid]) VALUES (N'2', N'hoaithuong', 47, CAST(N'2021-10-16' AS Date), N'Yêu luôn chủ shop có được không', NULL, NULL)
INSERT [dbo].[comments] ([id], [username], [productid], [createdate], [com], [is_edit], [flashsaleid]) VALUES (N'3', N'k5', 49, CAST(N'2021-10-17' AS Date), N'hihi', NULL, NULL)
INSERT [dbo].[comments] ([id], [username], [productid], [createdate], [com], [is_edit], [flashsaleid]) VALUES (N'4', N'k5', 46, CAST(N'2021-10-19' AS Date), N'hihii', NULL, NULL)
INSERT [dbo].[comments] ([id], [username], [productid], [createdate], [com], [is_edit], [flashsaleid]) VALUES (N'5', N'ngonnv', 46, CAST(N'2021-10-20' AS Date), N'đẹp lắm', NULL, NULL)
GO
INSERT [dbo].[discounts] ([id], [name_discount], [create_date], [percents]) VALUES (N'1', N'Không', CAST(N'2021-10-20' AS Date), 0)
INSERT [dbo].[discounts] ([id], [name_discount], [create_date], [percents]) VALUES (N'2', N'Nhân dịp quốc tế phụ nữ', CAST(N'2021-10-20' AS Date), 5)
INSERT [dbo].[discounts] ([id], [name_discount], [create_date], [percents]) VALUES (N'3', N'Nhân dịp Black Friday', CAST(N'2021-10-21' AS Date), 10)
INSERT [dbo].[discounts] ([id], [name_discount], [create_date], [percents]) VALUES (N'4', N'Ngày lễ tình nhân', CAST(N'2021-10-21' AS Date), 15)
INSERT [dbo].[discounts] ([id], [name_discount], [create_date], [percents]) VALUES (N'5', N'Nhân dịp quốc tế thiếu nhi', CAST(N'2021-10-25' AS Date), 5)
INSERT [dbo].[discounts] ([id], [name_discount], [create_date], [percents]) VALUES (N'6', N'Flash Sale 1', CAST(N'2021-11-19' AS Date), 75)
INSERT [dbo].[discounts] ([id], [name_discount], [create_date], [percents]) VALUES (N'7', N'Flash Sale 2', CAST(N'2021-11-20' AS Date), 85)
INSERT [dbo].[discounts] ([id], [name_discount], [create_date], [percents]) VALUES (N'8', N'Flash Sale 3', CAST(N'2021-11-20' AS Date), 90)
GO
SET IDENTITY_INSERT [dbo].[flash_sales] ON 

INSERT [dbo].[flash_sales] ([id], [available], [createdate], [desciption], [image], [insurance], [name], [price], [quantity], [categoryid], [discountid], [producerid]) VALUES (1, 1, CAST(N'2021-11-16' AS Date), N'Rất tốt', N'aa9cdb12.jpg', 1, N'Lightning 1', 2000000, 2, N'6', N'6', N'1')
INSERT [dbo].[flash_sales] ([id], [available], [createdate], [desciption], [image], [insurance], [name], [price], [quantity], [categoryid], [discountid], [producerid]) VALUES (2, 1, CAST(N'2021-11-20' AS Date), N'Rất nên mua để trải nghiệm', N'2c5fae3d.jpg', 1, N'Lightning 2', 2500000, 3, N'6', N'7', N'6')
SET IDENTITY_INSERT [dbo].[flash_sales] OFF
GO
SET IDENTITY_INSERT [dbo].[orderdetails] ON 

INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (43, 113750, 1, 11, 50, 4, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (44, 235520, 2, 12, 49, 4, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (45, 88350, 1, 13, 48, 2, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (46, 839360, 1, 14, 53, 4, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (47, 77600, 1, 15, 47, 1, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (48, 88350, 1, 15, 48, 2, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (49, 235520, 1, 15, 49, 3, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (50, 113750, 1, 15, 50, 4, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (51, 499800, 1, 16, 56, 4, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (52, 77600, 1, 17, 47, 3, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10052, 77600, 1, 1017, 47, 4, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10055, 88350, 1, 1019, 48, 4, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10059, 76000, 1, 1025, 47, 2, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10060, 90250, 2, 1025, 48, 4, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10067, 484500, 1, 1029, 56, NULL, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10068, 76000, 2, 1029, 47, NULL, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10070, 76000, 1, 1030, 47, 4, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10071, 90250, 1, 1030, 48, 4, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10072, 118750, 2, 1030, 50, 4, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10073, 243200, 1, 1030, 49, 4, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10074, 76000, 2, 1031, 47, 1, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10075, 90250, 2, 1031, 48, 2, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10076, 118750, 2, 1031, 50, 3, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10077, 931000, 1, 1031, 53, 4, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10078, 801000, 1, 1031, 54, 1, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10079, 158650, 1, 1031, 52, 4, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10080, 50400, 1, 1032, 64, 1, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (10081, 90250, 1, 1033, 48, 1, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (20082, 931000, 1, 2034, 53, 4, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (20083, 76000, 1, 2035, 47, 2, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (20084, 90250, 3, 2035, 48, 2, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (20085, 118750, 1, 2035, 50, 4, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (30083, 76000, 2, 3035, 47, NULL, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (30084, 90250, 1, 3035, 48, NULL, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (30085, 118750, 1, 3035, 50, NULL, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (30086, 243200, 1, 3035, 49, NULL, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (30087, 243200, 1, 3036, 49, NULL, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (30088, 931000, 1, 3036, 53, NULL, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (30089, 76000, 1, 3036, 47, 1, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (30098, 158650, 1, 3045, 52, 1, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (30099, 76000, 1, 3046, 47, NULL, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (30102, 243200, 1, 3049, 49, 4, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (30103, 118750, 1, 3050, 50, NULL, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (30104, 76000, 1, 3051, 47, 2, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (30105, 76000, 1, 3052, 47, NULL, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (40090, 76000, 1, 4037, 47, 2, NULL)
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [status], [flash_saleid]) VALUES (40091, 158650, 1, 4038, 52, 1, NULL)
SET IDENTITY_INSERT [dbo].[orderdetails] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (11, N'12 nguyen trai', CAST(N'2021-07-15' AS Date), N'ngonnv', NULL, N'giao bu?i chi?u', N'da nang', N'H?i Châu 2', N'H?i Châu 2', N'550000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (12, N'12 nguyen trai', CAST(N'2021-07-15' AS Date), N'ngonnv', NULL, N'okay', N'da nang', N'H?i Châu 2', N'H?i Châu 2', N'550000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (13, N'137 nguyen thi thap', CAST(N'2021-06-15' AS Date), N'ngonnv', NULL, N'oki', N'da nang', N'H?i Châu 2', N'H?i Châu 2', N'550000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (14, N'137 nguyen thi thap', CAST(N'2021-08-15' AS Date), N'ngonnv', NULL, N'oke', N'Tháng 4', N'H?i Châu 2', N'H?i Châu 2', N'550000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (15, N'137 nguyen thi thap', CAST(N'2021-06-15' AS Date), N'k3', NULL, N'Giao bu?i chi?u', N'da nang', N'H?i Châu 2', N'H?i Châu 2', N'550000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (16, N'137 nguyen thi thap', CAST(N'2021-09-16' AS Date), N'ngonnv', NULL, N'cút', N'da nang', N'Hải Châu 2', N'Hải Châu 2', N'650000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (17, N'Tân Tiến, KrongPak, Daklak', CAST(N'2021-09-17' AS Date), N'hoaithuong', NULL, N'a', N'Đắk Lắk', N'Krong păk', N'Tân Tiến', N'630000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (1017, N'Tân Tiến, KrongPak, Daklak', CAST(N'2021-06-17' AS Date), N'hoaithuong', NULL, N'hi', N'Đắk Lắk', N'Krong păk', N'Tân Tiến', N'630000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (1019, N'Tân Tiến, KrongPak, Daklak', CAST(N'2021-09-17' AS Date), N'hoaithuong', NULL, N'Giao giờ hành chính', N'Đắk Lắk', N'Krong păk', N'Tân Tiến', N'630000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (1020, N'', CAST(N'2021-10-18' AS Date), N'ngonnv', NULL, N'', N'', N'', N'', N'')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (1021, N'137 nguyen thi thap', CAST(N'2021-09-18' AS Date), N'ngonnv', NULL, N'okay', N'da nang', N'Hải Châu 2', N'Hải Châu 2', N'550000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (1022, N'Tân Tiến, KrongPak, Daklak', CAST(N'2021-10-21' AS Date), N'hoaithuong', NULL, N'Giao giờ hành chính', N'Đắk Lắk', N'Krong păk', N'Tân Tiến', N'630000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (1023, N'Tân Tiến, KrongPak, Daklak', CAST(N'2021-10-21' AS Date), N'hoaithuong', NULL, N'a', N'Đắk Lắk', N'Krong păk', N'Tân Tiến', N'630000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (1024, N'Tân Tiến, KrongPak, Daklak', CAST(N'2021-10-21' AS Date), N'hoaithuong', NULL, N'k', N'Đắk Lắk', N'Krong păk', N'Tân Tiến', N'630000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (1025, N'Tân Tiến, KrongPak, Daklak', CAST(N'2021-11-21' AS Date), N'hoaithuong', NULL, N'sa', N'Đắk Lắk', N'Krong păk', N'Tân Tiến', N'630000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (1026, N'137 nguyen thi thap', CAST(N'2021-07-29' AS Date), N'ngonnv', NULL, N'nhanh nha', N'da nang', N'Hải Châu 2', N'Hải Châu 2', N'650000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (1027, N'12 nguyen trai', CAST(N'2021-07-29' AS Date), N'ngonnv', NULL, N'', N'da nang', N'Hải Châu 2', N'Hải Châu 2', N'550000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (1028, N'137 nguyen thi thap', CAST(N'2021-06-29' AS Date), N'ngonnv', NULL, N'', N'Tháng 4', N'Hải Châu 2', N'Hải Châu 2', N'550000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (1029, N'', CAST(N'2021-08-30' AS Date), N'ngonnv', NULL, N'', N'', N'', N'', N'')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (1030, N'Tân Tiến, KrongPak, Daklak', CAST(N'2021-12-15' AS Date), N'hoaithuong', NULL, N'hi', N'Đắk Lắk', N'Krong păk', N'Đắk Lắk', N'630000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (1031, N'Tân Tiến, KrongPak, Daklak', CAST(N'2021-11-16' AS Date), N'hoaithuong', NULL, N'Giao giờ hành chính', N'Đắk Lắk', N'Krong păk', N'Đắk Lắk', N'630000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (1032, N'137 nguyen thi thap', CAST(N'2021-11-17' AS Date), N'ngonnv', NULL, N'okay', N'da nang', N'', N'', NULL)
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (1033, N'137 nguyen thi thap, f', CAST(N'2021-11-19' AS Date), N'ngonnv', NULL, N'giao buoi sang nha', N'da nang', N'', N'', N'550000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (1034, N'137 nguyen thi thap, f', CAST(N'2021-11-20' AS Date), N'ngonnv', NULL, N'giao gio hanh chinh', N'da nang', N'', N'', N'550000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (2034, N'12 nguyen trai', CAST(N'2021-11-23' AS Date), N'ngonnv', NULL, N'', N'da nang', N'', N'', NULL)
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (2035, N'Tân Tiến, KrongPak, Daklak', CAST(N'2021-11-26' AS Date), N'Yuki', NULL, N'Giao giờ hành chính', N'Đắk Lắk', N'Krong păk', N'Tân Tiến', N'630000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3035, N'Tân Tiến, KrongPak, Daklak', CAST(N'2021-11-30' AS Date), N'hoaithuong', NULL, N'', N'', N'', N'', N'630000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3036, N'Tân Tiến, KrongPak, Daklak', CAST(N'2021-12-07' AS Date), N'hoaithuong', NULL, N'Giao giờ hành chính', N'Đắk Lắk', N'Krong păk', N'Tân Tiến', N'630000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3037, N'', CAST(N'2021-12-19' AS Date), N'ngonnv', NULL, N'', N'', N'', N'', N'')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3038, N'', CAST(N'2021-12-19' AS Date), N'ngonnv', NULL, N'', N'', N'', N'', N'')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3039, N'', CAST(N'2021-12-19' AS Date), N'ngonnv', NULL, N'', N'', N'', N'', N'')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3040, N'', CAST(N'2021-12-19' AS Date), N'ngonnv', NULL, N'', N'', N'', N'', N'')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3041, N'', CAST(N'2021-12-19' AS Date), N'ngonnv', NULL, N'', N'', N'', N'', N'')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3042, N'', CAST(N'2021-12-19' AS Date), N'ngonnv', NULL, N'', N'', N'', N'', N'')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3043, N'', CAST(N'2021-12-19' AS Date), N'ngonnv', NULL, N'', N'', N'', N'', N'')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3044, N'', CAST(N'2021-12-19' AS Date), N'ngonnv', NULL, N'', N'', N'', N'', N'')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3045, N'', CAST(N'2021-12-19' AS Date), N'ngonnv', NULL, N'', N'', N'', N'', N'')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3046, N'12 Hà Nam', CAST(N'2021-12-20' AS Date), N'ngonnv', NULL, N'', N'', N'', N'', N'')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3047, N'', CAST(N'2021-12-20' AS Date), N'ngonnv', NULL, N'', N'', N'', N'', N'')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3048, N'', CAST(N'2021-12-20' AS Date), N'ngonnv', NULL, N'', N'', N'', N'', N'')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3049, N'12 Hà Nam', CAST(N'2021-12-20' AS Date), N'ngonnv', NULL, N'', N'', N'', N'', N'')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3050, N'137 nguyen thi thap', CAST(N'2021-12-20' AS Date), N'ngonnv', NULL, N'', N'Tháng 4', N'', N'', N'550000')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3051, N'121231233312313', CAST(N'2021-12-20' AS Date), N'ngonnv', NULL, N'', N'da nang', N'', N'', NULL)
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (3052, N'121231233312313', CAST(N'2021-12-20' AS Date), N'ngonnv', NULL, N'', N'da nang', N'', N'', NULL)
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (4037, N'12 Hà Nam', CAST(N'2021-12-21' AS Date), N'ngonnv', NULL, N'', N'', N'', N'', N'')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [status], [note], [city], [district], [ward], [zipcode]) VALUES (4038, N'12 Hà Nam', CAST(N'2021-12-21' AS Date), N'ngonnv', NULL, N'', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
INSERT [dbo].[producers] ([id], [name]) VALUES (N'1', N'Samsung')
INSERT [dbo].[producers] ([id], [name]) VALUES (N'2', N'Nokia')
INSERT [dbo].[producers] ([id], [name]) VALUES (N'3', N'Apple')
INSERT [dbo].[producers] ([id], [name]) VALUES (N'4', N'Black Berry')
INSERT [dbo].[producers] ([id], [name]) VALUES (N'5', N'HOCO')
INSERT [dbo].[producers] ([id], [name]) VALUES (N'6', N'Anker')
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (46, 0, CAST(N'2021-10-09' AS Date), N'Củ sạc nhanh Anker Powerport PD 2+ 35W (USA) A2636 sạc siêu nhanh iPhone, Mac
+ Phiên bản nâng cấp mới nhất với cổng PD nâng lên 20W (bản cũ 18W) - sạc nhanh chuẩn cho iPhone 12 và tổng công suất được nâng lên 35W (bản cũ 33W)
Dòng Sạc số 1 tại Mỹ, bán chạy nhất tại Amazon về pin, sạc. Hơn 20 triệu người tin dùng các sản phẩm Anker
Những điểm nổi bật riêng biệt:
+ Hỗ trợ chuẩn sạc nhanh PD (Power Delivery) thời thượng, sạc được cho tất cả các thiết bị
+ Sạc siêu nhanh cho iPhone: iPhone 8, iPhone X, iPhone 11 Series, iPhone 12 Series... trở về sau (VÔ CÙNG HOT). Các siêu phẩm Samsung, Huawei, LG...hỗ trợ cổng PD
+ Sạc nhanh cho iPhone 7 trở về trước (Không phải Power Delivery)
+ Sạc luôn được cả cho Macbook
+ 2 cổng sạc với công suất cực mạnh: 35W (1 cổng PD, 1 cổng IQ2)', N'42a7e1ce.jpg', N'Adapter Sạc nhanh 1 cổng UMETRAVEL', 100000, 20, N'4', 1, N'1', 1, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (47, 1, CAST(N'2021-10-09' AS Date), N'Củ sạc nhanh Anker Powerport PD 2+ 35W (USA) A2636 sạc siêu nhanh iPhone, Mac
+ Phiên bản nâng cấp mới nhất với cổng PD nâng lên 20W (bản cũ 18W) - sạc nhanh chuẩn cho iPhone 12 và tổng công suất được nâng lên 35W (bản cũ 33W)
Dòng Sạc số 1 tại Mỹ, bán chạy nhất tại Amazon về pin, sạc. Hơn 20 triệu người tin dùng các sản phẩm Anker
Những điểm nổi bật riêng biệt:
+ Hỗ trợ chuẩn sạc nhanh PD (Power Delivery) thời thượng, sạc được cho tất cả các thiết bị
+ Sạc siêu nhanh cho iPhone: iPhone 8, iPhone X, iPhone 11 Series, iPhone 12 Series... trở về sau (VÔ CÙNG HOT). Các siêu phẩm Samsung, Huawei, LG...hỗ trợ cổng PD
+ Sạc nhanh cho iPhone 7 trở về trước (Không phải Power Delivery)
+ Sạc luôn được cả cho Macbook
+ 2 cổng sạc với công suất cực mạnh: 35W (1 cổng PD, 1 cổng IQ2)', N'65c0969.jpg', N'Adapter Sạc nhanh 2 cổng UmeTravel A4', 80000, 10, N'4', 1, N'2', 2, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (48, 1, CAST(N'2021-10-09' AS Date), N'Củ sạc nhanh Anker Powerport PD 2+ 35W (USA) A2636 sạc siêu nhanh iPhone, Mac
+ Phiên bản nâng cấp mới nhất với cổng PD nâng lên 20W (bản cũ 18W) - sạc nhanh chuẩn cho iPhone 12 và tổng công suất được nâng lên 35W (bản cũ 33W)
Dòng Sạc số 1 tại Mỹ, bán chạy nhất tại Amazon về pin, sạc. Hơn 20 triệu người tin dùng các sản phẩm Anker
Những điểm nổi bật riêng biệt:
+ Hỗ trợ chuẩn sạc nhanh PD (Power Delivery) thời thượng, sạc được cho tất cả các thiết bị
+ Sạc siêu nhanh cho iPhone: iPhone 8, iPhone X, iPhone 11 Series, iPhone 12 Series... trở về sau (VÔ CÙNG HOT). Các siêu phẩm Samsung, Huawei, LG...hỗ trợ cổng PD
+ Sạc nhanh cho iPhone 7 trở về trước (Không phải Power Delivery)
+ Sạc luôn được cả cho Macbook
+ 2 cổng sạc với công suất cực mạnh: 35W (1 cổng PD, 1 cổng IQ2)', N'334c305d.jpg', N'Adapter Sạc nhanh 20W III Anker', 95000, 15, N'4', 1, N'3', NULL, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (49, 1, CAST(N'2021-10-09' AS Date), N'- Dung lượng: 5.000mah
- Sạc dự phòng mini 5S - Pace - Hàng do Việt Nam sản xuất và phân phối trên thị trường Việt Nam
- Thiết kế nhỏ gọn với ngoại hình hình hộp chữ nhật.
- Xung quanh các cạnh viền đều được bo cong mềm mại, tạo nên vẻ sang trọng không bị thô cứng giúp người dùng cầm nằm thoải mái, chắc chắn và không đau tay.
- Có đèn báo dung lượng pin. 4 đèn tương ứng mức pin 25 % - 50% -75% - 100% pin
- 2 cổng Input cực kỳ tiện lợi thông dụng nhất hiên nay là Type-C, và Micro.
- Chip thông minh được trang bị bên trong cũng giúp ngăn ngừa những tai nạn sạc xảy ra như: bảo vệ quá dòng, bảo vệ ngắn mạch, bảo vệ quá áp, bảo vệ quá tải và bảo vệ theo chu kỳ.
- Đầu vào: Micro-USB: 5V-1A. Type-C: 5V / 2.1A
- Đầu ra: USB 1: 5V-1.5A', N'4b6c3f22.jpg', N'Pin sạc dự phòng 20000mAh 3 Pro', 256000, 5, N'3', 0, N'1', NULL, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (50, 1, CAST(N'2021-10-09' AS Date), N'– Thiết kế nhỏ gọn ,trọng lượng nhẹ.
– Sử dụng lõi pin với công nghệ pin Li-ion: giúp sạc nhanh và cho hiệu suất cao
– Sạc đc 3 lần iphone 5.
– Sản phẩm tích hợp 2 đầu cổng sạc USB; có thể cùng lúc sạc cho hai thiết bị.
– Với thiết kế mạch bảo vệ giúp: ngăn chặn việc sạc quá tải & xả pin quá mức,giúp cho pin ko bị nóng & kéo dài tuổi thọ.
– Địa chỉ: 14 Đào Duy Anh, sau lưng bệnh viện Hoàn Mỹ (lên tầng 2).', N'2bb03b45.jpg', N'Pin sạc dự phòng Li-polymer 10000 mAh', 125000, 9, N'3', 0, N'2', NULL, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (51, 0, CAST(N'2021-10-09' AS Date), N'✪ Dung lượng: 10.000mah
✪ Thiết kế nhỏ gọn với ngoại hình hình hộp chữ nhật.
✪ Xung quanh các cạnh viền đều được bo cong mềm mại, tạo nên vẻ sang trọng không bị thô cứng giúp người dùng cầm nằm thoải mái, chắc chắn và không đau tay.
✪ Hoco J72A được cấu tạo bằng 3 chất liệu ABS + PC + hợp kim nhôm cho độ bóng đẹp bắt mắt và độ bền bỉ chắc chắn khi dùng lâu dài.
✪ 2 cổng Input cực kỳ tiện lợi thông dụng nhất hiên nay là Type-C, và Micro.
✪ Chip thông minh được trang bị bên trong cũng giúp ngăn ngừa những tai nạn sạc xảy ra như: bảo vệ quá dòng, bảo vệ ngắn mạch, bảo vệ quá áp, bảo vệ quá tải và bảo vệ theo chu kỳ.
✪ Có màn hình báo dung lượng pin.
✪ Đầu vào: Micro-USB: 5V-2A. Type-C: 5V / 2A
✪ Đầu ra: USB: 5V-2A', N'5dfbadb5.jpg', N'Pin sạc dự phòng Quick 10000 mAh', 300000, 20, N'3', 0, N'3', NULL, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (52, 1, CAST(N'2021-10-09' AS Date), N'✪ Dung lượng: 10.000mah
✪ Sử dụng lõi pin: Polymer cao cấp.
✪ Kích thước nhỏ gọn, dễ dàng mang theo.
✪ Xung quanh các cạnh viền đều được bo cong mềm mại, tạo nên vẻ sang trọng không bị thô cứng giúp người dùng cầm nằm thoải mái, chắc chắn và không đau tay.
✪ Arun mini 3 được cấu tạo bằng chất liệu ABS + PC cho độ bền bỉ chắc chắn khi dùng lâu dài.
✪ 2 cổng Input cực kỳ tiện lợi thông dụng nhất hiên nay là Type-C, và Micro.
✪ Chip thông minh được trang bị bên trong cũng giúp ngăn ngừa những tai nạn sạc xảy ra như: bảo vệ quá dòng, bảo vệ ngắn mạch, bảo vệ quá áp, bảo vệ quá tải và bảo vệ theo chu kỳ.
✪ Đầu vào: 5V-2A.
✪ Đầu ra: 5V-2.4A', N'a7e504b8.jpg', N'Pin sạc dự phòng Wireless', 167000, 15, N'3', 0, N'1', NULL, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (53, 1, CAST(N'2021-10-09' AS Date), N'TÍNH NĂNG CHÍNH:
● Chất liệu: ABS
● Phiên bản Bluetooth: 5.0
● Dung lượng pin: 800mAh
● Thời gian chờ: Khoảng 120 giờ
● Thời gian sạc: Khoảng 1 giờ
● Thời gian nghe: 5 giờ
● Màn hình LED hiển thị nguồn cho bạn biết rõ lượng pin.
● Bluetooth 5.0, kết nối ổn định và nhanh chóng.
● Tự động kết nối với điện thoại của bạn khi lấy chúng ra khỏi hộp sạc.
● Thiết kế móc tai bằng silicon, không gây đau dù đeo trong thời gian dài.
● Chống thấm nước đời IPX5, không lo mồ hôi khi vận động.
Vật liệu: ABS, Silicone
Tương thích chủ yếu với: Blackberry, HTC, iPad, iPhone, LG, Motorola, Nokia, SAMSUNG, Sony Ericsson
Chức năng: Nhắc bằng giọng nói tiếng Anh, Trả lời cuộc gọi, Chuyển bài hát, Tăng giảm âm thanh, Hỗ trợ nhạc
Phiên bản Bluetooth: V5.0
Giao thức Bluetooth: A2DP, AVRCP, HFP, HSP
Phạm vi truyền: 10 mét
Chế độ Bluetooth: Rảnh tay, Tai nghe
Dung lượng pin (mAh): Tai nghe 80mAh; thùng sạc 800mAh
Thời gian sạc: Tai nghe 1 giờ, kho sạc 4 giờ
Thời gian đàm thoại: Tai nghe 5 giờ, hộp sạc pin: 30 giờ
Âm thanh: Âm thanh nổi
Bộ đóng gói: 2 x Tai nghe, 1 x Hộp sạc, 1 x Cáp sạc, 2 x Cặp tai nghe, 1 x Hướng dẫn sử dụng tiếng Anh', N'd90d624d.jpg', N'Tai nghe Mi True Basic 2', 980000, 12, N'2', 1, N'2', NULL, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (54, 1, CAST(N'2021-10-09' AS Date), N'TÍNH NĂNG CHÍNH:
● Chất liệu: ABS
● Phiên bản Bluetooth: 5.0
● Dung lượng pin: 800mAh
● Thời gian chờ: Khoảng 120 giờ
● Thời gian sạc: Khoảng 1 giờ
● Thời gian nghe: 5 giờ
● Màn hình LED hiển thị nguồn cho bạn biết rõ lượng pin.
● Bluetooth 5.0, kết nối ổn định và nhanh chóng.
● Tự động kết nối với điện thoại của bạn khi lấy chúng ra khỏi hộp sạc.
● Thiết kế móc tai bằng silicon, không gây đau dù đeo trong thời gian dài.
● Chống thấm nước đời IPX5, không lo mồ hôi khi vận động.
Vật liệu: ABS, Silicone
Tương thích chủ yếu với: Blackberry, HTC, iPad, iPhone, LG, Motorola, Nokia, SAMSUNG, Sony Ericsson
Chức năng: Nhắc bằng giọng nói tiếng Anh, Trả lời cuộc gọi, Chuyển bài hát, Tăng giảm âm thanh, Hỗ trợ nhạc
Phiên bản Bluetooth: V5.0
Giao thức Bluetooth: A2DP, AVRCP, HFP, HSP
Phạm vi truyền: 10 mét
Chế độ Bluetooth: Rảnh tay, Tai nghe
Dung lượng pin (mAh): Tai nghe 80mAh; thùng sạc 800mAh
Thời gian sạc: Tai nghe 1 giờ, kho sạc 4 giờ
Thời gian đàm thoại: Tai nghe 5 giờ, hộp sạc pin: 30 giờ
Âm thanh: Âm thanh nổi
Bộ đóng gói: 2 x Tai nghe, 1 x Hộp sạc, 1 x Cáp sạc, 2 x Cặp tai nghe, 1 x Hướng dẫn sử dụng tiếng Anh', N'ed293d7c.png', N'Tai nghe Mi True Wireless 2', 890000, 10, N'2', 0, N'3', NULL, N'3')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (55, 0, CAST(N'2021-10-09' AS Date), N'Tai nghe Bluetooth FE018 có thiết kế gọn gàng hơn nhiều so với các tai nghe cắm jack truyền thống với trọng lượng chỉ 60g
Chất liệu nhựa bóng cao cấp không bám bẩn với màu thanh lịch phù hợp với mọi đối tượng. - Thiết bị sử dụng sử dụng chuẩn kết nối bluetooth 4.1
Tai nghe bluetooth FE 018 kiểu dáng dành riêng cho giới trẻ âm thanh trung thực bass-tresb,hiệu quả hỗ trợ cho cuộc sống năng động
Kết nối điện thoại máy tính bảng nhanh chóng dễ dàng,EXTRBASS cho âm thanh nặng lẽ và sâu lắng,âm thanh chất lượng cao với công nghệ không dây bluetooth
Công nghệ chống ồn kỹ thuật số tối ưu hóa các thiết lập âm thanh của bạn vói điện thoại, ứng dụng Headphones Connect. - Thời gian sử dụng pin cực lâu.
•	Tai nghe bluetooth chụp taiFE018ra đời với thiết kế dáng thể thao cựchoàn hảo. Chắc chắn khi sở hữu chiếc tai nghe này bạn sẽ thế hài lòng về hiệu quả mà nó mang lại. Âm thanh hoàn hảo, thiết kế tinh tế, nhỏ gọn và dễ sử dụng. Bạn không không lo dây bị quấn, không lo dây tai nghe bị đứt. - Tai nghe Bluetooth sportsSuperbass FE018 có thiết kế gọn gàng hơn nhiều so với các tai nghe cắm jack truyền thống với trọng lượng chỉ 60g, thuận tiện mang theo và thoải mái khi sử dụng. - Chất liệu nhựa bóng cao cấp không bám bẩn với màu thanh lịch phù hợp với mọi đối tượng. - Thiết bị sử dụng sử dụng chuẩn kết nối bluetooth 4.1 
•	Với viên pin dung lượng 300mAh, tai nghe Bluetooth FE-018 đem đến cho bạn thời lượng pin sử dụng lên đến 5 giờ liên tục chỉ trong 1 lần sạc. Vì thế, bạn có thể thoải mái sử dụng tai nghe để nghe nhạc mà không lo hết pin giữa chừng.
•	Bộ điều khiển đa phương tiện của FE-018 được đặt nằm ngay trên earcup, giúp bạn thuận tiện điều chỉnh âm thanh hay trả lời cuộc gọi mà không cần thao tác đến thiết bị phát nhạc.
Chất lượng tuyệt vời
Chất liệu nhựa bóng cao cấp không bám bẩn với màu trắng thanh lịch phù hợp với mọi đối tượng .
Âm thanh hoàn hảo, thiết kế tinh tế, nhỏ gọn và dễ sử dụng. Bạn không không lo dây nhùng nhằng, không lo dây tai nghe bị đứt. Ngoài ra tai nghe thiết kế thông minh có thể sạc trực tiếp qua cổng sạc thông rụng Microusb. Khi bạn muốn kết nối với máy tính hay là các thiết bị không hỗ trợ bluetooth, bạn có thể sử dụng cổng Line cắm trực tiếp jack 3.5 mm. Vậy có thể nói thiết bị được thiết kế thông minh giao tiếp với tất cả các thiết bị hỗ trợ âm thanh.
Thông số kỹ thuật
•	Bluetooth 5.0 + EDR
•	Tai nghe stereo Bluetooth, A2DP, AVRCP;
•	Đầu ra khuếch đại công suất: RMS 2x18MW (THD = 10%)
•	Các tín hiệu khuếch đại công suất để tỷ lệ tiếng ồn: ≥90dB
•	Điện áp đầu vào: 3.7V pin lithium có thể sạc lại
•	Thời gian chơi: 2-5 giờ
•	Thời gian đàm thoại: 2-5 giờ
•	Thời gian sạc: 1.5 giờ
•	Sạc điện áp đầu vào: DC 4.2 5.5V
•	Loa kỹ thuật: 2x16Ω 20MW Φ10mm
•	Dải tần số: 20Hz-20KHz
•	Độ nhạy: ≥100db ± 2dB
•	SNR: ≥80Db truyền / nhận tần số: 2.4 --- 2.48GHz
•	Khỏang cách: Khả năng tiếp cận 10', N'1be01bb0.jpg', N'Tai nghe Mi True Wireless 2', 345000, 12, N'2', 0, N'1', NULL, N'3')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (56, 1, CAST(N'2021-10-10' AS Date), N'Series ốp lưng gọn và nhẹ của Spigen dành cho iPhone 13 Pro Max được sản xuất tại Hàn Quốc với chất lượng tuyệt hảo. Sản phẩm bán rất chạy tại Lê Sang cho các dòng máy iPhone. Phiên bản Pro thiết kế lại để mang đến 1 sản phẩm còn tốt hơn.
Sản phẩm chính hãng Spigen (Mỹ) thương hiệu với những chiếc ốp lưng smartphone tốt nhất trên thế giới. Sản phẩm được các diễn đàn công nghệ và người tiêu dùng đánh giá rất cao về chất lượng. Sản phẩm được sản xuất tại Hàn Quốc với tiêu chuẩn chất lượng cao nhất.
Phiên bản Thin Fit Pro nâng cấp khả năng bảo vệ với việc bổ sung 1 khung viền cao su TPU và tích hợp công nghệ chống sốc AirCushion. Giờ đây chiếc ốp đã được tăng cường khả năng bảo vệ mà vẫn giữ được vẻ mỏng gọn vốn có (chỉ dầy hơn phiên bản cũ 1 chút).
Bảo vệ toàn diện mặt lưng + 4 góc cạnh của máy. Công nghệ chống sốc đệm khí Air Cushion độc quyền, thành quả 10 năm nghiên cứu của Spigen. 
Ốp iPhone 13 Pro Max Spigen Thin Fit được thiết kế chính xác và vừa vặn với thân máy, từng vị trí phím bấm, camera được cắt 1 cách chuẩn xác nhất và thẩm mỹ nhất.
Thiết kế đặc biệt với 2 chất liệu, phần viền được làm từ cao su TPU chống sốc, mặt lưng làm từ nhựa PC cứng cáp và chắc chắn. 
Lớp phủ SF và thiết kế nhám nhẹ của ốp sẽ giúp bạn chống lại việc bám vân tay, mồ hôi, chống lại bám bẩn, tăng cường khả năng chống xước và cho cảm giác cầm đỡ bị trơn.
Viền gờ cao bảo vệ màn hình và Camera khỏi trầy xuớc .', N'dd4aba9d.jpg', N'op-lung-iphone-13-pro-max', 510000, 30, N'1', 1, N'2', NULL, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (57, 1, CAST(N'2021-10-10' AS Date), N'Series ốp lưng gọn và nhẹ của Spigen dành cho iPhone 13 Pro Max được sản xuất tại Hàn Quốc với chất lượng tuyệt hảo. Sản phẩm bán rất chạy tại Lê Sang cho các dòng máy iPhone. Phiên bản Pro thiết kế lại để mang đến 1 sản phẩm còn tốt hơn.
Sản phẩm chính hãng Spigen (Mỹ) thương hiệu với những chiếc ốp lưng smartphone tốt nhất trên thế giới. Sản phẩm được các diễn đàn công nghệ và người tiêu dùng đánh giá rất cao về chất lượng. Sản phẩm được sản xuất tại Hàn Quốc với tiêu chuẩn chất lượng cao nhất.
Phiên bản Thin Fit Pro nâng cấp khả năng bảo vệ với việc bổ sung 1 khung viền cao su TPU và tích hợp công nghệ chống sốc AirCushion. Giờ đây chiếc ốp đã được tăng cường khả năng bảo vệ mà vẫn giữ được vẻ mỏng gọn vốn có (chỉ dầy hơn phiên bản cũ 1 chút).
Bảo vệ toàn diện mặt lưng + 4 góc cạnh của máy. Công nghệ chống sốc đệm khí Air Cushion độc quyền, thành quả 10 năm nghiên cứu của Spigen. 
Ốp iPhone 13 Pro Max Spigen Thin Fit được thiết kế chính xác và vừa vặn với thân máy, từng vị trí phím bấm, camera được cắt 1 cách chuẩn xác nhất và thẩm mỹ nhất.
Thiết kế đặc biệt với 2 chất liệu, phần viền được làm từ cao su TPU chống sốc, mặt lưng làm từ nhựa PC cứng cáp và chắc chắn. 
Lớp phủ SF và thiết kế nhám nhẹ của ốp sẽ giúp bạn chống lại việc bám vân tay, mồ hôi, chống lại bám bẩn, tăng cường khả năng chống xước và cho cảm giác cầm đỡ bị trơn.
Viền gờ cao bảo vệ màn hình và Camera khỏi trầy xuớc .', N'8ae28ac9.jpg', N'op-lung-iphone-13-pro-max', 560000, 40, N'1', 1, N'3', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (59, 1, CAST(N'2021-10-10' AS Date), N'Series ốp lưng gọn và nhẹ của Spigen dành cho iPhone 13 Pro Max được sản xuất tại Hàn Quốc với chất lượng tuyệt hảo. Sản phẩm bán rất chạy tại Lê Sang cho các dòng máy iPhone. Phiên bản Pro thiết kế lại để mang đến 1 sản phẩm còn tốt hơn.
Sản phẩm chính hãng Spigen (Mỹ) thương hiệu với những chiếc ốp lưng smartphone tốt nhất trên thế giới. Sản phẩm được các diễn đàn công nghệ và người tiêu dùng đánh giá rất cao về chất lượng. Sản phẩm được sản xuất tại Hàn Quốc với tiêu chuẩn chất lượng cao nhất.
Phiên bản Thin Fit Pro nâng cấp khả năng bảo vệ với việc bổ sung 1 khung viền cao su TPU và tích hợp công nghệ chống sốc AirCushion. Giờ đây chiếc ốp đã được tăng cường khả năng bảo vệ mà vẫn giữ được vẻ mỏng gọn vốn có (chỉ dầy hơn phiên bản cũ 1 chút).
Bảo vệ toàn diện mặt lưng + 4 góc cạnh của máy. Công nghệ chống sốc đệm khí Air Cushion độc quyền, thành quả 10 năm nghiên cứu của Spigen. 
Ốp iPhone 13 Pro Max Spigen Thin Fit được thiết kế chính xác và vừa vặn với thân máy, từng vị trí phím bấm, camera được cắt 1 cách chuẩn xác nhất và thẩm mỹ nhất.
Thiết kế đặc biệt với 2 chất liệu, phần viền được làm từ cao su TPU chống sốc, mặt lưng làm từ nhựa PC cứng cáp và chắc chắn. 
Lớp phủ SF và thiết kế nhám nhẹ của ốp sẽ giúp bạn chống lại việc bám vân tay, mồ hôi, chống lại bám bẩn, tăng cường khả năng chống xước và cho cảm giác cầm đỡ bị trơn.
Viền gờ cao bảo vệ màn hình và Camera khỏi trầy xuớc .', N'c6721edd.jpg', N'op-lung-iphone-13-pro-max', 320000, 20, N'1', 1, N'1', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (60, 1, CAST(N'2021-10-10' AS Date), N'Để sạc nhanh các bạn cần củ sạc có cổng sạc Power Delivery chuyên dụng (Củ sạc theo máy từ iPhone Xs Max trở về trước không sạc nhanh).
Các dòng iPhone từ iPhone 7 Plus trở xuống không cần mua cáp này vì máy không có sạc nhanh.
Dây cáp sạc iPhone Anker Powerline+ II USB C to Lightning dài 1.8m hỗ trợ sạc siêu nhanh Power Delivery
Dây cáp sạc cho iPhone bền nhất thế giới với lõi Kevlar (nguyên liệu làm áo chống đạn) - Chứng nhận MFI từ chính Apple.
Dây cáp này hỗ trợ sạc nhanh cho iPhone 8, iPhone 8 Plus, iPhone X, XS, Xs Max, iPhone 11 Series...và các bản về sau qua cổng sạc nhanh chuyên dụng Power Delivery (Dây sạc theo máy không hỗ trợ sạc nhanh).
1 đầu Lighting, 1 đầu USB-C để cắm vào cổng Power Delivery (PD) trên củ sạc.
Vỏ bọc sợi Nylon được thiết kế lại, tăng cường độ bền chắc.
Lõi và đầu nối được gia cố thêm, TĂNG CƯỜNG ĐỘ BỀN HƠN 30 LẦN.
PowerLine: Phiên bản phổ thông của Anker, có lõi Kevlar siêu bền. 
PowerLine+: Phiên bản nâng cấp, có lỗi Kevlar và bổ sung thêm 1 lớp nilon gia cố, chống rối.
Anker là thương hiệu nổi tiếng tại Mỹ về phụ kiện điện thoại đặc biệt là Pin, Sạc, Cáp. Hiện tại Anker là thương hiệu số 1 về Pin, Sạc trên Amazon, theo thống kê Anker chiếm đến 35% thị phần, có nghĩa là cứ 3 phụ kiện pin, cáp, sạc được bán ra thì trong đó có 1 là của Anker. 
Và chỉ tính riêng tại thị trường Mỹ đã có hơn 20 Triệu khách hàng hài lòng với các sản phẩm của Anker. Một minh chứng rõ nét và hùng hồn về chất lượng của các sản phẩm.
Lõi cáp được gia cố bằng sợi Kevlar siêu bền cho độ bền tuyệt đối. Độ bền gấp khoảng 30 lần cáp thông thường.', N'1619ae4b.jpg', N'Adapter Sạc nhanh 1 cổng', 520000, 20, N'6', 1, N'2', NULL, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (61, 1, CAST(N'2021-10-10' AS Date), N'Để sạc nhanh các bạn cần củ sạc có cổng sạc Power Delivery chuyên dụng (Củ sạc theo máy từ iPhone Xs Max trở về trước không sạc nhanh).
Các dòng iPhone từ iPhone 7 Plus trở xuống không cần mua cáp này vì máy không có sạc nhanh.
Dây cáp sạc iPhone Anker Powerline+ II USB C to Lightning dài 1.8m hỗ trợ sạc siêu nhanh Power Delivery
Dây cáp sạc cho iPhone bền nhất thế giới với lõi Kevlar (nguyên liệu làm áo chống đạn) - Chứng nhận MFI từ chính Apple.
Dây cáp này hỗ trợ sạc nhanh cho iPhone 8, iPhone 8 Plus, iPhone X, XS, Xs Max, iPhone 11 Series...và các bản về sau qua cổng sạc nhanh chuyên dụng Power Delivery (Dây sạc theo máy không hỗ trợ sạc nhanh).
1 đầu Lighting, 1 đầu USB-C để cắm vào cổng Power Delivery (PD) trên củ sạc.
Vỏ bọc sợi Nylon được thiết kế lại, tăng cường độ bền chắc.
Lõi và đầu nối được gia cố thêm, TĂNG CƯỜNG ĐỘ BỀN HƠN 30 LẦN.
PowerLine: Phiên bản phổ thông của Anker, có lõi Kevlar siêu bền. 
PowerLine+: Phiên bản nâng cấp, có lỗi Kevlar và bổ sung thêm 1 lớp nilon gia cố, chống rối.
Anker là thương hiệu nổi tiếng tại Mỹ về phụ kiện điện thoại đặc biệt là Pin, Sạc, Cáp. Hiện tại Anker là thương hiệu số 1 về Pin, Sạc trên Amazon, theo thống kê Anker chiếm đến 35% thị phần, có nghĩa là cứ 3 phụ kiện pin, cáp, sạc được bán ra thì trong đó có 1 là của Anker. 
Và chỉ tính riêng tại thị trường Mỹ đã có hơn 20 Triệu khách hàng hài lòng với các sản phẩm của Anker. Một minh chứng rõ nét và hùng hồn về chất lượng của các sản phẩm.
Lõi cáp được gia cố bằng sợi Kevlar siêu bền cho độ bền tuyệt đối. Độ bền gấp khoảng 30 lần cáp thông thường.', N'c03fa75e.jpg', N'cap-sac-anker-powerline', 780000, 14, N'6', 1, N'3', NULL, N'3')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (62, 1, CAST(N'2021-10-10' AS Date), N'Để sạc nhanh các bạn cần củ sạc có cổng sạc Power Delivery chuyên dụng (Củ sạc theo máy từ iPhone Xs Max trở về trước không sạc nhanh).
Các dòng iPhone từ iPhone 7 Plus trở xuống không cần mua cáp này vì máy không có sạc nhanh.
Dây cáp sạc iPhone Anker Powerline+ II USB C to Lightning dài 1.8m hỗ trợ sạc siêu nhanh Power Delivery
Dây cáp sạc cho iPhone bền nhất thế giới với lõi Kevlar (nguyên liệu làm áo chống đạn) - Chứng nhận MFI từ chính Apple.
Dây cáp này hỗ trợ sạc nhanh cho iPhone 8, iPhone 8 Plus, iPhone X, XS, Xs Max, iPhone 11 Series...và các bản về sau qua cổng sạc nhanh chuyên dụng Power Delivery (Dây sạc theo máy không hỗ trợ sạc nhanh).
1 đầu Lighting, 1 đầu USB-C để cắm vào cổng Power Delivery (PD) trên củ sạc.
Vỏ bọc sợi Nylon được thiết kế lại, tăng cường độ bền chắc.
Lõi và đầu nối được gia cố thêm, TĂNG CƯỜNG ĐỘ BỀN HƠN 30 LẦN.
PowerLine: Phiên bản phổ thông của Anker, có lõi Kevlar siêu bền. 
PowerLine+: Phiên bản nâng cấp, có lỗi Kevlar và bổ sung thêm 1 lớp nilon gia cố, chống rối.
Anker là thương hiệu nổi tiếng tại Mỹ về phụ kiện điện thoại đặc biệt là Pin, Sạc, Cáp. Hiện tại Anker là thương hiệu số 1 về Pin, Sạc trên Amazon, theo thống kê Anker chiếm đến 35% thị phần, có nghĩa là cứ 3 phụ kiện pin, cáp, sạc được bán ra thì trong đó có 1 là của Anker. 
Và chỉ tính riêng tại thị trường Mỹ đã có hơn 20 Triệu khách hàng hài lòng với các sản phẩm của Anker. Một minh chứng rõ nét và hùng hồn về chất lượng của các sản phẩm.
Lõi cáp được gia cố bằng sợi Kevlar siêu bền cho độ bền tuyệt đối. Độ bền gấp khoảng 30 lần cáp thông thường.', N'cb21e5b4.jpg', N'day-cap-sac-iphone-lightning', 349000, 12, N'6', 1, N'1', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (63, 1, CAST(N'2021-10-10' AS Date), N'Để sạc nhanh các bạn cần củ sạc có cổng sạc Power Delivery chuyên dụng (Củ sạc theo máy từ iPhone Xs Max trở về trước không sạc nhanh).
Các dòng iPhone từ iPhone 7 Plus trở xuống không cần mua cáp này vì máy không có sạc nhanh.
Dây cáp sạc iPhone Anker Powerline+ II USB C to Lightning dài 1.8m hỗ trợ sạc siêu nhanh Power Delivery
Dây cáp sạc cho iPhone bền nhất thế giới với lõi Kevlar (nguyên liệu làm áo chống đạn) - Chứng nhận MFI từ chính Apple.
Dây cáp này hỗ trợ sạc nhanh cho iPhone 8, iPhone 8 Plus, iPhone X, XS, Xs Max, iPhone 11 Series...và các bản về sau qua cổng sạc nhanh chuyên dụng Power Delivery (Dây sạc theo máy không hỗ trợ sạc nhanh).
1 đầu Lighting, 1 đầu USB-C để cắm vào cổng Power Delivery (PD) trên củ sạc.
Vỏ bọc sợi Nylon được thiết kế lại, tăng cường độ bền chắc.
Lõi và đầu nối được gia cố thêm, TĂNG CƯỜNG ĐỘ BỀN HƠN 30 LẦN.
PowerLine: Phiên bản phổ thông của Anker, có lõi Kevlar siêu bền. 
PowerLine+: Phiên bản nâng cấp, có lỗi Kevlar và bổ sung thêm 1 lớp nilon gia cố, chống rối.
Anker là thương hiệu nổi tiếng tại Mỹ về phụ kiện điện thoại đặc biệt là Pin, Sạc, Cáp. Hiện tại Anker là thương hiệu số 1 về Pin, Sạc trên Amazon, theo thống kê Anker chiếm đến 35% thị phần, có nghĩa là cứ 3 phụ kiện pin, cáp, sạc được bán ra thì trong đó có 1 là của Anker. 
Và chỉ tính riêng tại thị trường Mỹ đã có hơn 20 Triệu khách hàng hài lòng với các sản phẩm của Anker. Một minh chứng rõ nét và hùng hồn về chất lượng của các sản phẩm.
Lõi cáp được gia cố bằng sợi Kevlar siêu bền cho độ bền tuyệt đối. Độ bền gấp khoảng 30 lần cáp thông thường.', N'cb3b1bf8.png', N'bộ-sạc-Note10', 90000, 15, N'5', 1, N'2', NULL, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (64, 1, CAST(N'2021-10-10' AS Date), N'Để sạc nhanh các bạn cần củ sạc có cổng sạc Power Delivery chuyên dụng (Củ sạc theo máy từ iPhone Xs Max trở về trước không sạc nhanh).
Các dòng iPhone từ iPhone 7 Plus trở xuống không cần mua cáp này vì máy không có sạc nhanh.
Dây cáp sạc iPhone Anker Powerline+ II USB C to Lightning dài 1.8m hỗ trợ sạc siêu nhanh Power Delivery
Dây cáp sạc cho iPhone bền nhất thế giới với lõi Kevlar (nguyên liệu làm áo chống đạn) - Chứng nhận MFI từ chính Apple.
Dây cáp này hỗ trợ sạc nhanh cho iPhone 8, iPhone 8 Plus, iPhone X, XS, Xs Max, iPhone 11 Series...và các bản về sau qua cổng sạc nhanh chuyên dụng Power Delivery (Dây sạc theo máy không hỗ trợ sạc nhanh).
1 đầu Lighting, 1 đầu USB-C để cắm vào cổng Power Delivery (PD) trên củ sạc.
Vỏ bọc sợi Nylon được thiết kế lại, tăng cường độ bền chắc.
Lõi và đầu nối được gia cố thêm, TĂNG CƯỜNG ĐỘ BỀN HƠN 30 LẦN.
PowerLine: Phiên bản phổ thông của Anker, có lõi Kevlar siêu bền. 
PowerLine+: Phiên bản nâng cấp, có lỗi Kevlar và bổ sung thêm 1 lớp nilon gia cố, chống rối.
Anker là thương hiệu nổi tiếng tại Mỹ về phụ kiện điện thoại đặc biệt là Pin, Sạc, Cáp. Hiện tại Anker là thương hiệu số 1 về Pin, Sạc trên Amazon, theo thống kê Anker chiếm đến 35% thị phần, có nghĩa là cứ 3 phụ kiện pin, cáp, sạc được bán ra thì trong đó có 1 là của Anker. 
Và chỉ tính riêng tại thị trường Mỹ đã có hơn 20 Triệu khách hàng hài lòng với các sản phẩm của Anker. Một minh chứng rõ nét và hùng hồn về chất lượng của các sản phẩm.
Lõi cáp được gia cố bằng sợi Kevlar siêu bền cho độ bền tuyệt đối. Độ bền gấp khoảng 30 lần cáp thông thường.', N'5daae0fc.png', N'C72i-300', 56000, 20, N'5', 1, N'3', NULL, N'3')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (65, 1, CAST(N'2021-10-10' AS Date), N'Để sạc nhanh các bạn cần củ sạc có cổng sạc Power Delivery chuyên dụng (Củ sạc theo máy từ iPhone Xs Max trở về trước không sạc nhanh).
Các dòng iPhone từ iPhone 7 Plus trở xuống không cần mua cáp này vì máy không có sạc nhanh.
Dây cáp sạc iPhone Anker Powerline+ II USB C to Lightning dài 1.8m hỗ trợ sạc siêu nhanh Power Delivery
Dây cáp sạc cho iPhone bền nhất thế giới với lõi Kevlar (nguyên liệu làm áo chống đạn) - Chứng nhận MFI từ chính Apple.
Dây cáp này hỗ trợ sạc nhanh cho iPhone 8, iPhone 8 Plus, iPhone X, XS, Xs Max, iPhone 11 Series...và các bản về sau qua cổng sạc nhanh chuyên dụng Power Delivery (Dây sạc theo máy không hỗ trợ sạc nhanh).
1 đầu Lighting, 1 đầu USB-C để cắm vào cổng Power Delivery (PD) trên củ sạc.
Vỏ bọc sợi Nylon được thiết kế lại, tăng cường độ bền chắc.
Lõi và đầu nối được gia cố thêm, TĂNG CƯỜNG ĐỘ BỀN HƠN 30 LẦN.
PowerLine: Phiên bản phổ thông của Anker, có lõi Kevlar siêu bền. 
PowerLine+: Phiên bản nâng cấp, có lỗi Kevlar và bổ sung thêm 1 lớp nilon gia cố, chống rối.
Anker là thương hiệu nổi tiếng tại Mỹ về phụ kiện điện thoại đặc biệt là Pin, Sạc, Cáp. Hiện tại Anker là thương hiệu số 1 về Pin, Sạc trên Amazon, theo thống kê Anker chiếm đến 35% thị phần, có nghĩa là cứ 3 phụ kiện pin, cáp, sạc được bán ra thì trong đó có 1 là của Anker. 
Và chỉ tính riêng tại thị trường Mỹ đã có hơn 20 Triệu khách hàng hài lòng với các sản phẩm của Anker. Một minh chứng rõ nét và hùng hồn về chất lượng của các sản phẩm.
Lõi cáp được gia cố bằng sợi Kevlar siêu bền cho độ bền tuyệt đối. Độ bền gấp khoảng 30 lần cáp thông thường.', N'f7f381f.png', N'Sac-bo-Hoco-C80', 75000, 10, N'5', 1, N'1', NULL, N'3')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (66, 1, CAST(N'2021-11-20' AS Date), N'Loa Bluetooth Không Dây Cầm Tay Charge 3 Mini Nghe Nhạc Hay, Hỗ Trợ Cắm Usb Thẻ Nhớ Tf Nhỏ Gọn Giá Rẻ
GIỚI THIỆU VỀ LOA BLUETOOTH KHÔNG DÂY CHARGE 3 MINI
- Loa bluetooth không dây Charge 3 mini nổi tiếng với âm bass mạnh mẽ, tạo không gian rung đập, dồn dập. Chiến mọi thể loại nhạc từ EDM, DJ, Nonstop, Remix đến những bài nhạc Pop sâu lắng, nhẹ nhàng đầy cảm xúc hay những ca khúc cải lương, nhạc Bolero, nhạc cách mạng, kinh phật... đều tốt cả nhé. Âm thanh hay vượt trội, diễn tả mọi cung bậc cảm xúc của bản nhạc mà bạn yêu thích thật sự tuyệt vời.
- Loa bluetooth không dây Charge 3 mini trang bị công nghệ bluetooth vô cùng phổ biến nên bạn có thể kết nối loa với các thiết bị công nghệ thông minh như điện thoại, máy tính bảng, laptop đấy nhé. Sử dụng bluetooth ở loa cũng rất đơn giản, chỉ cần mở nguồn là loa sẽ tự động mở kết nối bluetooth, sau đó kết nối bluetooth của điện thoại bạn với loa là có thể nghe nhạc, xem phim, gọi điện trò chuyện thông qua loa cực kì thoải mái thoải mái.
- Ngoài kết nối bluetooth, loa charge 3 mini còn có thêm 2 cổng thẻ nhớ và USB. Với trang bị cổng thẻ nhớ TF, cổng USB trên thân loa giúp loa có thể tích hợp thẻ nhớ và USB phát nhạc một cách dễ dang. 
- Loa bluetooth không dây Charge 3 Mini được thiết kế có phần nhỏ hơn so với những dòng loa Charge 3 thường nên cũng có phần ưu điểm hơn. Cầm tay khá gọn, cũng khá nhẹ nên bạn có thể mang đi chơi, đi học, đi du lịch, công tác, cắm trại, dã ngoại đều thích cả nhé. Bỏ trong balo, trong cặp không hề chiếm nhiều diện tích, nghe nhạc mọi lúc mọi nơi.

THÔNG SỐ KỸ THUẬT LOA BLUETOOTH CHARGE 3 MINI: 
Bộ sản phẩm gồm: 1 loa, 1 cáp sạc 
– Chất liệu: nhựa, kim loại 
– Công suất: 5W 
– Thời gian sử dụng: 3-5giờ (tùy theo âm lượng sử dụng) 
– Thời gian sạc: 1.5 - 2 giờ 
– Kết nối: bluetooth, thẻ nhớ, USB 
– Trọng lượng: 0,3kg
- Màu sắc: đỏ, đen, xanh dương, xanh lá

*) CAM KẾT VỀ CHẤT LƯỢNG VÀ DỊCH VỤ BÁN HÀNG:
1. Hàng thật như hình.
2. Kiểm tra hàng trước khi thanh toán.
3. Cung cấp các sản phẩm chất lượng phù hợp với giá tiền
*) QUY ĐỊNH ĐỔI TRẢ:
Sẵn sàng đổi trả hoặc hoàn lại tiền cho khách hàng trong 72h kể từ ngày nhận hàng cho những lý do sau :
1. Sản phẩm bị lỗi.
2. Hư hỏng trong quá trình vận chuyển.
3. Khách hàng đưa ra lý do hợp lý về sự không hài lòng đối với sản phẩm và được sự đồng ý từ Shop.', N'9e131a5a.jpg', N'Loa Bluetooth Anker SoundCore Icon', 950000, 5, N'7', 1, N'6', NULL, N'3')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (67, 1, CAST(N'2021-11-20' AS Date), N'THÔNG SỐ KỸ THUẬT LOA BLUETOOTH LZ-3101: 
Bộ sản phẩm gồm: 1 loa, 1 cáp sạc, 1 chổi 
– Chất liệu: nhựa, kim loại 
– Công suất: 5W 
– Thời gian sử dụng: 2-5giờ (tùy theo âm lượng sử dụng) 
– Thời gian sạc: 1.5 - 2 giờ 
– Kết nối: bluetooth, thẻ nhớ, USB 
– Trọng lượng: 0,3kg
THÔNG SỐ KỸ THUẬT LOA BLUETOOTH LZ-3101: 
• Chất liệu: nhựa ABS 
• Công suất: 109 dB 
• Kích thước loa 4 inch 
• Kết nối bluetooth, ≤ 10m 
• Tần số đáp ứng: 100Hz - 20KHz 
• Nghe nhạc từ USB (max 32Gb) /SD Card 
• Tần số radio: 85.7 - 108.0 MHz 
• Cổng AUX: kết nối với các thiết bị phát bằng dây khi không có bluetooth 
• Cổng sạc mini USB, DC 5V 
• Pin sạc: 500mAh 
• Thời gian sử dụng: 2 - 5h tùy vào công suất sử dụng 
• Thời gian sạc đầy: 2 - 3h 
• Phụ kiện: Cáp sạc 
• Kích thước: 13 x 11 x 19 (cm)', N'a9dd4949.jpg', N'Loa Bluetooth Karaoke', 2780000, 8, N'7', 1, N'5', NULL, N'4')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (68, 1, CAST(N'2021-12-12' AS Date), N'Lưu ý cho khách hàng:
Vui lòng chọn đúng mẫu và đúng màu sắc mà bạn muốn.
Sản phẩm có hàng sẵn trong kho.
Hãy chắc chắn rằng địa chỉ của bạn là chính xác, vì chúng tôi không thể thay đổi địa chỉ giúp bạn được.

1. Tất cả các sản phẩm trong cửa hàng đều là sản phẩm mới 100% và chất lượng cao.
2. Đã được thử nghiệm trên điện thoại thực tế 100%.
3. Thân thiện với làn da, thoải mái, không bị ố vàng, không phải sử dụng ngón tay nhiều.
4. Bảo vệ toàn diện/ Chống bụi bẩn/ Chống va đập/ Làm giảm sốc.
5. Bảo vệ điện thoại của bạn khỏi bụi bẩn, trầy xước và va đập.', N'120c087d.jpg', N'Ốp lưng iphone 13 Pro', 1300000, 10, N'1', 1, N'3', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (69, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'a87fd364.jpg', N'Tai nghe Samsung', 1490000, 15, N'2', 1, N'1', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (70, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'32266663.png', N'Tai nghe nhét tai Rozer', 495000, 5, N'2', 1, N'5', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (71, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'd1b05bbf.jpg', N'Tai nghe choàng đầu logitech', 2500000, 25, N'2', 1, N'6', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (72, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'6c4b2b18.jpg', N'Pin sạc dự phòng Li-polymer 10000mAH UMETRAVEL TRIP10C', 345000, 12, N'3', 1, N'5', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (73, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'96b4956b.png', N'Loa dàn', 192000, 5, N'7', 1, N'1', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (74, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'17e37c5.jpg', N'Loa Bluet', 5000000, 2, N'7', 0, N'5', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (75, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'306736f4.jpg', N'Cáp USB-C to Lightning MFI 1m UmeTravel Nylon braided MF1', 215000, 30, N'5', 1, N'6', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (76, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'c838e65b.jpeg', N'Cáp USB-C to USB-C 0.9m Anker PowerLine+ A8187', 350000, 23, N'6', 1, N'6', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (77, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'81ea6580.jpg', N'Cáp USB-C to USB-C 1m UmeTravel Nylon braided CC1', 200000, 14, N'6', 1, N'2', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (78, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'27a5884e.jpg', N'cap-sac-usb-type-c-chinh-hang-samsung', 500000, 7, N'6', 1, N'1', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (79, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'd8271435.jpg', N'Sạc nhanh 20W USB-C Power Adapter', 590000, 9, N'5', 1, N'2', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (80, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'23a367e4.jpg', N'quat-tich-dien-mini-yoobao-f04-6400mah', 99000, 20, N'8', 1, N'5', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (81, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'80ce96c5.jpg', N'quat-tich-dien-mini-yoobao-Y-F04-6400mAh', 99000, 20, N'8', 1, N'6', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (83, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'86e0b931.jpg', N'quat-tich-dien-yoobao-F04-MAX-998845', 99000, 20, N'8', 1, N'6', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (84, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'8ae04af7.jpg', N'jack20chuyen20doi20220dau204', 329000, 14, N'9', 1, N'3', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (85, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'b5c3c334.jpg', N'Jack Chuyển', 549000, 13, N'9', 1, N'3', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (86, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'db2bec34.jpg', N'Jack Chuyển', 641000, 10, N'9', 1, N'3', NULL, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [desciption], [image], [name], [price], [quantity], [categoryid], [insurance], [producerid], [commentid], [discountid]) VALUES (87, 1, CAST(N'2021-12-12' AS Date), N'*) Ưu điểm nổi bật

- Tai nghe amoi F9 được thiết kế hoàn thiện nổi bật từng chi tiết
- Kết nối bluetooth V5.0 cho tốc độ nhanh ổn định và tiết kiệm pin
- Tai nghe không dây F9 dải bass rộng và chất lượng màng loa cao cấp, công nghệ mới lọc tạp âm và giảm tiếng ồn đem đến trải nghiệm âm thanh sống động, sắc nét
- Dock sạc tích hợp sạc dự phòng 2500 mAh, chạm cảm ứng trên tai nghe (điểm chính giữa vân tay)

*) Hướng dẫn sử dụng

- Kết nối
Bước 1: Lấy 2 tai nghe ra khỏi dock sạc
Bước 2: Hai tai nghe sẽ tự nhấp nháy đèn để tự liên kết với nhau, bạn đợi 1-2s 1 bên ngắt nháy đèn 
Bước 3: Bật thiết bị bluetooth trên điện thoại, và chọn thiết bị F9 để kết nối với tai nghe

*Lưu ý

Trong trường hợp nghe độc lập từng tai, cách khắc phục để kết nối nghe được cả 2 tai nghe:
B1: Bạn lấy đồng thời hai tai nghe nghe ra khỏi dock sạc (lúc này hai tai nghe sẽ đồng thời nháy và không bên nào bị tắt đèn và khi dò sẽ hiện ra 2 thiết bị f9)
B2: Bạn chạm 2 lần liên tục ( double tap) vào 1 bên tai nghe bất kì khi đó 1 bên tai nghe sẽ tắt nháy đèn
B3: Bạn tắt bluetooth và bật lại dò thì sẽ hiển thị ra 1 thiết bị f9 và kết nối là đã thành công

*) Thông số kỹ thuật

- Loại tai nghe: Tai nghe bluetooth không dây
- Kết nối bluetooth: 5.0
- Thời gian sử dụng: khoảng 3-4 giờ
- Dung lượng pin dock sạc: 2500 mAh
- Khoảng cách Bluetooth: 5-10 mét
- Công nghệ chống nước: IPX 5
- Chức năng đầy đủ : Phát/Tạm dừng nhạc, chuyển bài, tăng giảm âm lượng,..
- Tương thích với mọi hệ điều hành (IOS, Android) các thiết bị có kết nối bluetooth: Xiaomi, Samsung, Huawei, OPPO, vivo, Lenovo, tablet, máy tính bảng, laptop,..', N'3fc143a2.jpg', N'Jack Chuyển', 365000, 10, N'9', 1, N'3', NULL, N'1')
SET IDENTITY_INSERT [dbo].[products] OFF
GO
INSERT [dbo].[roles] ([id], [name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[roles] ([id], [name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[roles] ([id], [name]) VALUES (N'STAF', N'Staffs')
GO
/****** Object:  Index [UK_36xf85p9y70xqxjbf24631ap9]    Script Date: 12/21/2021 8:20:51 PM ******/
ALTER TABLE [dbo].[accounts_favorite_products] ADD  CONSTRAINT [UK_36xf85p9y70xqxjbf24631ap9] UNIQUE NONCLUSTERED 
(
	[favorite_products_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKbe4oq0qq7tsuqqsmt4p8fihy7]    Script Date: 12/21/2021 8:20:51 PM ******/
ALTER TABLE [dbo].[authorities] ADD  CONSTRAINT [UKbe4oq0qq7tsuqqsmt4p8fihy7] UNIQUE NONCLUSTERED 
(
	[username] ASC,
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKhtk0tjw6uf67w0vkhy5n3j1oq]    Script Date: 12/21/2021 8:20:51 PM ******/
ALTER TABLE [dbo].[authorities] ADD  CONSTRAINT [UKhtk0tjw6uf67w0vkhy5n3j1oq] UNIQUE NONCLUSTERED 
(
	[username] ASC,
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_ixgg7w683e6a4n5shc2hs5n2q]    Script Date: 12/21/2021 8:20:51 PM ******/
ALTER TABLE [dbo].[flash_sales_favorite_products] ADD  CONSTRAINT [UK_ixgg7w683e6a4n5shc2hs5n2q] UNIQUE NONCLUSTERED 
(
	[favorite_products_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_4r21h8pc985hpk3snnpn8nudt]    Script Date: 12/21/2021 8:20:51 PM ******/
ALTER TABLE [dbo].[products_favorite_products] ADD  CONSTRAINT [UK_4r21h8pc985hpk3snnpn8nudt] UNIQUE NONCLUSTERED 
(
	[favorite_products_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[accounts_favorite_products]  WITH CHECK ADD  CONSTRAINT [FK9p6r3i3ldgwvy1r7x816ts2qy] FOREIGN KEY([favorite_products_id])
REFERENCES [dbo].[favorite_products] ([id])
GO
ALTER TABLE [dbo].[accounts_favorite_products] CHECK CONSTRAINT [FK9p6r3i3ldgwvy1r7x816ts2qy]
GO
ALTER TABLE [dbo].[accounts_favorite_products]  WITH CHECK ADD  CONSTRAINT [FKi72x1f6t4ilj9ll4jo4al8k2y] FOREIGN KEY([account_username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[accounts_favorite_products] CHECK CONSTRAINT [FKi72x1f6t4ilj9ll4jo4al8k2y]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FKfof7t1d69xi65voejy080bcji] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FKfof7t1d69xi65voejy080bcji]
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD  CONSTRAINT [FKevi9708lm1k06pa4dugc91k7v] FOREIGN KEY([roleid])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[authorities] CHECK CONSTRAINT [FKevi9708lm1k06pa4dugc91k7v]
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD  CONSTRAINT [FKlw0sapcjvuxfa1kvyjw7jml88] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[authorities] CHECK CONSTRAINT [FKlw0sapcjvuxfa1kvyjw7jml88]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK507jupbtfmy5vuuobktflhpa2] FOREIGN KEY([flashsaleid])
REFERENCES [dbo].[flash_sales] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK507jupbtfmy5vuuobktflhpa2]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FKdpyej8iigc8ml84qxns9mwvda] FOREIGN KEY([productid])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FKdpyej8iigc8ml84qxns9mwvda]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FKmtau98mcbrvrn12dod8amygdl] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FKmtau98mcbrvrn12dod8amygdl]
GO
ALTER TABLE [dbo].[favorite_detail_product]  WITH CHECK ADD  CONSTRAINT [FKl9u7flpge6spdjo5no6k02ly9] FOREIGN KEY([productid])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[favorite_detail_product] CHECK CONSTRAINT [FKl9u7flpge6spdjo5no6k02ly9]
GO
ALTER TABLE [dbo].[favorite_detail_product]  WITH CHECK ADD  CONSTRAINT [FKls2k7d73o2g3yqamyckg04cmj] FOREIGN KEY([favoriteid])
REFERENCES [dbo].[favorite_products] ([id])
GO
ALTER TABLE [dbo].[favorite_detail_product] CHECK CONSTRAINT [FKls2k7d73o2g3yqamyckg04cmj]
GO
ALTER TABLE [dbo].[favorite_products]  WITH CHECK ADD  CONSTRAINT [FK6mfquuvfmxj15grg51rd8qny3] FOREIGN KEY([productid])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[favorite_products] CHECK CONSTRAINT [FK6mfquuvfmxj15grg51rd8qny3]
GO
ALTER TABLE [dbo].[favorite_products]  WITH CHECK ADD  CONSTRAINT [FK6vnfs0kp7drlpaatfvk3olc7t] FOREIGN KEY([flashsaleid])
REFERENCES [dbo].[flash_sales] ([id])
GO
ALTER TABLE [dbo].[favorite_products] CHECK CONSTRAINT [FK6vnfs0kp7drlpaatfvk3olc7t]
GO
ALTER TABLE [dbo].[favorite_products]  WITH CHECK ADD  CONSTRAINT [FKl91vjwfxs0v102yjdiqhc8o63] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[favorite_products] CHECK CONSTRAINT [FKl91vjwfxs0v102yjdiqhc8o63]
GO
ALTER TABLE [dbo].[flash_sales]  WITH CHECK ADD  CONSTRAINT [FKdr923cdckf2d21gihfprpq8lp] FOREIGN KEY([discountid])
REFERENCES [dbo].[discounts] ([id])
GO
ALTER TABLE [dbo].[flash_sales] CHECK CONSTRAINT [FKdr923cdckf2d21gihfprpq8lp]
GO
ALTER TABLE [dbo].[flash_sales]  WITH CHECK ADD  CONSTRAINT [FKh37ekmm4dlds069knot104kbn] FOREIGN KEY([producerid])
REFERENCES [dbo].[producers] ([id])
GO
ALTER TABLE [dbo].[flash_sales] CHECK CONSTRAINT [FKh37ekmm4dlds069knot104kbn]
GO
ALTER TABLE [dbo].[flash_sales]  WITH CHECK ADD  CONSTRAINT [FKq9r8569uv47matndtuf13q6jc] FOREIGN KEY([categoryid])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[flash_sales] CHECK CONSTRAINT [FKq9r8569uv47matndtuf13q6jc]
GO
ALTER TABLE [dbo].[flash_sales_favorite_products]  WITH CHECK ADD  CONSTRAINT [FK120lltjqj0jodxloqgvhooyk0] FOREIGN KEY([flash_sale_id])
REFERENCES [dbo].[flash_sales] ([id])
GO
ALTER TABLE [dbo].[flash_sales_favorite_products] CHECK CONSTRAINT [FK120lltjqj0jodxloqgvhooyk0]
GO
ALTER TABLE [dbo].[flash_sales_favorite_products]  WITH CHECK ADD  CONSTRAINT [FK5562peifv218x45v1gpxu6bcm] FOREIGN KEY([favorite_products_id])
REFERENCES [dbo].[favorite_products] ([id])
GO
ALTER TABLE [dbo].[flash_sales_favorite_products] CHECK CONSTRAINT [FK5562peifv218x45v1gpxu6bcm]
GO
ALTER TABLE [dbo].[flash_sales_favorite_products]  WITH CHECK ADD  CONSTRAINT [FKn1yhljgrfa7oclk8ye0307hy2] FOREIGN KEY([flash_sale_idfs])
REFERENCES [dbo].[flash_sales] ([id])
GO
ALTER TABLE [dbo].[flash_sales_favorite_products] CHECK CONSTRAINT [FKn1yhljgrfa7oclk8ye0307hy2]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FKaltatpxipsjtcih4d1h6bn0xr] FOREIGN KEY([productid])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FKaltatpxipsjtcih4d1h6bn0xr]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FKfhb84gubrxjkigsyfncke2ee5] FOREIGN KEY([flash_saleid])
REFERENCES [dbo].[flash_sales] ([id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FKfhb84gubrxjkigsyfncke2ee5]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FKj4gc2ja2otvwemf4rho2lp3s8] FOREIGN KEY([orderid])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FKj4gc2ja2otvwemf4rho2lp3s8]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_producers] FOREIGN KEY([producerid])
REFERENCES [dbo].[producers] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_producers]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK1krrsjgcawsfg8k8u4hm5gi8q] FOREIGN KEY([categoryid])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK1krrsjgcawsfg8k8u4hm5gi8q]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK73rpyqej33qrlipejlmgtirho] FOREIGN KEY([discountid])
REFERENCES [dbo].[discounts] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK73rpyqej33qrlipejlmgtirho]
GO
ALTER TABLE [dbo].[products_favorite_products]  WITH CHECK ADD  CONSTRAINT [FK58k6its7c4nnc1yoh3124uxi7] FOREIGN KEY([favorite_products_id])
REFERENCES [dbo].[favorite_products] ([id])
GO
ALTER TABLE [dbo].[products_favorite_products] CHECK CONSTRAINT [FK58k6its7c4nnc1yoh3124uxi7]
GO
ALTER TABLE [dbo].[products_favorite_products]  WITH CHECK ADD  CONSTRAINT [FK5mttmvoixpbjtd2dryt3aitrl] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[products_favorite_products] CHECK CONSTRAINT [FK5mttmvoixpbjtd2dryt3aitrl]
GO
USE [master]
GO
ALTER DATABASE [DATN] SET  READ_WRITE 
GO
