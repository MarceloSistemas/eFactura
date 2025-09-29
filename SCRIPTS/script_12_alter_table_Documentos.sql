USE [eFactura]
GO

/****** Object:  Table [dbo].[DOCUMENTOS]    Script Date: 03/09/2019 12:55:01 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [dbo].[DOCUMENTOS]
ADD 
[rcbtetipo] [int] NULL,
[rptovta] [int] NULL,
[rcbtenro] [int] NULL,
[rcbtefech] [char](8) NULL,
estadoAfip [char](1) NULL
GO