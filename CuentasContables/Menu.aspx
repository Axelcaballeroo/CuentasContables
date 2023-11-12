<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="CuentasContables.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1><strong>REGISTROS CONTABLES</strong></h1>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Cuentas.aspx">GESTION CUENTAS</asp:HyperLink>
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/RegistroContable.aspx">GESTION REGISTROS CONTABLES</asp:HyperLink>
        </div>
    </form>
</body>
</html>
