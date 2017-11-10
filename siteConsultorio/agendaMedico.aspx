<%@ Page Title="" Language="C#" MasterPageFile="~/funcionario.master" AutoEventWireup="true" CodeFile="agendaMedico.aspx.cs" Inherits="agenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h3>&nbsp; </h3>
    <p>&nbsp;</p>
    <h3>&nbsp;&nbsp; Ver agenda do consultório.</h3>
    <br />
    <br />
    <div class="form-group">
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Nome do Médico:"></asp:Label>
        <br />
        <br />
        <asp:DropDownList ID="ddlMedico" runat="server" DataSourceID="dsMedico" DataTextField="nome" DataValueField="nome" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="btn btn-default btn-sm">
        </asp:DropDownList>
        <asp:SqlDataSource ID="dsMedico" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" SelectCommand="SELECT [nome] FROM [Medico]"></asp:SqlDataSource>
        <br />
        <br />
    &nbsp;<asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Data das consultas:"></asp:Label>
        <br />
        <br />
        <asp:Calendar ID="cDia" runat="server"></asp:Calendar>
        <br />
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Consultas Agendadas:" Visible="False"></asp:Label>
    &nbsp;<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowCreated="GridView1_RowCreated" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand" CssClass="table table-striped table-bordered table-hover">
            <Columns>
                <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" >
                </asp:BoundField>
                <asp:BoundField DataField="hora" HeaderText="hora" SortExpression="hora" >
                </asp:BoundField>
                <asp:ButtonField CommandName="edit" Text="Adicionar Diagnóstico" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" SelectCommand="sp_verConsultas" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlMedico" Name="medico" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="cDia" DbType="Date" Name="data" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;
        <asp:Button ID="btnAgendar" runat="server" OnClick="btnAgendar_Click" Text="Agendar nova consulta" CssClass="btn btn-default" Width="173px"/>
        <br />
    &nbsp;
    </div>
</asp:Content>