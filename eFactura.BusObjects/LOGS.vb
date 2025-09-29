Imports ASF.Dal
Imports ASF.BusObjects
Public Class LOGS
    Inherits CommonICRUD
    Public Sub New()
        Me.dstBERecord = New BusEntities.LOGSRecord
    End Sub
    
    Public Overrides Sub SetFixedDataTableNames(ByVal dstToReturn As DataSet)
    '$SetFixedDataTableNames$
    End Sub
End Class
