using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace food_ordering_app.user
{
    
    public partial class contact2 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Label1.Text = "hi";
            string CS = "data source=.; database = FoodieDB; integrated security=SSPI";
            con = new SqlConnection(CS);
            cmd = new SqlCommand("ContactSp", con);
            cmd.Parameters.AddWithValue("@Action", "INSERT");
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Subject", txtSubject.Text.Trim());
            cmd.Parameters.AddWithValue("@Message", txtMessage.Text.Trim());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Thanks for reaching out will look into your query!";
            lblMsg.CssClass = "alert alert-success";
            lblMsg.Visible = true;

            clear();
            con.Close();
        }
        private void clear()
        {
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtSubject.Text = string.Empty;
            txtMessage.Text = string.Empty;
        }
    }
}