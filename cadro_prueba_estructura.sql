USE [master]
GO
/****** Object:  Database [cadro_prueba]    Script Date: 27/01/2020 01:49:40 p.m. ******/
CREATE DATABASE [cadro_prueba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cadro_prueba', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\cadro_prueba.mdf' , SIZE = 27648KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'cadro_prueba_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\cadro_prueba_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [cadro_prueba] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cadro_prueba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cadro_prueba] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cadro_prueba] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cadro_prueba] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cadro_prueba] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cadro_prueba] SET ARITHABORT OFF 
GO
ALTER DATABASE [cadro_prueba] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cadro_prueba] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cadro_prueba] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cadro_prueba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cadro_prueba] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cadro_prueba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cadro_prueba] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cadro_prueba] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cadro_prueba] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cadro_prueba] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cadro_prueba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cadro_prueba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cadro_prueba] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cadro_prueba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cadro_prueba] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cadro_prueba] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cadro_prueba] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cadro_prueba] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [cadro_prueba] SET  MULTI_USER 
GO
ALTER DATABASE [cadro_prueba] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cadro_prueba] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cadro_prueba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cadro_prueba] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [cadro_prueba] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'cadro_prueba', N'ON'
GO
USE [cadro_prueba]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[catalogo_de_tramites]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[catalogo_de_tramites](
	[id_tipo_solicitud] [int] NOT NULL,
	[descripcion] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo_solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[catregiones]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[catregiones](
	[iIdRegion] [int] IDENTITY(0,1) NOT NULL,
	[cClaveRegion] [char](2) NOT NULL DEFAULT ('00'),
	[cRegion] [varchar](25) NOT NULL DEFAULT ('cRegion'),
PRIMARY KEY CLUSTERED 
(
	[iIdRegion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DRO_user]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DRO_user](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](35) NOT NULL,
	[contra] [nvarchar](18) NOT NULL,
	[nombre] [nvarchar](35) NOT NULL,
	[paterno] [nvarchar](20) NULL,
	[materno] [nvarchar](20) NULL,
	[cedulapro] [nvarchar](10) NOT NULL,
	[isactivado] [bit] NULL,
	[fecharegistro] [datetime] NULL,
 CONSTRAINT [PK_DRO_user] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IdRegistros]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdRegistros](
	[id_PadronDRO] [bigint] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
 CONSTRAINT [PK_IdRegistros] PRIMARY KEY CLUSTERED 
(
	[id_PadronDRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[integrantes]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[integrantes](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[presidente] [varchar](60) NOT NULL,
	[cargo_dependencia] [varchar](85) NOT NULL,
	[secretario_tecnico] [varchar](60) NOT NULL,
	[cargo_dependencia2] [varchar](70) NOT NULL,
	[vocal1] [varchar](60) NOT NULL,
	[cargo_dependencia3] [varchar](70) NOT NULL,
	[vocal2] [varchar](60) NOT NULL,
	[cargo_dependencia4] [varchar](70) NOT NULL,
	[propietario] [varchar](60) NOT NULL,
	[cargo_dependencia5] [varchar](70) NOT NULL,
	[invitado1] [varchar](60) NOT NULL,
	[cargo_dependencia6] [varchar](70) NOT NULL,
	[invitado2] [varchar](60) NOT NULL,
	[cargo_dependencia7] [varchar](70) NOT NULL,
	[vocal3] [varchar](60) NOT NULL,
	[cargo_dependencia8] [varchar](70) NOT NULL,
	[vocal4] [varchar](60) NOT NULL,
	[cargo_dependencia9] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[oficios]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[oficios](
	[numero_oficio] [int] IDENTITY(1,1) NOT NULL,
	[fecha_oficio] [date] NULL,
	[cedula] [char](13) NOT NULL,
	[id_solicitud] [int] NOT NULL,
	[id_tramite] [int] NOT NULL,
 CONSTRAINT [PK_oficios] PRIMARY KEY CLUSTERED 
(
	[numero_oficio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[padron]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[padron](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[cedula_prof] [int] NOT NULL,
	[registro_dro] [varchar](4) NOT NULL,
	[clasifica] [varchar](1) NOT NULL,
	[nombre] [varchar](70) NOT NULL,
	[prof] [varchar](3) NOT NULL,
	[profesion] [varchar](40) NOT NULL,
	[domicilio] [varchar](70) NOT NULL,
	[municipio] [varchar](50) NOT NULL,
	[region] [varchar](50) NOT NULL,
	[telefonos] [varchar](40) NOT NULL,
	[colegio] [varchar](50) NOT NULL,
	[egresado] [varchar](50) NOT NULL,
	[egre] [varchar](20) NOT NULL,
	[fecha_titulo] [varchar](10) NOT NULL,
	[fecha_cedula] [varchar](10) NOT NULL,
	[ano_reg_sop] [varchar](4) NOT NULL,
	[cursos] [varchar](20) NOT NULL,
	[vigencia_2000] [varchar](10) NOT NULL,
	[vigencia_2001] [varchar](10) NOT NULL,
	[vigencia_2002] [varchar](10) NOT NULL,
	[vigencia_2003] [varchar](10) NOT NULL,
	[vigencia_2004] [varchar](10) NOT NULL,
	[vigencia_2005] [varchar](10) NOT NULL,
	[vigencia_2006] [varchar](10) NOT NULL,
	[vigencia_2007] [varchar](10) NOT NULL,
	[vigencia_2008] [varchar](10) NOT NULL,
	[vigencia_2009] [varchar](10) NOT NULL,
	[vigencia_2010] [varchar](10) NOT NULL,
	[vigencia_2011] [varchar](10) NOT NULL,
	[vigencia_2012] [varchar](10) NOT NULL,
	[vig_2000] [varchar](2) NOT NULL,
	[vig_2001] [varchar](2) NOT NULL,
	[vig_2002] [varchar](2) NOT NULL,
	[vig_2003] [varchar](2) NOT NULL,
	[vig_2004] [varchar](2) NOT NULL,
	[vig_2005] [varchar](2) NOT NULL,
	[vig_2006] [varchar](2) NOT NULL,
	[vig_2007] [varchar](2) NOT NULL,
	[vig_2008] [varchar](2) NOT NULL,
	[vig_2009] [varchar](2) NOT NULL,
	[vig_2010] [varchar](2) NOT NULL,
	[vig_2011] [varchar](2) NOT NULL,
	[vig_2012] [varchar](2) NOT NULL,
	[folio_solicitud] [int] NOT NULL,
	[email] [varchar](40) NOT NULL,
	[ultima_vigencia] [varchar](4) NOT NULL,
	[observaciones] [varchar](20) NOT NULL,
	[vigencia_2013] [varchar](10) NOT NULL,
	[vigencia_2014] [varchar](10) NOT NULL,
	[vigencia_2015] [varchar](10) NOT NULL,
	[vigencia_2016] [varchar](10) NOT NULL,
	[vig_2013] [varchar](2) NOT NULL,
	[vig_2014] [varchar](2) NOT NULL,
	[vig_2015] [varchar](2) NOT NULL,
	[vig_2016] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[padron1]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[padron1](
	[cedula_profesional] [varchar](10) NOT NULL,
	[registro] [varchar](4) NULL DEFAULT (NULL),
	[clasifica] [varchar](1) NULL DEFAULT (NULL),
	[apellido_paterno] [varchar](60) NOT NULL,
	[apellido_materno] [varchar](30) NOT NULL,
	[nombres] [varchar](30) NOT NULL,
	[clave_profesion] [varchar](5) NOT NULL,
	[calle_numero] [varchar](80) NOT NULL,
	[colonia] [varchar](50) NOT NULL,
	[municipio] [int] NOT NULL,
	[region] [varchar](2) NOT NULL,
	[telefono_local] [varchar](60) NOT NULL,
	[telefono_celular] [varchar](50) NOT NULL,
	[colegio] [int] NOT NULL,
	[egresado_de] [int] NOT NULL,
	[fecha_titulo] [text] NOT NULL,
	[fecha_cedula] [text] NOT NULL,
	[ano_registro_sop] [varchar](4) NULL DEFAULT (''),
	[cursos] [text] NULL,
	[total_vigencias] [tinyint] NULL DEFAULT ('0'),
	[email] [varchar](80) NULL DEFAULT (''),
	[ultima_vigencia] [varchar](4) NULL DEFAULT (''),
	[observaciones] [text] NULL,
	[url_foto] [varchar](70) NULL DEFAULT (''),
	[Id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cedula_profesional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[padron2]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[padron2](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cedula_prof] [int] NOT NULL,
	[registro_dro] [varchar](4) NOT NULL,
	[clasifica] [varchar](1) NOT NULL,
	[nombre] [varchar](70) NOT NULL,
	[prof] [varchar](3) NOT NULL,
	[profesion] [varchar](40) NOT NULL,
	[domicilio] [varchar](70) NOT NULL,
	[municipio] [varchar](50) NOT NULL,
	[region] [varchar](50) NOT NULL,
	[telefonos] [varchar](40) NOT NULL,
	[colegio] [varchar](50) NOT NULL,
	[egresado] [varchar](50) NOT NULL,
	[egre] [varchar](20) NOT NULL,
	[fecha_titulo] [varchar](10) NOT NULL,
	[fecha_cedula] [varchar](10) NOT NULL,
	[ano_reg_sop] [varchar](4) NOT NULL,
	[cursos] [varchar](20) NOT NULL,
	[vigencia_2000] [varchar](10) NOT NULL,
	[vigencia_2001] [varchar](10) NOT NULL,
	[vigencia_2002] [varchar](10) NOT NULL,
	[vigencia_2003] [varchar](10) NOT NULL,
	[vigencia_2004] [varchar](10) NOT NULL,
	[vigencia_2005] [varchar](10) NOT NULL,
	[vigencia_2006] [varchar](10) NOT NULL,
	[vigencia_2007] [varchar](10) NOT NULL,
	[vigencia_2008] [varchar](10) NOT NULL,
	[vigencia_2009] [varchar](10) NOT NULL,
	[vigencia_2010] [varchar](10) NOT NULL,
	[vigencia_2011] [varchar](10) NOT NULL,
	[vigencia_2012] [varchar](10) NOT NULL,
	[vig_2000] [varchar](2) NOT NULL,
	[vig_2001] [varchar](2) NOT NULL,
	[vig_2002] [varchar](2) NOT NULL,
	[vig_2003] [varchar](2) NOT NULL,
	[vig_2004] [varchar](2) NOT NULL,
	[vig_2005] [varchar](2) NOT NULL,
	[vig_2006] [varchar](2) NOT NULL,
	[vig_2007] [varchar](2) NOT NULL,
	[vig_2008] [varchar](2) NOT NULL,
	[vig_2009] [varchar](2) NOT NULL,
	[vig_2010] [varchar](2) NOT NULL,
	[vig_2011] [varchar](2) NOT NULL,
	[vig_2012] [varchar](2) NOT NULL,
	[folio_solicitud] [int] NOT NULL,
	[email] [varchar](40) NOT NULL,
	[ultima_vigencia] [varchar](4) NOT NULL,
	[observaciones] [varchar](20) NOT NULL,
	[vigencia_2013] [varchar](10) NOT NULL,
	[vigencia_2014] [varchar](10) NOT NULL,
	[vigencia_2015] [varchar](10) NOT NULL,
	[vigencia_2016] [varchar](10) NOT NULL,
	[vig_2013] [varchar](2) NOT NULL,
	[vig_2014] [varchar](2) NOT NULL,
	[vig_2015] [varchar](2) NOT NULL,
	[vig_2016] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[solicitudes_pasadas]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[solicitudes_pasadas](
	[solicitud] [int] NOT NULL,
	[fecha] [varchar](10) NOT NULL,
	[registro] [varchar](4) NOT NULL,
	[solicita] [varchar](25) NOT NULL,
	[procede] [varchar](5) NOT NULL,
	[observaciones] [varchar](20) NOT NULL,
	[tramite_que_procede] [varchar](25) NOT NULL,
	[folio_solicitud] [int] NOT NULL,
	[folio_aceptacion] [int] NOT NULL,
	[folio_rechazado] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_PadronDRO]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_PadronDRO](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[cedula_profesional] [varchar](10) NOT NULL,
	[Idregistro] [bigint] NOT NULL,
	[clasifica] [varchar](1) NULL,
	[apellido_paterno] [varchar](255) NOT NULL,
	[apellido_materno] [varchar](255) NOT NULL,
	[nombres] [varchar](255) NOT NULL,
	[clave_profesion] [varchar](5) NOT NULL,
	[calle_numero] [varchar](255) NOT NULL,
	[colonia] [varchar](255) NOT NULL,
	[municipio] [int] NOT NULL,
	[region] [varchar](2) NOT NULL,
	[telefono_local] [varchar](60) NOT NULL,
	[telefono_celular] [varchar](50) NOT NULL,
	[colegio] [int] NOT NULL,
	[egresado_de] [int] NOT NULL,
	[fecha_titulo] [datetime] NOT NULL,
	[fecha_cedula] [datetime] NOT NULL,
	[anio_registro_sop] [varchar](4) NULL,
	[cursos] [text] NULL,
	[total_vigencias] [tinyint] NULL,
	[email] [varchar](255) NULL,
	[ultima_vigencia] [varchar](4) NULL,
	[observaciones] [text] NULL,
	[url_foto] [varchar](70) NULL,
	[FechaRegistro] [datetime] NULL,
	[FechaActualizacion] [datetime] NULL,
	[IdUsuario] [int] NULL,
	[Idlocalidad] [int] NULL,
	[NombreLocalidad] [varchar](255) NULL,
	[NombreMunicipio] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[cedula_profesional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblColegios]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblColegios](
	[id_colegio] [int] IDENTITY(0,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[abreviatura] [varchar](16) NOT NULL,
	[presidente] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_colegio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFoliosRegistros]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFoliosRegistros](
	[id_PadronDRO] [bigint] NOT NULL,
	[fecha] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLocalidades]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLocalidades](
	[Id] [int] NOT NULL,
	[entidad] [float] NULL,
	[nom_ent] [nvarchar](255) NULL,
	[mun] [float] NULL,
	[nom_mun] [nvarchar](255) NULL,
	[loc] [float] NULL,
	[nom_loc] [nvarchar](255) NULL,
	[longitud] [float] NULL,
	[latitud] [float] NULL,
	[altitud] [float] NULL,
	[pobtot] [float] NULL,
	[pobmas] [float] NULL,
	[pobfem] [float] NULL,
	[p_0a2] [float] NULL,
	[p_0a2_m] [float] NULL,
	[p_0a2_f] [float] NULL,
	[p_3ymas] [float] NULL,
	[p_3ymas_m] [float] NULL,
	[p_3ymas_f] [float] NULL,
	[p_5ymas] [float] NULL,
	[p_5ymas_m] [float] NULL,
	[p_5ymas_f] [float] NULL,
	[p_12ymas] [float] NULL,
	[p_12ymas_m] [float] NULL,
	[p_12ymas_f] [float] NULL,
	[p_15ymas] [float] NULL,
	[p_15ymas_m] [float] NULL,
	[p_15ymas_f] [float] NULL,
	[p_18ymas] [float] NULL,
	[p_18ymas_m] [float] NULL,
	[p_18ymas_f] [float] NULL,
	[p_3a5] [float] NULL,
	[p_3a5_m] [float] NULL,
	[p_3a5_f] [float] NULL,
	[p_6a11] [float] NULL,
	[p_6a11_m] [float] NULL,
	[p_6a11_f] [float] NULL,
	[p_8a14] [float] NULL,
	[p_8a14_m] [float] NULL,
	[p_8a14_f] [float] NULL,
	[p_12a14] [float] NULL,
	[p_12a14_m] [float] NULL,
	[p_12a14_f] [float] NULL,
	[p_15a17] [float] NULL,
	[p_15a17_m] [float] NULL,
	[p_15a17_f] [float] NULL,
	[p_18a24] [float] NULL,
	[p_18a24_m] [float] NULL,
	[p_18a24_f] [float] NULL,
	[p_15a49_f] [float] NULL,
	[p_60ymas] [float] NULL,
	[p_60ymas_m] [float] NULL,
	[p_60ymas_f] [float] NULL,
	[rel_h_m] [float] NULL,
	[prom_hnv] [float] NULL,
	[pnacent] [float] NULL,
	[pnacent_m] [float] NULL,
	[pnacent_f] [float] NULL,
	[pnacoe] [float] NULL,
	[pnacoe_m] [float] NULL,
	[pnacoe_f] [float] NULL,
	[pres2005] [float] NULL,
	[pres2005_m] [float] NULL,
	[pres2005_f] [float] NULL,
	[presoe05] [float] NULL,
	[presoe05_m] [float] NULL,
	[presoe05_f] [float] NULL,
	[p3ym_hli] [float] NULL,
	[p3ym_hli_m] [float] NULL,
	[p3ym_hli_f] [float] NULL,
	[p3hlinhe] [float] NULL,
	[p3hlinhe_m] [float] NULL,
	[p3hlinhe_f] [float] NULL,
	[p3hli_he] [float] NULL,
	[p3hli_he_m] [float] NULL,
	[p3hli_he_f] [float] NULL,
	[p5_hli] [float] NULL,
	[p5_hli_nhe] [float] NULL,
	[p5_hli_he] [float] NULL,
	[phog_ind] [float] NULL,
	[pcon_lim] [float] NULL,
	[pclim_mot] [float] NULL,
	[pclim_vis] [float] NULL,
	[pclim_leng] [float] NULL,
	[pclim_aud] [float] NULL,
	[pclim_mot2] [float] NULL,
	[pclim_men] [float] NULL,
	[pclim_men2] [float] NULL,
	[psin_lim] [float] NULL,
	[p3a5_noa] [float] NULL,
	[p3a5_noa_m] [float] NULL,
	[p3a5_noa_f] [float] NULL,
	[p6a11_noa] [float] NULL,
	[p6a11_noam] [float] NULL,
	[p6a11_noaf] [float] NULL,
	[p12a14noa] [float] NULL,
	[p12a14noam] [float] NULL,
	[p12a14noaf] [float] NULL,
	[p15a17a] [float] NULL,
	[p15a17a_m] [float] NULL,
	[p15a17a_f] [float] NULL,
	[p18a24a] [float] NULL,
	[p18a24a_m] [float] NULL,
	[p18a24a_f] [float] NULL,
	[p8a14an] [float] NULL,
	[p8a14an_m] [float] NULL,
	[p8a14an_f] [float] NULL,
	[p15ym_anint] [float] NULL,
	[p15ym_an_m] [float] NULL,
	[p15ym_an_f] [float] NULL,
	[p15ym_se] [float] NULL,
	[p15ym_se_m] [float] NULL,
	[p15ym_se_f] [float] NULL,
	[p15pri_in] [float] NULL,
	[p15pri_inm] [float] NULL,
	[p15pri_inf] [float] NULL,
	[p15pri_co] [float] NULL,
	[p15pri_com] [float] NULL,
	[p15pri_cof] [float] NULL,
	[p15sec_in] [float] NULL,
	[p15sec_inm] [float] NULL,
	[p15sec_inf] [float] NULL,
	[p15sec_co] [float] NULL,
	[p15sec_com] [float] NULL,
	[p15sec_cof] [float] NULL,
	[p18ym_pb] [float] NULL,
	[p18ym_pb_m] [float] NULL,
	[p18ym_pb_f] [float] NULL,
	[graproes] [float] NULL,
	[graproes_m] [float] NULL,
	[graproes_f] [float] NULL,
	[pea] [float] NULL,
	[pea_m] [float] NULL,
	[pea_f] [float] NULL,
	[pe_inac] [float] NULL,
	[pe_inac_m] [float] NULL,
	[pe_inac_f] [float] NULL,
	[pocupada] [float] NULL,
	[pocupada_m] [float] NULL,
	[pocupada_fint] [float] NULL,
	[pdesocup] [float] NULL,
	[pdesocup_m] [float] NULL,
	[pdesocup_f] [float] NULL,
	[psinder] [float] NULL,
	[pder_ss] [float] NULL,
	[pder_imss] [float] NULL,
	[pder_iste] [float] NULL,
	[pder_istee] [float] NULL,
	[pder_segp] [float] NULL,
	[p12ym_solt] [float] NULL,
	[p12ym_casa] [float] NULL,
	[p12ym_sepa] [float] NULL,
	[pcatolica] [float] NULL,
	[pncatolica] [float] NULL,
	[potras_rel] [float] NULL,
	[psin_relig] [float] NULL,
	[tothog] [float] NULL,
	[hogjef_m] [float] NULL,
	[hogjef_f] [float] NULL,
	[pobhog] [float] NULL,
	[phogjef_m] [float] NULL,
	[phogjef_f] [float] NULL,
	[tvivhab] [float] NULL,
	[tvivpar] [float] NULL,
	[vivpar_hab] [float] NULL,
	[vivpar_des] [float] NULL,
	[vivpar_ut] [float] NULL,
	[ocupvivpar] [float] NULL,
	[prom_ocup] [float] NULL,
	[pro_ocup_c] [float] NULL,
	[vph_pisodt] [float] NULL,
	[vph_pisoti] [float] NULL,
	[vph_1dor] [float] NULL,
	[vph_2ymasd] [float] NULL,
	[vph_1cuart] [float] NULL,
	[vph_2cuart] [float] NULL,
	[vph_3ymasc] [float] NULL,
	[vph_c_elec] [float] NULL,
	[vph_s_elec] [float] NULL,
	[vph_aguadv] [float] NULL,
	[vph_aguafv] [float] NULL,
	[vph_excsa] [float] NULL,
	[vph_drenaj] [float] NULL,
	[vph_nodren] [float] NULL,
	[vph_c_serv] [float] NULL,
	[vph_snbien] [float] NULL,
	[vph_radio] [float] NULL,
	[vph_tv] [float] NULL,
	[vph_refri] [float] NULL,
	[vph_lavad] [float] NULL,
	[vph_autom] [float] NULL,
	[vph_pc] [float] NULL,
	[vph_telef] [float] NULL,
	[vph_cel] [float] NULL,
	[vph_inter] [float] NULL,
	[tam_loc] [float] NULL,
 CONSTRAINT [PK_tblLocalidades_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMunicipios]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMunicipios](
	[idMunicipio] [float] NULL,
	[nombreMunicipioINEGI] [nvarchar](255) NULL,
	[nombreMunicipioSEFIN] [nvarchar](255) NULL,
	[CNCH] [nvarchar](255) NULL,
	[NOMBREANTIGUO] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPadronDRO]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPadronDRO](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[cedula] [char](13) NOT NULL,
	[Idregistro] [int] NULL,
	[clasificacion] [varchar](1) NULL,
	[ap_paterno] [nvarchar](200) NOT NULL,
	[ap_materno] [nvarchar](200) NULL,
	[nombre] [nvarchar](200) NOT NULL,
	[id_profesion] [varchar](5) NOT NULL,
	[calle_numero] [nvarchar](255) NOT NULL,
	[colonia] [nvarchar](200) NOT NULL,
	[telefono_local] [bigint] NULL,
	[telefono_celular] [bigint] NOT NULL,
	[id_colegio] [int] NOT NULL,
	[id_universidad] [int] NOT NULL,
	[fecha_titulo] [datetime] NOT NULL,
	[fecha_cedula] [datetime] NOT NULL,
	[anio_reg_sop] [int] NULL,
	[cursos] [text] NULL,
	[email] [varchar](80) NOT NULL,
	[ultima_vigencia] [int] NULL,
	[observaciones] [text] NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[FechaActualizacion] [datetime] NULL,
	[Idlocalidad] [int] NOT NULL,
	[curp] [varchar](18) NOT NULL,
	[rfc] [varchar](13) NULL,
	[nacimiento] [nvarchar](80) NULL,
	[isActivado] [bit] NULL,
	[url] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_tblPadronDRO_cedula] UNIQUE NONCLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_tblPadronDRO_curp] UNIQUE NONCLUSTERED 
(
	[curp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_tblPadronDRO_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_tblPadronDRO_rfc] UNIQUE NONCLUSTERED 
(
	[rfc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProfesiones]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProfesiones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[id_profesion] [varchar](5) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[clave_de_profesion] [varchar](2) NOT NULL,
	[abreviatura_de_profesion] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_profesion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRegion]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRegion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NULL,
 CONSTRAINT [PK_tblRegion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRegionesMunicipios]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegionesMunicipios](
	[idMunicipio] [float] NULL,
	[idModuloDesarrolloSustentable] [float] NULL,
	[idDistritoRentistico] [float] NULL,
	[idRegion] [float] NULL,
	[idMicroRegionCOPLADE] [float] NULL,
	[idMicroRegionCGMDS] [float] NULL,
	[idMicroRegionSEDESOH] [float] NULL,
	[idModuloDesarrolloRegional2016] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblsolicitudes]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblsolicitudes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_de_sesion] [datetime] NULL,
	[fecha_solicitud] [datetime] NOT NULL,
	[folio_solicitud] [int] NULL,
	[id_PadronDRO] [bigint] NOT NULL,
	[tramite_que_solicita] [nvarchar](60) NOT NULL,
	[observaciones] [varchar](250) NULL,
	[numero_de_oficio] [int] NULL,
	[fecha_de_oficio] [datetime] NULL,
	[status] [nvarchar](200) NOT NULL,
	[fecha_de_entrega_de_licencia] [datetime] NULL,
	[entregado_por] [nvarchar](255) NULL,
	[notasfecha] [nvarchar](255) NULL,
	[votos] [int] NULL DEFAULT ((0)),
	[registrovotos] [int] NULL DEFAULT ((0)),
	[correo_votantes] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUniversidades]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUniversidades](
	[id_universidad] [int] IDENTITY(0,1) NOT NULL,
	[descripcion] [varchar](80) NOT NULL,
	[abreviatura] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_universidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsuarios]    Script Date: 27/01/2020 01:49:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Contrasena] [varchar](500) NULL,
	[Nombre] [varchar](300) NULL,
	[APaterno] [varchar](300) NULL,
	[AMaterno] [varchar](300) NULL,
	[isActivado] [bit] NULL,
	[rol] [varchar](255) NULL,
	[fechaRegistro] [datetime] NULL,
	[Email] [varchar](600) NULL,
	[nivel] [int] NULL,
	[nomUser] [varchar](255) NULL,
	[cedula] [varchar](10) NULL,
 CONSTRAINT [PK_tblUsuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_tblUsuario_Cedula] UNIQUE NONCLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_tblUsuario_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 27/01/2020 01:49:41 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 27/01/2020 01:49:41 p.m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 27/01/2020 01:49:41 p.m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 27/01/2020 01:49:41 p.m. ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 27/01/2020 01:49:41 p.m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 27/01/2020 01:49:41 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[tblFoliosRegistros]  WITH CHECK ADD  CONSTRAINT [FK_tblFoliosRegistros_tblPadronDRO] FOREIGN KEY([id_PadronDRO])
REFERENCES [dbo].[tblPadronDRO] ([id])
GO
ALTER TABLE [dbo].[tblFoliosRegistros] CHECK CONSTRAINT [FK_tblFoliosRegistros_tblPadronDRO]
GO
ALTER TABLE [dbo].[tblPadronDRO]  WITH CHECK ADD  CONSTRAINT [FK_tblPadronDRO_tblColegios] FOREIGN KEY([id_colegio])
REFERENCES [dbo].[tblColegios] ([id_colegio])
GO
ALTER TABLE [dbo].[tblPadronDRO] CHECK CONSTRAINT [FK_tblPadronDRO_tblColegios]
GO
ALTER TABLE [dbo].[tblPadronDRO]  WITH CHECK ADD  CONSTRAINT [FK_tblPadronDRO_tblLocalidades] FOREIGN KEY([Idlocalidad])
REFERENCES [dbo].[tblLocalidades] ([Id])
GO
ALTER TABLE [dbo].[tblPadronDRO] CHECK CONSTRAINT [FK_tblPadronDRO_tblLocalidades]
GO
ALTER TABLE [dbo].[tblPadronDRO]  WITH CHECK ADD  CONSTRAINT [FK_tblPadronDRO_tblProfesiones] FOREIGN KEY([id_profesion])
REFERENCES [dbo].[tblProfesiones] ([id_profesion])
GO
ALTER TABLE [dbo].[tblPadronDRO] CHECK CONSTRAINT [FK_tblPadronDRO_tblProfesiones]
GO
ALTER TABLE [dbo].[tblPadronDRO]  WITH CHECK ADD  CONSTRAINT [FK_tblPadronDRO_tblUniversidades] FOREIGN KEY([id_universidad])
REFERENCES [dbo].[tblUniversidades] ([id_universidad])
GO
ALTER TABLE [dbo].[tblPadronDRO] CHECK CONSTRAINT [FK_tblPadronDRO_tblUniversidades]
GO
ALTER TABLE [dbo].[tblsolicitudes]  WITH CHECK ADD  CONSTRAINT [FK_tblsolicitudes_tblPadronDRO] FOREIGN KEY([id_PadronDRO])
REFERENCES [dbo].[tblPadronDRO] ([id])
GO
ALTER TABLE [dbo].[tblsolicitudes] CHECK CONSTRAINT [FK_tblsolicitudes_tblPadronDRO]
GO
USE [master]
GO
ALTER DATABASE [cadro_prueba] SET  READ_WRITE 
GO
