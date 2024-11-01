USE [DBvehicle]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 07/03/2024 4:13:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[VehicleID] [int] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[STdate] [nvarchar](255) NULL,
	[Endate] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 07/03/2024 4:13:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[ReviewDate] [date] NOT NULL,
	[UserID] [int] NULL,
	[VehicleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07/03/2024 4:13:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[RoleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 07/03/2024 4:13:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[VehicleID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NULL,
	[Brand] [nvarchar](100) NOT NULL,
	[Model] [nvarchar](100) NOT NULL,
	[Year] [int] NOT NULL,
	[Color] [nvarchar](50) NOT NULL,
	[DailyRate] [decimal](10, 2) NOT NULL,
	[Availability] [bit] NOT NULL,
	[Images] [varchar](100) NULL,
	[Describe] [varchar](100) NULL,
	[Price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleTypes]    Script Date: 07/03/2024 4:13:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleTypes](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [UserID], [VehicleID], [StartDate], [EndDate], [TotalAmount], [Status], [STdate], [Endate]) VALUES (2, 1, 4, CAST(N'2001-01-01' AS Date), CAST(N'2001-02-02' AS Date), CAST(10.00 AS Decimal(10, 2)), N'Success', N'2023-12-14 14:30:00', NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [VehicleID], [StartDate], [EndDate], [TotalAmount], [Status], [STdate], [Endate]) VALUES (3, 1, 6, CAST(N'2023-12-13' AS Date), CAST(N'2023-12-17' AS Date), CAST(120.00 AS Decimal(10, 2)), N'Success', N'2023-12-14 14:30:00', NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [VehicleID], [StartDate], [EndDate], [TotalAmount], [Status], [STdate], [Endate]) VALUES (4, 4, 4, CAST(N'2001-01-01' AS Date), CAST(N'2001-02-02' AS Date), CAST(120.00 AS Decimal(10, 2)), N'Success', N'2023-12-14 14:30:00', NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [VehicleID], [StartDate], [EndDate], [TotalAmount], [Status], [STdate], [Endate]) VALUES (5, 1, 7, CAST(N'2023-12-13' AS Date), CAST(N'2023-12-06' AS Date), CAST(-280.00 AS Decimal(10, 2)), N'Wait', N'2023-12-14 14:30:00', NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [VehicleID], [StartDate], [EndDate], [TotalAmount], [Status], [STdate], [Endate]) VALUES (6, 1, 6, CAST(N'2023-12-13' AS Date), CAST(N'2023-12-14' AS Date), CAST(30.00 AS Decimal(10, 2)), N'Unsuccess', N'2023-12-14 14:30:00', NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [VehicleID], [StartDate], [EndDate], [TotalAmount], [Status], [STdate], [Endate]) VALUES (1003, 1, 6, CAST(N'2023-12-14' AS Date), CAST(N'2023-12-15' AS Date), CAST(30.00 AS Decimal(10, 2)), N'Success', NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [VehicleID], [StartDate], [EndDate], [TotalAmount], [Status], [STdate], [Endate]) VALUES (1004, 1, 9, CAST(N'2023-12-14' AS Date), CAST(N'2023-12-16' AS Date), CAST(100.03 AS Decimal(10, 2)), N'Wait', NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [VehicleID], [StartDate], [EndDate], [TotalAmount], [Status], [STdate], [Endate]) VALUES (1005, 1, 19, CAST(N'2023-12-14' AS Date), CAST(N'2023-12-20' AS Date), CAST(120.00 AS Decimal(10, 2)), N'Wait', NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [VehicleID], [StartDate], [EndDate], [TotalAmount], [Status], [STdate], [Endate]) VALUES (1006, 1, 21, CAST(N'2023-12-14' AS Date), CAST(N'2023-12-17' AS Date), CAST(62.51 AS Decimal(10, 2)), N'Wait', NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [VehicleID], [StartDate], [EndDate], [TotalAmount], [Status], [STdate], [Endate]) VALUES (1007, 1, 11, CAST(N'2023-12-21' AS Date), CAST(N'2023-12-30' AS Date), CAST(187.42 AS Decimal(10, 2)), N'Wait', NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [VehicleID], [StartDate], [EndDate], [TotalAmount], [Status], [STdate], [Endate]) VALUES (1010, 1, 4, CAST(N'2023-12-15' AS Date), CAST(N'2023-12-20' AS Date), CAST(150.00 AS Decimal(10, 2)), N'Wait', NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [VehicleID], [StartDate], [EndDate], [TotalAmount], [Status], [STdate], [Endate]) VALUES (1011, 1, 7, CAST(N'2023-12-15' AS Date), CAST(N'2023-12-20' AS Date), CAST(599.89 AS Decimal(10, 2)), N'Wait', N'15/12/2023 9:52:00 SA', NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [VehicleID], [StartDate], [EndDate], [TotalAmount], [Status], [STdate], [Endate]) VALUES (1012, 1, 19, CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), CAST(261.72 AS Decimal(10, 2)), N'Wait', N'14/12/2023 12:51:00 SA', N'27/12/2023 2:55:00 SA')
INSERT [dbo].[Orders] ([OrderID], [UserID], [VehicleID], [StartDate], [EndDate], [TotalAmount], [Status], [STdate], [Endate]) VALUES (1013, 1, 21, CAST(N'2023-12-14' AS Date), CAST(N'2023-12-18' AS Date), CAST(78.35 AS Decimal(10, 2)), N'Wait', N'14/12/2023 1:55:00 CH', N'18/12/2023 11:56:00 SA')
INSERT [dbo].[Orders] ([OrderID], [UserID], [VehicleID], [StartDate], [EndDate], [TotalAmount], [Status], [STdate], [Endate]) VALUES (1014, 1, 21, CAST(N'2023-12-14' AS Date), CAST(N'2023-12-17' AS Date), CAST(61.61 AS Decimal(10, 2)), N'Wait', N'14/12/2023 10:54:00 SA', N'17/12/2023 12:50:00 CH')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([ReviewID], [OrderID], [Rating], [Comment], [ReviewDate], [UserID], [VehicleID]) VALUES (2, 2, 4, N'Xe Đi Tốt', CAST(N'2002-12-20' AS Date), 1, 4)
INSERT [dbo].[Reviews] ([ReviewID], [OrderID], [Rating], [Comment], [ReviewDate], [UserID], [VehicleID]) VALUES (3, 4, 2, N'Xe Đi Chán', CAST(N'2002-11-11' AS Date), 4, 4)
INSERT [dbo].[Reviews] ([ReviewID], [OrderID], [Rating], [Comment], [ReviewDate], [UserID], [VehicleID]) VALUES (4, 3, 3, N'Xe Đi Tạm', CAST(N'2001-01-11' AS Date), 1, 6)
INSERT [dbo].[Reviews] ([ReviewID], [OrderID], [Rating], [Comment], [ReviewDate], [UserID], [VehicleID]) VALUES (1003, 2, 3, N'Tôi Đã Rất Hài Lòng ', CAST(N'2023-12-14' AS Date), 1, 4)
INSERT [dbo].[Reviews] ([ReviewID], [OrderID], [Rating], [Comment], [ReviewDate], [UserID], [VehicleID]) VALUES (1004, 2, 4, N'chán lắm', CAST(N'2024-01-17' AS Date), 1, NULL)
INSERT [dbo].[Reviews] ([ReviewID], [OrderID], [Rating], [Comment], [ReviewDate], [UserID], [VehicleID]) VALUES (1005, 2, 3, N'chán lắm', CAST(N'2024-01-17' AS Date), 1, NULL)
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [PhoneNumber], [RoleID]) VALUES (1, N'namgbs', N'29042001', N'namgbs29042001@gmail.com', N'Lê Xuân Nam', N'0869834229', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [PhoneNumber], [RoleID]) VALUES (2, N'namadmin', N'29042001', N'namlxhe153241@fpt.edu.vn', N'Nam Admin', N'0123456789', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [PhoneNumber], [RoleID]) VALUES (4, N'nam1', N'29', N'namgbs29042001@gmail.com', N'nam1', N'0123456789', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Vehicles] ON 

