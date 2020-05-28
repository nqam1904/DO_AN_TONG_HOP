
create function [dbo].[func_CryptData] (@Data varchar(100))
returns varchar(256)
as
begin
return convert(varchar(256),HASHBYTES('SHA2_256',@Data),2)
end
GO
/****** Object:  Table [dbo].[BILL]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILL](
	[idBill] [int] IDENTITY(1,1) NOT NULL,
	[idCustom] [int] NOT NULL,
	[idUserNV] [int] NOT NULL,
	[idBuild] [int] NOT NULL,
	[totalPrice] [int] NULL,
	[createDate] [datetime] NULL,
	[content] [ntext] NULL,
	[cmndTruoc] [nvarchar](55) NULL,
	[cmndSau] [nvarchar](55) NULL,
	[ngayKyTen] [datetime] NULL,
	[kyten] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[idBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BUILDING]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BUILDING](
	[idBuild] [int] IDENTITY(1,1) NOT NULL,
	[idWard] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[idType] [int] NOT NULL,
	[nameBuild] [nvarchar](55) NULL,
	[street] [nvarchar](55) NULL,
	[floorarea] [decimal](18, 0) NULL,
	[floor] [int] NULL,
	[conent] [ntext] NULL,
	[price] [decimal](18, 0) NULL,
	[depositDate] [nvarchar](50) NULL,
	[nameManager] [nvarchar](55) NULL,
	[phoneManager] [nvarchar](12) NULL,
	[idHuong] [int] NULL,
	[idStatus] [int] NULL,
	[deposits] [nvarchar](50) NULL,
 CONSTRAINT [PK__BUILDING__609ABD04CFA23A7A] PRIMARY KEY CLUSTERED 
(
	[idBuild] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CITY]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CITY](
	[idCity] [int] IDENTITY(1,1) NOT NULL,
	[nameCity] [nvarchar](55) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[idCustom] [int] IDENTITY(1,1) NOT NULL,
	[nameCustom] [nvarchar](50) NULL,
	[phoneCustom] [nvarchar](12) NULL,
	[emailCustom] [nvarchar](50) NULL,
	[addressCustom] [nvarchar](50) NULL,
 CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[idCustom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DISTRICT]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DISTRICT](
	[idDistrict] [int] IDENTITY(1,1) NOT NULL,
	[nameDistrict] [nvarchar](55) NULL,
	[idCity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDistrict] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HUONG]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HUONG](
	[idHuong] [int] IDENTITY(1,1) NOT NULL,
	[nameHuong] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HUONG] PRIMARY KEY CLUSTERED 
(
	[idHuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IMAGE]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGE](
	[idImage] [int] IDENTITY(1,1) NOT NULL,
	[nameImage] [nvarchar](50) NULL,
	[idBuild] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idImage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NEWS]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEWS](
	[idNews] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[titleNews] [nvarchar](200) NULL,
	[Description] [ntext] NULL,
	[createDate] [datetime] NULL,
	[Img] [nvarchar](250) NULL,
 CONSTRAINT [PK__NEWS__ABB4148F684B84FD] PRIMARY KEY CLUSTERED 
(
	[idNews] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHIEUHEN]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUHEN](
	[idPhieu] [int] IDENTITY(1,1) NOT NULL,
	[idCustom] [int] NOT NULL,
	[idUserNV] [int] NOT NULL,
	[idBuild] [int] NOT NULL,
	[contentPhieu] [nvarchar](255) NULL,
	[createPhieu] [datetime] NULL,
	[ngayhen] [datetime] NULL,
 CONSTRAINT [PK__PHIEUHEN__DF4093D8842436AD] PRIMARY KEY CLUSTERED 
(
	[idPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ROLE]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLE](
	[idRole] [int] IDENTITY(1,1) NOT NULL,
	[nameRole] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SER_BUILD]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SER_BUILD](
	[idService] [int] NOT NULL,
	[idBuild] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idService] ASC,
	[idBuild] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SERVICES]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SERVICES](
	[idService] [int] IDENTITY(1,1) NOT NULL,
	[typeService] [nvarchar](22) NULL,
	[nameService] [nvarchar](55) NULL,
PRIMARY KEY CLUSTERED 
(
	[idService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STATUS]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STATUS](
	[idStatus] [int] IDENTITY(1,1) NOT NULL,
	[nameStatuts] [nvarchar](50) NULL,
 CONSTRAINT [PK_STATUS] PRIMARY KEY CLUSTERED 
(
	[idStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TYPE]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TYPE](
	[idType] [int] IDENTITY(1,1) NOT NULL,
	[nameType] [nvarchar](55) NULL,
PRIMARY KEY CLUSTERED 
(
	[idType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USER]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[idRole] [int] NOT NULL,
	[userName] [nvarchar](50) NULL,
	[userPassword] [nvarchar](300) NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](55) NULL,
	[Phone] [nvarchar](12) NULL,
	[Address] [nvarchar](55) NULL,
 CONSTRAINT [PK__USER__3717C98241A4D881] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WARD]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WARD](
	[idWard] [int] IDENTITY(1,1) NOT NULL,
	[nameWard] [nvarchar](255) NULL,
	[idDistrict] [int] NOT NULL,
 CONSTRAINT [PK__WARD__9B850F606D67F0CB] PRIMARY KEY CLUSTERED 
(
	[idWard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BUILDING] ON 

GO
INSERT [dbo].[BUILDING] ([idBuild], [idWard], [idUser], [idType], [nameBuild], [street], [floorarea], [floor], [conent], [price], [depositDate], [nameManager], [phoneManager], [idHuong], [idStatus], [deposits]) VALUES (7, 116, 31, 5, N'CENTER POINT', N'Nguyễn Văn Trỗi', CAST(300 AS Decimal(18, 0)), 12, N'<p>Văn ph&ograve;ng cho thu&ecirc; CentrePoint Tower, Call 090.268.5050 - 090.268.5051. To&agrave; nh&agrave; Centre Point toạ lạc số 106 Nguyễn Văn Trỗi, quận Ph&uacute; Nhuận, tr&ecirc;n trục đường ch&iacute;nh nối trung t&acirc;m th&agrave;nh phố v&agrave; s&acirc;n bay T&acirc;n Sơn Nhất.<br />
<br />
Th&ocirc;ng tin to&agrave; nh&agrave;: CentrePoint Tower<br />
Vị tr&iacute;: 106 Nguyễn Văn Trỗi, quận Ph&uacute; Nhuận<br />
Cấu tr&uacute;c: 2 hầm &ndash; 1 trệt &ndash; 15 tầng &ndash; 8 Thang m&aacute;y<br />
Diện t&iacute;ch s&agrave;n: 500 m2/tầng cao - 900m2/tầng thấp<br />
Diện t&iacute;ch cho thu&ecirc;: 131m2 - 166m2 - 178m2 - 220m2 - 411m2 - 516m2<br />
Chiều cao trần: 2,6m<br />
<br />
- Gi&aacute; cho thu&ecirc;: 22 USD /m2<br />
- Ph&iacute; dịch vụ: 5 USD /m2<br />
- Thuế GTGT: 10%<br />
- Tiền điện: c&oacute; đồng hồ ri&ecirc;ng, t&iacute;nh theo gi&aacute; Nh&agrave; nước<br />
- Điện lạnh: Đ&atilde; bao gồm trong ph&iacute; dịch vụ.<br />
- Ph&iacute; l&agrave;m th&ecirc;m giờ ngo&agrave;i giờ: Theo thực tế ph&aacute;t sinh/thỏa thuận<br />
- Ph&iacute; gửi xe: 215,000 VND/xe m&aacute;y/th&aacute;ng - 3,225,000 VND/xe &ocirc;t&ocirc;/th&aacute;ng<br />
<br />
Đi&ecirc;̀u ki&ecirc;̣n thu&ecirc;:<br />
- Hợp đồng cho thu&ecirc; tối thiểu: 2 năm<br />
- Tiền cọc v&agrave; thanh to&aacute;n: 3 th&aacute;ng - Thanh to&aacute;n Linh động<br />
- Thời gian b&agrave;n giao: B&agrave;n giao mặt bằng ngay<br />
- Thời gian thi c&ocirc;ng nội thất: 15-30 ng&agrave;y<br />
- Ph&iacute; l&agrave;m việc ngo&agrave;i giờ: Theo thực tế ph&aacute;t sinh<br />
<br />
C&Aacute;C DỊCH VỤ BAO GỒM TRONG PH&Iacute; QUẢN L&Yacute;<br />
- Điện phục vụ m&aacute;y lạnh trong giờ l&agrave;m việc<br />
- Nh&acirc;n vi&ecirc;n lễ t&acirc;n<br />
- Bảo vệ 24/24<br />
- Nh&acirc;n vi&ecirc;n vệ sinh chung<br />
- Thang m&aacute;y<br />
- Điện chiếu s&aacute;ng khu vực c&ocirc;ng cộng<br />
- Bảo tr&igrave; thang m&aacute;y.<br />
- Bảo tr&igrave; khu vực c&ocirc;ng cộng.<br />
- Diệt c&ocirc;n tr&ugrave;ng khu vực c&ocirc;ng cộng<br />
- Nước sinh hoạt<br />
<br />
C&Aacute;C DỊCH VỤ KH&Ocirc;NG BAO GỒM TRONG PH&Iacute; QUẢN L&Yacute;:<br />
- Điện ti&ecirc;u thụ tại Khu vực thu&ecirc;.<br />
- Chi ph&iacute; điện thoại bao gồm cả chi ph&iacute; lắp đặt điện thoại.<br />
- Dọn dẹp b&ecirc;n trong Khu vực thu&ecirc;.<br />
- To&agrave;n bộ c&aacute;c bảo tr&igrave; v&agrave; ti&ecirc;u thụ b&ecirc;n trong Khu vực thu&ecirc;.<br />
- Chi ph&iacute; điều h&ograve;a kh&ocirc;ng kh&iacute; ngo&agrave;i giờ l&agrave;m việc.<br />
- Điện thoại, Dịch vụ ADSL...<br />
<br />
Chi tiết xin vui l&ograve;ng li&ecirc;n hệ:<br />
Ph&ograve;ng kinh doanh nh&agrave; v&agrave; cho thu&ecirc;<br />
Mr.Trường - 090.268.5050 - 090.268.5051<br />
<br />
CentrePoint Tower l&agrave; t&ograve;a nh&agrave; văn ph&ograve;ng xanh đầu ti&ecirc;n của Việt Nam, l&agrave; t&ograve;a nh&agrave; th&acirc;n thiện với m&ocirc;i trường, được thiết kế gi&uacute;p tiết kiệm đến 30% lượng điện năng ti&ecirc;u thụ, giảm thiểu c&aacute;c t&aacute;c động &ocirc; nhiễm m&ocirc;i trường v&agrave; kh&iacute; thải carbonic đến 20% với c&aacute;c t&ograve;a nh&agrave; c&oacute; c&ugrave;ng diện t&iacute;ch. Theo ti&ecirc;u ch&iacute; &quot;xanh&quot;, 80% diện t&iacute;ch t&ograve;a nh&agrave; sẽ tiếp nhận &aacute;nh s&aacute;ng ho&agrave;n to&agrave;n tự nhi&ecirc;n cũng do c&aacute;c giải ph&aacute;p về kiến tr&uacute;c mang lại.</p>
', CAST(2000000 AS Decimal(18, 0)), N'24', N'Huy', N'090889983', 5, 1, N'3')
GO
INSERT [dbo].[BUILDING] ([idBuild], [idWard], [idUser], [idType], [nameBuild], [street], [floorarea], [floor], [conent], [price], [depositDate], [nameManager], [phoneManager], [idHuong], [idStatus], [deposits]) VALUES (8, 3, 31, 3, N'President Place Tower', N'Nguyễn Du', CAST(100 AS Decimal(18, 0)), 12, N'<p>chưa c&oacute;</p>
', CAST(2000000 AS Decimal(18, 0)), N'48', N'huy', N'075432345678', 2, 1, N'3')
GO
INSERT [dbo].[BUILDING] ([idBuild], [idWard], [idUser], [idType], [nameBuild], [street], [floorarea], [floor], [conent], [price], [depositDate], [nameManager], [phoneManager], [idHuong], [idStatus], [deposits]) VALUES (9, 124, 32, 1, N'Sun Building', N'Thảo Điền ', CAST(300 AS Decimal(18, 0)), 2, N'<ul>
	<li>T&ograve;a cao ốc&nbsp;<em><a href="https://vlook.vn/property-location/cho-thue-van-phong-quan-2/">cho thu&ecirc; văn ph&ograve;ng&nbsp;quận 2</a>&nbsp;<strong>THE SUN BUILDING</strong></em>&nbsp;ph&ugrave; hợp&nbsp;cho mọi nhu cầu t&igrave;m thu&ecirc; văn ph&ograve;ng của c&aacute;c c&ocirc;ng ty vừa v&agrave; nhỏ.&nbsp;T&ograve;a nh&agrave;&nbsp;<em>cho thu&ecirc; văn ph&ograve;ng quận 2</em>&nbsp;<strong>THE SUN BUILDING</strong>&nbsp;được thiết kế theo phong c&aacute;ch năng động hiện đại, t&ograve;a nh&agrave; được trang bị c&aacute;c tiện nghi linh hoạt, mang t&iacute;nh ứng dụng cao.</li>
</ul>

<ul>
	<li>T&ograve;a cao ốc&nbsp;<em>cho thu&ecirc; văn ph&ograve;ng&nbsp;quận 2&nbsp;<strong>THE SUN BUILDING</strong></em>&nbsp;được trang bị những tiện nghi cao cấp đ&aacute;p ứng trọn vẹn nhu cầu của kh&aacute;ch thu&ecirc; như hệ thống m&aacute;y lạnh, camera CCTV quan s&aacute;t 24/24, hệ thống b&aacute;o kh&oacute;i v&agrave; chữa ch&aacute;y, hệ thống toilet nam nữ ri&ecirc;ng biệt&hellip;T&ograve;a cao ốc&nbsp;<strong>THE SUN BUILDING</strong><strong>&nbsp;</strong>c&ograve;n cung cấp đường d&acirc;y internet tốc độ cao, đường d&acirc;y điện thoại cho từng văn ph&ograve;ng.</li>
</ul>

<ul>
	<li>T&ograve;a cao ốc&nbsp;<em><strong><a href="https://vlook.vn/property-location/cho-thue-van-phong-quan-2/">cho thu&ecirc; văn ph&ograve;ng quận 2</a></strong></em><em>&nbsp;<strong>THE SUN BUILDING</strong></em>&nbsp;thực hiện việc phun thuốc diệt c&ocirc;n tr&ugrave;ng định kỳ, thu gom r&aacute;c văn ph&ograve;ng v&agrave; r&aacute;c vệ sinh h&agrave;ng ng&agrave;y để&nbsp;đảm bảo m&ocirc;i trường l&agrave;m việc lu&ocirc;n sạch sẽ v&agrave; an to&agrave;n.&nbsp;B&ecirc;n cạnh đ&oacute;, dịch vụ lễ t&acirc;n c&ugrave;ng ban bảo vệ t&ograve;a nh&agrave; th&acirc;n thiện, vui vẻ l&agrave; một trong những điểm cộng của t&ograve;a&nbsp;<em>cao ốc cho thu&ecirc; văn ph&ograve;ng quận 2&nbsp;<strong>THE SUN BUILDING.</strong></em></li>
</ul>

<ul>
	<li>T&ograve;a cao ốc&nbsp;<em>cho thu&ecirc; văn ph&ograve;ng&nbsp;quận 2</em>&nbsp;<strong>THE SUN BUILDING</strong>&nbsp;được xếp hạng&nbsp;<strong>C</strong>,&nbsp;với vẻ ngo&agrave;i tinh tế, độc đ&aacute;o, vị tr&iacute; đầy hứa hẹn&nbsp;c&ugrave;ng những tiện nghi ph&ugrave; hợp với việc cho thu&ecirc; văn ph&ograve;ng&nbsp;hứa hẹn sẽ g&oacute;p phần kh&ocirc;ng nhỏ v&agrave;o sự th&agrave;nh c&ocirc;ng của qu&yacute; doanh nghiệp.</li>
</ul>

<p>&nbsp;</p>

<h2><strong>III. TH&Ocirc;NG TIN CHI TIẾT VĂN PH&Ograve;NG CHO THU&Ecirc; THE SUN BUILDING:</strong></h2>

<p>&nbsp;</p>

<p>&nbsp; &nbsp; &nbsp;Cao ốc&nbsp;<em>cho thu&ecirc; văn ph&ograve;ng&nbsp;quận 2 Đường số 66&nbsp;</em>&ndash;&nbsp;<strong>THE SUN BUILDING</strong></p>

<ul>
	<li>Địa chỉ:&nbsp;<em>Đường số 66</em>, Phường&nbsp;Thảo Điền, Quận 2, TP HCM</li>
	<li>Kết cấu: 1 Trệt &ndash; 4 Tầng &ndash; 1 Thang bộ</li>
	<li>Diện t&iacute;ch s&agrave;n: xấp xỉ 105 m2</li>
	<li>Tổng diện t&iacute;ch: gần 500 m2</li>
	<li>Diện t&iacute;ch cho thu&ecirc;:&nbsp;<strong>40 &ndash; 60 &ndash; 75 &ndash; 85 &ndash;100 &ndash; 110 &ndash; 500 m2</strong></li>
	<li>Gi&aacute; cho thu&ecirc;:&nbsp;<strong>15 USD /m2</strong></li>
	<li>Ph&iacute; dịch vụ:&nbsp;<strong>0 USD /m2</strong></li>
	<li>Thuế GTGT: Chưa bao gồm 10%</li>
	<li>Ph&iacute; giữ xe:&nbsp;<strong>150.000đ</strong>&nbsp;/xe m&aacute;y /th&aacute;ng.&nbsp;<strong>Miễn ph&iacute; gửi &ocirc; t&ocirc;</strong>.</li>
	<li>Tiền nước: Miễn ph&iacute;</li>
	<li>Tiền điện: Đồng hồ ri&ecirc;ng. Đơn gi&aacute; 3.800đ /Kwh.</li>
	<li>Ph&iacute; ngo&agrave;i giờ:&nbsp;<strong>500đ /m2 /h</strong></li>
	<li>Thời gian thiết kế văn ph&ograve;ng: Miễn ph&iacute; từ&nbsp;<strong>7</strong>&nbsp;ng&agrave;y đến&nbsp;<strong>30</strong>&nbsp;ng&agrave;y, t&ugrave;y diện t&iacute;ch</li>
	<li>Đặt cọc:&nbsp;<strong>3</strong>&nbsp;th&aacute;ng</li>
	<li>Thanh to&aacute;n: theo&nbsp;th&aacute;ng</li>
	<li>Thời gian thu&ecirc;: tối thiểu&nbsp;<strong>2</strong>&nbsp;năm</li>
</ul>

<p><strong>Lưu &yacute;</strong>: Diện t&iacute;ch v&agrave; Gi&aacute; thu&ecirc; c&oacute; thể thay đổi theo từng thời điểm</p>

<p>&nbsp;</p>

<p>Qu&yacute; kh&aacute;ch c&oacute; nhu cầu t&igrave;m cao ốc&nbsp;<a href="https://vlook.vn/"><em><strong>cho thu&ecirc; văn ph&ograve;ng TP.HCM</strong></em></a>&nbsp;&ndash;&nbsp;<strong>THE SUN BUILDING</strong>&nbsp;vui l&ograve;ng li&ecirc;n hệ với BQL để được tư vấn v&agrave; hướng dẫn tham quan văn ph&ograve;ng.&nbsp;Ch&uacute;ng t&ocirc;i rất vinh dự được g&oacute;p một phần nhỏ v&agrave;o sự th&agrave;nh c&ocirc;ng của qu&yacute; c&ocirc;ng ty.</p>
', CAST(20000000 AS Decimal(18, 0)), N'24', N'Minh', N'0344558877', 6, 2, N'3')
GO
INSERT [dbo].[BUILDING] ([idBuild], [idWard], [idUser], [idType], [nameBuild], [street], [floorarea], [floor], [conent], [price], [depositDate], [nameManager], [phoneManager], [idHuong], [idStatus], [deposits]) VALUES (10, 145, 34, 1, N'3G BUILDING 1', N'Võ Văn Tần', CAST(378 AS Decimal(18, 0)), 11, N'<ul>
	<li>T&ograve;a nh&agrave;&nbsp;<em><a href="https://vlook.vn/property-location/cho-thue-van-phong-quan-3/">cho thu&ecirc; văn ph&ograve;ng quận 3</a>&nbsp;</em><strong>3G Building&nbsp;</strong>tọa lạc tại tuyến đường sầm uất bậc nhất khu vực &ndash; đường&nbsp;<em>V&otilde; Văn Tần,</em>&nbsp;Phường 5. Đường&nbsp;<em>V&otilde; Văn Tần</em>&nbsp;l&agrave; trục đường ch&iacute;nh nối liền giao th&ocirc;ng c&aacute;c&nbsp;<strong><em><a href="https://vlook.vn/property-location/cho-thue-van-phong-quan-1/">Quận 1</a></em></strong>&nbsp;&ndash; Quận 3 &ndash;&nbsp;<strong><em><a href="https://vlook.vn/property-location/cho-thue-van-phong-quan-10/">Quận 10</a></em></strong>,&nbsp;với nhiều hoạt động kinh doanh v&agrave; giao thương diễn ra kh&aacute; s&ocirc;i nổi.</li>
</ul>

<ul>
	<li>Tuyến đường&nbsp;<em>V&otilde; Văn Tần</em>&nbsp;n&oacute;i ri&ecirc;ng cũng như khu vực Quận 3&nbsp;n&oacute;i chung được đ&aacute;nh gi&aacute; l&agrave; khu trung t&acirc;m kinh tế t&agrave;i ch&iacute;nh mới của th&agrave;nh phố với đầy đủ c&aacute;c loại h&igrave;nh dịch vụ&nbsp;như bệnh viện lớn, trường học, khu phố ăn uống, kh&aacute;ch sạn lớn&hellip;&nbsp;Việc đặt văn ph&ograve;ng tại t&ograve;a cao ốc&nbsp;<em>cho thu&ecirc; văn ph&ograve;ng Quận 3</em>&nbsp;<strong>3G Building</strong><strong>&nbsp;</strong>gi&uacute;p kh&aacute;ch thu&ecirc; dễ d&agrave;ng trong việc đ&aacute;p ứng c&aacute;c nhu cầu ẩm thực, mua sắm, giải tr&iacute;&hellip;</li>
</ul>
', CAST(3700000 AS Decimal(18, 0)), N'24', N'Đạt', N'0877766655', 7, 1, N'3')
GO
INSERT [dbo].[BUILDING] ([idBuild], [idWard], [idUser], [idType], [nameBuild], [street], [floorarea], [floor], [conent], [price], [depositDate], [nameManager], [phoneManager], [idHuong], [idStatus], [deposits]) VALUES (11, 141, 31, 1, N'Agrex Building', N'Võ Văn Tần', CAST(369 AS Decimal(18, 0)), 7, N'<ul>
	<li>T&ograve;a nh&agrave; cao ốc văn ph&ograve;ng cho thu&ecirc;&nbsp;<a href="https://vlook.vn/van-phong-cho-thue/agrex-building-cho-thue-van-phong-quan-3/"><strong>Agrex&nbsp;Building</strong></a>&nbsp;tọa lạc&nbsp;gần giao lộ V&otilde; Văn Tần &ndash; Trương Định,&nbsp;ngay trung t&acirc;m Quận 3 v&agrave; được đ&aacute;nh gi&aacute; l&agrave; một trong những vị tr&iacute; đắc địa trong khu vực</li>
</ul>

<ul>
	<li>B&ecirc;n cạnh những lợi thế về tiện &iacute;ch c&ocirc;ng cộng, cao ốc Agrex Tower được thiết kế hiện đại, c&ocirc;ng năng hợp l&yacute;, sử dụng những thiết bị cao cấp, hiện đại nhằm đ&aacute;p ứng v&agrave; phục vụ tối đa nhu cầu thu&ecirc; văn ph&ograve;ng của c&aacute;c doanh nghiệp trong v&agrave; ngo&agrave;i nước.</li>
</ul>
', CAST(3000000 AS Decimal(18, 0)), N'24', N'Liên hệ', N'0339988773', 3, 3, N'3')
GO
INSERT [dbo].[BUILDING] ([idBuild], [idWard], [idUser], [idType], [nameBuild], [street], [floorarea], [floor], [conent], [price], [depositDate], [nameManager], [phoneManager], [idHuong], [idStatus], [deposits]) VALUES (12, 218, 31, 1, N'REMAX PLAZA', N'Phạm Đình Hổ', CAST(900 AS Decimal(18, 0)), 28, N'<ul>
	<li>T&ograve;a cao ốc<strong><em><a href="https://vlook.vn/property-location/cho-thue-van-phong-quan-6/">cho thu&ecirc; văn ph&ograve;ng Quận 6</a></em>&nbsp;Remax Plaza&nbsp;</strong>được đ&aacute;nh gi&aacute; cao nhờ v&agrave;o vị tr&iacute; đắc địa, thuận tiện lưu th&ocirc;ng ra trung t&acirc;m quận 10, quận 11 v&agrave; quận 5, quận T&acirc;n Ph&uacute; v&agrave; B&igrave;nh Ch&aacute;nh.</li>
</ul>

<ul>
	<li>B&ecirc;n cạnh đ&oacute;, t&ograve;a cao ốc&nbsp;<em>văn ph&ograve;ng cho thu&ecirc;</em>&nbsp;<strong>Remax Plaza</strong><strong>&nbsp;</strong>với gi&aacute; thu&ecirc; hợp l&yacute; c&ugrave;ng diện t&iacute;ch cho thu&ecirc; đa dạng đ&atilde; trở th&agrave;nh lựa chọn kh&ocirc;ng thể bỏ qua đối với c&aacute;c doanh nghiệp đang t&igrave;m kiếm&nbsp;<em>văn ph&ograve;ng cho thu&ecirc;</em>&nbsp;tại quận 6. Với vị tr&iacute; đắc địa nằm gần trung t&acirc;m thương mại, t&agrave;i ch&iacute;nh, v&agrave; cũng l&agrave; cửa ng&otilde; v&agrave;o th&agrave;nh phố Hồ Ch&iacute; Minh; cao ốc&nbsp;<em>cho thu&ecirc; văn ph&ograve;ng quận 6</em>&nbsp;<strong>Remax Plaza</strong>&nbsp;hứa hẹn sẽ l&agrave; trụ sở l&agrave;m việc l&yacute; tưởng, mở ra&nbsp;nhiều cơ hội hợp t&aacute;c kinh doanh cũng như g&oacute;p phần đ&aacute;nh b&oacute;ng t&ecirc;n tuổi của c&aacute;c doanh nghiệp chọn thu&ecirc; văn ph&ograve;ng tại đ&acirc;y.</li>
</ul>
', CAST(2300000 AS Decimal(18, 0)), N'48', N'Khang', N'022344566', 4, 1, N'3')
GO
INSERT [dbo].[BUILDING] ([idBuild], [idWard], [idUser], [idType], [nameBuild], [street], [floorarea], [floor], [conent], [price], [depositDate], [nameManager], [phoneManager], [idHuong], [idStatus], [deposits]) VALUES (13, 80, 34, 1, N'LANDMARK 81', N'208 Nguyễn Hữu Cảnh ', CAST(461 AS Decimal(18, 0)), 81, N'<p>Landmark 81, t&ecirc;n ch&iacute;nh thức Vincom Landmark 81, l&agrave; một t&ograve;a nh&agrave; chọc trời trong tổ hợp dự &aacute;n Vinhomes Central Park, một dự &aacute;n c&oacute; tổng mức đầu tư khoảng 300 triệu USD, do C&ocirc;ng ty Cổ phần Đầu tư x&acirc;y dựng T&acirc;n Li&ecirc;n Ph&aacute;t thuộc Vingroup l&agrave;m chủ đầu tư.</p>
', CAST(10000000000 AS Decimal(18, 0)), N'24', N'Phạm Nhựt Vượng', N'0909909909', 5, 1, N'4')
GO
SET IDENTITY_INSERT [dbo].[BUILDING] OFF
GO
SET IDENTITY_INSERT [dbo].[CITY] ON 

GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (1, N'An Giang')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (2, N'Bạc Liêu')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (3, N'Bến Tre')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (4, N'Cà Mau')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (5, N'Cần Thơ')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (6, N'Đồng Tháp')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (7, N'Hậu Giang')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (8, N'Kiên Giang')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (9, N'Long An')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (10, N'Sóc Trăng')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (11, N'Tiền Giang')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (12, N'Trà Vinh')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (13, N'Vĩnh Long')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (14, N'TP Hồ Chí Minh')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (15, N'Bà Rịa Vũng Tàu')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (16, N'Bình Dương')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (17, N'Bình Phước')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (18, N'Đồng Nai')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (19, N'Tây Ninh')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (20, N'Hòa Bình')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (21, N'Sơn La')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (22, N'Điện Biên')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (23, N'Lai Châu')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (24, N'Lào Cai')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (25, N'Yên Bái')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (26, N'Phú Thọ')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (27, N'Hà Giang')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (28, N'Tuyên Quang')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (29, N'Cao Bằng')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (30, N'Bắc Kạn')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (31, N'Thái Nguyên')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (32, N'Lạng Sơn')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (33, N'Bắc Giang')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (34, N'Quảng Ninh')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (35, N'Hà Nội')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (36, N'Bắc Ninh')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (37, N'Hà Nam')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (38, N'Hải Dương')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (39, N'Hải Phòng')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (40, N'Hưng Yên')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (41, N'Nam Định')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (42, N'Thái Bình')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (43, N'Vĩnh Phúc')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (44, N'Ninh Bình')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (45, N'Thanh Hóa')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (46, N'Nghệ An')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (47, N'Hà Tĩnh')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (48, N'Quảng Bình')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (49, N'Quảng Trị')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (50, N'Thừa Thiên Huế')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (51, N'Đà Nẵng')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (52, N'Quảng Nam')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (53, N'Quảng Ngãi')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (54, N'Bình Định')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (55, N'Phú Yên')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (56, N'Khánh Hòa')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (57, N'Ninh Thuận')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (58, N'Bình Thuận')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (59, N'Kon Tum')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (60, N'Gia Lai')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (61, N'Đắk Lắk')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (62, N'Đắk Nông')
GO
INSERT [dbo].[CITY] ([idCity], [nameCity]) VALUES (63, N'Lâm Đồng')
GO
SET IDENTITY_INSERT [dbo].[CITY] OFF
GO
SET IDENTITY_INSERT [dbo].[CUSTOMER] ON 

GO
INSERT [dbo].[CUSTOMER] ([idCustom], [nameCustom], [phoneCustom], [emailCustom], [addressCustom]) VALUES (1, N'Phạm Ngọc Vinh', N'0707743501', N'vinhpham@gmail.com', N'thủ đức')
GO
INSERT [dbo].[CUSTOMER] ([idCustom], [nameCustom], [phoneCustom], [emailCustom], [addressCustom]) VALUES (2, N'Trần Minh Tuấn', N'0788773852', N'tuan1491998@gmail.com', N'Bình Thạnh')
GO
INSERT [dbo].[CUSTOMER] ([idCustom], [nameCustom], [phoneCustom], [emailCustom], [addressCustom]) VALUES (12, N'Nghiêm Quốc Anh Minh', N'0339895154', N'nghiemminh1904@gmail.com', N'thủ đức')
GO
INSERT [dbo].[CUSTOMER] ([idCustom], [nameCustom], [phoneCustom], [emailCustom], [addressCustom]) VALUES (13, N'Lý Nguyễn Thanh Tuấn', N'0933812192', N'lynguyenthanhtuan@gmail.com', N'quận 4')
GO
INSERT [dbo].[CUSTOMER] ([idCustom], [nameCustom], [phoneCustom], [emailCustom], [addressCustom]) VALUES (14, N'Nguyễn Hoàng Phong', N'0962087540', N'hpnguyen545@gmail.com', N'Hóc Môn')
GO
INSERT [dbo].[CUSTOMER] ([idCustom], [nameCustom], [phoneCustom], [emailCustom], [addressCustom]) VALUES (15, N' Vòng Phước Thịnh', N'0364561756', N'vpthinh1998@gmail.com', N'Tân binh')
GO
INSERT [dbo].[CUSTOMER] ([idCustom], [nameCustom], [phoneCustom], [emailCustom], [addressCustom]) VALUES (16, N'Trần Văn Quang', N'0333847733', N'Quangnguyenvanquang8698@gmail.com', N'Biên Hòa')
GO
SET IDENTITY_INSERT [dbo].[CUSTOMER] OFF
GO
SET IDENTITY_INSERT [dbo].[DISTRICT] ON 

GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (23, N'Quận 1', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (24, N'Quận 2', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (25, N'Quận 3', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (26, N'Quận 4', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (27, N'Quận 5', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (28, N'Quận 6', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (29, N'Quận 7', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (30, N'Quận 8', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (31, N'Quận 9', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (32, N'Quận 10', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (33, N'Quận 11', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (34, N'Quận 12', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (35, N'Bình Thạnh', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (36, N'Bình Chánh', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (37, N'Bình Tân', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (38, N'Thủ Đức', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (39, N'Phú Nhuận', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (40, N'Tân Bình', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (41, N'Tân Phú', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (42, N'Gò Vấp', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (43, N'Hóc Môn', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (44, N'Củ Chi', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (46, N'Nhà Bè', 14)
GO
INSERT [dbo].[DISTRICT] ([idDistrict], [nameDistrict], [idCity]) VALUES (47, N'Cần Giờ', 14)
GO
SET IDENTITY_INSERT [dbo].[DISTRICT] OFF
GO
SET IDENTITY_INSERT [dbo].[HUONG] ON 

GO
INSERT [dbo].[HUONG] ([idHuong], [nameHuong]) VALUES (1, N'Tây')
GO
INSERT [dbo].[HUONG] ([idHuong], [nameHuong]) VALUES (2, N'Nam')
GO
INSERT [dbo].[HUONG] ([idHuong], [nameHuong]) VALUES (3, N'Bắc')
GO
INSERT [dbo].[HUONG] ([idHuong], [nameHuong]) VALUES (4, N'Đông')
GO
INSERT [dbo].[HUONG] ([idHuong], [nameHuong]) VALUES (5, N'Đông Nam')
GO
INSERT [dbo].[HUONG] ([idHuong], [nameHuong]) VALUES (6, N'Đông Bắc')
GO
INSERT [dbo].[HUONG] ([idHuong], [nameHuong]) VALUES (7, N'Tây Nam')
GO
INSERT [dbo].[HUONG] ([idHuong], [nameHuong]) VALUES (8, N'Tây Bắc')
GO
SET IDENTITY_INSERT [dbo].[HUONG] OFF
GO
SET IDENTITY_INSERT [dbo].[IMAGE] ON 

GO
INSERT [dbo].[IMAGE] ([idImage], [nameImage], [idBuild]) VALUES (21, N'center point.jpg', 7)
GO
INSERT [dbo].[IMAGE] ([idImage], [nameImage], [idBuild]) VALUES (22, N'President-Place-2-MaisonOffice.jpg', 8)
GO
INSERT [dbo].[IMAGE] ([idImage], [nameImage], [idBuild]) VALUES (24, N'3g-building-cho-thue-van-phong-quan-3-02.jpg', 10)
GO
INSERT [dbo].[IMAGE] ([idImage], [nameImage], [idBuild]) VALUES (25, N'AGREX BUILDING.png', 11)
GO
INSERT [dbo].[IMAGE] ([idImage], [nameImage], [idBuild]) VALUES (28, N'REMAX_PLAZA.jpeg', 12)
GO
INSERT [dbo].[IMAGE] ([idImage], [nameImage], [idBuild]) VALUES (29, N'91065567_261645291666648_6162313033558261760_n.jpg', 10)
GO
INSERT [dbo].[IMAGE] ([idImage], [nameImage], [idBuild]) VALUES (32, N'van-phong-cho-thue-toa-nha-the-sun-building-4.jpg', 9)
GO
INSERT [dbo].[IMAGE] ([idImage], [nameImage], [idBuild]) VALUES (33, N'vinhomes-central-park-tan-cang-2019-3.jpg', 13)
GO
SET IDENTITY_INSERT [dbo].[IMAGE] OFF
GO
SET IDENTITY_INSERT [dbo].[NEWS] ON 

GO
INSERT [dbo].[NEWS] ([idNews], [idUser], [titleNews], [Description], [createDate], [Img]) VALUES (1, 1, N'5 kinh nghiệm nhất định phải biết khi tìm thuê văn phòng', N'<p>Thị trường BĐS Đ&agrave; Nẵng thời gian gần đ&acirc;y xuất hiện th&ocirc;ng tin c&aacute;c nh&agrave; đầu tư đang gom h&agrave;ng &quot;bắt đ&aacute;y&quot; để đợi thời cơ, chờ thị trường phục hồi. Thực hư của việc n&agrave;y ra sao? &quot;&Aacute;nh s&aacute;ng đ&atilde; thực sự xuất hiện ở cuối đường hầm&quot; hậu Covid-19?</p>

<h2><strong>Thị trường chỉ vừa khởi động lại</strong></h2>

<p>Biểu đồ tăng trưởng của thị trường bất động sản kh&ocirc;ng c&ograve;n nh&igrave;n thấy c&aacute;i t&ecirc;n &quot;Đ&agrave; Nẵng&quot; trong giai đoạn ảm đạm của thị trường k&eacute;o d&agrave;i từ nửa cuối năm ngo&aacute;i đến đầu năm nay. Theo đ&oacute;, d&ugrave; gi&aacute; giảm kh&aacute; s&acirc;u nhưng những điểm từng sốt n&oacute;ng v&agrave;o khoảng cuối 2018, đầu 2019 như khu T&acirc;y Bắc quận Li&ecirc;n Chiểu, H&ograve;a Xu&acirc;n hay huyện H&ograve;a Vang&hellip; chỉ xuất hiện l&aacute;c đ&aacute;c v&agrave;i giao dịch v&agrave; gần như kh&ocirc;ng thấy xuất hiện b&oacute;ng d&aacute;ng của c&aacute;c nh&agrave; đầu tư.&nbsp;&nbsp;</p>

<p>Kịch bản n&agrave;y tưởng như sẽ c&ograve;n tiếp tục k&eacute;o d&agrave;i khi &quot;cơn b&atilde;o&quot; Covid-19 k&eacute;o đến khiến thị trường Đ&atilde; Nẵng tạm thời &quot;ngủ đ&ocirc;ng&quot;. Tuy nhi&ecirc;n, khi lệnh gi&atilde;n c&aacute;ch x&atilde; hội được nới lỏng v&agrave;o cuối th&aacute;ng 4 vừa rồi, thị trường nh&agrave; đất tại đ&acirc;y được quan t&acirc;m trở lại v&agrave; ghi nhận giao dịch dần s&ocirc;i sộng hơn.&nbsp;</p>
', CAST(N'2020-05-21 13:06:04.360' AS DateTime), N'llnpv03resort-1-1589967243985997541727-crop-1589967252451631654828.jpg')
GO
INSERT [dbo].[NEWS] ([idNews], [idUser], [titleNews], [Description], [createDate], [Img]) VALUES (2, 1, N'Bất động sản đà nẵng', N'<p>Thị trường BĐS Đ&agrave; Nẵng thời gian gần đ&acirc;y xuất hiện th&ocirc;ng tin c&aacute;c nh&agrave; đầu tư đang gom h&agrave;ng &quot;bắt đ&aacute;y&quot; để đợi thời cơ, chờ thị trường phục hồi. Thực hư của việc n&agrave;y ra sao? &quot;&Aacute;nh s&aacute;ng đ&atilde; thực sự xuất hiện ở cuối đường hầm&quot; hậu Covid-19?</p>

<h2><strong>Thị trường chỉ vừa khởi động lại</strong></h2>

<p>Biểu đồ tăng trưởng của thị trường bất động sản kh&ocirc;ng c&ograve;n nh&igrave;n thấy c&aacute;i t&ecirc;n &quot;Đ&agrave; Nẵng&quot; trong giai đoạn ảm đạm của thị trường k&eacute;o d&agrave;i từ nửa cuối năm ngo&aacute;i đến đầu năm nay. Theo đ&oacute;, d&ugrave; gi&aacute; giảm kh&aacute; s&acirc;u nhưng những điểm từng sốt n&oacute;ng v&agrave;o khoảng cuối 2018, đầu 2019 như khu T&acirc;y Bắc quận Li&ecirc;n Chiểu, H&ograve;a Xu&acirc;n hay huyện H&ograve;a Vang&hellip; chỉ xuất hiện l&aacute;c đ&aacute;c v&agrave;i giao dịch v&agrave; gần như kh&ocirc;ng thấy xuất hiện b&oacute;ng d&aacute;ng của c&aacute;c nh&agrave; đầu tư.&nbsp;&nbsp;</p>

<p>Kịch bản n&agrave;y tưởng như sẽ c&ograve;n tiếp tục k&eacute;o d&agrave;i khi &quot;cơn b&atilde;o&quot; Covid-19 k&eacute;o đến khiến thị trường Đ&atilde; Nẵng tạm thời &quot;ngủ đ&ocirc;ng&quot;. Tuy nhi&ecirc;n, khi lệnh gi&atilde;n c&aacute;ch x&atilde; hội được nới lỏng v&agrave;o cuối th&aacute;ng 4 vừa rồi, thị trường nh&agrave; đất tại đ&acirc;y được quan t&acirc;m trở lại v&agrave; ghi nhận giao dịch dần s&ocirc;i sộng hơn.&nbsp;</p>
', CAST(N'2020-05-21 13:09:54.517' AS DateTime), N'2-3356-1589943115.jpg')
GO
INSERT [dbo].[NEWS] ([idNews], [idUser], [titleNews], [Description], [createDate], [Img]) VALUES (3, 1, N'Thêm 10 dự án được bán cho người ngoài tại Hà Nội', N'<p>Dự &aacute;n Khu đ&ocirc; thị mới Văn Kh&ecirc; mở rộng được đầu tư bởi&nbsp;C&ocirc;ng ty CP S&ocirc;ng Đ&agrave; - Thăng Long&nbsp;tại&nbsp;phường La Kh&ecirc;;&nbsp;</p>

<p>Chung cư cao tầng thuộc dự &aacute;n Khu đ&ocirc; thị mới L&ecirc; Trọng Tấn - Park City (phường La Kh&ecirc;) do C&ocirc;ng ty CP Ph&aacute;t triển đ&ocirc; thị quốc tế Việt Nam l&agrave;m chủ đầu tư.</p>

<p>T&ograve;a nh&agrave; hỗn hợp Đ&agrave;i Ph&aacute;t thanh v&agrave; Truyền h&igrave;nh H&agrave; Nội tại thửa đất k&yacute; hiệu 14, l&ocirc; VIII, Khu trung t&acirc;m h&agrave;nh ch&iacute;nh quận H&agrave; Đ&ocirc;ng (phường H&agrave; Cầu) được đầu tư bởi&nbsp;C&ocirc;ng ty CP Đầu tư x&acirc;y dựng v&agrave; thương mại Ph&uacute; Thịnh;</p>

<p>5 dự &aacute;n c&ograve;n lại c&oacute; vị tr&iacute;&nbsp;tại c&aacute;c quận&nbsp;Cầu Giấy, Nam Từ Li&ecirc;m v&agrave; Thanh Xu&acirc;n, gồm:</p>

<p>Dự &aacute;n nh&agrave; ở cao tầng, văn ph&ograve;ng lưu tr&uacute;, căn hộ du lịch v&agrave; thương mại Eco Park View (Đơn nguy&ecirc;n A - khối căn hộ) tại một phần l&ocirc; đất k&yacute; hiệu D14 - Khu đ&ocirc; thị mới Cầu Giấy (ng&otilde; 19 Duy T&acirc;n) do li&ecirc;n danh C&ocirc;ng ty CP Thiết bị y tế Medinsco, C&ocirc;ng ty CP Ecoland v&agrave; C&ocirc;ng ty CP X&acirc;y dựng v&agrave; ph&aacute;t triển cơ sở hạ tầng l&agrave;m chủ đầu tư. Dự &aacute;n c&oacute; vị tr&iacute; thuộc&nbsp;phường Mỹ Đ&igrave;nh 2 (quận Nam Từ Li&ecirc;m) v&agrave; phường Dịch Vọng Hậu (quận Cầu Giấy).&nbsp;</p>

<p>C&ocirc;ng tr&igrave;nh hỗn hợp dịch vụ, văn ph&ograve;ng v&agrave; nh&agrave; ở tại số 25 đường L&ecirc; Văn Lương, phường Nh&acirc;n Ch&iacute;nh, quận Thanh Xu&acirc;n. Chủ đầu tư dự &aacute;n l&agrave; C&ocirc;ng ty CP Dịch vụ v&agrave; kinh doanh bất động sản H&agrave; Nội.</p>

<p>Dự &aacute;n tổ hợp căn hộ cao cấp v&agrave; văn ph&ograve;ng l&agrave;m việc Dolphin Plaza tại phường Mỹ Đ&igrave;nh 2, quận Nam Từ Li&ecirc;m&nbsp;do C&ocirc;ng ty CP TID l&agrave;m chủ đầu tư.</p>

<p>Dự &aacute;n Keangnam Hanoi Landmark Tower tại phường Mễ Tr&igrave;, quận Nam Từ Li&ecirc;m. Chủ đầu tư dự &aacute;n&nbsp;l&agrave; Tập đo&agrave;n Keangnam (H&agrave;n Quốc).</p>

<p>T&ograve;a nh&agrave; HH2-1A của c&ocirc;ng tr&igrave;nh chung cư HH2-1 thuộc dự &aacute;n C&ocirc;ng vi&ecirc;n giải tr&iacute;, trường học v&agrave; tổ hợp nh&agrave; ở, thương mại dịch vụ Golden Palace A do&nbsp;C&ocirc;ng ty CP Đầu tư Mai Linh l&agrave;m chủ đầu tư. Dự &aacute;n c&oacute; vị tr&iacute;&nbsp;tại phường Ph&uacute; Đ&ocirc; v&agrave; phường Mễ Tr&igrave;, quận Nam Từ Li&ecirc;m.</p>

<p>Th&aacute;ng 11/2019,&nbsp;Sở X&acirc;y dựng H&agrave; Nội đ&atilde;&nbsp;c&ocirc;ng bố danh s&aacute;ch 16 dự &aacute;n nh&agrave; tr&ecirc;n địa b&agrave;n&nbsp;m&agrave; người nước ngo&agrave;i được ph&eacute;p mua, sở hữu.</p>
', CAST(N'2020-05-21 13:10:49.683' AS DateTime), N'20200518115844-9646-d232.jpg')
GO
INSERT [dbo].[NEWS] ([idNews], [idUser], [titleNews], [Description], [createDate], [Img]) VALUES (4, 3, N'Cho thuê Nguyên tòa nhà Văn Phòng', N'<p>Dự &aacute;n Khu đ&ocirc; thị mới Văn Kh&ecirc; mở rộng được đầu tư bởi&nbsp;C&ocirc;ng ty CP S&ocirc;ng Đ&agrave; - Thăng Long&nbsp;tại&nbsp;phường La Kh&ecirc;;&nbsp;</p>

<p>Chung cư cao tầng thuộc dự &aacute;n Khu đ&ocirc; thị mới L&ecirc; Trọng Tấn - Park City (phường La Kh&ecirc;) do C&ocirc;ng ty CP Ph&aacute;t triển đ&ocirc; thị quốc tế Việt Nam l&agrave;m chủ đầu tư.</p>

<p>T&ograve;a nh&agrave; hỗn hợp Đ&agrave;i Ph&aacute;t thanh v&agrave; Truyền h&igrave;nh H&agrave; Nội tại thửa đất k&yacute; hiệu 14, l&ocirc; VIII, Khu trung t&acirc;m h&agrave;nh ch&iacute;nh quận H&agrave; Đ&ocirc;ng (phường H&agrave; Cầu) được đầu tư bởi&nbsp;C&ocirc;ng ty CP Đầu tư x&acirc;y dựng v&agrave; thương mại Ph&uacute; Thịnh;</p>

<p>5 dự &aacute;n c&ograve;n lại c&oacute; vị tr&iacute;&nbsp;tại c&aacute;c quận&nbsp;Cầu Giấy, Nam Từ Li&ecirc;m v&agrave; Thanh Xu&acirc;n, gồm:</p>

<p>Dự &aacute;n nh&agrave; ở cao tầng, văn ph&ograve;ng lưu tr&uacute;, căn hộ du lịch v&agrave; thương mại Eco Park View (Đơn nguy&ecirc;n A - khối căn hộ) tại một phần l&ocirc; đất k&yacute; hiệu D14 - Khu đ&ocirc; thị mới Cầu Giấy (ng&otilde; 19 Duy T&acirc;n) do li&ecirc;n danh C&ocirc;ng ty CP Thiết bị y tế Medinsco, C&ocirc;ng ty CP Ecoland v&agrave; C&ocirc;ng ty CP X&acirc;y dựng v&agrave; ph&aacute;t triển cơ sở hạ tầng l&agrave;m chủ đầu tư. Dự &aacute;n c&oacute; vị tr&iacute; thuộc&nbsp;phường Mỹ Đ&igrave;nh 2 (quận Nam Từ Li&ecirc;m) v&agrave; phường Dịch Vọng Hậu (quận Cầu Giấy).&nbsp;</p>

<p>C&ocirc;ng tr&igrave;nh hỗn hợp dịch vụ, văn ph&ograve;ng v&agrave; nh&agrave; ở tại số 25 đường L&ecirc; Văn Lương, phường Nh&acirc;n Ch&iacute;nh, quận Thanh Xu&acirc;n. Chủ đầu tư dự &aacute;n l&agrave; C&ocirc;ng ty CP Dịch vụ v&agrave; kinh doanh bất động sản H&agrave; Nội.</p>

<p>Dự &aacute;n tổ hợp căn hộ cao cấp v&agrave; văn ph&ograve;ng l&agrave;m việc Dolphin Plaza tại phường Mỹ Đ&igrave;nh 2, quận Nam Từ Li&ecirc;m&nbsp;do C&ocirc;ng ty CP TID l&agrave;m chủ đầu tư.</p>

<p>Dự &aacute;n Keangnam Hanoi Landmark Tower tại phường Mễ Tr&igrave;, quận Nam Từ Li&ecirc;m. Chủ đầu tư dự &aacute;n&nbsp;l&agrave; Tập đo&agrave;n Keangnam (H&agrave;n Quốc).</p>

<p>T&ograve;a nh&agrave; HH2-1A của c&ocirc;ng tr&igrave;nh chung cư HH2-1 thuộc dự &aacute;n C&ocirc;ng vi&ecirc;n giải tr&iacute;, trường học v&agrave; tổ hợp nh&agrave; ở, thương mại dịch vụ Golden Palace A do&nbsp;C&ocirc;ng ty CP Đầu tư Mai Linh l&agrave;m chủ đầu tư. Dự &aacute;n c&oacute; vị tr&iacute;&nbsp;tại phường Ph&uacute; Đ&ocirc; v&agrave; phường Mễ Tr&igrave;, quận Nam Từ Li&ecirc;m.</p>

<p>Th&aacute;ng 11/2019,&nbsp;Sở X&acirc;y dựng H&agrave; Nội đ&atilde;&nbsp;c&ocirc;ng bố danh s&aacute;ch 16 dự &aacute;n nh&agrave; tr&ecirc;n địa b&agrave;n&nbsp;m&agrave; người nước ngo&agrave;i được ph&eacute;p mua, sở hữu.</p>
', CAST(N'2020-05-21 13:15:30.903' AS DateTime), N'295620180519133750-d-416-1571122505106.jpg')
GO
INSERT [dbo].[NEWS] ([idNews], [idUser], [titleNews], [Description], [createDate], [Img]) VALUES (5, 3, N'Đầu tư bất động sản sẽ chậm lại trong nửa đầu năm 2020', N'<h2>Dự b&aacute;o hoạt động đầu tư bất động sản c&oacute; thể sẽ chậm lại trong nửa đầu năm 2020 do c&aacute;c nh&agrave; đầu tư do dự trước t&igrave;nh h&igrave;nh bất ổn, trong đ&oacute; lĩnh vực b&aacute;n lẻ v&agrave; kh&aacute;ch sạn sẽ bị ảnh hưởng nhiều nhất.</h2>

<p>Trong những sự kiện biến động về kinh tế tương tự, giới đầu tư BĐS c&oacute; xu hướng ph&acirc;n bổ vốn v&agrave;o d&ograve;ng sản phẩm nh&agrave; đất c&oacute; gi&aacute; trị khai th&aacute;c d&agrave;i hạn, hướng đến bi&ecirc;n độ lợi nhuận ổn định hơn l&agrave; chọn c&aacute;c loại h&igrave;nh ngắn hạn.</p>

<p>Theo &ocirc;ng&nbsp;Stephen Wyatt, TGĐ JLL Việt Nam, thay v&igrave; đặt cược v&agrave;o bất kỳ dự đo&aacute;n t&aacute;o bạo n&agrave;o, c&aacute;c doanh nghiệp h&atilde;y tập trung chuẩn bị cho tăng trưởng chậm v&agrave; c&oacute; thể k&eacute;o d&agrave;i. Với thị trường vốn, JLL dự b&aacute;o, hoạt động đầu tư c&oacute; thể sẽ chậm lại trong nửa đầu năm 2020 do c&aacute;c nh&agrave; đầu tư do dự trước t&igrave;nh h&igrave;nh bất ổn, trong đ&oacute; lĩnh vực b&aacute;n lẻ v&agrave; kh&aacute;ch sạn sẽ bị ảnh hưởng nhiều nhất. C&aacute;c nh&agrave; đầu tư sẽ nghi&ecirc;ng về t&agrave;i sản tr&uacute; ẩn an to&agrave;n, c&acirc;n nhắc về rủi ro như ổn định thu nhập v&agrave; khả năng vận h&agrave;nh.</p>

<p>Đ&aacute;nh gi&aacute; t&aacute;c động của dịch Covid-19, &ocirc;ng Stephen Wyatt cho rằng ng&agrave;nh kinh doanh kh&aacute;ch sạn v&agrave; du lịch đang chịu thiệt hại nặng nhất. T&aacute;c động của t&acirc;m l&yacute; hạn chế đi lại v&agrave; lệnh cấm nhập cảnh từ nhiều quốc gia đ&atilde; ngay lập tức l&agrave;m ảnh hưởng ti&ecirc;u cực đến lĩnh vực kh&aacute;ch sạn v&agrave; du lịch. Trong ngắn hạn, tỷ lệ lấp đầy của ng&agrave;nh sẽ giảm. C&aacute;c thị trường c&oacute; tỷ lệ kh&aacute;ch quốc tế cao sẽ bị ảnh hưởng nhiều nhất, trong khi c&aacute;c khu vực c&oacute; thể phục vụ du kh&aacute;ch trong nước c&oacute; thể bị ảnh hưởng &iacute;t hơn.&nbsp;</p>
', CAST(N'2020-05-21 13:26:41.597' AS DateTime), N'20200323100636-355a.jpg')
GO
INSERT [dbo].[NEWS] ([idNews], [idUser], [titleNews], [Description], [createDate], [Img]) VALUES (6, 3, N'Giá thuê văn phòng tăng cao, doanh nghiệp nhỏ chịu sức ép lớn', N'<p><strong>Gặp kh&oacute; v&igrave; gi&aacute; thu&ecirc; văn ph&ograve;ng li&ecirc;n tục tăng cao</strong></p>

<p>Th&agrave;nh lập c&ocirc;ng ty được gần 5 th&aacute;ng v&agrave; đ&atilde; bắt đầu c&oacute; kh&aacute;ch h&agrave;ng nhưng anh Hồng Phong, gi&aacute;m đốc một c&ocirc;ng ty c&ocirc;ng nghệ cho biết gần đ&acirc;y vẫn phải mượn tạm kh&ocirc;ng gian c&aacute;c qu&aacute;n caf&eacute; để họp nh&oacute;m v&agrave; gặp gỡ c&aacute;c đối t&aacute;c. L&agrave; một doanh nghiệp nhỏ quy m&ocirc; vừa, nguồn kinh ph&iacute; hạn hẹp, giải ph&aacute;p về văn ph&ograve;ng l&agrave;m việc gi&aacute; rẻ sẽ l&agrave; ưu ti&ecirc;n h&agrave;ng đầu của anh. Để tiết kiệm chi ph&iacute;, anh từng thu&ecirc; mặt bằng tại một căn nh&agrave; phố, c&oacute; diện t&iacute;ch 40m2 kh&ocirc;ng nằm ở vị tr&iacute; đắc địa. D&ugrave; được đầu tư b&agrave;i bản v&agrave; c&oacute; chăm ch&uacute;t về thiết kế, nhưng anh vẫn gặp kh&ocirc;ng &iacute;t kh&oacute; khăn trong việc giao dịch với kh&aacute;ch h&agrave;ng do vị tr&iacute; kh&ocirc;ng thuận tiện, kh&ocirc;ng gian chật chội v&agrave; gi&aacute; thu&ecirc; nh&agrave; phố cũng tăng kh&ocirc;ng &iacute;t.</p>

<p>Theo anh Phong, d&ugrave; rất muốn thu&ecirc; văn ph&ograve;ng trong t&ograve;a nh&agrave; tại khu vực trung t&acirc;m nhưng đ&acirc;y cũng l&agrave; b&agrave;i to&aacute;n nan giải của những doanh nghiệp nhỏ hoặc mới th&agrave;nh lập. &ldquo;Với quy m&ocirc; 8 nh&acirc;n vi&ecirc;n, m&igrave;nh chỉ cần văn ph&ograve;ng nhỏ tầm 50m2, tuy nhi&ecirc;n việc t&igrave;m mặt bằng diện t&iacute;ch nhỏ dưới 50m2 rất kh&oacute; khăn khi những t&ograve;a nh&agrave; văn ph&ograve;ng quản l&yacute; chuy&ecirc;n nghiệp thuộc quận 1, quận 3, quận 2 hay quận 7 đều c&oacute; diện t&iacute;ch thu&ecirc; từ 65m2 trở l&ecirc;n, gi&aacute; thu&ecirc; cũng l&agrave; &aacute;p lực lớn&rdquo;, anh Phong n&oacute;i.</p>

<p>Thực tế, trường hợp như c&ocirc;ng ty của anh Phong đang kh&aacute; phổ biến. T&iacute;nh đến nửa đầu năm 2019, tổng nguồn cung thị trường văn ph&ograve;ng TP.HCM chỉ c&oacute; 1,2 triệu m2 diện t&iacute;ch thu&ecirc;. Trong qu&yacute; 2, th&agrave;nh phố kh&ocirc;ng c&oacute; th&ecirc;m dự &aacute;n mới khiến nguồn cung văn ph&ograve;ng tại TP.HCM thấp hơn H&agrave; Nội 116.000 m2. Do hạn chế nguồn cung, gi&aacute; thu&ecirc; văn ph&ograve;ng tiếp tục tăng, trung b&igrave;nh từ 800 ngh&igrave;n &ndash; 1,5 triệu/m2. Cứ qua mỗi năm, gi&aacute; thu&ecirc; lại tăng th&ecirc;m từ 6-12%. Nhu cầu thu&ecirc; văn ph&ograve;ng li&ecirc;n tục tăng, đặc biệt sau thời điểm xảy ra thương chiến Mỹ - Trung.&nbsp;</p>

<p><img alt="văn phòng cho thuê" src="https://file4.batdongsan.com.vn/2019/08/10/wxbwknn6/20190810092455-e87b.jpg" /><br />
<em>C&aacute;c loại h&igrave;nh văn ph&ograve;ng cho thu&ecirc; linh hoạt đang dần được ưa chuộng khi<br />
văn ph&ograve;ng truyền thống khan hiếm nguồn cung. Ảnh minh họa</em></p>

<p>Theo số liệu từ JLL Việt Nam, y&ecirc;u cầu thu&ecirc; văn ph&ograve;ng mới tăng 30% so với c&ugrave;ng k&igrave; năm ngo&aacute;i. So với qu&yacute; trước, gi&aacute; thu&ecirc; cao ốc hạng A tăng 4,8%. Tốc độ tăng gi&aacute; thu&ecirc; c&aacute;c t&ograve;a th&aacute;p hạng B v&agrave; C thậm ch&iacute; c&ograve;n nhanh hơn, lần lượt l&agrave; 4,9% v&agrave; 7,5%. Hiện tỷ lệ lấp đầy của c&aacute;c t&ograve;a nh&agrave; văn ph&ograve;ng đều đạt ngưỡng l&yacute; tưởng 96-97%. Trong đ&oacute;, khu vực c&aacute;c quận trung t&acirc;m như quận 1, quận 2, quận 7 l&agrave; nơi kh&oacute; thu&ecirc; được mặt bằng nhất hiện nay. Gi&aacute; thu&ecirc; văn ph&ograve;ng ở khu vực n&agrave;y cao gấp 1,5 lần so với gi&aacute; b&igrave;nh qu&acirc;n chung tr&ecirc;n địa b&agrave;n nhưng cũng rất kh&oacute; t&igrave;m được vị tr&iacute; trống.</p>

<p><strong>Doanh nghiệp chuyển hướng sang c&aacute;c m&ocirc; h&igrave;nh cho thu&ecirc; kh&aacute;c</strong></p>

<p>Theo t&igrave;m hiểu của&nbsp;<a href="http://batdongsan.com.vn/" target="_blank">Batdongsan.com.vn</a>, sự cộng hưởng của cơn sốt gi&aacute; tại thị trường văn ph&ograve;ng cho thu&ecirc; đ&atilde; tạo c&uacute; h&iacute;ch cho thị trường căn hộ officetel v&agrave; kh&ocirc;ng gian l&agrave;m việc chia sẻ.&nbsp;</p>

<p>Cụ thể, c&aacute;c doanh nghiệp vừa v&agrave; nhỏ, doanh nghiệp startup kh&oacute; t&igrave;m kiếm được chỗ thu&ecirc; khi khu vực trung t&acirc;m v&agrave; cận trung t&acirc;m S&agrave;i G&ograve;n đều khan hiếm nguồn cung. Kh&aacute;ch thu&ecirc; thậm ch&iacute; phải xếp h&agrave;ng chờ mới đến lượt v&agrave;o c&aacute;c t&ograve;a nh&agrave; hạng A trong khi gi&aacute; thu&ecirc; cũng cực kỳ đắt đỏ. Điều n&agrave;y khiến nhiều doanh nghiệp chuyển hướng sang loại h&igrave;nh kh&ocirc;ng gian chia sẻ v&agrave; căn hộ văn ph&ograve;ng.&nbsp;</p>

<p>Theo th&ocirc;ng tin từ c&aacute;c s&agrave;n m&ocirc;i giới cho thu&ecirc;, đa số kh&aacute;ch h&agrave;ng c&oacute; nhu cầu thu&ecirc; văn ph&ograve;ng truyền thống sau khi được gợi &yacute; đều quan t&acirc;m tới việc t&igrave;m thu&ecirc; tại c&aacute;c t&ograve;a nh&agrave; Co.working hay sở hữu một căn hộ officetel để l&agrave;m văn ph&ograve;ng.&nbsp;</p>

<p>L&agrave; CEO doanh nghiệp c&oacute; quy m&ocirc; vừa v&agrave; nhỏ mới đổi hướng sang thu&ecirc; officetel, b&agrave; Nguyễn Phương Lan cho biết, trước việc gi&aacute; thu&ecirc; văn ph&ograve;ng truyền thống tăng cao, doanh nghiệp của b&agrave; chuyển sang t&igrave;m kiếm c&aacute;c kh&ocirc;ng gian l&agrave;m việc chia sẻ, nếu chưa t&igrave;m được sẽ tạm thời thu&ecirc; officetel tại trung t&acirc;m. Chi ph&iacute; thu&ecirc; văn ph&ograve;ng 40m2 khu trung t&acirc;m tối thiểu từ 27-40 triệu/th&aacute;ng. Trong khi đ&oacute;, nếu thu&ecirc; văn ph&ograve;ng loại h&igrave;nh co.working hay officetel th&igrave; gi&aacute; mềm hơn hẳn, tầm 20-30 triệu/th&aacute;ng.&nbsp;</p>

<p>Trong 2 năm trở lại đ&acirc;y, loại h&igrave;nh kh&ocirc;ng gian l&agrave;m việc linh hoạt cũng đang được ưa chuộng với diện t&iacute;ch thu&ecirc; được mở rộng nhanh ch&oacute;ng. T&iacute;nh đến qu&yacute; 2/2019, tổng nguồn cung t&iacute;ch lũy của thị trường văn ph&ograve;ng chia sẻ đạt 46.266 m2 diện t&iacute;ch s&agrave;n, tăng 101% so với c&ugrave;ng kỳ năm ngo&aacute;i. Con số n&agrave;y được dự b&aacute;o sẽ tăng gấp đ&ocirc;i v&agrave;o cuối năm 2019.&nbsp;</p>

<p>Thị trường kh&ocirc;ng gian l&agrave;m việc linh hoạt tại TP.HCM nằm trong top 5 thị trường tăng trưởng nhanh nhất với trung b&igrave;nh hơn 80% mỗi năm. Hiệu suất hoạt động của kh&ocirc;ng gian chia sẻ ghi nhận rất tốt với tỷ lệ lấp đầy đạt mức trung b&igrave;nh 80%. B&ecirc;n cạnh đ&oacute;, loại h&igrave;nh văn ph&ograve;ng ảo cũng đang ng&agrave;y c&agrave;ng phổ biến v&agrave; ph&ugrave; hợp t&agrave;i ch&iacute;nh với nhiều doanh nghiệp nhỏ, mới khởi nghiệp.&nbsp;</p>
', CAST(N'2020-05-21 13:27:50.330' AS DateTime), N'20190810092455-e87b.jpg')
GO
INSERT [dbo].[NEWS] ([idNews], [idUser], [titleNews], [Description], [createDate], [Img]) VALUES (7, 1, N'Bỏ 40 USD lên toà nhà cao nhất thế giới ở Dubai, du khách ước mình không mua vé', N'<p>Nổi bật trong th&agrave;nh phố Dubai, cao 828 m với 160 tầng, Burj Khalifa trở th&agrave;nh t&ograve;a th&aacute;p cao nhất thế giới khi khai trương v&agrave;o năm 2010. C&ocirc;ng tr&igrave;nh cũng giữ kỷ lục Guinness cho cấu tr&uacute;c nh&acirc;n tạo cao nhất, nh&agrave; h&agrave;ng cao nhất cho đến nay v&agrave; đ&agrave;i quan s&aacute;t cao nhất cho đến năm 2015.&nbsp;<em>US News &amp; World Report</em>&nbsp;xếp hạng Burj Khalifa l&agrave; điểm thu h&uacute;t số 5 tại đ&acirc;y.</p>

<p>Ph&oacute;ng vi&ecirc;n Harrison Jacobs của&nbsp;<em>Business Insider&nbsp;</em>thăm th&agrave;nh phố lần đầu ti&ecirc;n v&agrave;o th&aacute;ng 11/2018 v&agrave; quyết t&acirc;m xem thử kỳ quan n&agrave;y. Tuy nhi&ecirc;n, sau khi chi 40 USD v&agrave; một v&agrave;i giờ tr&ecirc;n tầng quan s&aacute;t, anh ước m&igrave;nh đ&atilde; bỏ qua v&agrave; chỉ ngắm từ b&ecirc;n dưới.</p>

<p><a href="https://cafebiz.cafebizcdn.vn/2019/2/1/photo-1-1549004918268837297566.jpg"><img alt="Bỏ 40 USD lên toà nhà cao nhất thế giới ở Dubai, du khách ước mình không mua vé  - Ảnh 1." src="https://cafebiz.cafebizcdn.vn/thumb_w/640/2019/2/1/photo-1-1549004918268837297566.jpg" /></a></p>

<p><em>Để v&agrave;o Burj Khalifa, du kh&aacute;ch phải mua v&eacute; cho thời điểm nhất định. Gi&aacute; cả cũng kh&aacute;c nhau. V&agrave;o 17h (ho&agrave;ng h&ocirc;n), v&eacute; c&oacute; thể l&ecirc;n tới 60 USD. Jacobs quyết định đi khoảng 19h để tiết kiệm 20 USD.</em></p>
', CAST(N'2020-05-22 14:54:57.757' AS DateTime), N'photo-23-1549004921452185319105-crop-1549005036581223598508.jpg')
GO
SET IDENTITY_INSERT [dbo].[NEWS] OFF
GO
SET IDENTITY_INSERT [dbo].[PHIEUHEN] ON 

GO
INSERT [dbo].[PHIEUHEN] ([idPhieu], [idCustom], [idUserNV], [idBuild], [contentPhieu], [createPhieu], [ngayhen]) VALUES (3, 2, 1, 7, N'Không có', CAST(N'2020-05-18 17:37:58.260' AS DateTime), CAST(N'2020-05-19 08:30:00.000' AS DateTime))
GO
INSERT [dbo].[PHIEUHEN] ([idPhieu], [idCustom], [idUserNV], [idBuild], [contentPhieu], [createPhieu], [ngayhen]) VALUES (4, 1, 1, 7, N'không có', CAST(N'2020-05-18 17:47:25.123' AS DateTime), CAST(N'2020-05-20 08:30:00.000' AS DateTime))
GO
INSERT [dbo].[PHIEUHEN] ([idPhieu], [idCustom], [idUserNV], [idBuild], [contentPhieu], [createPhieu], [ngayhen]) VALUES (5, 1, 31, 7, N'ádsadas', CAST(N'2020-05-18 20:53:30.447' AS DateTime), CAST(N'2020-05-18 11:11:00.000' AS DateTime))
GO
INSERT [dbo].[PHIEUHEN] ([idPhieu], [idCustom], [idUserNV], [idBuild], [contentPhieu], [createPhieu], [ngayhen]) VALUES (8, 13, 31, 11, N'PHP PHP PHP PHP JAVA JAVA JAVA JAVA', CAST(N'2020-05-23 12:44:08.807' AS DateTime), CAST(N'2020-05-23 14:08:00.000' AS DateTime))
GO
INSERT [dbo].[PHIEUHEN] ([idPhieu], [idCustom], [idUserNV], [idBuild], [contentPhieu], [createPhieu], [ngayhen]) VALUES (10, 14, 31, 7, N'test', CAST(N'2020-05-23 12:52:10.610' AS DateTime), CAST(N'2020-05-23 00:02:00.000' AS DateTime))
GO
INSERT [dbo].[PHIEUHEN] ([idPhieu], [idCustom], [idUserNV], [idBuild], [contentPhieu], [createPhieu], [ngayhen]) VALUES (11, 15, 31, 11, N'hello bạn thịnh tuần tớ hết học anh văn rồi hôm nay ngày cuối thứ 4 đi thi :3', CAST(N'2020-05-23 13:01:41.230' AS DateTime), CAST(N'2020-05-28 09:00:00.000' AS DateTime))
GO
INSERT [dbo].[PHIEUHEN] ([idPhieu], [idCustom], [idUserNV], [idBuild], [contentPhieu], [createPhieu], [ngayhen]) VALUES (12, 16, 31, 7, N'hello quang :3', CAST(N'2020-05-23 13:10:02.873' AS DateTime), CAST(N'2020-05-25 01:01:00.000' AS DateTime))
GO
INSERT [dbo].[PHIEUHEN] ([idPhieu], [idCustom], [idUserNV], [idBuild], [contentPhieu], [createPhieu], [ngayhen]) VALUES (13, 12, 31, 7, N'test', CAST(N'2020-05-23 13:42:03.213' AS DateTime), CAST(N'2020-05-23 01:01:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PHIEUHEN] OFF
GO
SET IDENTITY_INSERT [dbo].[ROLE] ON 

GO
INSERT [dbo].[ROLE] ([idRole], [nameRole]) VALUES (1, N'Quản Trị Viên')
GO
INSERT [dbo].[ROLE] ([idRole], [nameRole]) VALUES (2, N'Nhân Viên Quản Trị')
GO
INSERT [dbo].[ROLE] ([idRole], [nameRole]) VALUES (3, N'Nhân Viên Tư Vấn')
GO
INSERT [dbo].[ROLE] ([idRole], [nameRole]) VALUES (1012, N'21312')
GO
SET IDENTITY_INSERT [dbo].[ROLE] OFF
GO
SET IDENTITY_INSERT [dbo].[STATUS] ON 

GO
INSERT [dbo].[STATUS] ([idStatus], [nameStatuts]) VALUES (1, N'Chưa cho thuê')
GO
INSERT [dbo].[STATUS] ([idStatus], [nameStatuts]) VALUES (2, N'Đã cho thuê')
GO
INSERT [dbo].[STATUS] ([idStatus], [nameStatuts]) VALUES (3, N'Hết chỗ')
GO
SET IDENTITY_INSERT [dbo].[STATUS] OFF
GO
SET IDENTITY_INSERT [dbo].[TYPE] ON 

GO
INSERT [dbo].[TYPE] ([idType], [nameType]) VALUES (1, N'Văn phòng hạng A')
GO
INSERT [dbo].[TYPE] ([idType], [nameType]) VALUES (2, N'Văn Phòng hạng B')
GO
INSERT [dbo].[TYPE] ([idType], [nameType]) VALUES (3, N'Văn phòng hạng C')
GO
INSERT [dbo].[TYPE] ([idType], [nameType]) VALUES (4, N'Văn Phòng giá rẻ')
GO
INSERT [dbo].[TYPE] ([idType], [nameType]) VALUES (5, N'Văn Phòng trọn gói')
GO
SET IDENTITY_INSERT [dbo].[TYPE] OFF
GO
SET IDENTITY_INSERT [dbo].[USER] ON 

GO
INSERT [dbo].[USER] ([idUser], [idRole], [userName], [userPassword], [FullName], [Email], [Phone], [Address]) VALUES (1, 1, N'admin', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', N'ADMIN', N'admin@gmail.com', N'01234567789', N'Hutech')
GO
INSERT [dbo].[USER] ([idUser], [idRole], [userName], [userPassword], [FullName], [Email], [Phone], [Address]) VALUES (3, 2, N'minh', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', N'Nghiêm Quốc Anh Minh', N'nghiemminh1904@gmail.com', N'0339895154', N'thủ đức')
GO
INSERT [dbo].[USER] ([idUser], [idRole], [userName], [userPassword], [FullName], [Email], [Phone], [Address]) VALUES (13, 2, N'tuan', N'6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B', N'Trần Thanh Tuấn', N'tuan@gmail.com', N'0334456777', N'quận 4')
GO
INSERT [dbo].[USER] ([idUser], [idRole], [userName], [userPassword], [FullName], [Email], [Phone], [Address]) VALUES (29, 2, N'hieu', N'6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B', N'Minh Hiếu', N'hieu@gmail.com', N'0331345878', N'chưa có')
GO
INSERT [dbo].[USER] ([idUser], [idRole], [userName], [userPassword], [FullName], [Email], [Phone], [Address]) VALUES (31, 3, N'maicotung', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', N'Nguyễn Thanh Tùng', N'nguyenthanhtung270895@gmail.com', N'0703191294', N'Quận 2')
GO
INSERT [dbo].[USER] ([idUser], [idRole], [userName], [userPassword], [FullName], [Email], [Phone], [Address]) VALUES (32, 3, N'nhanvien', N'6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B', N'Nguyễn Văn A', N'nguyen@gmail.com', N'0123456789', N'hutechB')
GO
INSERT [dbo].[USER] ([idUser], [idRole], [userName], [userPassword], [FullName], [Email], [Phone], [Address]) VALUES (34, 3, N'tan', N'6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B', N'Trần quốc Tấn', N'Tan@gmail.com', N'02399887744', N'quận 4')
GO
SET IDENTITY_INSERT [dbo].[USER] OFF
GO
SET IDENTITY_INSERT [dbo].[WARD] ON 

GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (1, N'Phường Tân Định', 23)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (2, N'Phường Đa Kao', 23)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (3, N'Phường Bến Nghé', 23)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (4, N'Phường Bến Thành', 23)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (5, N'Phường Nguyễn Thái Bình', 23)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (6, N'Phường Phạm Ngũ Lão', 23)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (7, N'Phường Cầu Ông Lãnh', 23)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (8, N'Phường Cô Giang', 23)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (9, N'Phường Nguyễn Cư Trinh', 23)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (10, N'Phường Cầu Kho', 23)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (11, N'Phường Thạnh Xuân', 34)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (12, N'Phường Thạnh Lộc', 34)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (13, N'Phường Hiệp Thành', 34)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (14, N'Phường Thới An', 34)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (15, N'Phường Tân Chánh Hiệp', 34)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (16, N'Phường An Phú Đông', 34)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (17, N'Phường Tân Thới Hiệp', 34)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (18, N'Phường Trung Mỹ Tây', 34)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (19, N'Phường Tân Hưng Thuận', 34)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (20, N'Phường Đông Hưng Thuận', 34)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (21, N'Phường Tân Thới Nhất', 34)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (22, N'Phường Linh Xuân', 38)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (23, N'Phường Bình Chiểu', 38)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (24, N'Phường Linh Trung', 38)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (25, N'Phường Tam Bình', 38)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (26, N'Phường Tam Phú', 38)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (27, N'Phường Hiệp Bình Phước', 38)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (28, N'Phường Hiệp Bình Chánh', 38)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (29, N'Phường Linh Chiểu', 38)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (30, N'Phường Linh Tây', 38)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (31, N'Phường Linh Đông', 38)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (32, N'Phường Bình Thọ', 38)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (33, N'Phường Trường Thọ', 38)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (34, N'Phường Long Bình', 31)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (35, N'Phường Long Thạnh Mỹ', 31)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (36, N'Phường Tân Phú', 31)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (37, N'Phường Hiệp Phú', 31)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (38, N'Phường Tăng Nhơn Phú A', 31)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (39, N'Phường Tăng Nhơn Phú B', 31)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (40, N'Phường Phước Long B', 31)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (41, N'Phường Phước Long A', 31)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (42, N'Phường Trường Thạnh', 31)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (43, N'Phường Long Phước', 31)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (44, N'Phường Long Trường', 31)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (45, N'Phường Phước Bình', 31)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (46, N'Phường Phú Hữu', 31)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (47, N'Phường 15', 42)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (48, N'Phường 13', 42)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (49, N'Phường 17', 42)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (50, N'Phường 6', 42)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (51, N'Phường 16', 42)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (52, N'Phường 12', 42)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (53, N'Phường 14', 42)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (54, N'Phường 10', 42)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (55, N'Phường 05', 42)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (56, N'Phường 07', 42)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (57, N'Phường 04', 42)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (58, N'Phường 01', 42)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (59, N'Phường 9', 42)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (60, N'Phường 8', 42)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (61, N'Phường 11', 42)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (62, N'Phường 03', 42)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (63, N'Phường 13', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (64, N'Phường 11', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (65, N'Phường 27', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (66, N'Phường 26', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (67, N'Phường 12', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (68, N'Phường 25', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (69, N'Phường 05', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (70, N'Phường 07', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (71, N'Phường 24', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (72, N'Phường 06', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (73, N'Phường 14', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (74, N'Phường 15', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (75, N'Phường 02', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (76, N'Phường 01', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (77, N'Phường 03', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (78, N'Phường 17', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (79, N'Phường 21', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (80, N'Phường 22', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (81, N'Phường 19', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (82, N'Phường 28', 35)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (83, N'Phường 02', 40)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (84, N'Phường 04', 40)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (85, N'Phường 12', 40)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (86, N'Phường 13', 40)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (87, N'Phường 01', 40)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (88, N'Phường 03', 40)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (89, N'Phường 11', 40)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (90, N'Phường 07', 40)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (91, N'Phường 05', 40)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (92, N'Phường 10', 40)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (93, N'Phường 06', 40)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (94, N'Phường 08', 40)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (95, N'Phường 09', 40)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (96, N'Phường 14', 40)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (97, N'Phường 15', 41)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (98, N'Phường Tân Sơn Nhì', 41)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (99, N'Phường Tây Thạnh', 41)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (100, N'Phường Sơn Kỳ', 41)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (101, N'Phường Tân Quý', 41)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (102, N'Phường Tân Thành', 41)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (103, N'Phường Phú Thọ Hòa', 41)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (104, N'Phường Phú Thạnh', 41)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (105, N'Phường Phú Trung', 41)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (106, N'Phường Hòa Thạnh', 41)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (107, N'Phường Hiệp Tân', 41)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (108, N'Phường Tân Thới Hòa', 41)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (109, N'Phường 04', 39)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (110, N'Phường 05', 39)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (111, N'Phường 09', 39)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (112, N'Phường 07', 39)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (113, N'Phường 03', 39)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (114, N'Phường 01', 39)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (115, N'Phường 02', 39)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (116, N'Phường 08', 39)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (117, N'Phường 15', 39)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (118, N'Phường 10', 39)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (119, N'Phường 11', 39)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (120, N'Phường 17', 39)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (121, N'Phường 14', 39)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (122, N'Phường 12', 39)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (123, N'Phường 13', 39)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (124, N'Phường Thảo Điền', 24)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (125, N'Phường An Phú', 24)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (126, N'Phường Bình An', 24)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (127, N'Phường Bình Trưng Đông', 24)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (128, N'Phường Bình Trưng Tây', 24)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (129, N'Phường Bình Khánh', 24)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (130, N'Phường An Khánh', 24)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (131, N'Phường Cát Lái', 24)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (132, N'Phường Thạnh Mỹ Lợi', 24)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (133, N'Phường An Lợi Đông', 24)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (134, N'Phường Thủ Thiêm', 24)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (135, N'Phường 08', 25)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (136, N'Phường 07', 25)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (137, N'Phường 14', 25)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (138, N'Phường 12', 25)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (139, N'Phường 11', 25)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (140, N'Phường 13', 25)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (141, N'Phường 06', 25)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (142, N'Phường 09', 25)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (143, N'Phường 10', 25)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (144, N'Phường 04', 25)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (145, N'Phường 05', 25)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (146, N'Phường 03', 25)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (147, N'Phường 02', 25)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (148, N'Phường 01', 25)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (149, N'Phường 15', 32)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (150, N'Phường 13', 32)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (151, N'Phường 14', 32)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (152, N'Phường 12', 32)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (153, N'Phường 11', 32)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (154, N'Phường 10', 32)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (155, N'Phường 09', 32)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (156, N'Phường 01', 32)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (157, N'Phường 08', 32)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (158, N'Phường 02', 32)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (159, N'Phường 04', 32)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (160, N'Phường 07', 32)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (161, N'Phường 05', 32)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (162, N'Phường 06', 32)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (163, N'Phường 03', 32)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (164, N'Phường 15', 33)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (165, N'Phường 05', 33)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (166, N'Phường 14', 33)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (167, N'Phường 11', 33)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (168, N'Phường 03', 33)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (169, N'Phường 10', 33)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (170, N'Phường 13', 33)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (171, N'Phường 08', 33)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (172, N'Phường 09', 33)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (173, N'Phường 12', 33)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (174, N'Phường 07', 33)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (175, N'Phường 06', 33)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (176, N'Phường 04', 33)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (177, N'Phường 01', 33)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (178, N'Phường 02', 33)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (179, N'Phường 16', 33)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (180, N'Phường 12', 26)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (181, N'Phường 13', 26)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (182, N'Phường 09', 26)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (183, N'Phường 06', 26)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (184, N'Phường 08', 26)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (185, N'Phường 10', 26)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (186, N'Phường 05', 26)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (187, N'Phường 18', 26)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (188, N'Phường 14', 26)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (189, N'Phường 04', 26)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (190, N'Phường 03', 26)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (191, N'Phường 16', 26)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (192, N'Phường 02', 26)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (193, N'Phường 15', 26)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (194, N'Phường 01', 26)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (195, N'Phường 04', 27)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (196, N'Phường 09', 27)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (197, N'Phường 03', 27)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (198, N'Phường 12', 27)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (199, N'Phường 02', 27)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (200, N'Phường 08', 27)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (201, N'Phường 15', 27)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (202, N'Phường 07', 27)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (203, N'Phường 01', 27)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (204, N'Phường 11', 27)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (205, N'Phường 14', 27)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (206, N'Phường 05', 27)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (207, N'Phường 06', 27)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (208, N'Phường 10', 27)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (209, N'Phường 13', 27)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (210, N'Phường 14', 28)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (211, N'Phường 13', 28)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (212, N'Phường 09', 28)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (213, N'Phường 06', 28)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (214, N'Phường 12', 28)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (215, N'Phường 05', 28)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (216, N'Phường 11', 28)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (217, N'Phường 02', 28)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (218, N'Phường 01', 28)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (219, N'Phường 04', 28)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (220, N'Phường 08', 28)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (221, N'Phường 03', 28)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (222, N'Phường 07', 28)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (223, N'Phường 10', 28)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (224, N'Phường 08', 30)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (225, N'Phường 02', 30)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (226, N'Phường 01', 30)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (227, N'Phường 03', 30)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (228, N'Phường 11', 30)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (229, N'Phường 09', 30)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (230, N'Phường 10', 30)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (231, N'Phường 04', 30)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (232, N'Phường 13', 30)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (233, N'Phường 12', 30)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (234, N'Phường 05', 30)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (235, N'Phường 14', 30)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (236, N'Phường 06', 30)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (237, N'Phường 15', 30)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (238, N'Phường 16', 30)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (239, N'Phường 07', 30)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (240, N'Phường Bình Hưng Hòa', 37)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (241, N'Phường Bình Hưng Hoà A', 37)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (242, N'Phường Bình Hưng Hoà B', 37)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (243, N'Phường Bình Trị Đông', 37)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (244, N'Phường Bình Trị Đông A', 37)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (245, N'Phường Bình Trị Đông B', 37)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (246, N'Phường Tân Tạo', 37)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (247, N'Phường Tân Tạo A', 37)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (248, N'Phường An Lạc', 37)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (249, N'Phường An Lạc A', 37)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (250, N'Phường Tân Thuận Đông', 29)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (251, N'Phường Tân Thuận Tây', 29)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (252, N'Phường Tân Kiểng', 29)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (253, N'Phường Tân Hưng', 29)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (254, N'Phường Bình Thuận', 29)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (255, N'Phường Tân Quy', 29)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (256, N'Phường Phú Thuận', 29)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (257, N'Phường Tân Phú', 29)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (258, N'Phường Tân Phong', 29)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (259, N'Phường Phú Mỹ', 29)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (260, N'Thị trấn Củ Chi', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (261, N'Xã Phú Mỹ Hưng', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (262, N'Xã An Phú', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (263, N'Xã Trung Lập Thượng', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (264, N'Xã An Nhơn Tây', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (265, N'Xã Nhuận Đức', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (266, N'Xã Phạm Văn Cội', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (267, N'Xã Phú Hòa Đông', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (268, N'Xã Trung Lập Hạ', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (269, N'Xã Trung An', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (270, N'Xã Phước Thạnh', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (271, N'Xã Phước Hiệp', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (272, N'Xã Tân An Hội', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (273, N'Xã Phước Vĩnh An', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (274, N'Xã Thái Mỹ', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (275, N'Xã Tân Thạnh Tây', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (276, N'Xã Hòa Phú', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (277, N'Xã Tân Thạnh Đông', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (278, N'Xã Bình Mỹ', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (279, N'Xã Tân Phú Trung', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (280, N'Xã Tân Thông Hội', 44)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (281, N'Thị trấn Hóc Môn', 43)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (282, N'Xã Tân Hiệp', 43)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (283, N'Xã Nhị Bình', 43)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (284, N'Xã Đông Thạnh', 43)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (285, N'Xã Tân Thới Nhì', 43)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (286, N'Xã Thới Tam Thôn', 43)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (287, N'Xã Xuân Thới Sơn', 43)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (288, N'Xã Tân Xuân', 43)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (289, N'Xã Xuân Thới Đông', 43)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (290, N'Xã Trung Chánh', 43)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (291, N'Xã Xuân Thới Thượng', 43)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (292, N'Xã Bà Điểm', 43)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (293, N'Thị trấn Tân Túc', 36)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (294, N'Xã Phạm Văn Hai', 36)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (295, N'Xã Vĩnh Lộc A', 36)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (296, N'Xã Vĩnh Lộc B', 36)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (297, N'Xã Bình Lợi', 36)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (298, N'Xã Lê Minh Xuân', 36)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (299, N'Xã Tân Nhựt', 36)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (300, N'Xã Tân Kiên', 36)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (301, N'Xã Bình Hưng', 36)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (302, N'Xã Phong Phú', 36)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (303, N'Xã An Phú Tây', 36)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (304, N'Xã Hưng Long', 36)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (305, N'Xã Đa Phước', 36)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (306, N'Xã Tân Quý Tây', 36)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (307, N'Xã Bình Chánh', 36)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (308, N'Xã Quy Đức', 36)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (309, N'Thị trấn Nhà Bè', 46)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (310, N'Xã Phước Kiển', 46)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (311, N'Xã Phước Lộc', 46)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (312, N'Xã Nhơn Đức', 46)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (313, N'Xã Phú Xuân', 46)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (314, N'Xã Long Thới', 46)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (315, N'Xã Hiệp Phước', 46)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (316, N'Thị trấn Cần Thạnh', 47)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (317, N'Xã Bình Khánh', 47)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (318, N'Xã Tam Thôn Hiệp', 47)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (319, N'Xã An Thới Đông', 47)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (320, N'Xã Thạnh An', 47)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (321, N'Xã Long Hòa', 47)
GO
INSERT [dbo].[WARD] ([idWard], [nameWard], [idDistrict]) VALUES (322, N'Xã Lý Nhơn', 47)
GO
SET IDENTITY_INSERT [dbo].[WARD] OFF
GO
ALTER TABLE [dbo].[BILL]  WITH CHECK ADD  CONSTRAINT [FK__BILL__idBuild__30F848ED] FOREIGN KEY([idBuild])
REFERENCES [dbo].[BUILDING] ([idBuild])
GO
ALTER TABLE [dbo].[BILL] CHECK CONSTRAINT [FK__BILL__idBuild__30F848ED]
GO
ALTER TABLE [dbo].[BILL]  WITH CHECK ADD  CONSTRAINT [FK_BILL_CUSTOMER] FOREIGN KEY([idCustom])
REFERENCES [dbo].[CUSTOMER] ([idCustom])
GO
ALTER TABLE [dbo].[BILL] CHECK CONSTRAINT [FK_BILL_CUSTOMER]
GO
ALTER TABLE [dbo].[BILL]  WITH CHECK ADD  CONSTRAINT [FK_BILL_USER] FOREIGN KEY([idUserNV])
REFERENCES [dbo].[USER] ([idUser])
GO
ALTER TABLE [dbo].[BILL] CHECK CONSTRAINT [FK_BILL_USER]
GO
ALTER TABLE [dbo].[BUILDING]  WITH CHECK ADD  CONSTRAINT [FK__BUILDING__idType__31EC6D26] FOREIGN KEY([idType])
REFERENCES [dbo].[TYPE] ([idType])
GO
ALTER TABLE [dbo].[BUILDING] CHECK CONSTRAINT [FK__BUILDING__idType__31EC6D26]
GO
ALTER TABLE [dbo].[BUILDING]  WITH CHECK ADD  CONSTRAINT [FK__BUILDING__idUser__29572725] FOREIGN KEY([idUser])
REFERENCES [dbo].[USER] ([idUser])
GO
ALTER TABLE [dbo].[BUILDING] CHECK CONSTRAINT [FK__BUILDING__idUser__29572725]
GO
ALTER TABLE [dbo].[BUILDING]  WITH CHECK ADD  CONSTRAINT [FK__BUILDING__idWard__35BCFE0A] FOREIGN KEY([idWard])
REFERENCES [dbo].[WARD] ([idWard])
GO
ALTER TABLE [dbo].[BUILDING] CHECK CONSTRAINT [FK__BUILDING__idWard__35BCFE0A]
GO
ALTER TABLE [dbo].[BUILDING]  WITH CHECK ADD  CONSTRAINT [FK_BUILDING_HUONG] FOREIGN KEY([idHuong])
REFERENCES [dbo].[HUONG] ([idHuong])
GO
ALTER TABLE [dbo].[BUILDING] CHECK CONSTRAINT [FK_BUILDING_HUONG]
GO
ALTER TABLE [dbo].[BUILDING]  WITH CHECK ADD  CONSTRAINT [FK_BUILDING_STATUS] FOREIGN KEY([idStatus])
REFERENCES [dbo].[STATUS] ([idStatus])
GO
ALTER TABLE [dbo].[BUILDING] CHECK CONSTRAINT [FK_BUILDING_STATUS]
GO
ALTER TABLE [dbo].[DISTRICT]  WITH CHECK ADD FOREIGN KEY([idCity])
REFERENCES [dbo].[CITY] ([idCity])
GO
ALTER TABLE [dbo].[IMAGE]  WITH CHECK ADD  CONSTRAINT [FK_IMAGE_BUILDING] FOREIGN KEY([idBuild])
REFERENCES [dbo].[BUILDING] ([idBuild])
GO
ALTER TABLE [dbo].[IMAGE] CHECK CONSTRAINT [FK_IMAGE_BUILDING]
GO
ALTER TABLE [dbo].[NEWS]  WITH CHECK ADD  CONSTRAINT [FK__NEWS__idUser__286302EC] FOREIGN KEY([idUser])
REFERENCES [dbo].[USER] ([idUser])
GO
ALTER TABLE [dbo].[NEWS] CHECK CONSTRAINT [FK__NEWS__idUser__286302EC]
GO
ALTER TABLE [dbo].[PHIEUHEN]  WITH CHECK ADD  CONSTRAINT [FK__PHIEUHEN__idBuil__2E1BDC42] FOREIGN KEY([idBuild])
REFERENCES [dbo].[BUILDING] ([idBuild])
GO
ALTER TABLE [dbo].[PHIEUHEN] CHECK CONSTRAINT [FK__PHIEUHEN__idBuil__2E1BDC42]
GO
ALTER TABLE [dbo].[PHIEUHEN]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUHEN_CUSTOMER] FOREIGN KEY([idCustom])
REFERENCES [dbo].[CUSTOMER] ([idCustom])
GO
ALTER TABLE [dbo].[PHIEUHEN] CHECK CONSTRAINT [FK_PHIEUHEN_CUSTOMER]
GO
ALTER TABLE [dbo].[PHIEUHEN]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUHEN_USER] FOREIGN KEY([idUserNV])
REFERENCES [dbo].[USER] ([idUser])
GO
ALTER TABLE [dbo].[PHIEUHEN] CHECK CONSTRAINT [FK_PHIEUHEN_USER]
GO
ALTER TABLE [dbo].[SER_BUILD]  WITH CHECK ADD  CONSTRAINT [FK__SER_BUILD__idBui__2F10007B] FOREIGN KEY([idBuild])
REFERENCES [dbo].[BUILDING] ([idBuild])
GO
ALTER TABLE [dbo].[SER_BUILD] CHECK CONSTRAINT [FK__SER_BUILD__idBui__2F10007B]
GO
ALTER TABLE [dbo].[SER_BUILD]  WITH CHECK ADD FOREIGN KEY([idService])
REFERENCES [dbo].[SERVICES] ([idService])
GO
ALTER TABLE [dbo].[USER]  WITH CHECK ADD  CONSTRAINT [FK__USER__idRole__276EDEB3] FOREIGN KEY([idRole])
REFERENCES [dbo].[ROLE] ([idRole])
GO
ALTER TABLE [dbo].[USER] CHECK CONSTRAINT [FK__USER__idRole__276EDEB3]
GO
ALTER TABLE [dbo].[WARD]  WITH CHECK ADD  CONSTRAINT [FK__WARD__idDistrict__34C8D9D1] FOREIGN KEY([idDistrict])
REFERENCES [dbo].[DISTRICT] ([idDistrict])
GO
ALTER TABLE [dbo].[WARD] CHECK CONSTRAINT [FK__WARD__idDistrict__34C8D9D1]
GO
/****** Object:  StoredProcedure [dbo].[proc_CryptData]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[proc_CryptData] (@Data varchar(255))
as
begin
declare @Result varchar(256)
set @Result = dbo.func_CryptData(@Data)
select top 1 @Result
end

GO
/****** Object:  Trigger [dbo].[trg_AutoCryptPassword]    Script Date: 5/28/2020 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trg_AutoCryptPassword] on [dbo].[USER]
for insert, update
as
begin
	if UPDATE([userPassword])
	begin
		declare @id int
		declare @Password varchar(256)
		select @Password = [userPassword], @id = IdUser from inserted
		set @Password = dbo.func_CryptData(@Password)
		update [USER] set [userPassword] = @Password where IdUser = @id
	end
end

GO
