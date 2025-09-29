USE [eFactura]
GO

/****** Object:  Table [dbo].[DOCUMENTOS]    Script Date: 03/09/2019 12:55:01 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [dbo].[DOCUMENTOS]
ADD [cbteFchVto] [char](8) NULL,
[cbu] [varchar](22) NULL,
[aliasCbu] [varchar](22) NULL

GO