INSERT [dbo].[Vehicles] ([VehicleID], [TypeID], [Brand], [Model], [Year], [Color], [DailyRate], [Availability], [Images], [Describe], [Price]) VALUES (4, 2, N'Honda', N'Sh2018', 2018, N'red', CAST(4.00 AS Decimal(10, 2)), 1, N'SH.png', N'All 100% genuine Honda and Yamaha vehicles.', 10)
INSERT [dbo].[Vehicles] ([VehicleID], [TypeID], [Brand], [Model], [Year], [Color], [DailyRate], [Availability], [Images], [Describe], [Price]) VALUES (6, 3, N'Honda', N'Wave AL', 2018, N'red', CAST(2.00 AS Decimal(10, 2)), 1, N'Wave.png', N'All 100% genuine Honda and Yamaha vehicles.', 30)
INSERT [dbo].[Vehicles] ([VehicleID], [TypeID], [Brand], [Model], [Year], [Color], [DailyRate], [Availability], [Images], [Describe], [Price]) VALUES (7, 2, N'Honda', N'ABL 2021', 2012, N'yellow', CAST(3.00 AS Decimal(10, 2)), 1, N'abl.png', N'All 100% genuine Honda and Yamaha vehicles.', 40)
INSERT [dbo].[Vehicles] ([VehicleID], [TypeID], [Brand], [Model], [Year], [Color], [DailyRate], [Availability], [Images], [Describe], [Price]) VALUES (9, 1, N'Yamaha', N'R15', 2012, N'black', CAST(3.00 AS Decimal(10, 2)), 1, N'R15BL.png', N'All 100% genuine Honda and Yamaha vehicles.', 50)
INSERT [dbo].[Vehicles] ([VehicleID], [TypeID], [Brand], [Model], [Year], [Color], [DailyRate], [Availability], [Images], [Describe], [Price]) VALUES (11, 1, N'Yamaha', N'R1', 2012, N'red', CAST(1.00 AS Decimal(10, 2)), 1, N'R1.png', N'All 100% genuine Honda and Yamaha vehicles.', 20)
INSERT [dbo].[Vehicles] ([VehicleID], [TypeID], [Brand], [Model], [Year], [Color], [DailyRate], [Availability], [Images], [Describe], [Price]) VALUES (12, 1, N'Yamaha', N'R6', 2018, N'red', CAST(1.00 AS Decimal(10, 2)), 1, N'R6.png', N'All 100% genuine Honda and Yamaha vehicles.', 20)
INSERT [dbo].[Vehicles] ([VehicleID], [TypeID], [Brand], [Model], [Year], [Color], [DailyRate], [Availability], [Images], [Describe], [Price]) VALUES (18, 3, N'Yamaha', N'MT15', 2018, N'red', CAST(1.00 AS Decimal(10, 2)), 1, N'MT15.png', N'All 100% genuine Honda and Yamaha vehicles.', 20)
INSERT [dbo].[Vehicles] ([VehicleID], [TypeID], [Brand], [Model], [Year], [Color], [DailyRate], [Availability], [Images], [Describe], [Price]) VALUES (19, 1, N'Yamaha', N'Z1000', 2023, N'red', CAST(5.00 AS Decimal(10, 2)), 1, N'Z1000.png', N'All 100% genuine Honda and Yamaha vehicles.', 20)
INSERT [dbo].[Vehicles] ([VehicleID], [TypeID], [Brand], [Model], [Year], [Color], [DailyRate], [Availability], [Images], [Describe], [Price]) VALUES (20, 1, N'Honda', N'Z800', 2018, N'red', CAST(1.00 AS Decimal(10, 2)), 1, N'Z800.png', N'All 100% genuine Honda and Yamaha vehicles.', 20)
INSERT [dbo].[Vehicles] ([VehicleID], [TypeID], [Brand], [Model], [Year], [Color], [DailyRate], [Availability], [Images], [Describe], [Price]) VALUES (21, 1, N'Honda', N'CBR1000', 2018, N'red', CAST(1.00 AS Decimal(10, 2)), 1, N'CBR1000.png', N'All 100% genuine Honda and Yamaha vehicles.', 20)
INSERT [dbo].[Vehicles] ([VehicleID], [TypeID], [Brand], [Model], [Year], [Color], [DailyRate], [Availability], [Images], [Describe], [Price]) VALUES (22, 1, N'Honda', N'CBR600', 2018, N'red', CAST(1.00 AS Decimal(10, 2)), 1, N'CBR600.png', N'All 100% genuine Honda and Yamaha vehicles.', 20)
SET IDENTITY_INSERT [dbo].[Vehicles] OFF
GO
SET IDENTITY_INSERT [dbo].[VehicleTypes] ON 

INSERT [dbo].[VehicleTypes] ([TypeID], [TypeName]) VALUES (1, N'motor')
INSERT [dbo].[VehicleTypes] ([TypeID], [TypeName]) VALUES (2, N'xe ga')
INSERT [dbo].[VehicleTypes] ([TypeID], [TypeName]) VALUES (3, N'xe so')
SET IDENTITY_INSERT [dbo].[VehicleTypes] OFF
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicles] ([VehicleID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Users]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Vehicles] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicles] ([VehicleID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Vehicles]
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD FOREIGN KEY([TypeID])
REFERENCES [dbo].[VehicleTypes] ([TypeID])
GO
