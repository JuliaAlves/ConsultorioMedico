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
    private SqlConnection conexao;
    private int codMedico;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] == null)
            Response.Redirect("Default.aspx");
        else
        {
            conexao = new SqlConnection(WebConfigurationManager.ConnectionStrings["BD16173ConnectionString"].ConnectionString);
            conexao.Open();
            string cmd = "SELECT idMedico FROM usuarioMedico WHERE idUsuario = '" + Session["usuario"] + "'";
            SqlCommand sqlcmd = new SqlCommand(cmd, conexao);
            SqlDataReader dr = sqlcmd.ExecuteReader();
            dr.Read();
            codMedico = Convert.ToInt32(dr["idMedico"]);
            dr.Close();
        }
    }


    protected void Unnamed2_Click(object sender, EventArgs e)
    {
        string comando = "INSERT INTO Consulta VALUES(@pac, @med, null, null, @h, @d, @si)";
        SqlCommand cmd = new SqlCommand(comando, conexao);
        cmd.Parameters.AddWithValue("pac", ddlPaciente.SelectedValue);
        cmd.Parameters.AddWithValue("med", codMedico);
        cmd.Parameters.AddWithValue("h", ddlHora.SelectedValue);
        cmd.Parameters.AddWithValue("d", Calendar1.SelectedDate);
        cmd.Parameters.AddWithValue("si", 0);

        cmd.ExecuteNonQuery();
        Response.Redirect("agendaMedico.aspx");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ddlHora_DataBinding(object sender, EventArgs e)
    {
        ddlHora.Items.Clear();
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        DateTime dataEscolhida = Calendar1.SelectedDate;
        string comando = "SELECT hora FROM Consulta WHERE data = '" + dataEscolhida.ToString() + "' AND (codMedico = '" + codMedico + "' OR codPaciente = '"+ddlPaciente.SelectedValue.ToString()+"')";
        SqlCommand cmd = new SqlCommand(comando, conexao);
        SqlDataReader drHora = cmd.ExecuteReader();
        bool hasRows = drHora.HasRows;
        ddlHora.Items.Clear();
        if (hasRows)
            drHora.Read();
        for (int i = 9; i < 17; i++)
        {
            if (i >= 12 && i <= 14)
                continue;

            string hora = i + ":00";
            if (!hasRows)
                ddlHora.Items.Add(hora);
            else
                if (drHora["hora"].ToString().Equals(hora))
                    hasRows = drHora.Read();
                else
                    ddlHora.Items.Add(hora);

            hora = i + ":30";
            if (!hasRows)
                ddlHora.Items.Add(hora);
            else
                if (drHora["hora"].ToString().Equals(hora))
                    hasRows = drHora.Read();
                else
                    ddlHora.Items.Add(hora);
        }
    }
}