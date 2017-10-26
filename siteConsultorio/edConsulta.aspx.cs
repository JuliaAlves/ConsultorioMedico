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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] == null)
            Response.Redirect("Default.aspx");
        else
        {
            conexao = new SqlConnection(WebConfigurationManager.ConnectionStrings["BD16173ConnectionString"].ConnectionString);
            conexao.Open();
            int idConsulta = Convert.ToInt32(Request.QueryString["id"].ToString());
            string comando = "SELECT * FROM Consulta WHERE id = '" + idConsulta + "'";
            SqlCommand sqlcmd = new SqlCommand(comando, conexao);
            SqlDataReader dr = sqlcmd.ExecuteReader();
            dr.Read();
            if (dr["diagnostico"] != null)
                txtDiag.Text = dr["diagnostico"].ToString();
        }
            
    }



    protected void bntTerm_Click(object sender, EventArgs e)
    {
               
    }

    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Fazer popup para editar consulta
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {

    }
}