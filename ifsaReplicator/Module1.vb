Option Explicit On
Option Strict On

Imports System
Imports System.Configuration
Imports System.IO
Imports System.Text
Imports ASF.Dal
Imports ifsaReplicator
Imports eFactura.Core

Module Module1

    Sub Main()
        Dim objDalJDE As New DataAccess(ConfigurationManager.AppSettings("ConnectionStringJDE"), "GotDotNet.ApplicationBlocks.Data", "GotDotNet.ApplicationBlocks.Data.SqlServer")
        Try
            CopiarDocumentos(objDalJDE)
            Dim iSender As New eFactura.Core.Engine
            iSender.Execute()
            ActualizarDocumentos()
            ' PK 07/10/2019 Actualización de estados de comprobantes FCE contra AFIP
            iSender.ActualizarEstadoFacturasFCE(objDalJDE)

        Catch ex As Exception
            Helpers.LoggerHelper.LogException("Error en Replicador: ", ex)
        Finally
            objDalJDE.Dispose()
            objDalJDE = Nothing
        End Try
    End Sub

    '' Consulta los 100 primeros datos en la tablas JDE 
    '' proddta.f56BEJFE, proddta.f4201, proddta.f560002 con TIPO='A' and ESTADO ('N','A','C') y los pone en dstDocumentosIfsa
    '' Recorre todo lo que trajo y borra los documentos de la tabla documentos, iva y tributos que coincidan
    '' Inserta en las tablas documentos y documentos_iva
    '' Actualiza el documento en la tabla FDE a estado "T" en la tabla proddta.f56BEJFE
    Private Sub CopiarDocumentos(objDalJDE As DataAccess)

        Dim objDataAccess As New DataAccess
        Try
            objDataAccess.commandTimeOut = 360
            ' PK 03/09/2019 - agrego tres campos para FCE
            Dim dstDocumentosIfsa As New DocumentosIfsa
            Dim dstDocumentosRecord As New DocumentoRecord
            '----------------------------------------------
            Dim DOCUMENTO_ID As String = ""

            Dim query As String = "select top 100 cbteTipo, PtoVta,CbteNro, Concepto,DocTipo, DocNro, CbteFech as CbteFch ,bjag/100 as ImpTotal, " &
                "cast(cast((bjag/100) / (1 + (IVTXR1/100)) as decimal(13,2)) as float) as impNeto, " &
                "BJCRCD as MonID, MonCotiz, Estado, cast(IVTXR2 as integer) as TipoIva, IVTXR1 as AlicuotaIva, " &
                "cbtefchvto as cbteFchVto, cbu,  aliascbu  as aliasCbu, " &
                "rcbtetipo as rCbteTipo, rptovta as rPtoVta, rcbtenro as rCbteNro, rcbtefech as rCbteFech, anulacion, ISNULL(Condiva,'1') as Condiva " &
                "from proddta.f56BEJFEL inner  join proddta.f4201 on BJDOCO = SHDOCO and BJDCTO = SHDCTO " &
                "inner  join proddta.f560002 on SHTXA1 = IVTXA1 where TIPO='A' and ESTADO in('N','A','C')"

            'objDalJDE.FillDataSet(CommandType.Text, "select cbteTipo, PtoVta,CbteNro, Concepto,DocTipo, DocNro, CbteFech as CbteFch ,bjag/100 as ImpTotal, cast(cast((bjag/100) / 1.21 as decimal(13,2)) as float) as impNeto, BJCRCD as MonID, MonCotiz, Estado from proddta.f56BEJFEL where TIPO='A' and ESTADO in('N','A','C') ", dstDocumentosIfsa)
            'objDalJDE.FillDataSet(CommandType.Text, "select cbteTipo, PtoVta,CbteNro, Concepto,DocTipo, DocNro, CbteFech as CbteFch ,bjag/100 as ImpTotal, cast(cast((bjag/100) / 1.105 as decimal(13,2)) as float) as impNeto, BJCRCD as MonID, MonCotiz, Estado from proddta.f56BEJFEL where TIPO='A' and ESTADO in('N','A','C') ", dstDocumentosIfsa)

            ' PK 03/09 Agregar 3 campos al query: 
            '   cbtefchvto char(8)
            '   cbu varchar(22)
            '   aliascbu varchar(22)
            ' PK 12/09 Agregar 4 campos al query: 
            ' rcbtetipo [int] NULL,
            ' rptovta [int] NULL,
            ' rcbtenro [int] NULL,
            ' rcbtefech [char](8) NULL
            ' anulacion [char](1) NULL

            objDalJDE.FillDataSet(CommandType.Text, query, dstDocumentosIfsa)

            For Each dtrDocumentoIFSA As DocumentosIfsa.DocumentosRow In dstDocumentosIfsa.Documentos.Rows

                Dim dtrDocumentoHeader As DocumentoRecord.DOCUMENTOSRow = dstDocumentosRecord.DOCUMENTOS.NewDOCUMENTOSRow

                DOCUMENTO_ID = "01-" + dtrDocumentoIFSA.cbteTipo.ToString().PadLeft(3, "0"c) + "-" + dtrDocumentoIFSA.PtoVta.ToString().PadLeft(4, "0"c) + "-" + dtrDocumentoIFSA.CbteNro.ToString().PadLeft(8, "0"c)
                Console.WriteLine("Copiando: " + DOCUMENTO_ID)

                objDataAccess.ExecuteNonQuery(CommandType.StoredProcedure, "DOCUMENTOS_DEL", New Object() {DOCUMENTO_ID})

                Dim impTotal As Double = dtrDocumentoIFSA.ImpTotal
                Dim impNeto As Double = dtrDocumentoIFSA.impNeto
                Dim impIva As Double = Decimal.Parse(impTotal.ToString) - Decimal.Parse(impNeto.ToString)

                Dim baseImp As Double = impNeto
                Dim impTotConc As Double = 0 'Importe No gravado
                Dim ivaTipo As Integer = dtrDocumentoIFSA.TipoIva

                If (dtrDocumentoIFSA.AlicuotaIva = 0) Then
                    impTotConc = impTotal
                    impNeto = 0
                    impIva = 0
                    baseImp = 0
                End If

                dtrDocumentoHeader.ESTADO_ID = "N"
                dtrDocumentoHeader.DOCUMENTO_ID = DOCUMENTO_ID
                dtrDocumentoHeader.EMPRESA_ID = 1
                dtrDocumentoHeader.CbteTipo = dtrDocumentoIFSA.cbteTipo
                dtrDocumentoHeader.PtoVta = dtrDocumentoIFSA.PtoVta
                dtrDocumentoHeader.CbteNro = Integer.Parse(dtrDocumentoIFSA.CbteNro.ToString())
                dtrDocumentoHeader.Concepto = dtrDocumentoIFSA.Concepto
                dtrDocumentoHeader.DocTipo = dtrDocumentoIFSA.DocTipo
                dtrDocumentoHeader.DocNro = dtrDocumentoIFSA.DocNro
                dtrDocumentoHeader.CbteFecha = dtrDocumentoIFSA.CbteFch
                dtrDocumentoHeader.ImpTotal = impTotal
                dtrDocumentoHeader.ImpTotConc = impTotConc  'Importe neto no gravado.
                dtrDocumentoHeader.ImpNeto = impNeto
                dtrDocumentoHeader.ImpOpEx = 0 'Importe exento.
                dtrDocumentoHeader.ImpIva = impIva
                dtrDocumentoHeader.ImpTrib = 0
                dtrDocumentoHeader.MonId = dtrDocumentoIFSA.MonID
                dtrDocumentoHeader.MonCotiz = dtrDocumentoIFSA.MonCotiz
                dtrDocumentoHeader.FchServDesde = ""
                dtrDocumentoHeader.FchServHasta = ""
                dtrDocumentoHeader.FchVtoPago = ""
                dtrDocumentoHeader.FECHA_ALTA = System.DateTime.Now
                dtrDocumentoHeader.Condiva = dtrDocumentoIFSA.Condiva

                ' PK 03/09/2019 - agrego  campos para FCE solo para los mayores de 200
                'If (dtrDocumentoIFSA.cbteTipo > 200) Then
                dtrDocumentoHeader.cbteFchVto = dtrDocumentoIFSA.cbteFchVto
                dtrDocumentoHeader.cbu = dtrDocumentoIFSA.cbu
                dtrDocumentoHeader.aliasCbu = dtrDocumentoIFSA.aliascbu
                ' PK 12/09/219 docuemento relacionado FCE
                dtrDocumentoHeader.rCbteTipo = dtrDocumentoIFSA.rCbteTipo
                dtrDocumentoHeader.rPtoVta = dtrDocumentoIFSA.rPtoVta
                dtrDocumentoHeader.rCbteNro = dtrDocumentoIFSA.rCbteNro
                dtrDocumentoHeader.rCbteFech = dtrDocumentoIFSA.rCbteFech
                dtrDocumentoHeader.estadoAfip = "P"

                dtrDocumentoHeader.anulacion = "N"
                Try
                    dtrDocumentoHeader.anulacion = dtrDocumentoIFSA.anulacion
                Catch exNull As Exception
                    dtrDocumentoHeader.anulacion = "N"
                End Try

                'End If

                dstDocumentosRecord.DOCUMENTOS.AddDOCUMENTOSRow(dtrDocumentoHeader)

                If (impIva <> 0) Then
                    Dim dtrDocumentoIva As DocumentoRecord.DOCUMENTO_IVARow = dstDocumentosRecord.DOCUMENTO_IVA.NewDOCUMENTO_IVARow
                    dtrDocumentoIva.DOCUMENTO_ID = DOCUMENTO_ID
                    dtrDocumentoIva.IvaTipo = ivaTipo
                    dtrDocumentoIva.BaseImp = baseImp
                    dtrDocumentoIva.Importe = impIva

                    dstDocumentosRecord.DOCUMENTO_IVA.AddDOCUMENTO_IVARow(dtrDocumentoIva)
                End If

                Try
                    Dim oCrud As New CRUDAdapter
                    oCrud.UpdateDataSet(dstDocumentosRecord)
                    dstDocumentosRecord.AcceptChanges()

                    Dim strUpdate As String = String.Format("update proddta.f56BEJFEL set Estado= 'T', Error ='' where cbteTipo = {0} and PtoVta = {1} and CbteNro = {2}", dtrDocumentoIFSA.cbteTipo, dtrDocumentoIFSA.PtoVta, dtrDocumentoIFSA.CbteNro)
                    Try
                        objDalJDE.ExecuteNonQuery(CommandType.Text, strUpdate)

                    Catch ex As Exception
                        Console.WriteLine("Falló en: CopiarDocumentos: " + strUpdate)
                        Helpers.LoggerHelper.LogException("Falló en: CopiarDocumentos: " + strUpdate, ex)

                    End Try
                Catch ex1 As Exception
                    Console.WriteLine("Falló en: CopiarDocumentos1: " + ex1.Message)
                    Helpers.LoggerHelper.LogException("Falló en: CopiarDocumentos1: ", ex1)
                End Try
            Next



        Catch ex As Exception
            Console.WriteLine("Error en Replicador/CopiarDocumentos: " + ex.Message)
            Helpers.LoggerHelper.LogException("Error en Replicador/CopiarDocumentos: ", ex)
        Finally
            objDataAccess.Dispose()
            objDataAccess = Nothing
        End Try
    End Sub


    Private Sub ActualizarDocumentos()
        Dim objDataAccess As New DataAccess
        Dim objDalJDE As New DataAccess(ConfigurationManager.AppSettings("ConnectionStringJDE"), "GotDotNet.ApplicationBlocks.Data", "GotDotNet.ApplicationBlocks.Data.SqlServer")

        Dim dst As DataSet = objDataAccess.ExecuteDataSet(CommandType.StoredProcedure, "DOCUMENTOS_A_INFORMAR_LIST")
        Dim strUpdate As String = ""
        Try
            For Each dtr As DataRow In dst.Tables(0).Rows

                strUpdate = ""
                If dtr("ESTADO_ID").ToString = "O" Then
                    dtr("ESTADO_ID") = "P"
                    strUpdate = String.Format("update proddta.f56BEJFEL set Estado= 'O', Error='', CAE='{3}', CAEFchVto='{4}' where cbteTipo = {0} and PtoVta = {1} and CbteNro = {2}", dtr("CbteTipo").ToString, dtr("PtoVta").ToString, dtr("CbteNro").ToString, dtr("CAE").ToString, dtr("CAEFchVto").ToString)
                Else
                    dtr("ESTADO_ID") = "R"
                    strUpdate = String.Format("update proddta.f56BEJFEL set Estado= 'E', Error='{3}'  where cbteTipo = {0} and PtoVta = {1} and CbteNro = {2}", dtr("CbteTipo").ToString, dtr("PtoVta").ToString, dtr("CbteNro").ToString, dtr("Error").ToString)

                End If

                objDalJDE.ExecuteNonQuery(CommandType.Text, strUpdate)
                objDataAccess.ExecuteNonQuery(CommandType.StoredProcedure, "DOCUMENTO_ESTADO_SET", dtr)
            Next
        Catch ex As Exception
            Console.WriteLine("Error en Replicador/ActualizarDocumentos: " + ex.Message + " ----- Sentencia Update: " + strUpdate)
            Helpers.LoggerHelper.LogException("Error en Replicador/ActualizarDocumentos: " + ex.Message + " ----- Sentencia Update: " + strUpdate, ex)

        Finally
            objDataAccess.Dispose()
            objDataAccess = Nothing
            objDalJDE.Dispose()
            objDalJDE = Nothing

        End Try

    End Sub
End Module