using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class edConsulta : System.Web.UI.Page
{
    SqlConnection conexao;
    int idConsulta;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] == null)
            Response.Redirect("Default.aspx");
        else
        {
            conexao = new SqlConnection(WebConfigurationManager.ConnectionStrings["BD16173ConnectionString"].ConnectionString);
            conexao.Open();
            idConsulta = Convert.ToInt32(Request.QueryString["id"].ToString());
            string comando = "SELECT * FROM Consulta WHERE id = '" + idConsulta + "'";
            SqlCommand sqlcmd = new SqlCommand(comando, conexao);
            SqlDataReader dr = sqlcmd.ExecuteReader();
            dr.Read();
            if (dr["diagnostico"] != null)
                if(!IsPostBack)
                    txtDiag.Text = dr["diagnostico"].ToString();
            conexao.Close();
        }        
    }

    protected void bntTerm_Click(object sender, EventArgs e)
    {
        conexao.Open();

        string cmd = "UPDATE Consulta SET diagnostico = @diag , situacao = @sit WHERE id = '"+idConsulta+"'";
        SqlCommand comando = new SqlCommand(cmd, conexao);        
        comando.Parameters.AddWithValue("diag", txtDiag.Text);
        comando.Parameters.AddWithValue("sit", ddlSit.SelectedValue);
        comando.ExecuteNonQuery();
        comando.Dispose();

        Label5.Visible = true;
        Label5.Text = "Consulta atualizada com sucesso!";
        conexao.Close();
    }

    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label6.Text = "Alterar Resultado:";
        Label6.Visible = true;
        txtResult.Visible = true;
        btnAlterar.Visible = true;
        conexao.Open();
        string cmd = "SELECT resultado FROM exame WHERE id = '"+ListBox1.SelectedValue+"'";
        SqlCommand comando = new SqlCommand(cmd, conexao);
        SqlDataReader reader = comando.ExecuteReader();
        reader.Read();        
        txtResult.Text = reader["resultado"].ToString();
        reader.Close();
        conexao.Close();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        conexao.Open();
        string comando = "SELECT codPaciente FROM Consulta WHERE id = '" + idConsulta+"'";
        SqlCommand comandoUsuario = new SqlCommand(comando, conexao);
        SqlDataReader drUsuario = comandoUsuario.ExecuteReader();
        drUsuario.Read();
        int user = Convert.ToInt32(drUsuario["codPaciente"]);
        drUsuario.Close();
        comandoUsuario.Dispose();

        string desc = txtDescricao.Text;
        comando = "INSERT INTO exame VALUES (@codPaciente, @desc, NULL)";
        SqlCommand cmd = new SqlCommand(comando, conexao);
        cmd.Parameters.AddWithValue("codPaciente", user);
        cmd.Parameters.AddWithValue("codConsulta", idConsulta);
        cmd.Parameters.AddWithValue("desc", desc);
        cmd.ExecuteNonQuery();
        cmd.Dispose();

        conexao.Close();
        ListBox1.DataBind();
    }

    protected void btnAlterar_Click(object sender, EventArgs e)
    {
        conexao.Open();
        string comando = "UPDATE exame SET resultado = @result WHERE id = @id";
        SqlCommand cmd = new SqlCommand(comando, conexao);
        cmd.Parameters.AddWithValue("result", txtResult.Text);
        cmd.Parameters.AddWithValue("id", ListBox1.SelectedValue);
        cmd.ExecuteNonQuery();
        conexao.Close();
        btnAlterar.Visible = false;
        txtResult.Visible = false;
        Label6.Text = "Resultado do exame alterado com sucesso";
    }
}