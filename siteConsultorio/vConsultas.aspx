<%@ Page Title="" Language="C#" MasterPageFile="~/paciente.master" AutoEventWireup="true" CodeFile="vConsultas.aspx.cs" Inherits="vConsultas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover">
    <Columns>
        <asp:BoundField DataField="diagnostico" HeaderText="diagnostico" SortExpression="diagnostico" />
        <asp:BoundField DataField="avaliacao" HeaderText="avaliacao" SortExpression="avaliacao" />
        <asp:BoundField DataField="hora" HeaderText="hora" SortExpression="hora" />
        <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
        <asp:CheckBoxField DataField="situacao" HeaderText="situacao" SortExpression="situacao" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" SelectCommand="SELECT * FROM [Consulta] WHERE [codPaciente] in (SELECT idPaciente FROM usuarioPaciente WHERE idUsuario = @codUsuario)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="" Name="codUsuario" SessionField="usuario" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

