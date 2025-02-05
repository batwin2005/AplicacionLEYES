USE [bdley]
GO
/****** Object:  Table [dbo].[tbl_articulos]    Script Date: 22/2/2021 04:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_articulos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idley] [int] NULL,
	[nombre] [nchar](50) NULL,
	[descripcion] [text] NULL,
 CONSTRAINT [PK_tbl_articulos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ley]    Script Date: 22/2/2021 04:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ley](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](100) NULL,
	[fecha] [date] NULL,
	[titulo] [nchar](100) NULL,
	[descripcion] [text] NULL,
	[decreto] [nchar](100) NULL,
 CONSTRAINT [PK_tbl_ley] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_observacion]    Script Date: 22/2/2021 04:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_observacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idley] [nchar](50) NULL,
	[observacion] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_titulos]    Script Date: 22/2/2021 04:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_titulos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idley] [int] NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_titulos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[actualizacion_articulo]    Script Date: 22/2/2021 04:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[actualizacion_articulo]
	-- Add the parameters for the stored procedure here
	@id int =0,
	@nombre varchar (max)=NULL,
	@descripcion varchar (max) = nULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tbl_articulos]
   SET
       [nombre] = @nombre
      ,[descripcion] =@descripcion
 WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[actualizacion_ley]    Script Date: 22/2/2021 04:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[actualizacion_ley]
	-- Add the parameters for the stored procedure here
	@id int =0,
	@nombre varchar (max)=NULL,
	@fecha Date = NULL,
	@titulo varchar (max) = NULL,
	@descripcion varchar (max) = nULL,
	@decreto varchar (max) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tbl_ley]
   SET
       [nombre] = @nombre
      ,[fecha] = @fecha
      ,[titulo] = @titulo
      ,[descripcion] =@descripcion
      ,[decreto] = @decreto
 WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[actualizar_observacion]    Script Date: 22/2/2021 04:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[actualizar_observacion]
	-- Add the parameters for the stored procedure here
	@id int =0,
	@observacion varchar (max) = nULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tbl_observacion]
   SET
[observacion] =@observacion
      
 WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[actualizar_titulos]    Script Date: 22/2/2021 04:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[actualizar_titulos]
	-- Add the parameters for the stored procedure here
	 @idley int =0,
	 @nombre varchar (max)=NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tbl_ley]
   SET
       [nombre] = @nombre
 WHERE id=@idley
END
GO
/****** Object:  StoredProcedure [dbo].[inserciones_leyes]    Script Date: 22/2/2021 04:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[inserciones_leyes]
	-- Add the parameters for the stored procedure here
	@nombre varchar (max),
	@fecha Date,
	@titulo varchar (max),
	@descripcion varchar (max),
	@decreto varchar (max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tbl_ley]
           ([nombre]
           ,[fecha]
           ,[titulo]
           ,[descripcion]
           ,[decreto])
     VALUES
           (@nombre,@fecha,	@titulo ,@descripcion,@decreto )
END
GO
/****** Object:  StoredProcedure [dbo].[iserciones_articulos]    Script Date: 22/2/2021 04:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[iserciones_articulos]
	-- Add the parameters for the stored procedure here
	@idley int  =0,
	@nombre varchar (max) = NULL,
	@descripcion varchar (max) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tbl_articulos]
           ([idley]
           ,[nombre],
		   [descripcion])
     VALUES
           (@idley,@nombre,@descripcion)
END
GO
/****** Object:  StoredProcedure [dbo].[iserciones_obervacion]    Script Date: 22/2/2021 04:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[iserciones_obervacion]
	-- Add the parameters for the stored procedure here
	@idley int  =0,
	@observacion varchar (max) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tbl_observacion]
           ([idley]
           ,[observacion])
     VALUES
           (@idley,@observacion)
END
GO
/****** Object:  StoredProcedure [dbo].[iserciones_titulos]    Script Date: 22/2/2021 04:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[iserciones_titulos]
	-- Add the parameters for the stored procedure here
	@idley int  =0,
	@nombre varchar (max) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tbl_titulos]
           ([idley]
           ,[nombre])
     VALUES
           (@idley,@nombre)
END
GO
/****** Object:  StoredProcedure [dbo].[sacar_Numero_de_Leyes]    Script Date: 22/2/2021 04:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sacar_Numero_de_Leyes]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT (COUNT(*)+1) as Num from tbl_ley;
END
GO
