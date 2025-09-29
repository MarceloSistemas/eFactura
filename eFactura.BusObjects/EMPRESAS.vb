Imports ASF.Dal
Imports ASF.BusObjects
Public Class EMPRESAS
    Inherits CommonICRUD
    Public Sub New()
        Me.dstBERecord = New BusEntities.EMPRESASRecord
    End Sub
    
    Public Overrides Sub SetFixedDataTableNames(ByVal dstToReturn As DataSet)
    '$SetFixedDataTableNames$
    End Sub
End Class
