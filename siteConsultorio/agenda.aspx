<%@ Page Title="" Language="C#" MasterPageFile="~/funcionario.master" AutoEventWireup="true" CodeFile="agenda.aspx.cs" Inherits="agenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsMedico" DataTextField="nome" DataValueField="id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:SqlDataSource ID="dsMedico" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" SelectCommand="SELECT [id], [nome], [codEspecializacao] FROM [Medico]"></asp:SqlDataSource>
</asp:Content>

