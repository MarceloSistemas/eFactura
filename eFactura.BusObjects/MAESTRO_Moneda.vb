Imports ASF.Dal
Imports ASF.BusObjects
Public Class MAESTRO_Moneda
    Inherits CommonICRUD
    Public Sub New()
        Me.dstBERecord = New BusEntities.MAESTRO_MonedaRecord
    End Sub
    
    Public Overrides Sub SetFixedDataTableNames(ByVal dstToReturn As DataSet)
    '$SetFixedDataTableNames$
    End Sub
End Class
