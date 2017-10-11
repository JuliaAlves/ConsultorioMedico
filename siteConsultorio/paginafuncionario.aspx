<%@ Page Title="" Language="C#" MasterPageFile="~/funcionario.master" AutoEventWireup="true" CodeFile="paginafuncionario.aspx.cs" Inherits="paginafuncionario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    &nbsp;&nbsp;&nbsp;
    <br />
<br />
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblEspec" runat="server"></asp:Label>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;
    <asp:Image ID="imgFoto" runat="server" Height="180px" Width="160px"/>
    <br />
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Text="Envie uma imagem:" Visible="False"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:FileUpload ID="fupfoto" runat="server" Enabled="False" EnableTheming="True" EnableViewState="False" Visible="False" />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnEnviar" runat="server" Enabled="False" OnClick="btnEnviar_Click" Text="Enviar" Visible="False" />
    <br />
    <br />
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
</asp:Content>

