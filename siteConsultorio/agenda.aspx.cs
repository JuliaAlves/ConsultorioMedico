using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class agenda : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(WebConfigurationManager.ConnectionStrings["BD16173ConnectionString"].ConnectionString);        
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string nome = ddlMedico.SelectedItem.ToString();
        con.Open();
        string comando = "sp_verConsultas ";
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView1_Load(object sender, EventArgs e)
    {
        
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
       
    }

    protected void GridView1_DataBinding(object sender, EventArgs e)
    {
   
    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        Label4.Visible = true;
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label4.Visible = false;
    }
}