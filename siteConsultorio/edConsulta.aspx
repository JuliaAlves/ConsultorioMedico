<%@ Page Title="" Language="C#" MasterPageFile="~/funcionario.master" AutoEventWireup="true" CodeFile="edConsulta.aspx.cs" Inherits="edConsulta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h3>&nbsp;&nbsp; </h3>
    <h3>&nbsp;&nbsp;&nbsp; Diagnosticar consulta.</h3>
    <p>
        <asp:Label ID="Label5" runat="server" Font-Size="Larger" ForeColor="Lime" Text="Label" Visible="False"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <div class="form-group">
    <p>
    
        <asp:Label ID="Label1" runat="server" Text="Diagnóstico:" Font-Bold="True"></asp:Label>
        &nbsp;</p>
        <p>
    
            <asp:TextBox ID="txtDiag" runat="server" AutoPostBack="True" CssClass="form-control" Height="132px" TextMode="MultiLine" Width="704px"></asp:TextBox>
        </p>
        <p>
    
        <asp:Label ID="Label4" runat="server" Text="Situação:" Font-Bold="True"></asp:Label>
        </p>
        <p>
    
            <asp:DropDownList ID="ddlSit" runat="server" Height="22px" Width="134px">
                <asp:ListItem Value="0">Não atendido</asp:ListItem>
                <asp:ListItem Value="1">Atendido</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p>
    
            &nbsp;</p>
        <p>
    
            &nbsp;</p>
        <p>
    
            &nbsp;</p>
        <p>
    
        <asp:Label ID="Label3" runat="server" Text="Nome do novo exame:" Font-Bold="True"></asp:Label>
        </p>
        <p>
    
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescricao" ErrorMessage="Digite o nome do exame" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
    
            <asp:TextBox ID="txtDescricao" CssClass="form-control" runat="server" Height="24px" Width="313px"></asp:TextBox>
        </p>
        <p>
    
            <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Adicionar Exame" CssClass="btn btn-default" />
        </p>
        <p>
    
            &nbsp;</p>
        <p>
    
            &nbsp;</p>
        <p>
    
        <asp:Label ID="Label2" runat="server" Text="Exames:" Font-Bold="True"></asp:Label>
            </p>
        <p>
    
            <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="dsExames" DataTextField="descricao" DataValueField="id" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
            <asp:SqlDataSource ID="dsExames" runat="server" ConnectionString="<%$ ConnectionStrings:BD16173ConnectionString %>" SelectCommand="SELECT * FROM [Exame] WHERE codPaciente=( SELECT codPaciente FROM Consulta WHERE id = @consulta)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="consulta" QueryStringField="id" DefaultValue="" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
    
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Alterar Resultado:" Visible="False"></asp:Label>
        </p>
        <p>
    
            <asp:TextBox ID="txtResult" CssClass="form-control" runat="server" AutoPostBack="True" Height="62px" TextMode="MultiLine" Visible="False" Width="651px"></asp:TextBox>
        </p>
        <p>
    
            <asp:Button ID="btnAlterar" runat="server" CausesValidation="False" OnClick="btnAlterar_Click" Text="Alterar" Visible="False" Width="172px"  CssClass="btn btn-default"/>
        </p>
        <p>
    
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
        <p>
    
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button runat="server" Text="Terminar consulta" CssClass="btn btn-default" ID="bntTerm" OnClick="bntTerm_Click" CausesValidation="False" />
                </p>
        <p>
    
            &nbsp;</p>
     </div>
</asp:Content>

