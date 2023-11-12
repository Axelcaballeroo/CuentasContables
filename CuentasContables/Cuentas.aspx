<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cuentas.aspx.cs" Inherits="CuentasContables.Cuentas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">VOLVER AL MENU</asp:HyperLink>
            <strong>
            <br />
            NOMBRE CUENTA:</strong>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
            <strong>CUENTAS DISPONIBLES</strong><br />
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <br />
            <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="idCuentas" Height="162px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="311px"></asp:ListBox>
            <br />
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Eliminar" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Modificar" />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [idCuentas] = @idCuentas" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" SelectCommand="SELECT * FROM [Cuentas]" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [idCuentas] = @idCuentas">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="ListBox1" Name="idCuentas" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="descripcion" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="idCuentas" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Cuentas] WHERE ([idCuentas] = @idCuentas)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListBox1" Name="idCuentas" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
