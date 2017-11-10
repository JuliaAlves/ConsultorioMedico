<%@ Page Title="" Language="C#" MasterPageFile="~/funcionario.master" AutoEventWireup="true" CodeFile="agendaDia.aspx.cs" Inherits="agendaDia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Font-Bold="True"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id,id1,id2" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="nome" HeaderText="Médico" SortExpression="nome" />
            <asp:BoundField DataField="nome1" HeaderText="Paciente" SortExpression="nome1" />
            <asp:BoundField DataField="diagnostico" HeaderText="diagnostico" SortExpression="diagnostico" />
            <asp:BoundField DataField="avaliacao" HeaderText="avaliacao" SortExpression="avaliacao" />
            <asp:BoundField DataField="hora" HeaderText="hora" SortExpression="hora" />
            <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
            <asp:CheckBoxField DataField="situacao" HeaderText="situacao" SortExpression="situacao" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" SelectCommand="SELECT * FROM Consulta c INNER JOIN Medico m ON m.id = c.codMedico INNER JOIN Paciente p ON p.id = c.codPaciente
WHERE CAST(c.data AS DATE) = CAST(GETDATE() AS DATE)"></asp:SqlDataSource>
</asp:Content>

