using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using siteConsultorio;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;
using System.Security.Cryptography;
using System.Text;

public partial class Account_Register : Page
{
    SqlConnection conexao;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
            conexao = new SqlConnection(WebConfigurationManager.ConnectionStrings["BD16173ConnectionString"].ConnectionString);

        conexao.Open();

        for (int i = 9; i < 17; i++)
        {
            if (i >= 12 && i <= 14)
                continue;

            ddlHora.Items.Add("" + i + ":00");
            ddlHora.Items.Add("" + i + ":30");
        }
    }


    protected void Unnamed2_Click(object sender, EventArgs e)
    {
        string comando = "INSERT INTO Consulta VALUES(@pac, @med, null, null, @h, @d, @si)";
        SqlCommand cmd = new SqlCommand(comando, conexao);
        cmd.Parameters.AddWithValue("pac", ddlPaciente.SelectedValue);
        cmd.Parameters.AddWithValue("med", ddlMedico.SelectedValue);
        cmd.Parameters.AddWithValue("h", ddlHora.SelectedValue);
        cmd.Parameters.AddWithValue("d", Calendar1.SelectedDate);
        cmd.Parameters.AddWithValue("si", 0);

        cmd.ExecuteNonQuery();
        lblS.Text = "Consulta agendada";
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}