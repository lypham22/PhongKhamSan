USE [PhongKhamSan]
GO
/****** Object:  Table [dbo].[BenhNhan]    Script Date: 11/26/2022 8:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BenhNhan](
	[MaBenhNhan] [int] IDENTITY(1,1) NOT NULL,
	[HoVaTen] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[NamSinh] [int] NULL,
	[Para] [nchar](8) NULL,
	[NgayDuSanh] [date] NULL,
	[DienThoai] [nchar](13) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[GhiChu] [nvarchar](256) NULL,
	[GioiTinh] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinKham]    Script Date: 11/26/2022 8:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinKham](
	[MaThongTinKham] [bigint] IDENTITY(1,1) NOT NULL,
	[LyDoKham] [nvarchar](256) NULL,
	[TienSu] [nvarchar](256) NULL,
	[BenhSu] [nvarchar](256) NULL,
	[Mach] [decimal](18, 2) NULL,
	[HuyetAp] [nchar](10) NULL,
	[NhietDo] [decimal](18, 2) NULL,
	[CanNang] [decimal](18, 2) NULL,
	[ChieuCao] [decimal](18, 2) NULL,
	[BMI] [decimal](18, 2) NULL,
	[TongTrang] [nvarchar](50) NULL,
	[Tim] [nvarchar](50) NULL,
	[Phoi] [nvarchar](50) NULL,
	[Bung] [nvarchar](50) NULL,
	[BeCaoTuCung] [decimal](18, 2) NULL,
	[TimThai1] [decimal](18, 2) NULL,
	[TimThai2] [decimal](18, 2) NULL,
	[ConGo] [decimal](18, 2) NULL,
	[AmHo] [nvarchar](50) NULL,
	[AmDao] [nvarchar](50) NULL,
	[CoTuCung] [nvarchar](50) NULL,
	[Ngoi] [nvarchar](50) NULL,
	[NuocOi] [nvarchar](50) NULL,
	[KhungChau] [nvarchar](50) NULL,
	[YeuToNguyCo] [nvarchar](50) NULL,
	[CacChiDinhCLS] [nvarchar](256) NULL,
	[ChuanDoan] [nvarchar](256) NULL,
	[HuongXuLy] [nvarchar](256) NULL,
	[ToaThuoc] [nvarchar](256) NULL,
	[TaiKham] [nvarchar](256) NULL,
	[DanDo] [nvarchar](256) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinKhamBN]    Script Date: 11/26/2022 8:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinKhamBN](
	[MaKham] [int] IDENTITY(1,1) NOT NULL,
	[MaBenhNhan] [int] NULL,
	[MaThongTinKham] [int] NULL,
	[NgayTao] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thuoc]    Script Date: 11/26/2022 8:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thuoc](
	[MaThuoc] [int] IDENTITY(1,1) NOT NULL,
	[TenThuoc] [nvarchar](100) NULL,
	[DonGia] [int] NULL,
	[SoLuong] [int] NULL,
	[HanSuDung] [datetime] NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spa_ChiTietBenhNhan]    Script Date: 11/26/2022 8:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spa_ChiTietBenhNhan] 
	-- Add the parameters for the stored procedure here
	@MaBenhNhan int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM BenhNhan (nolock)
	WHERE MaBenhNhan = @MaBenhNhan

END
GO
/****** Object:  StoredProcedure [dbo].[spa_DanhSachBenhNhan]    Script Date: 11/26/2022 8:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spa_DanhSachBenhNhan] 
	-- Add the parameters for the stored procedure here
	@SoDienThoai nvarchar(13),
	@Print bit = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @SoDienThoai = ''
	BEGIN
		SELECT MaBenhNhan, HoVaTen, NgayDuSanh, DiaChi,NgayTao
		FROM BenhNhan (nolock)
		ORDER BY HoVaTen
	END
	ELSE
	BEGIN
		SELECT MaBenhNhan, HoVaTen, NgayDuSanh, DiaChi,NgayTao
		FROM BenhNhan (nolock)
		WHERE DienThoai like '%'+@SoDienThoai+'%' 
		ORDER BY HoVaTen
	END
END


--exec [spa_DanhSachBenhNhan] @SoDienThoai='2'
GO
/****** Object:  StoredProcedure [dbo].[spa_LuuThongTinKham]    Script Date: 11/26/2022 8:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spa_LuuThongTinKham]
	-- Add the parameters for the stored procedure here
	  @MaBenhNhan int
	  ,@MaThongTinKham int = 0
      ,@LyDoKham nvarchar(100)
      ,@TienSu  nvarchar(100)
      ,@BenhSu nvarchar(100)
      ,@Mach decimal = null
      ,@HuyetAp nvarchar(100)
      ,@NhietDo decimal = null
      ,@CanNang decimal = null
      ,@ChieuCao decimal = null
      ,@BMI decimal = null
      ,@TongTrang nvarchar(100)
      ,@Tim nvarchar(100)
      ,@Phoi nvarchar(100)
      ,@Bung nvarchar(100)
      ,@BeCaoTuCung decimal = null
      ,@TimThai1 decimal = null
      ,@TimThai2 decimal = null
      ,@ConGo decimal = null
      ,@AmHo nvarchar(100)
      ,@AmDao nvarchar(100)
      ,@CoTuCung nvarchar(100)
      ,@Ngoi nvarchar(100)
      ,@NuocOi nvarchar(100)
      ,@KhungChau nvarchar(100)
      ,@YeuToNguyCo nvarchar(100)
      ,@CacChiDinhCLS nvarchar(100)
      ,@ChuanDoan nvarchar(100)
      ,@HuongXuLy nvarchar(100)
      ,@TaiKham nvarchar(100)
      ,@DanDo  nvarchar(100)
	  ,@MaTTKham int OUTPUT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF @MaThongTinKham = 0
	BEGIN
		INSERT INTO ThongTinKham(LyDoKham
      ,TienSu
      ,BenhSu
      ,Mach
      ,HuyetAp
      ,NhietDo
      ,CanNang
      ,ChieuCao
      ,BMI
      ,TongTrang
      ,Tim
      ,Phoi
      ,Bung
      ,BeCaoTuCung
      ,TimThai1
      ,TimThai2
      ,ConGo
      ,AmHo
      ,AmDao
      ,CoTuCung
      ,Ngoi
      ,NuocOi
      ,KhungChau
      ,YeuToNguyCo
      ,CacChiDinhCLS
      ,ChuanDoan
      ,HuongXuLy
      ,TaiKham
      ,DanDo
      ,NgayTao)
		VALUES(@LyDoKham
      ,@TienSu
      ,@BenhSu
      ,@Mach
      ,@HuyetAp
      ,@NhietDo
      ,@CanNang
      ,@ChieuCao
      ,@BMI
      ,@TongTrang
      ,@Tim
      ,@Phoi
      ,@Bung
      ,@BeCaoTuCung
      ,@TimThai1
      ,@TimThai2
      ,@ConGo
      ,@AmHo
      ,@AmDao
      ,@CoTuCung
      ,@Ngoi
      ,@NuocOi
      ,@KhungChau
      ,@YeuToNguyCo
      ,@CacChiDinhCLS
      ,@ChuanDoan
      ,@HuongXuLy
      ,@TaiKham
      ,@DanDo
      ,GETDATE())
		
		SELECT @MaThongTinKham = SCOPE_IDENTITY();
		INSERT INTO ThongTinKhamBN(MaThongTinKham, MaBenhNhan) VALUES (@MaThongTinKham, @MaBenhNhan)

		SELECT @MaTTKham = @MaThongTinKham
	END
	ELSE
	BEGIN
		UPDATE ThongTinKham
		SET LyDoKham = @LyDoKham, TienSu = @TienSu, BenhSu = @BenhSu, Mach = @Mach, HuyetAp = @HuyetAp, NhietDo = @NhietDo,
		CanNang = @CanNang, ChieuCao = @ChieuCao, BMI = @BMI, TongTrang = @TongTrang, Tim = @Tim, @Phoi = @Phoi, @Bung = @Bung,
		BeCaoTuCung = @BeCaoTuCung, TimThai1 = @TimThai1, TimThai2 = @TimThai2, ConGo = @ConGo, AmHo = @AmHo, CoTuCung = @CoTuCung,
		Ngoi = @Ngoi, NuocOi = @NuocOi, KhungChau =@KhungChau, YeuToNguyCo = @YeuToNguyCo, CacChiDinhCLS = @CacChiDinhCLS,
		ChuanDoan = @ChuanDoan, HuongXuLy = @HuongXuLy, TaiKham = @TaiKham, DanDo = @DanDo, NgayCapNhat = GETDATE()
		WHERE MaThongTinKham = @MaThongTinKham

		SELECT @MaTTKham = @MaThongTinKham
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spa_ThemBenhNhan]    Script Date: 11/26/2022 8:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spa_ThemBenhNhan]
	-- Add the parameters for the stored procedure here
	@MaBenhNhan int,
	@HoVaTen nvarchar(100),
	@DiaChi nvarchar(100),
	@NamSinh int,
	@Para nchar(8),
	@DienThoai nchar(13),
	@NgayDuSanh DateTime,
	@GhiChu nvarchar(256),
	@GioiTinh int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @MaBenhNhan = 0
	BEGIN
		IF NOT EXISTS (SELECT MaBenhNhan FROM BenhNhan WHERE DienThoai=@DienThoai)
			INSERT INTO BenhNhan(HoVaTen, DiaChi, NamSinh, Para, DienThoai, NgayDuSanh, GioiTinh, NgayTao)
			VALUES(@HoVaTen, @DiaChi, @NamSinh, @Para, @DienThoai, @NgayDuSanh, @GioiTinh, GETDATE())
		ELSE
		PRINT N'Thêm Bệnh Nhân Lỗi'
	END
	ELSE
	BEGIN
		UPDATE BenhNhan
		SET HoVaTen = @HoVaTen, DiaChi = @DiaChi, NamSinh = @NamSinh, Para = @Para, DienThoai = @DienThoai
		, NgayDuSanh = @NgayDuSanh, GhiChu = @GhiChu, GioiTinh = @GioiTinh, NgayCapNhat = GETDATE()
		WHERE MaBenhNhan = @MaBenhNhan
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spa_ThemThuoc]    Script Date: 11/26/2022 8:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spa_ThemThuoc]
	-- Add the parameters for the stored procedure here
	@MaThuoc int,
	@TenThuoc nvarchar(100),
	@DonGia int,
	@SoLuong int,
	@HanSuDung datetime

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @MaThuoc = 0
	BEGIN
			INSERT INTO Thuoc(TenThuoc, DonGia, SoLuong, HanSuDung, NgayTao)
			VALUES(@TenThuoc, @DonGia, @SoLuong, @HanSuDung, GETDATE())
	END
	ELSE
	BEGIN
		UPDATE Thuoc
		SET TenThuoc = @TenThuoc, DonGia = @DonGia,SoLuong= @SoLuong, HanSuDung = @HanSuDung, NgayCapNhat = GETDATE()
		WHERE MaThuoc = @MaThuoc
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spa_XoaBenhNhan]    Script Date: 11/26/2022 8:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spa_XoaBenhNhan] 
	-- Add the parameters for the stored procedure here
	@MaBenhNhan int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM BenhNhan 
	WHERE MaBenhNhan = @MaBenhNhan

END
GO
