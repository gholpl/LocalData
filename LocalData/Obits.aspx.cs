using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace LocalData
{
    public partial class Obits : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            OLPLServer.SelectCommand = "SELECT * FROM Obits WHERE OBITSID > " + "'" + "0" + "'";
            string[] keys = TextBox1.Text.Split(' ');
            foreach (string key in keys)
            {
                if (key != "")
                {
                    string keyNew = key.Replace("'", "''");
                    OLPLServer.SelectCommand += " AND (LASTNAME like " + "'%" + keyNew + "%' or FIRSTNAME like " + "'%" + keyNew + "%' or MAIDENNAME like " + "'%" + keyNew + "%'"  + ")";
                }
            }
            OLPLServer.SelectCommand += " ORDER BY LASTNAME ASC, FIRSTNAME ASC";

            GridView1.DataBind();

            TextBox2.Text = GridView1.Rows.Count + " Records Returned!!";
            
        }

        protected void OLPLServer_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
        
        }
    }
}