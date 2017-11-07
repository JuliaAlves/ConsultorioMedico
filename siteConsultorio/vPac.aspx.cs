using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class vPac : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }



    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "vExames")
        {
            GridView2.Visible = true;
            string codpaciente = "";
            int i = Convert.ToInt32(e.CommandArgument);

            SqlDataSource2.SelectCommand = "SELECT [descricao], [resultado] FROM [Exame] WHERE ([codPaciente] = @codPaciente)";
            SqlDataSource2.SelectParameters.Add("codPaciente", codpaciente);
        }
    }

    
}