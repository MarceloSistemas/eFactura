Imports ASF.Dal
Imports ASF.BusObjects
Public Class PUNTO_VENTA_CONTROL
    Inherits CommonICRUD
    Public Sub New()
        Me.dstBERecord = New BusEntities.PUNTO_VENTA_CONTROLRecord
    End Sub
    
    Public Overrides Sub SetFixedDataTableNames(ByVal dstToReturn As DataSet)
    dstToReturn.Tables(0).TableName= "EMPRESAS"
dstToReturn.Tables(1).TableName= "MAESTRO_CbteTipo"

    End Sub
End Class
