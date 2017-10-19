<%@ Page Title="" Language="C#" MasterPageFile="~/paciente.master" AutoEventWireup="true" CodeFile="paginapaciente.aspx.cs" Inherits="paginapaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblNome" runat="server"></asp:Label>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;
    <asp:Image ID="imgFoto" runat="server" Height="180px" Width="160px"/>
    <br />
    &nbsp;&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Envie uma imagem:" Visible="False"></asp:Label>
        &nbsp;<asp:FileUpload ID="fupfoto" runat="server" Enabled="False" EnableTheming="True" EnableViewState="False" Visible="False" />
        &nbsp;<br />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnEnviar" runat="server" Enabled="False" OnClick="btnEnviar_Click" Text="Enviar" Visible="False" />
        <br />
&nbsp;&nbsp;&nbsp;
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
    <br />
    <br />
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblEnd" runat="server"></asp:Label>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblNasc" runat="server"></asp:Label>
</asp:Content>

