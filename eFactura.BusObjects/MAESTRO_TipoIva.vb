Imports ASF.Dal
Imports ASF.BusObjects
Public Class MAESTRO_TipoIva
    Inherits CommonICRUD
    Public Sub New()
        Me.dstBERecord = New BusEntities.MAESTRO_TipoIvaRecord
    End Sub
    
    Public Overrides Sub SetFixedDataTableNames(ByVal dstToReturn As DataSet)
    '$SetFixedDataTableNames$
    End Sub
End Class
