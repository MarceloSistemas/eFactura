USE [eFactura]
GO
/****** Objeto:  StoredProcedure [dbo].[DOCUMENTOS_INS]    Fecha de la secuencia de comandos: 11/26/2019 11:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[DOCUMENTOS_INS] (
@DOCUMENTO_ID char(36), @EMPRESA_ID int, @CbteTipo int, @PtoVta int, @CbteNro int, @Concepto int, @DocTipo int, @DocNro bigint, @CbteFecha char(8), @ImpTotal float(53), @ImpTotConc float(53), @ImpNeto float(53), @ImpOpEx float(53), @ImpIva float(53), @ImpTrib float(53), @FchServDesde char(8), @FchServHasta char(8), @FchVtoPago char(8), @MonId char(3), @MonCotiz float(53), @ESTADO_ID char(1), @NOTAS varchar(5000), @FECHA_ALTA datetime, @FECHA_ACTUALIZACION datetime, @ERP_NOMBRE_ARCHIVO varchar(500), @CAE varchar(14), @cbteFchVto char(8) = NULL, @cbu varchar(22) = NULL, @aliasCbu varchar(22) = NULL, @rcbtetipo int = NULL, @rptovta int = NULL, @rcbtenro int = NULL, @rcbtefech char(8) = NULL, @estadoAfip char(1) = NULL, @anulacion char(1) = NULL )
AS
SET NOCOUNT ON
INSERT INTO DOCUMENTOS ( 
DOCUMENTO_ID,    EMPRESA_ID,   CbteTipo,   PtoVta,   CbteNro,   Concepto,   DocTipo,   DocNro,   CbteFecha,  ImpTotal,  ImpTotConc,  ImpNeto,  ImpOpEx,  ImpIva,  ImpTrib,  FchServDesde,  FchServHasta,  FchVtoPago,  MonId,  MonCotiz,  ESTADO_ID, NOTAS,  FECHA_ALTA,   FECHA_ACTUALIZACION,  ERP_NOMBRE_ARCHIVO,  CAE,  cbteFchVto, cbu,   aliasCbu,  rcbtetipo,  rptovta,  rcbtenro,  rcbtefech,  estadoAfip, anulacion) 
VALUES ( 
@DOCUMENTO_ID,  @EMPRESA_ID,  @CbteTipo,  @PtoVta,  @CbteNro,  @Concepto,  @DocTipo,  @DocNro,  @CbteFecha, @ImpTotal, @ImpTotConc, @ImpNeto, @ImpOpEx, @ImpIva, @ImpTrib, @FchServDesde, @FchServHasta, @FchVtoPago, @MonId, @MonCotiz, @ESTADO_ID, @NOTAS, @FECHA_ALTA, @FECHA_ACTUALIZACION, @ERP_NOMBRE_ARCHIVO, @CAE, @cbteFchVto, @cbu, @aliasCbu, @rcbtetipo, @rptovta, @rcbtenro, @rcbtefech, @estadoAfip, @anulacion)
