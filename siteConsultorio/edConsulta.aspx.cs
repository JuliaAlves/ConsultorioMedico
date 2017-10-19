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
        //if (Session["usuario"] == null)
        //    Response.Redirect("Default.aspx");
        //else
            conexao = new SqlConnection(WebConfigurationManager.ConnectionStrings["BD16173ConnectionString"].ConnectionString);
    }



    protected void bntTerm_Click(object sender, EventArgs e)
    {
       
    }
}