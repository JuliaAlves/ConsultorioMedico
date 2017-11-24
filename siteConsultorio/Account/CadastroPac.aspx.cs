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
        conexao = new SqlConnection(WebConfigurationManager.ConnectionStrings["BD16173ConnectionString"].ConnectionString);
    }
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        
        if (!String.IsNullOrEmpty(fupFotoPac.PostedFile.FileName))
        {
            string ext = Path.GetExtension(fupFotoPac.PostedFile.FileName);
            if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".bmp")
            {
                //Pegar o nome do arquivo e colocar o arquivo no servidor//
                string fileUrl = "..\\ImagesFuncionarios\\foto" + UserName.Text + Path.GetFileName(fupFotoPac.PostedFile.FileName);
                fupFotoPac.SaveAs(Server.MapPath(fileUrl));


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

                string comando = "SELECT * FROM Paciente";

                SqlCommand cmd = new SqlCommand(comando, conexao);
                conexao.Open();
                SqlDataReader sqldr = cmd.ExecuteReader();
                int last = 0;
                while (sqldr.Read())
                    last = sqldr.GetInt32(0);

                sqldr.Close();

                

                cmd.CommandText = "INSERT into Paciente Values (@id, @nome, @end, @nasc, @email, @cel, @tel, @foto)";
                cmd.Parameters.AddWithValue("id", last + 1);
                cmd.Parameters.AddWithValue("nome", txtNome.Text);
                cmd.Parameters.AddWithValue("end", txtEnd.Text);
                cmd.Parameters.AddWithValue("nasc", txtNasc.Text);
                cmd.Parameters.AddWithValue("email", txtEmail.Text);
                cmd.Parameters.AddWithValue("cel", txtCel.Text);
                cmd.Parameters.AddWithValue("tel", txtTel.Text);
                cmd.Parameters.AddWithValue("foto", vet);

                cmd.ExecuteNonQuery();

                cmd.Parameters.Clear();

                MD5 md5Hash = MD5.Create();
                cmd.CommandText = "INSERT into Usuario Values(@id, @sen, 'Paciente')";
                cmd.Parameters.AddWithValue("id", UserName.Text);
                cmd.Parameters.AddWithValue("sen", GetMd5Hash(md5Hash,Password.Text));

                cmd.ExecuteNonQuery();

                cmd.Parameters.Clear();
                cmd.CommandText = "INSERT into usuarioPaciente Values(@id, @id2)";
                cmd.Parameters.AddWithValue("id", last+1);
                cmd.Parameters.AddWithValue("id2", UserName.Text);

                cmd.ExecuteNonQuery();

                Response.Redirect("Login.aspx");
            }
        }
        else
        {
            string comando = "SELECT * FROM Paciente";

            SqlCommand cmd = new SqlCommand(comando, conexao);
            conexao.Open();
            SqlDataReader sqldr = cmd.ExecuteReader();
            int last = 0;
            while (sqldr.Read())
                last = sqldr.GetInt32(0);

            sqldr.Close();



            cmd.CommandText = "INSERT into Paciente Values (@id, @nome, @end, @nasc, @email, @cel, @tel, NULL)";
            cmd.Parameters.AddWithValue("id", last + 1);
            cmd.Parameters.AddWithValue("nome", txtNome.Text);
            cmd.Parameters.AddWithValue("end", txtEnd.Text);
            cmd.Parameters.AddWithValue("nasc", txtNasc.Text);
            cmd.Parameters.AddWithValue("email", txtEmail.Text);
            cmd.Parameters.AddWithValue("cel", txtCel.Text);
            cmd.Parameters.AddWithValue("tel", txtTel.Text);

            cmd.ExecuteNonQuery();

            cmd.Parameters.Clear();

            MD5 md5Hash = MD5.Create();
            cmd.CommandText = "INSERT into Usuario Values(@id, @sen, 'Paciente')";
            cmd.Parameters.AddWithValue("id", UserName.Text);
            cmd.Parameters.AddWithValue("sen", GetMd5Hash(md5Hash, Password.Text));

            cmd.ExecuteNonQuery();

            cmd.Parameters.Clear();
            cmd.CommandText = "INSERT into usuarioPaciente Values(@id, @id2)";
            cmd.Parameters.AddWithValue("id", last + 1);
            cmd.Parameters.AddWithValue("id2", UserName.Text);

            cmd.ExecuteNonQuery();

            Response.Redirect("Login.aspx");
        }

    }

    static string GetMd5Hash(MD5 md5Hash, string input)
    {

        byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

        StringBuilder sBuilder = new StringBuilder();

        for (int i = 0; i < data.Length; i++)
        {
            sBuilder.Append(data[i].ToString("x2"));
        }

        return sBuilder.ToString();
    }

}