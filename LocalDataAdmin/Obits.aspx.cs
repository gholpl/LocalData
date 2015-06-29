using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

namespace LocalDataAdmin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SQS_ObitsAdmin_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SQS_ObitsAdmin.SelectCommand = "SELECT * FROM Obits WHERE OBITSID > " + "'" + "0" + "'";
            string[] keys = TextBox1.Text.Split(' ');
            foreach (string key in keys)
            {
                if (key != "")
                {
                    SQS_ObitsAdmin.SelectCommand += " AND (LASTNAME like " + "'%" + key + "%' or FIRSTNAME like " + "'%" + key + "%' or MAIDENNAME like " + "'%" + key + "%' or DEATHDATE like " + "'%" + key + "%' or NEWSPAPER like " + "'%" + key + "%' or DATE like " + "'%" + key + "%' or CITATION like " + "'%" + key + "%'" + ")";
                }
            }
            GridView1.AllowPaging = false;

            GridView1.DataBind();
            
            TextBox_Status.Text = GridView1.Rows.Count + " Records Returned!!";
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            Panel1.Visible = true;
            //TextBox_DA.Text = DateTime.Now.ToString();

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string msg = "";
            SqlConnection conn = new SqlConnection(@"Data Source=sqs1.olpl.org;Initial Catalog=OLPL_prod;User ID=OLPLData;Password=123456");
            string sql = "INSERT INTO Obits (LASTNAME, FIRSTNAME, MAIDENNAME, DEATHDATE, NEWSPAPER, DATE, CITATION) VALUES (" + "'" + TextBox_LN.Text + "', " + "'" + TextBox_FN.Text + "', " + "'" + TextBox_MN.Text + "', " +"'" + TextBox_DD.Text + "', " +"'" + TextBox_NP.Text + "', " +"'" + TextBox_DA.Text + "', " +"'" + TextBox_CI.Text + "')";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                msg = "Insert Error:";
                msg += ex.Message;
            }
            finally
            {
                msg = "Record Added";
                conn.Close();
            }
            TextBox_Status.Text = msg;

            string result = TextBox_LN.Text + " " + TextBox_FN.Text + " " + TextBox_MN.Text + " " + TextBox_DD.Text + " " + TextBox_NP.Text + " " + TextBox_DA.Text + " " + TextBox_CI.Text;



            SQS_ObitsAdmin.SelectCommand = "SELECT * FROM Obits WHERE OBITSID > " + "'" + "0" + "'";
            string[] keys = result.Split(' ');
            foreach (string key in keys)
            {
                if (key != "")
                {
                    SQS_ObitsAdmin.SelectCommand += " AND (LASTNAME like " + "'%" + key + "%' or FIRSTNAME like " + "'%" + key + "%' or MAIDENNAME like " + "'%" + key + "%' or DEATHDATE like " + "'%" + key + "%' or NEWSPAPER like " + "'%" + key + "%' or DATE like " + "'%" + key + "%' or CITATION like " + "'%" + key + "%'" + ")";
                }
            }
            GridView1.AllowPaging = false;

            GridView1.DataBind();

            //TextBox_Status.Text = GridView1.Rows.Count + " Records Returned!!";
        
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            GridView1.Visible = true;
        }
    }
}