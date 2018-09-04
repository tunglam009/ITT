
/****** Object:  Table [dbo].[Mod_BaoCaoSuCo]    Script Date: 04-Sep-18 04:49:46 PM ******/
ALTER TABLE Mod_BaoCaoSuCo ADD Title nvarchar(250);
GO

/****** Object:  Table [dbo].[Mod_BaoCaoDienBienSuCo]    Script Date: 04-Sep-18 04:49:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Mod_BaoCaoDienBienSuCo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BaoCaoSuCoID] [int] NOT NULL CONSTRAINT [DF_Mod_BaoCaoDienBienSuCo_BaoCaoSuCoID]  DEFAULT ((0)),
	[UserID] [int] NULL,
	[UserID1] [int] NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](250) NULL,
	[ToChuc_Ten] [nvarchar](250) NULL,
	[ToChuc_DiaChi] [nvarchar](250) NULL,
	[ToChuc_DienThoai] [nvarchar](20) NULL,
	[ToChuc_Email] [nvarchar](100) NULL,
	[ChiTiet_MoTa] [nvarchar](1000) NULL,
	[ChiTiet_NgayTao] [datetime] NOT NULL CONSTRAINT [DF_Mod_BaoCaoDienBienSuCo_ChiTiet_NgayTao]  DEFAULT (getdate()),
	[Activity] [bit] NOT NULL CONSTRAINT [DF_Mod_BaoCaoDienBienSuCo_Activity]  DEFAULT ((0)),
 CONSTRAINT [PK_Mod_BaoCaoDienBienSuCo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Mod_BaoCaoHoTroPhoiHopSuCo]    Script Date: 04-Sep-18 04:50:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Mod_BaoCaoHoTroPhoiHopSuCo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BaoCaoSuCoID] [int] NOT NULL CONSTRAINT [DF_Mod_BaoCaoHoTroPhoiHopSuCo_BaoCaoSuCoID]  DEFAULT ((0)),
	[UserID] [int] NULL,
	[UserID1] [int] NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](250) NULL,
	[ToChuc_Ten] [nvarchar](250) NULL,
	[ToChuc_DiaChi] [nvarchar](250) NULL,
	[ToChuc_DienThoai] [nvarchar](20) NULL,
	[ToChuc_Email] [nvarchar](100) NULL,
	[ChiTiet_MoTa] [nvarchar](1000) NULL,
	[ChiTiet_NgayTao] [datetime] NOT NULL CONSTRAINT [DF_Mod_BaoCaoHoTroPhoiHopSuCo_ChiTiet_NgayTao]  DEFAULT (getdate()),
	[Activity] [bit] NOT NULL CONSTRAINT [DF_Mod_BaoCaoHoTroPhoiHopSuCo_Activity]  DEFAULT ((0)),
 CONSTRAINT [PK_Mod_BaoCaoHoTroPhoiHopSuCo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



/****** Object:  Table [dbo].[Mod_BaoCaoPhuongAnSuCo]    Script Date: 04-Sep-18 04:50:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Mod_BaoCaoPhuongAnSuCo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BaoCaoSuCoID] [int] NOT NULL CONSTRAINT [DF_Mod_BaoCaoPhuongAnSuCo_BaoCaoSuCoID]  DEFAULT ((0)),
	[UserID] [int] NULL,
	[UserID1] [int] NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](250) NULL,
	[ToChuc_Ten] [nvarchar](250) NULL,
	[ToChuc_DiaChi] [nvarchar](250) NULL,
	[ToChuc_DienThoai] [nvarchar](20) NULL,
	[ToChuc_Email] [nvarchar](100) NULL,
	[ChiTiet_MoTa] [nvarchar](1000) NULL,
	[ChiTiet_NgayTao] [datetime] NOT NULL CONSTRAINT [DF_Mod_BaoCaoPhuongAnSuCo_ChiTiet_NgayTao]  DEFAULT (getdate()),
	[Activity] [bit] NOT NULL CONSTRAINT [DF_Mod_BaoCaoPhuongAnSuCo_Activity]  DEFAULT ((0)),
 CONSTRAINT [PK_Mod_BaoCaoPhuongAnSuCo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



/****** Object:  Table [dbo].[Mod_ThongBaoSuCo]    Script Date: 04-Sep-18 04:50:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Mod_ThongBaoSuCo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[UserID1] [int] NULL,
	[MenuID] [int] NULL,
	[Code] [varchar](250) NULL,
	[State] [int] NULL,
	[ToChuc_Ten] [nvarchar](250) NULL,
	[ToChuc_DiaChi] [nvarchar](250) NULL,
	[ChiTiet_TenDonVi] [nvarchar](250) NULL,
	[ChiTiet_CoQuan] [nvarchar](250) NULL,
	[ChiTiet_TenHeThong] [nvarchar](250) NULL,
	[ChiTiet_MoTa] [nvarchar](1000) NULL,
	[ChiTiet_NgayGioPhatHien] [datetime] NULL,
	[ChiTiet_KetQua] [nvarchar](1000) NULL,
	[ChiTiet_KienNghi] [nvarchar](1000) NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Mod_ThongBaoSuCo_DateCreated]  DEFAULT (getdate()),
	[UpdatedDate] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NOT NULL CONSTRAINT [DF_Mod_ThongBaoSuCo_Activity]  DEFAULT ((0)),
 CONSTRAINT [PK_Mod_ThongBaoSuCo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



