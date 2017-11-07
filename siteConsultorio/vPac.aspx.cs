using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class vPac : System.Web.UI.Page
{
    SqlConnection con;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] == null)
            Response.Redirect("Default.aspx");
        else
            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["BD16173ConnectionString"].ConnectionString);
    }



    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "vExames")
        {
            con.Open();
            GridView2.Visible = true;
            string codpaciente = "";
            int i = Convert.ToInt32(e.CommandArgument);
            string nome = GridView1.Rows[i].Cells[0].Text;
            string comando = "SELECT id FROM Paciente WHERE nome = '" + nome + "'";
            SqlCommand cmd = new SqlCommand(comando, con);
            SqlDataReader drID = cmd.ExecuteReader();
            drID.Read();
            codpaciente = drID["id"].ToString();

            SqlDataSource2.SelectCommand = "SELECT [descricao], [resultado] FROM [Exame] WHERE ([codPaciente] = @codPaciente)";
            SqlDataSource2.SelectParameters.Clear();
            SqlDataSource2.SelectParameters.Add("codPaciente", codpaciente);
            GridView2.DataBind();
        }
    }

    
}