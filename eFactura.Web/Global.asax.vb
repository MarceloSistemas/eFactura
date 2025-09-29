Imports System.Web.SessionState
Imports Newtonsoft.Json
Imports System.Web.Http
Imports System.Web
Imports System.Web.Routing

Public Class Global_asax
    Inherits System.Web.HttpApplication

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        Dim jSettings = New Newtonsoft.Json.JsonSerializerSettings()
        GlobalConfiguration.Configuration.Formatters.JsonFormatter.SerializerSettings = jSettings
        jSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore
        RouteTable.Routes.MapHttpRoute( _
           name:="DefaultApi", _
           routeTemplate:="api/{controller}/{id}", _
           defaults:=New With {.id = RouteParameter.Optional}
       )


    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session is started
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires at the beginning of each request
    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires upon attempting to authenticate the use
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when an error occurs
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session ends
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the application ends
    End Sub

End Class