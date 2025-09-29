Imports ASF.Dal
Imports ASF.BusObjects
Public Class MAESTRO_DocTipo
    Inherits CommonICRUD
    Public Sub New()
        Me.dstBERecord = New BusEntities.MAESTRO_DocTipoRecord
    End Sub
    
    Public Overrides Sub SetFixedDataTableNames(ByVal dstToReturn As DataSet)
    '$SetFixedDataTableNames$
    End Sub
End Class
