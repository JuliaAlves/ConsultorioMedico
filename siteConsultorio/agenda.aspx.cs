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
        if (Session["usuario"] == null)
            Response.Redirect("Default.aspx");
        else
            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["BD16173ConnectionString"].ConnectionString);        
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string nome = ddlMedico.SelectedItem.ToString();
        con.Open();
        string comando = "sp_verConsultas ";
    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        Label4.Visible = true;
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label4.Visible = false;
    }
    protected void btnAgendar_Click(object sender, EventArgs e)
    {
        Response.Redirect("agConsulta.aspx");
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            int i = int.Parse((string)e.CommandArgument);
            Console.WriteLine(GridView1.DataKeys.Count);
            int id = (int)GridView1.DataKeys[i]["id"];
        }
    }
}