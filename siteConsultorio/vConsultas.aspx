<%@ Page Title="" Language="C#" MasterPageFile="~/paciente.master" AutoEventWireup="true" CodeFile="vConsultas.aspx.cs" Inherits="vConsultas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Label" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover" OnRowCommand="GridView1_RowCommand">
    <Columns>
        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
        <asp:BoundField DataField="diagnostico" HeaderText="diagnostico" SortExpression="diagnostico" />
        <asp:BoundField DataField="avaliacao" HeaderText="avaliacao" SortExpression="avaliacao" />
        <asp:BoundField DataField="hora" HeaderText="hora" SortExpression="hora" />
        <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
        <asp:CheckBoxField DataField="situacao" HeaderText="situacao" SortExpression="situacao" />
        <asp:ButtonField CausesValidation="True" CommandName="avaliar" Text="Avaliar" />
    </Columns>
</asp:GridView>
    <br />
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Dê uma nota para sua Consulta"></asp:Label>
    <br />
    <br />
    <asp:RadioButtonList ID="rblNota" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
    </asp:RadioButtonList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" SelectCommand="SELECT * FROM [Consulta] WHERE [codPaciente] in (SELECT idPaciente FROM usuarioPaciente WHERE idUsuario = @codUsuario)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="" Name="codUsuario" SessionField="usuario" />
    </SelectParameters>
</asp:SqlDataSource>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rblNota" ErrorMessage="Escolha um item" ForeColor="Red"></asp:RequiredFieldValidator>
</asp:Content>

