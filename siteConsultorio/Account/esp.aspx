<%@ Page Title="" Language="C#" MasterPageFile="~/funcionario.master" AutoEventWireup="true" CodeFile="esp.aspx.cs" Inherits="esp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <h4>Cadastrar Especialidade</h4>
    <div class="form-group">
        <br />
        <asp:Label runat="server" AssociatedControlID="txtNome" CssClass="col-md-2 control-label" ID="Label1">Nome:</asp:Label>
        <asp:TextBox runat="server" ID="txtNome" CssClass="form-control" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNome" CssClass="text-danger" ErrorMessage="O campo nome é necessário" ID="RequiredFieldValidator1" />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button runat="server" OnClick="btnCadastrar_Click" Text="Cadastrar" CssClass="btn btn-default" ID="btnCadastrar" />
        <br />
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" SelectCommand="SELECT [nome] FROM [Especializacao]"></asp:SqlDataSource>
        <br />
    </div>
</asp:Content>

