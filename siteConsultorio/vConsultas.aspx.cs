using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class vConsultas : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] == null)
            Response.Redirect("Default.aspx");

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "avaliar")
        {
            int i = Convert.ToInt32(e.CommandArgument);
            CheckBox chk = (CheckBox)GridView1.Rows[i].Cells[5].Controls[0];
            if (chk.Checked)
            {
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["BD16173ConnectionString"].ConnectionString);
                con.Open();
                string comando = "UPDATE Consulta SET avaliacao= @ava WHERE id= @codconsulta";
                SqlCommand c = new SqlCommand(comando, con);
                c.Parameters.AddWithValue("@ava", rblNota.SelectedValue);
                c.Parameters.AddWithValue("@codconsulta", Convert.ToInt32(GridView1.Rows[i].Cells[0].Text));
                c.ExecuteNonQuery();
                Label2.Visible = true;
                Label2.Text = "Sua avaliação foi enviada. Obrigado!";
            }
            else
            {
                Label2.Visible = true;
                Label2.Text = "Essa consulta ainda não ocorreu, não há como avaliá-la";
            }                

        }
    }
}