Imports ASF.Dal
Imports ASF.BusObjects
Public Class PARAMETROS
    Inherits CommonICRUD
    Public Sub New()
        Me.dstBERecord = New BusEntities.PARAMETROSRecord
    End Sub
    
    Public Overrides Sub SetFixedDataTableNames(ByVal dstToReturn As DataSet)
    '$SetFixedDataTableNames$
    End Sub
End Class
