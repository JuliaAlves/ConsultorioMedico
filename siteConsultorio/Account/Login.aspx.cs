using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using siteConsultorio;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Security.Cryptography;
using System.Text;

public partial class Account_Login : Page
{
    SqlConnection conexao;
        protected void Page_Load(object sender, EventArgs e)
        {
        conexao = new SqlConnection(WebConfigurationManager.ConnectionStrings["BD16173ConnectionString"].ConnectionString);

        }

        protected void LogIn(object sender, EventArgs e)
        {
            MD5 hash = MD5.Create();
            string comando = "SELECT * FROM usuario WHERE id = '" + UserName.Text + "' AND senha = '" + GetMd5Hash(hash,Password.Text)+"'";
            SqlCommand cmd = new SqlCommand(comando, conexao);
            conexao.Open();
            SqlDataReader sqldr = cmd.ExecuteReader();
            if (sqldr.HasRows)
            {
            sqldr.Read();
            Session["usuario"] = sqldr["id"];
                if (sqldr["tipo"].ToString() == "Funcionario")
                    Response.Redirect("../paginafuncionario.aspx");
                else
                    Response.Redirect("../paginapaciente.aspx");            
            }
            else
            {
                FailureText.Text = "Usuário ou senha inválidos.";
                ErrorMessage.Visible = true;
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