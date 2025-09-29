USE [eFactura]
GO
INSERT INTO [dbo].[PARAMETROS]  ([PARAMETRO_ID],[DESCRIPCION],[VALOR]) VALUES ('INI_BATCH_CONSULTA_FCE_HORA','Hora inicial en la que debe correr el batch de consulta del estado de comprobantes de FCE a AFIP','8')
INSERT INTO [dbo].[PARAMETROS]  ([PARAMETRO_ID],[DESCRIPCION],[VALOR]) VALUES ('FIN_BATCH_CONSULTA_FCE_HORA','Hora final   en la que debe correr el batch de consulta del estado de comprobantes de FCE a AFIP','20')
INSERT INTO [dbo].[PARAMETROS]  ([PARAMETRO_ID],[DESCRIPCION],[VALOR]) VALUES ('INI_BATCH_CONSULTA_FCE_MINUTO','Minuto inicial de cada hora en el que debe correr el batch de consulta del estado de comprobantes de FCE a AFIP','0')
INSERT INTO [dbo].[PARAMETROS]  ([PARAMETRO_ID],[DESCRIPCION],[VALOR]) VALUES ('FIN_BATCH_CONSULTA_FCE_MINUTO','Minuto final   de cada hora en el que debe correr el batch de consulta del estado de comprobantes de FCE a AFIP','5')
INSERT INTO [dbo].[PARAMETROS]  ([PARAMETRO_ID],[DESCRIPCION],[VALOR]) VALUES ('FLAG_BATCH_CONSULTA_CORRIENDO','Flag que marca que el proceso batch de consulta del estado de comprobantes de FCE a AFIP esta corriendo','S')
INSERT INTO [dbo].[PARAMETROS]  ([PARAMETRO_ID],[DESCRIPCION],[VALOR]) VALUES ('FORZAR_BATCH_CONSULTA_FCE_MINUTO','Forzar el proceso batch de consulta del estado de comprobantes de FCE a AFIP todo el tiempo','S')
INSERT INTO [dbo].[PARAMETROS]  ([PARAMETRO_ID],[DESCRIPCION],[VALOR]) VALUES ('ESTADO_DOC_1_FCE_PARA_CONSULTA_AFIP','Estado 1 de los comprobantes que serán los que se vayan a consultar a AFIP','P')
INSERT INTO [dbo].[PARAMETROS]  ([PARAMETRO_ID],[DESCRIPCION],[VALOR]) VALUES ('ESTADO_DOC_2_FCE_PARA_CONSULTA_AFIP','Estado 2 de los comprobantes que serán los que se vayan a consultar a AFIP','C')
INSERT INTO [dbo].[PARAMETROS]  ([PARAMETRO_ID],[DESCRIPCION],[VALOR]) VALUES ('ESTADO_DOC_3_FCE_PARA_CONSULTA_AFIP','Estado 3 de los comprobantes que serán los que se vayan a consultar a AFIP','A')

GO


