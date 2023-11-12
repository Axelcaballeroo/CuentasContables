<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroContable.aspx.cs" Inherits="CuentasContables.RegistroContable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">VOLVER MENU</asp:HyperLink>
            <br />
            <asp:Label ID="Label4" runat="server" Text="CUENTA= "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="idCuentas" Width="199px" Height="29px">
            </asp:DropDownList>
            <asp:TextBox ID="TextBox2" runat="server" placeholder ="MONTO"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" Text="FACTURO? (0=NO 1=SI)
                "></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" Height="29px" Width="53px">
                <asp:ListItem Value="False">0</asp:ListItem>
                <asp:ListItem Value="True">1</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" />
            <asp:Button ID="Button2" runat="server" Text="Modificar" OnClick="Button2_Click" />
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <br />
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="idRegistro" DataValueField="idRegistro" Height="28px" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" Width="236px">
            </asp:DropDownList>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Borrar" />
            <br />
            <br />
            <br />
            <asp:Table ID="Table1" CssClass="table" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" GridLines="Both">
            </asp:Table>
            <br />
            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Cuentas]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [RegistroContables] WHERE [idRegistro] = @idRegistro" InsertCommand="INSERT INTO [RegistroContables] ([idCuentas], [monto], [tipo]) VALUES (@idCuentas, @monto, @tipo)" SelectCommand="SELECT RegistroContables.idRegistro, RegistroContables.idCuentas, RegistroContables.monto, RegistroContables.tipo, Cuentas.descripcion FROM RegistroContables INNER JOIN Cuentas ON RegistroContables.idCuentas = Cuentas.idCuentas" UpdateCommand="UPDATE [RegistroContables] SET [idCuentas] = @idCuentas, [monto] = @monto, [tipo] = @tipo WHERE [idRegistro] = @idRegistro">
                <DeleteParameters>
                    <asp:Parameter Name="idRegistro" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="idCuentas" Type="Int32" />
                    <asp:Parameter Name="monto" Type="Int32" />
                    <asp:Parameter Name="tipo" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="idCuentas" Type="Int32" />
                    <asp:Parameter Name="monto" Type="Int32" />
                    <asp:Parameter Name="tipo" Type="Boolean" />
                    <asp:Parameter Name="idRegistro" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [RegistroContables] WHERE ([idRegistro] = @idRegistro)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList3" Name="idRegistro" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [RegistroContables] WHERE [idRegistro] = @idRegistro" InsertCommand="INSERT INTO [RegistroContables] ([idCuentas], [monto], [tipo]) VALUES (@idCuentas, @monto, @tipo)" SelectCommand="SELECT * FROM [RegistroContables]" UpdateCommand="UPDATE [RegistroContables] SET [idCuentas] = @idCuentas, [monto] = @monto, [tipo] = @tipo WHERE [idRegistro] = @idRegistro">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="DropDownList3" Name="idRegistro" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="idCuentas" Type="Int32" />
                    <asp:Parameter Name="monto" Type="Int32" />
                    <asp:Parameter Name="tipo" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="idCuentas" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBox2" Name="monto" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="tipo" PropertyName="SelectedValue" Type="Boolean" />
                    <asp:ControlParameter ControlID="DropDownList3" Name="idRegistro" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
