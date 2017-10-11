<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="paginapaciente.aspx.cs" Inherits="paginapaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal">
        <Items>
            <asp:MenuItem Text="Ver Exames" Value="Ver Exames " NavigateUrl="exame.aspx"></asp:MenuItem>
            <asp:MenuItem NavigateUrl="agenda.aspx" Text="Agendar Consulta     " Value="Agendar Consulta"></asp:MenuItem>
            <asp:MenuItem NavigateUrl="paciente.aspx" Text="Ver Consultas" Value="Ver Consultas"></asp:MenuItem>
        </Items>
    </asp:Menu>
    <br />
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblNome" runat="server"></asp:Label>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;
    <asp:Image ID="imgFoto" runat="server" Height="180px" Width="160px"/>
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
    <br />
    <br />
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblEnd" runat="server"></asp:Label>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblNasc" runat="server"></asp:Label>
</asp:Content>

