using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;

public partial class paginafuncionario : System.Web.UI.Page
{
    string usuario;
    SqlConnection con;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] == null)
        {
            Response.Redirect("~/Default.aspx");
            return;
        }

        con = new SqlConnection(WebConfigurationManager.ConnectionStrings["BD16173ConnectionString"].ConnectionString);
        string cmd = "SELECT idMedico FROM usuarioMedico WHERE idUsuario = '" +Session["usuario"]+"'";
        SqlCommand comando = new SqlCommand(cmd, con);
        con.Open();
        SqlDataReader rdr = comando.ExecuteReader();
        if (rdr.HasRows)
        {
            rdr.Read();
            cmd = "SELECT * FROM Medico WHERE id = " + rdr["idMedico"];
            comando = new SqlCommand(cmd, con);
            rdr.Close();
            rdr = comando.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                usuario = rdr["id"].ToString();
                lblCel.Text   = "Celular: " + rdr["celular"].ToString();
                lblEmail.Text = "Email: " + rdr["email"].ToString();
                lblTel.Text   = "Telefone residencial: " + rdr["telResidencial"].ToString();
                lblNasc.Text  = "Data de Nascimento: " + ((DateTime)rdr["dataNasc"]).ToString("dd/MM/yyyy");

                System.Drawing.Image img;
                var vetbyte = (byte[])rdr["foto"];
                MemoryStream stream = new MemoryStream(vetbyte);
                if (stream == null || stream.Length == 0)
                {
                    fupfoto.Visible = true;
                    fupfoto.Enabled = true;
                    Label1.Visible = true;
                    btnEnviar.Visible = true;
                    btnEnviar.Enabled = true;
                }
                else
                {
                    img = System.Drawing.Image.FromStream(stream);
                    string url = "ImagesFuncionarios\\foto" + usuario + ".jpg";
                    if (!File.Exists(url))
                        img.Save(Server.MapPath(url));
                    imgFoto.ImageUrl = url;
                }

                int codEspecializacao = Convert.ToInt32(rdr["codEspecializacao"]);
                cmd = "SELECT nome FROM especializacao WHERE id = '" + codEspecializacao + "'";
                comando = new SqlCommand(cmd, con);
                rdr.Close();
                rdr = comando.ExecuteReader();
                rdr.Read();
                lblEspec.Text = "Especialização em: " + rdr["nome"].ToString();
            }
            con.Close();
        }
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        con.Open();
        if(fupfoto.PostedFile != null)
        {
            string ext = Path.GetExtension(fupfoto.PostedFile.FileName);
            if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".bmp")
            {
                //Pegar o nome do arquivo e colocar o arquivo no servidor//
                string fileUrl = "ImagesFuncionarios\\foto" + usuario + Path.GetFileName(fupfoto.PostedFile.FileName);
                fupfoto.SaveAs(Server.MapPath(fileUrl));
                imgFoto.ImageUrl = fileUrl;

                //Criaçao de uma stream para a inserçao da imagem no BD
                MemoryStream ms = new MemoryStream();
                System.Drawing.Image foto = System.Drawing.Image.FromFile(Server.MapPath(fileUrl));
                System.Drawing.Imaging.ImageFormat fmt = System.Drawing.Imaging.ImageFormat.Jpeg;

                switch (ext)
                {
                    case ".jpg":
                        fmt = System.Drawing.Imaging.ImageFormat.Jpeg;
                        break;
                    case ".png":
                        fmt = System.Drawing.Imaging.ImageFormat.Png;
                        break;
                    case ".gif":
                        fmt = System.Drawing.Imaging.ImageFormat.Gif;
                        break;
                    case ".bmp":
                        fmt = System.Drawing.Imaging.ImageFormat.Bmp;
                        break;
                }

                foto.Save(ms, fmt);

                
                byte[] vet = ms.ToArray();

                string cmd = "UPDATE Medico SET foto = @imagem WHERE id = @usuario";
                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = con;
                sqlcmd.CommandType = System.Data.CommandType.Text;
                sqlcmd.CommandText = cmd;
                sqlcmd.Parameters.AddWithValue("imagem", vet);
                sqlcmd.Parameters.AddWithValue("usuario", usuario);
                
                sqlcmd.ExecuteNonQuery();
            }
            else
                Label1.Text = "Formato de arquivo errado. Tente novamente: ";
        }
    }
}