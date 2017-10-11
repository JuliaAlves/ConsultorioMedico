using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class esp : System.Web.UI.Page
{
    SqlConnection conexao;
    protected void Page_Load(object sender, EventArgs e)
    {
        conexao = new SqlConnection(WebConfigurationManager.ConnectionStrings["BD16173ConnectionString"].ConnectionString);
    }

    protected void btnCadastrar_Click(object sender, EventArgs e)
    {
        string comando = "SELECT * FROM Especializacao";
        SqlCommand cmd = new SqlCommand(comando, conexao);
        conexao.Open();
        SqlDataReader sqldr = cmd.ExecuteReader();
        int last = 0;
        while (sqldr.Read())
            last = sqldr.GetInt32(0);

        sqldr.Close();
                        
        cmd.CommandText = "INSERT into Especializacao Values (@id, @nome)";
        cmd.Parameters.AddWithValue("id", last+1);
        cmd.Parameters.AddWithValue("nome", txtNome.Text);        

        cmd.ExecuteNonQuery();

        lblMsg.Text = "Especialização inserida com sucesso";
    }
}