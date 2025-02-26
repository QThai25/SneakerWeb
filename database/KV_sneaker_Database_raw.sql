Create database [KV_Sneaker]
go
USE [KV_Sneaker]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/27/2024 11:34:32 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 11/27/2024 11:34:32 PM ******/
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
/****** Object:  Table [dbo].[Order_Details]    Script Date: 11/27/2024 11:34:32 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 11/27/2024 11:34:32 PM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 11/27/2024 11:34:32 PM ******/
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
/****** Object:  Table [dbo].[Reviews]    Script Date: 11/27/2024 11:34:32 PM ******/
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
/****** Object:  Table [dbo].[Shipping]    Script Date: 11/27/2024 11:34:32 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 11/27/2024 11:34:32 PM ******/
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
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role], [phone], [birthday], [fullname], [created_at]) VALUES (1, N'QuocThai', N'1234', N'thaivo307@gmail.com', N'admin', N'0767973496', CAST(N'2003-12-25' AS Date), N'Qu?c Thái', CAST(N'2024-11-25T15:11:38.000' AS DateTime))
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role], [phone], [birthday], [fullname], [created_at]) VALUES (3, N'QuocThai1', N'123', N'thaivo3072@gmail.com', N'customer', N'0767973496', CAST(N'2003-12-25' AS Date), N'Qu?c Thái', CAST(N'2024-11-25T15:11:38.000' AS DateTime))
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role], [phone], [birthday], [fullname], [created_at]) VALUES (4, N'QuocThai2', N'123', N'thaivo3073@gmail.com', N'customer', N'0767973496', CAST(N'2003-12-25' AS Date), N'Quốc Thái', CAST(N'2024-11-25T17:09:20.000' AS DateTime))
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role], [phone], [birthday], [fullname], [created_at]) VALUES (5, N'QuocThai4', N'123', N'thaivo3074@gmail.com', N'customer', N'0767973496', CAST(N'1900-01-01' AS Date), N'Quốc Thái', CAST(N'2024-11-25T17:21:07.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E616427D75AC3]    Script Date: 11/27/2024 11:34:32 PM ******/
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
