using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LocalData
{
    public partial class Newspaper : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            OLPLServer.SelectCommand = "SELECT ReferenceLocalNewspapersMainHeadings.mainHeading, ReferenceLocalNewspapersSubHeadings.subHeading, "
                + "Newspapers.KEYWORDS, Newspapers.HEADLINE, Newspapers.AUTHOR, Newspapers.DATE, Newspapers.CITATION, ReferenceLocalNewspapers.Newspaper "
                + "FROM Newspapers INNER JOIN ReferenceLocalNewspapers ON Newspapers.NewspaperId = ReferenceLocalNewspapers.Id "
                + "INNER JOIN ReferenceLocalNewspapersMainHeadings ON Newspapers.MainheadingId = ReferenceLocalNewspapersMainHeadings.Id "
                + "INNER JOIN ReferenceLocalNewspapersSubHeadings ON Newspapers.SubheadingId = ReferenceLocalNewspapersSubHeadings.Id "
                + "WHERE Newspapers.NEWSID > " + "'" + "0" + "'";
            string[] keys = TextBox1.Text.Split(' ');
            foreach (string key in keys)
            {
                if (key != "")
                {
                    string keyNew = key.Replace("'", "''");
                    OLPLServer.SelectCommand += " AND (ReferenceLocalNewspapersMainHeadings.mainHeading like " + "'%" + keyNew + "%' or ReferenceLocalNewspapersSubHeadings.subHeading like "
                        + "'%" + keyNew + "%' or Newspapers.KEYWORDS like " + "'%" + keyNew + "%' or Newspapers.HEADLINE like " + "'%" + keyNew 
                        + "%' or Newspapers.AUTHOR like " + "'%" + keyNew + "%' or Newspapers.CITATION like " + "'%" + keyNew 
                        + "%' or  ReferenceLocalNewspapers.Newspaper like " + "'%" + keyNew + "%'" + ")";
                }
            }
            OLPLServer.SelectCommand += " ORDER BY  Newspapers.DATE ASC";

            GridView1.DataBind();

            TextBox2.Text = GridView1.Rows.Count + " Records Returned!!";
        }
    }
}