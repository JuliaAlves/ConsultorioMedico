using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class paginapaciente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["BD16173ConnectionString"].ConnectionString);
        string cmd = "SELECT idPaciente FROM usuarioPaciente WHERE idUsuario = '" + Session["usuario"] + "'";
        SqlCommand comando = new SqlCommand(cmd, con);
        con.Open();
        SqlDataReader rdr = comando.ExecuteReader();
        if (rdr.HasRows)
        {
            cmd = "SELECT * FROM Paciente WHERE id = '" + rdr["idPaciente"].ToString() + "'";
            comando = new SqlCommand(cmd, con);
            rdr = comando.ExecuteReader();
            if (rdr.HasRows)
            {
                lblNome.Text = "Nome: " + rdr["nome"].ToString();
                lblCel.Text = "Celular: " + rdr["celular"].ToString();
                lblEmail.Text = "Email: " + rdr["email"].ToString();
                lblTel.Text = "Telefone residencial: " + rdr["telResidencial"].ToString();
                lblNasc.Text = "Data de Nascimento: " + rdr["dataNasc"].ToString();
                lblEnd.Text = "Endereço: " + rdr["endereco"].ToString();               

                System.Drawing.Image img = System.Drawing.Image.FromStream(rdr.GetStream(rdr.GetOrdinal("foto")));
                img.Save(Server.MapPath("ImagesPaciente\\foto"+rdr["id"].ToString()));
                imgFoto.ImageUrl = Server.MapPath("ImagesPaciente\\foto" + rdr["id"].ToString());
            }
        }
    }
}