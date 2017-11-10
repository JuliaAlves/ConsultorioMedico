using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class agendaDia : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count == 0)
            Label1.Text = "Hoje não tem consultas";
    }
}