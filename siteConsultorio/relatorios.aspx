<%@ Page Title="" Language="C#" MasterPageFile="~/funcionario.master" AutoEventWireup="true" CodeFile="relatorios.aspx.cs" Inherits="relatorios" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <br />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Consultas  Mensais por Médico"></asp:Label>
    <br />
    <br />
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
    <series>
        <asp:Series Name="Series1" XValueMember="nome" YValueMembers="Column1">
        </asp:Series>
    </series>
    <chartareas>
        <asp:ChartArea Name="ChartArea1">
        </asp:ChartArea>
    </chartareas>
</asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" SelectCommand="SELECT count(c.codMedico), m.nome FROM Consulta c INNER JOIN Medico m ON m.id=c.codMedico 
WHERE 
MONTH(c.data)= MONTH(GETDATE())
GROUP BY m.nome"></asp:SqlDataSource>
    <br />
    <br />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Consultas diárias por Especialidade"></asp:Label>
    <br />
    <br />
    <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2">
        <series>
            <asp:Series ChartType="Pie" Name="Series1" XValueMember="nome" YValueMembers="Column1">
            </asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" SelectCommand="SELECT count(c.id), e.nome FROM Consulta c 
INNER JOIN Medico m ON m.id= c.codMedico
INNER JOIN Especializacao e ON e.id= m.codEspecializacao
WHERE  
DAY(c.data)= DAY(GETDATE())
GROUP BY 
e.nome"></asp:SqlDataSource>
    <br />
    <br />
    <br />
</asp:Content>

