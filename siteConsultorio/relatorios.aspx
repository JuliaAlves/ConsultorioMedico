<%@ Page Title="" Language="C#" MasterPageFile="~/funcionario.master" AutoEventWireup="true" CodeFile="relatorios.aspx.cs" Inherits="relatorios" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <br />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Consultas  Mensais por Médico" Font-Size="Large"></asp:Label>
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
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Não há dados para este mês" Visible="False"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" SelectCommand="SELECT count(c.codMedico), m.nome FROM Consulta c INNER JOIN Medico m ON m.id=c.codMedico 
WHERE 
MONTH(c.data)= MONTH(GETDATE())
GROUP BY m.nome" OnSelected="SqlDataSource1_Selected"></asp:SqlDataSource>
    <br />
    <br />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Consultas diárias por Especialidade" Font-Size="Large"></asp:Label>
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
e.nome" OnSelected="SqlDataSource2_Selected"></asp:SqlDataSource>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Não há dados para este dia" Visible="False"></asp:Label>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Consultas por pacientes"></asp:Label>
    <br />
    <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource3">
        <Series>
            <asp:Series ChartType="Bar" Name="Series1" XValueMember="nome" YValueMembers="Column1">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" OnSelected="SqlDataSource3_Selected" SelectCommand="SELECT count(c.id), p.nome FROM consulta c, paciente p WHERE p.id = c.codPaciente GROUP BY p.nome"></asp:SqlDataSource>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Não há dados para pacientes" Visible="False"></asp:Label>
    <br />
    <br />
    <br />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Large" Text="Consultas canceladas por mês"></asp:Label>
    <br />
    <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSource4">
        <Series>
            <asp:Series Name="Series1" XValueMember="Column1" YValueMembers="Column2">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" OnSelected="SqlDataSource4_Selected" SelectCommand="SELECT DateName(month, DateAdd(month, MONTH(data), 0)-1), count(id) FROM Consulta WHERE situacao = 0 AND data&lt;CONVERT(date, GETDATE())
GROUP BY MONTH(data)"></asp:SqlDataSource>
    <br />
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Não há dados para consultas canceladas" Visible="False"></asp:Label>
    </asp:Content>

