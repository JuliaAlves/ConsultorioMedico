using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net.Mail;

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
        /*con.Open();
        string comando = "sp_verConsultas ";*/
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
            int i = Convert.ToInt32(e.CommandArgument);
            string medico = ddlMedico.SelectedValue.ToString();
            string nome = GridView1.Rows[i].Cells[1].Text;
            string hora = GridView1.Rows[i].Cells[2].Text;
            

            con.Open();
            string cmd = "SELECT id FROM paciente WHERE nome='" + nome + "'";            
            SqlCommand sqlcmd = new SqlCommand(cmd, con);
            SqlDataReader sqlDr = sqlcmd.ExecuteReader();
            sqlDr.Read();
            int idPaciente = (int)sqlDr["id"];

            cmd = "SELECT id FROM medico WHERE nome = '" + medico + "'";
            sqlDr.Close();
            sqlcmd = new SqlCommand(cmd, con);
            sqlDr = sqlcmd.ExecuteReader();
            sqlDr.Read();
            int idMedico = (int)sqlDr["id"];
            

            

            cmd = "SELECT id FROM Consulta WHERE codMedico = " + idMedico + " AND codPaciente = " + idPaciente + " AND hora = '"+hora+"'";
            sqlcmd = new SqlCommand(cmd, con);
            sqlDr.Close();
            sqlDr = sqlcmd.ExecuteReader();
            sqlDr.Read();
            Response.Redirect("edConsulta.aspx?id=" + sqlDr["id"].ToString());
        }

        else if(e.CommandName == "email")
        {

            int i = Convert.ToInt32(e.CommandArgument);
            string medico = ddlMedico.SelectedValue.ToString();
            string data = cDia.SelectedDate.ToString();
            string hora = GridView1.Rows[i].Cells[2].Text;

            con.Open();
            SqlCommand sqlcmd = new SqlCommand("SELECT p.email FROM Paciente p INNER JOIN Consulta c ON p.id = c.codPaciente WHERE c.id="+GridView1.Rows[i].Cells[0].Text, con);
            SqlDataReader sqlDr = sqlcmd.ExecuteReader();
            sqlDr.Read();

            MailMessage mail = new MailMessage("consultoriomedico1337@gmail.com", (string)sqlDr["email"]);
            SmtpClient client = new SmtpClient();
            System.Net.NetworkCredential basicauthenticationinfo = new System.Net.NetworkCredential("consultoriomedico1337@gmail.com", "juliafrodobronze");
            client.Port = 25;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Host = "smtp.google.com";
            client.Credentials = basicauthenticationinfo;
            mail.Subject = "Consulta";
            mail.Body = "Você tem uma consulta marcada para o dia "+ data+" às "+hora+" com o Médico "+medico+". \n Att. Consultório.";
            client.Send(mail);
        }

    }
}