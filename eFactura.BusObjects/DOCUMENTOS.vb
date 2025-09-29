Imports ASF.Dal
Imports ASF.BusObjects
Public Class DOCUMENTOS
    Inherits CommonICRUD
    Public Sub New()
        Me.dstBERecord = New BusEntities.DOCUMENTOSRecord
    End Sub

    Public Overrides Sub SetFixedDataTableNames(ByVal dstToReturn As DataSet)
        dstToReturn.Tables(0).TableName = "EMPRESAS"
        dstToReturn.Tables(1).TableName = "MAESTRO_CbteTipo"
        dstToReturn.Tables(2).TableName = "MAESTRO_DocTipo"
        dstToReturn.Tables(3).TableName = "MAESTRO_Moneda"
        dstToReturn.Tables(4).TableName = "MAESTRO_ESTADOS_DOCUMENTO"
        'MA

    End Sub
End Class
