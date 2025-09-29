USE [eFactura]
GO
/****** Objeto:  StoredProcedure [dbo].[DOCUMENTOS_A_INFORMAR_LIST]    Fecha de la secuencia de comandos: 11/26/2019 11:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[DOCUMENTOS_A_INFORMAR_LIST]
as
SET NOCOUNT ON
SELECT DOCUMENTO_ID, EMPRESA_ID, CbteTipo, PtoVta, CbteNro, Concepto, DocTipo, DocNro, CbteFecha, ImpTotal, ImpTotConc, ImpNeto, ImpOpEx, ImpIva, ImpTrib, FchServDesde, FchServHasta, FchVtoPago, MonId, MonCotiz, ESTADO_ID, NOTAS, FECHA_ALTA, FECHA_ACTUALIZACION, ERP_NOMBRE_ARCHIVO, CAE, CAEFchVto, Error, anulacion  
FROM DOCUMENTOS where ESTADO_ID in ('O','E')
