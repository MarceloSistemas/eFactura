Imports ASF.Dal
Imports ASF.BusObjects
Public Class MAESTRO_Tributo
    Inherits CommonICRUD
    Public Sub New()
        Me.dstBERecord = New BusEntities.MAESTRO_TributoRecord
    End Sub
    
    Public Overrides Sub SetFixedDataTableNames(ByVal dstToReturn As DataSet)
    '$SetFixedDataTableNames$
    End Sub
End Class
