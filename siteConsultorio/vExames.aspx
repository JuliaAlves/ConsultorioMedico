<%@ Page Title="" Language="C#" MasterPageFile="~/paciente.master" AutoEventWireup="true" CodeFile="vExames.aspx.cs" Inherits="vExames" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover">
        <Columns>
            <asp:BoundField DataField="descricao" HeaderText="descricao" SortExpression="descricao" />
            <asp:BoundField DataField="resultado" HeaderText="resultado" SortExpression="resultado" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" SelectCommand="SELECT * FROM [Exame] WHERE codPaciente in (SELECT idPaciente FROM usuarioPaciente WHERE idUsuario = @codUsuario)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="codUsuario" SessionField="usuario" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

