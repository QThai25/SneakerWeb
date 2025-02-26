USE [KV_Sneaker]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/12/2024 3:01:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/12/2024 3:01:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
	[decription] [varchar](255) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 11/12/2024 3:01:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/12/2024 3:01:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[total_amount] [decimal](10, 2) NOT NULL,
	[status] [varchar](20) NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/12/2024 3:01:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [text] NULL,
	[price] [decimal](10, 2) NOT NULL,
	[stock] [int] NOT NULL,
	[category_id] [int] NULL,
	[image] [varchar](255) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 11/12/2024 3:01:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[rating] [int] NULL,
	[comment] [text] NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 11/12/2024 3:01:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[shipping_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[address] [varchar](255) NOT NULL,
	[city] [varchar](100) NOT NULL,
	[state] [varchar](100) NULL,
	[postal_code] [varchar](20) NOT NULL,
	[country] [varchar](100) NOT NULL,
	[shipping_status] [varchar](50) NOT NULL,
	[shipped_date] [datetime] NULL,
	[delivered_date] [datetime] NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[shipping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/12/2024 3:01:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[role] [varchar](20) NOT NULL,
	[phone] [varchar](15) NULL,
	[birthday] [date] NULL,
	[fullname] [nvarchar](100) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([category_id], [name], [decription], [created_at]) VALUES (1, N'Balenciaga', N'Famous_in_the_world', CAST(N'2024-11-23T15:05:44.100' AS DateTime))
INSERT [dbo].[Categories] ([category_id], [name], [decription], [created_at]) VALUES (2, N'Chanel', N'Famous_in_the_world', CAST(N'2024-11-23T15:06:06.413' AS DateTime))
INSERT [dbo].[Categories] ([category_id], [name], [decription], [created_at]) VALUES (3, N'Dior', N'Famous_in_the_world', CAST(N'2024-11-23T15:06:15.363' AS DateTime))
INSERT [dbo].[Categories] ([category_id], [name], [decription], [created_at]) VALUES (4, N'Gucci', N'Famous_in_the_world', CAST(N'2024-11-23T15:20:02.997' AS DateTime))
INSERT [dbo].[Categories] ([category_id], [name], [decription], [created_at]) VALUES (5, N'Ananas', N'Favourite_in_VietNam', CAST(N'2024-11-23T15:20:15.373' AS DateTime))
INSERT [dbo].[Categories] ([category_id], [name], [decription], [created_at]) VALUES (6, N'Bitis', N'Favourite_in_VietNam', CAST(N'2024-11-23T15:20:19.127' AS DateTime))
INSERT [dbo].[Categories] ([category_id], [name], [decription], [created_at]) VALUES (7, N'Shondo', N'Favourite_in_VietNam', CAST(N'2024-11-23T15:20:28.097' AS DateTime))
INSERT [dbo].[Categories] ([category_id], [name], [decription], [created_at]) VALUES (8, N'Adidas', N'Most_favourite', CAST(N'2024-11-23T15:21:07.310' AS DateTime))
INSERT [dbo].[Categories] ([category_id], [name], [decription], [created_at]) VALUES (9, N'Converse', N'Most_favourite', CAST(N'2024-11-23T15:21:20.287' AS DateTime))
INSERT [dbo].[Categories] ([category_id], [name], [decription], [created_at]) VALUES (10, N'Jordan', N'Most_favourite', CAST(N'2024-11-23T15:21:23.050' AS DateTime))
INSERT [dbo].[Categories] ([category_id], [name], [decription], [created_at]) VALUES (11, N'New Balance', N'Most_favourite', CAST(N'2024-11-23T15:21:39.293' AS DateTime))
INSERT [dbo].[Categories] ([category_id], [name], [decription], [created_at]) VALUES (12, N'Nike', N'Most_favourite', CAST(N'2024-11-23T15:21:45.727' AS DateTime))
INSERT [dbo].[Categories] ([category_id], [name], [decription], [created_at]) VALUES (13, N'Vans', N'Most_favourite', CAST(N'2024-11-23T15:21:52.963' AS DateTime))
GO
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (1, N'balenciaga1', N'balenciaga1', CAST(2000900.00 AS Decimal(10, 2)), 39, 1, N'img/Sneakers/Famous_in_the_world/Balenciaga/balenciaga1.jpg', CAST(N'2024-11-23T15:07:03.043' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (2, N'balenciaga2', N'balenciaga2', CAST(2990000.00 AS Decimal(10, 2)), 12, 1, N'img/Sneakers/Famous_in_the_world/Balenciaga/balenciaga2.jpg', CAST(N'2024-11-23T15:07:36.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (3, N'balenciaga3', N'balenciaga3', CAST(2900000.00 AS Decimal(10, 2)), 12, 1, N'img/Sneakers/Famous_in_the_world/Balenciaga/balenciaga3.jpg', CAST(N'2024-11-23T15:10:56.510' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (4, N'balenciaga4', N'balenciaga4', CAST(1900000.00 AS Decimal(10, 2)), 40, 1, N'img/Sneakers/Famous_in_the_world/Balenciaga/balenciaga4.jpg', CAST(N'2024-11-23T15:11:18.333' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (5, N'balenciaga5', N'balenciaga5', CAST(999000.00 AS Decimal(10, 2)), 50, 1, N'img/Sneakers/Famous_in_the_world/Balenciaga/balenciaga5.jpg', CAST(N'2024-11-23T15:12:09.207' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (6, N'balenciaga6', N'balenciaga6', CAST(899000.00 AS Decimal(10, 2)), 30, 1, N'img/Sneakers/Famous_in_the_world/Balenciaga/balenciaga6.jpg', CAST(N'2024-11-23T15:12:39.467' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (7, N'Chanel1', N'Chanel1', CAST(4999000.00 AS Decimal(10, 2)), 10, 2, N'img/Sneakers/Famous_in_the_world/Chanel/chanel1.jpg', CAST(N'2024-11-23T15:16:24.993' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (8, N'Chanel2', N'Chanel2', CAST(5900000.00 AS Decimal(10, 2)), 23, 2, N'img/Sneakers/Famous_in_the_world/Chanel/chanel2.jpg', CAST(N'2024-11-23T15:19:18.027' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (9, N'chanel3', N'chanel3', CAST(3900000.00 AS Decimal(10, 2)), 2, 2, N'img/Sneakers/Famous_in_the_world/Chanel/chanel3.jpg', CAST(N'2024-11-23T15:22:43.117' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (10, N'Chanel4', N'chanel4', CAST(1200090.00 AS Decimal(10, 2)), 4, 2, N'img/Sneakers/Famous_in_the_world/Chanel/chanel4.jpg', CAST(N'2024-11-23T15:24:17.740' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (11, N'Chanel5', N'chanel5', CAST(1200000.00 AS Decimal(10, 2)), 4, 2, N'img/Sneakers/Famous_in_the_world/Chanel/chanel5.jpg', CAST(N'2024-11-23T15:24:59.673' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (12, N'Chanel6', N'chanel6', CAST(2399999.00 AS Decimal(10, 2)), 3, 2, N'img/Sneakers/Famous_in_the_world/Chanel/chanel6.jpg', CAST(N'2024-11-23T15:25:30.870' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (13, N'Dior', N'Dior1', CAST(2000000.00 AS Decimal(10, 2)), 25, 3, N'img/Sneakers/Famous_in_the_world/Dior/dior1.jpg', CAST(N'2024-11-26T16:22:07.810' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (14, N'Dior2', N'Dior2', CAST(1999000.00 AS Decimal(10, 2)), 20, 3, N'img/Sneakers/Famous_in_the_world/Dior/dior2.jpg', CAST(N'2024-11-26T17:25:51.857' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (15, N'Dior3', N'Dior3', CAST(5999999.00 AS Decimal(10, 2)), 30, 3, N'img/Sneakers/Famous_in_the_world/Dior/dior3.jpg', CAST(N'2024-11-26T17:26:20.217' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (16, N'Ananas1', N'Ananas1', CAST(1999999.00 AS Decimal(10, 2)), 10, 5, N'img/Sneakers/Favourite_in_VietNam/Ananas/ananas1.jpg', CAST(N'2024-11-26T17:29:24.407' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (17, N'Chanel11', N'chanel11', CAST(2599999.00 AS Decimal(10, 2)), 15, 2, N'img/Sneakers/Famous_in_the_world/Chanel/chanel1.jpg', CAST(N'2024-12-02T03:19:54.357' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (18, N'Chanel12', N'Chanel12', CAST(2599999.00 AS Decimal(10, 2)), 14, 2, N'img/Sneakers/Famous_in_the_world/Chanel/chanel2.jpg', CAST(N'2024-12-02T03:25:20.780' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (19, N'Chanel13', N'Chanel13', CAST(2399999.00 AS Decimal(10, 2)), 12, 2, N'img/Sneakers/Famous_in_the_world/Chanel/chanel3.jpg', CAST(N'2024-12-02T03:37:00.810' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (20, N'ananas3', N'ananas3', CAST(999999.00 AS Decimal(10, 2)), 7, 5, N'img/Sneakers/Favourite_in_VietNam/Ananas/ananas3.jpg', CAST(N'2024-12-02T03:39:26.750' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (21, N'bitis2', N'bitis2', CAST(399999.00 AS Decimal(10, 2)), 5, 6, N'img/Sneakers/Favourite_in_VietNam/Bitis/bitis2.jpg', CAST(N'2024-12-02T04:26:28.543' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (22, N'bitis1', N'bitis1', CAST(388888.00 AS Decimal(10, 2)), 10, 6, N'img/Sneakers/Favourite_in_VietNam/Bitis/bitis1.jpg', CAST(N'2024-12-02T04:28:21.360' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (23, N'bitis3', N'bitis3', CAST(299999.00 AS Decimal(10, 2)), 9, 6, N'img/Sneakers/Favourite_in_VietNam/Bitis/bitis3.jpg', CAST(N'2024-12-02T04:35:33.390' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (24, N'adidas1', N'adidas1', CAST(1999999.00 AS Decimal(10, 2)), 20, 8, N'img/Sneakers/Most_favourite/Adidas/adidas1.jpgL', CAST(N'2024-12-02T04:37:31.953' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (25, N'adidas2', N'adidas2', CAST(1499999.00 AS Decimal(10, 2)), 17, 8, N'img/Sneakers/Most_favourite/Adidas/adidas2.jpg', CAST(N'2024-12-02T04:41:05.413' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (26, N'adidas3', N'adidas3', CAST(2999999.00 AS Decimal(10, 2)), 18, 8, N'img/Sneakers/Most_favourite/Adidas/adidas3.jpg', CAST(N'2024-12-02T04:42:19.407' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (27, N'adidas4', N'adidas4', CAST(2499999.00 AS Decimal(10, 2)), 22, 8, N'img/Sneakers/Most_favourite/Adidas/adidas4.jpg', CAST(N'2024-12-02T04:43:32.453' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (28, N'adidas5', N'adidas5', CAST(3999999.00 AS Decimal(10, 2)), 15, 8, N'img/Sneakers/Most_favourite/Adidas/adidas5.jpg', CAST(N'2024-12-02T04:44:55.723' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (29, N'gucci1', N'gucci1', CAST(7999999.00 AS Decimal(10, 2)), 12, 4, N'img/Sneakers/Famous_in_the_world/Gucci/gucci1.jpg', CAST(N'2024-12-02T04:46:45.393' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (30, N'gucci2', N'gucci2', CAST(6999999.00 AS Decimal(10, 2)), 10, 4, N'img/Sneakers/Famous_in_the_world/Gucci/gucci2.jpg', CAST(N'2024-12-02T04:48:25.940' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (31, N'gucci3', N'gucci3', CAST(10999999.00 AS Decimal(10, 2)), 9, 4, N'img/Sneakers/Famous_in_the_world/Gucci/gucci3.jpg', CAST(N'2024-12-02T04:49:15.297' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (32, N'gucci4', N'gucci4', CAST(9999999.00 AS Decimal(10, 2)), 8, 4, N'img/Sneakers/Famous_in_the_world/Gucci/gucci4.jpg', CAST(N'2024-12-02T04:50:32.347' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (33, N'gucci5', N'gucci5', CAST(7999999.00 AS Decimal(10, 2)), 8, 4, N'img/Sneakers/Famous_in_the_world/Gucci/gucci5.jpg', CAST(N'2024-12-02T04:51:46.257' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (34, N'bitis4', N'bitis4', CAST(199999.00 AS Decimal(10, 2)), 5, 6, N'img/Sneakers/Favourite_in_VietNam/Bitis/bitis4.jpg', CAST(N'2024-12-02T04:52:51.410' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (35, N'bitis5', N'bitis5', CAST(239999.00 AS Decimal(10, 2)), 5, 6, N'img/Sneakers/Favourite_in_VietNam/Bitis/bitis5.jpg', CAST(N'2024-12-02T04:53:38.203' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (36, N'bitis6', N'bitis6', CAST(259999.00 AS Decimal(10, 2)), 4, 6, N'img/Sneakers/Favourite_in_VietNam/Bitis/bitis6.jpg', CAST(N'2024-12-02T04:55:06.530' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (37, N'shondo1', N'shondo1', CAST(399999.00 AS Decimal(10, 2)), 7, 7, N'img/Sneakers/Favourite_in_VietNam/Shondo/shondo1.jfif', CAST(N'2024-12-02T04:56:18.567' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (38, N'shondo2', N'shondo2', CAST(299999.00 AS Decimal(10, 2)), 8, 7, N'img/Sneakers/Favourite_in_VietNam/Shondo/shondo2.jfif', CAST(N'2024-12-02T04:57:09.197' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (39, N'shondo3', N'shondo3', CAST(239999.00 AS Decimal(10, 2)), 6, 7, N'img/Sneakers/Favourite_in_VietNam/Shondo/shondo3.jfif', CAST(N'2024-12-02T04:58:04.790' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (40, N'shondo4', N'shondo4', CAST(229999.00 AS Decimal(10, 2)), 7, 7, N'img/Sneakers/Favourite_in_VietNam/Shondo/shondo4.jfif', CAST(N'2024-12-02T04:59:25.287' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (41, N'shondo5', N'shondo5', CAST(239999.00 AS Decimal(10, 2)), 7, 7, N'img/Sneakers/Favourite_in_VietNam/Shondo/shondo5.jfif', CAST(N'2024-12-02T05:01:27.417' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (42, N'shondo6', N'shondo6', CAST(219999.00 AS Decimal(10, 2)), 6, 7, N'img/Sneakers/Favourite_in_VietNam/Shondo/shondo6.jfif', CAST(N'2024-12-02T05:02:37.177' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (43, N'shondo7', N'shondo7', CAST(299999.00 AS Decimal(10, 2)), 8, 7, N'img/Sneakers/Favourite_in_VietNam/Shondo/shondo7.jfif', CAST(N'2024-12-02T05:03:23.853' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (44, N'converse1', N'converse1', CAST(1199999.00 AS Decimal(10, 2)), 20, 9, N'img/Sneakers/Most_favourite/Converse/converse1.jpg', CAST(N'2024-12-02T05:04:37.333' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (45, N'converse2', N'converse2', CAST(1299999.00 AS Decimal(10, 2)), 30, 9, N'img/Sneakers/Most_favourite/Converse/converse2.jpg', CAST(N'2024-12-02T05:05:26.813' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (46, N'converse3', N'converse3', CAST(1099999.00 AS Decimal(10, 2)), 25, 9, N'img/Sneakers/Most_favourite/Converse/converse3.jpg', CAST(N'2024-12-02T05:07:43.030' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (47, N'converse4', N'converse4', CAST(1399999.00 AS Decimal(10, 2)), 24, 9, N'img/Sneakers/Most_favourite/Converse/converse4.jpg', CAST(N'2024-12-02T05:09:48.143' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (48, N'converse5', N'converse5', CAST(1099999.00 AS Decimal(10, 2)), 25, 9, N'img/Sneakers/Most_favourite/Converse/converse5.jpg', CAST(N'2024-12-02T05:11:19.540' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (49, N'converse6', N'converse6', CAST(1999999.00 AS Decimal(10, 2)), 20, 9, N'img/Sneakers/Most_favourite/Converse/converse6.jpg', CAST(N'2024-12-02T05:12:59.803' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (50, N'converse7', N'converse7', CAST(1799999.00 AS Decimal(10, 2)), 20, 9, N'img/Sneakers/Most_favourite/Converse/converse7.jpg', CAST(N'2024-12-02T05:15:00.900' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (51, N'converse8', N'converse8', CAST(2199999.00 AS Decimal(10, 2)), 25, 9, N'img/Sneakers/Most_favourite/Converse/converse8.jpg', CAST(N'2024-12-02T05:16:53.397' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (52, N'nike1', N'nike1', CAST(2299999.00 AS Decimal(10, 2)), 19, 12, N'img/Sneakers/Most_favourite/Nike/nike1.jpg', CAST(N'2024-12-02T05:18:39.847' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (53, N'nike2', N'nike2', CAST(3999999.00 AS Decimal(10, 2)), 20, 12, N'img/Sneakers/Most_favourite/Nike/nike2.jpg', CAST(N'2024-12-02T05:22:13.623' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (54, N'nike3', N'nike3', CAST(3499999.00 AS Decimal(10, 2)), 25, 12, N'img/Sneakers/Most_favourite/Nike/nike3.jpg', CAST(N'2024-12-02T05:24:53.697' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (55, N'nike4', N'nike4', CAST(3199999.00 AS Decimal(10, 2)), 20, 12, N'img/Sneakers/Most_favourite/Nike/nike4.jpg', CAST(N'2024-12-02T05:27:21.097' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (56, N'nike5', N'nike5', CAST(3299999.00 AS Decimal(10, 2)), 17, 12, N'img/Sneakers/Most_favourite/Nike/nike5.jpg', CAST(N'2024-12-02T05:28:59.220' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (57, N'nike6', N'nike6', CAST(3099999.00 AS Decimal(10, 2)), 18, 12, N'img/Sneakers/Most_favourite/Nike/nike6.jpg', CAST(N'2024-12-02T05:29:52.437' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (58, N'nike7', N'nike7', CAST(3299999.00 AS Decimal(10, 2)), 17, 12, N'img/Sneakers/Most_favourite/Nike/nike7.jpg', CAST(N'2024-12-02T05:31:08.553' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (59, N'vans1', N'vans1', CAST(999999.00 AS Decimal(10, 2)), 10, 13, N'img/Sneakers/Most_favourite/Vans/vans1.jpg', CAST(N'2024-12-02T05:33:19.580' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (60, N'vans2', N'vans2', CAST(1199999.00 AS Decimal(10, 2)), 9, 13, N'img/Sneakers/Most_favourite/Vans/vans2.jpg', CAST(N'2024-12-02T05:33:49.643' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (61, N'vans3', N'vans3', CAST(1299999.00 AS Decimal(10, 2)), 8, 13, N'img/Sneakers/Most_favourite/Vans/vans3.jpg', CAST(N'2024-12-02T05:35:46.293' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (62, N'vans4', N'vans4', CAST(1399999.00 AS Decimal(10, 2)), 9, 13, N'img/Sneakers/Most_favourite/Vans/vans4.jpg', CAST(N'2024-12-02T05:37:03.367' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (63, N'vans5', N'vans5', CAST(1599999.00 AS Decimal(10, 2)), 10, 13, N'img/Sneakers/Most_favourite/Vans/vans5.jpg', CAST(N'2024-12-02T05:38:09.470' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (64, N'vans6', N'vans6', CAST(1999999.00 AS Decimal(10, 2)), 8, 13, N'img/Sneakers/Most_favourite/Vans/vans6.jpg', CAST(N'2024-12-02T05:39:39.003' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (65, N'jordan1', N'jordan1', CAST(4999999.00 AS Decimal(10, 2)), 20, 10, N'img/Sneakers/Most_favourite/Jordan/jordan1.jpg', CAST(N'2024-12-02T05:41:02.790' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (66, N'jordan2', N'jordan2', CAST(4499999.00 AS Decimal(10, 2)), 22, 10, N'img/Sneakers/Most_favourite/Jordan/jordan2.jpg', CAST(N'2024-12-02T05:43:00.323' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (67, N'jordan3', N'jordan3', CAST(4299999.00 AS Decimal(10, 2)), 25, 10, N'img/Sneakers/Most_favourite/Jordan/jordan3.jpg', CAST(N'2024-12-02T05:43:47.140' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (68, N'jordan4', N'jordan4', CAST(4599999.00 AS Decimal(10, 2)), 26, 10, N'img/Sneakers/Most_favourite/Jordan/jordan4.jpg', CAST(N'2024-12-02T05:44:50.477' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (69, N'jordan5', N'jordan5', CAST(3999999.00 AS Decimal(10, 2)), 20, 10, N'img/Sneakers/Most_favourite/Jordan/jordan5.jpg', CAST(N'2024-12-02T05:45:40.373' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (70, N'jordan6', N'jordan6', CAST(3799999.00 AS Decimal(10, 2)), 20, 10, N'img/Sneakers/Most_favourite/Jordan/jordan6.jpg', CAST(N'2024-12-02T05:46:59.050' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (71, N'jordan7', N'jordan7', CAST(4699999.00 AS Decimal(10, 2)), 25, 10, N'img/Sneakers/Most_favourite/Jordan/jordan7.jpg', CAST(N'2024-12-02T05:48:20.177' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (72, N'jordan8', N'jordan8', CAST(5199999.00 AS Decimal(10, 2)), 30, 10, N'img/Sneakers/Most_favourite/Jordan/jordan8.jpg', CAST(N'2024-12-02T05:49:16.157' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (73, N'new1', N'new1', CAST(2499999.00 AS Decimal(10, 2)), 20, 11, N'img/Sneakers/Most_favourite/New Balance/new1.jpg', CAST(N'2024-12-02T05:50:02.497' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (74, N'new2', N'new2', CAST(2299999.00 AS Decimal(10, 2)), 20, 11, N'img/Sneakers/Most_favourite/New Balance/new2.jpg', CAST(N'2024-12-02T05:50:57.190' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (75, N'new3', N'new3', CAST(2199999.00 AS Decimal(10, 2)), 22, 11, N'img/Sneakers/Most_favourite/New Balance/new3.jpg', CAST(N'2024-12-02T05:52:54.590' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (76, N'new4', N'new4', CAST(2599999.00 AS Decimal(10, 2)), 19, 11, N'img/Sneakers/Most_favourite/New Balance/new4.jpg', CAST(N'2024-12-02T05:54:01.110' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (77, N'new5', N'new5', CAST(2199999.00 AS Decimal(10, 2)), 21, 11, N'img/Sneakers/Most_favourite/New Balance/new5.jpg', CAST(N'2024-12-02T05:54:50.337' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (78, N'new6', N'new6', CAST(2799999.00 AS Decimal(10, 2)), 22, 11, N'img/Sneakers/Most_favourite/New Balance/new6.jpg', CAST(N'2024-12-02T05:55:41.290' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (79, N'new7', N'new7', CAST(3599999.00 AS Decimal(10, 2)), 25, 11, N'img/Sneakers/Most_favourite/New Balance/new7.jpg', CAST(N'2024-12-02T05:57:46.950' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (80, N'new8', N'new8', CAST(3299999.00 AS Decimal(10, 2)), 24, 11, N'img/Sneakers/Most_favourite/New Balance/new8.jpg', CAST(N'2024-12-02T05:59:03.263' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (81, N'new9', N'new9', CAST(3799999.00 AS Decimal(10, 2)), 20, 11, N'img/Sneakers/Most_favourite/New Balance/new9.jpg', CAST(N'2024-12-02T05:59:53.397' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock], [category_id], [image], [created_at]) VALUES (82, N'new10', N'new10', CAST(3999999.00 AS Decimal(10, 2)), 21, 11, N'img/Sneakers/Most_favourite/New Balance/new10.jpg', CAST(N'2024-12-02T06:01:31.770' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role], [phone], [birthday], [fullname], [created_at]) VALUES (6, N'khuong', N'khuong123', N'khuong@gmail.com', N'customer', N'123456789', CAST(N'1999-10-30' AS Date), N'Khuong Vo', CAST(N'2024-12-02T03:13:23.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E6164F34E5D21]    Script Date: 11/12/2024 3:01:28 CH ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Shipping] ADD  DEFAULT ('pending') FOR [shipping_status]
GO
ALTER TABLE [dbo].[Shipping] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Products]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Users]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Products]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Users]
GO
ALTER TABLE [dbo].[Shipping]  WITH CHECK ADD  CONSTRAINT [FK_Shipping_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shipping] CHECK CONSTRAINT [FK_Shipping_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([status]='cancelled' OR [status]='completed' OR [status]='pending'))
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[Shipping]  WITH CHECK ADD CHECK  (([shipping_status]='cancelled' OR [shipping_status]='delivered' OR [shipping_status]='in transit' OR [shipping_status]='shipped' OR [shipping_status]='pending'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([role]='customer' OR [role]='admin'))
GO
