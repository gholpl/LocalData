using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LocalData
{
    public partial class FakeBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            SQS_FakeBook.SelectCommand = "SELECT * FROM FakeBook WHERE FAKEBOOKID > " + "'" + "0" + "'";
            string[] keys = TextBox1.Text.Split(' ');
            foreach (string key in keys)
            {
                if (key != "")
                {
                    string keyNew = key.Replace("'", "''");
                    SQS_FakeBook.SelectCommand += " AND (TITLE like " + "'%" + keyNew + "%' or FIRSTLINE like " + "'%" + keyNew + "%' or COMPOSER like " + "'%" + keyNew +  "%'" + ")";
                }
            }
            GridView1.DataBind();
            TextBox2.Text = GridView1.Rows.Count + " Records returned from FakeBook Database";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            SQS_FakeBook_Source.SelectCommand = "SELECT * FROM FakeBookSources WHERE SOURCESID > " + "'" + "0" + "'";
            string[] keys = TextBox1.Text.Split(' ');
            foreach (string key in keys)
            {
                if (key != "")
                {
                    string keyNew = key.Replace("'", "''");
                    SQS_FakeBook_Source.SelectCommand += " AND (AUTHOR like " + "'%" + keyNew + "%' or TITLE like " + "'%" + keyNew + "%' or PUBL like " + "'%" + keyNew + "%' or CODE like " + "'%" + keyNew + "%'" + ")";
                }
            }

        }
    }
}