<%@ Page Title="" Language="C#" MasterPageFile="~/funcionario.master" AutoEventWireup="true" CodeFile="agenda.aspx.cs" Inherits="agenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Nome do Médico:"></asp:Label>
    <asp:DropDownList ID="ddlMedico" runat="server" DataSourceID="dsMedico" DataTextField="nome" DataValueField="nome" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:SqlDataSource ID="dsMedico" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" SelectCommand="SELECT [nome] FROM [Medico]"></asp:SqlDataSource>
    <br />
    <br />
&nbsp;<asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Data das consultas:"></asp:Label>
    <asp:Calendar ID="cDia" runat="server"></asp:Calendar>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Consultas Agendadas:" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Height="171px" OnRowCreated="GridView1_RowCreated" OnRowDeleting="GridView1_RowDeleting" Width="261px">
        <Columns>
            <asp:BoundField DataField="hora" HeaderText="Hora" SortExpression="hora" >
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" >
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" SelectCommand="sp_verConsultas" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlMedico" Name="medico" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="cDia" DbType="Date" Name="data" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

