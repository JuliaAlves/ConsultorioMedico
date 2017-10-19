<%@ Page Title="" Language="C#" MasterPageFile="~/funcionario.master" AutoEventWireup="true" CodeFile="vPac.aspx.cs" Inherits="vPac" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h3>&nbsp;</h3>
    <h3>&nbsp;&nbsp;&nbsp; Ver Pacientes.</h3>
    <br />
    <div class="form-group">
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FAFAD2;color: #284775;">nome:
                    <asp:Label ID="nomeLabel" runat="server" Text='<%# Eval("nome") %>' />
                    <br />endereco:
                    <asp:Label ID="enderecoLabel" runat="server" Text='<%# Eval("endereco") %>' />
                    <br />dataNasc:
                    <asp:Label ID="dataNascLabel" runat="server" Text='<%# Eval("dataNasc") %>' />
                    <br />email:
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    <br />celular:
                    <asp:Label ID="celularLabel" runat="server" Text='<%# Eval("celular") %>' />
                    <br />telResidencial:
                    <asp:Label ID="telResidencialLabel" runat="server" Text='<%# Eval("telResidencial") %>' />
                    <br /></td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: #FFCC66;color: #000080;">nome:
                    <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
                    <br />endereco:
                    <asp:TextBox ID="enderecoTextBox" runat="server" Text='<%# Bind("endereco") %>' />
                    <br />dataNasc:
                    <asp:TextBox ID="dataNascTextBox" runat="server" Text='<%# Bind("dataNasc") %>' />
                    <br />email:
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    <br />celular:
                    <asp:TextBox ID="celularTextBox" runat="server" Text='<%# Bind("celular") %>' />
                    <br />telResidencial:
                    <asp:TextBox ID="telResidencialTextBox" runat="server" Text='<%# Bind("telResidencial") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
    <td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">nome:
                    <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
                    <br />endereco:
                    <asp:TextBox ID="enderecoTextBox" runat="server" Text='<%# Bind("endereco") %>' />
                    <br />dataNasc:
                    <asp:TextBox ID="dataNascTextBox" runat="server" Text='<%# Bind("dataNasc") %>' />
                    <br />email:
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    <br />celular:
                    <asp:TextBox ID="celularTextBox" runat="server" Text='<%# Bind("celular") %>' />
                    <br />telResidencial:
                    <asp:TextBox ID="telResidencialTextBox" runat="server" Text='<%# Bind("telResidencial") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color: #FFFBD6;color: #333333;">nome:
                    <asp:Label ID="nomeLabel" runat="server" Text='<%# Eval("nome") %>' />
                    <br />endereco:
                    <asp:Label ID="enderecoLabel" runat="server" Text='<%# Eval("endereco") %>' />
                    <br />dataNasc:
                    <asp:Label ID="dataNascLabel" runat="server" Text='<%# Eval("dataNasc") %>' />
                    <br />email:
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    <br />celular:
                    <asp:Label ID="celularLabel" runat="server" Text='<%# Eval("celular") %>' />
                    <br />telResidencial:
                    <asp:Label ID="telResidencialLabel" runat="server" Text='<%# Eval("telResidencial") %>' />
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #FFCC66;font-weight: bold;color: #000080;">nome:
                    <asp:Label ID="nomeLabel" runat="server" Text='<%# Eval("nome") %>' />
                    <br />endereco:
                    <asp:Label ID="enderecoLabel" runat="server" Text='<%# Eval("endereco") %>' />
                    <br />dataNasc:
                    <asp:Label ID="dataNascLabel" runat="server" Text='<%# Eval("dataNasc") %>' />
                    <br />email:
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    <br />celular:
                    <asp:Label ID="celularLabel" runat="server" Text='<%# Eval("celular") %>' />
                    <br />telResidencial:
                    <asp:Label ID="telResidencialLabel" runat="server" Text='<%# Eval("telResidencial") %>' />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" SelectCommand="SELECT [nome], [endereco], [dataNasc], [email], [celular], [telResidencial] FROM [Paciente]"></asp:SqlDataSource>
    </div>
</asp:Content>

