<%@ Page Title="Register" Language="C#" MasterPageFile="~/funcionario.Master" AutoEventWireup="true" CodeFile="CadastroMed.aspx.cs" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>&nbsp;</h2>
    <div class="form-group">
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>

        <div class="form-horizontal" >
            <h4>Registre um médico.</h4>
            <hr />
            <asp:ValidationSummary runat="server" CssClass="text-danger" />
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="UserName" CssClass="control-label" ID="Label6">Nome de usuário:</asp:Label>
                <div>
                    <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                        CssClass="text-danger" ErrorMessage="O campo usuário é obrigatório" ID="RequiredFieldValidator4" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="UserName" CssClass="control-label">Nome do Médico:</asp:Label>
                <div>
                    <asp:TextBox runat="server" ID="txtNome" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNome"
                        CssClass="text-danger" ErrorMessage="O campo nome é obrigatório" />
                    <br />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Password" CssClass="control-label">Senha:</asp:Label>
                <div>
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                        CssClass="text-danger" ErrorMessage="O campo senha é obrigatório" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="control-label">Confirmar senha:</asp:Label>
                <div>
                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="O campo confirmar  senha é obrigatório" />
                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="As senhas não batem" />
                    <br />
                    <asp:Label runat="server" AssociatedControlID="ConfirmPassword"  ID="Label1">Telefone Residencial (opcional):</asp:Label>
                    <br />
                </div>
                <div>
                    &nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtTel" TextMode="Phone" CssClass="form-control" />
                    <br />
                    <br />
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass=" control-label" ID="Label2">Celular (opcional):</asp:Label>
                    <asp:TextBox ID="txtCel" runat="server" CssClass="form-control" TextMode="Phone" />
                    <br />
                    <br />
                </div>
                    <div>
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="control-label" ID="Label8">Especialidade:</asp:Label>
                    &nbsp;&nbsp;
                        <asp:DropDownList ID="ddlEsp" runat="server" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="id" CssClass="btn btn-default btn-sm">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" SelectCommand="SELECT * FROM [Especializacao]"></asp:SqlDataSource>
    &nbsp;<br />
                    </div>
                <div>
                    <br />
                    <br />
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="control-label" ID="Label4">Email:</asp:Label>
                    <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="O campo email é obrigatório" ID="RequiredFieldValidator2" />
                </div>
                <div>
                    <br />
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="control-label" ID="Label5">Data de nascimento:</asp:Label>
                    <asp:TextBox runat="server" ID="txtNasc" TextMode="Date" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNasc"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="O campo email é obrigatório" ID="RequiredFieldValidator3" />
                </div>
                <div>
                    <br />
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="control-label" ID="Label7">Foto:</asp:Label>
                    <asp:FileUpload ID="fupFotoPac" runat="server" EnableViewState="False" />
                    <asp:Button runat="server" OnClick="CreateUser_Click" Text="Registrar" CssClass="btn btn-default" />
                </div>
                    <asp:Label ID="lblS" runat="server"></asp:Label>
                    <br />
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>

