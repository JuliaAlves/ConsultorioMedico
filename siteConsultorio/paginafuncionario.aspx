<%@ Page Title="" Language="C#" MasterPageFile="~/funcionario.master" AutoEventWireup="true" CodeFile="paginafuncionario.aspx.cs" Inherits="paginafuncionario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    &nbsp;&nbsp;&nbsp;
    <br />
<br />
&nbsp;&nbsp;&nbsp;
    <div class="form-group">
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblEspec" runat="server" Font-Size="Medium" Font-Bold="True"></asp:Label>
        <asp:Image ID="imgFoto" style="float: right;" runat="server" Height="250px" Width="250px"/>
        <br />
        &nbsp;&nbsp;&nbsp;
        <div style="float: right;">
            <asp:Label ID="Label1" runat="server" Text="Envie uma imagem:" Visible="False"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:FileUpload ID="fupfoto" runat="server" Enabled="False" EnableTheming="True" EnableViewState="False" Visible="False" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnEnviar" runat="server" Enabled="False" OnClick="btnEnviar_Click" Text="Enviar" Visible="False" />
        </div>
        <br />
    &nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblEmail" runat="server"></asp:Label>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblTel" runat="server"></asp:Label>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblCel" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <br />
        <br />
    &nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblNasc" runat="server"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>

