Imports ASF.Dal
Imports ASF.BusObjects
Public Class MAESTRO_ESTADOS_DOCUMENTO
    Inherits CommonICRUD
    Public Sub New()
        Me.dstBERecord = New BusEntities.MAESTRO_ESTADOS_DOCUMENTORecord
    End Sub
    
    Public Overrides Sub SetFixedDataTableNames(ByVal dstToReturn As DataSet)
    '$SetFixedDataTableNames$
    End Sub
End Class
