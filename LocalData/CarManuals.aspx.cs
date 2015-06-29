using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LocalData
{
    public partial class CarManuals : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //SQS_Make.SelectCommand = "SELECT DISTINCT CarMaker FROM AutoModel UNION SELECT DISTINCT CarMaker FROM Automotive WHERE (YearsCovered LIKE '%" + DropDownList3.Text + "%')";
            //SQS_Make.DataBind();
            //DropDownList1.DataSource = SQS_Make;
            //DropDownList1.DataTextField = "CarMaker";
            //DropDownList1.DataValueField="CarMaker";
            //DropDownList1.DataBind();
        }

        protected void DropDownList2_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList3.SelectedValue.ToString() != "0")
            {
                SQS_Grid.SelectCommand = "SELECT * FROM [Automotive] WHERE [YearsCovered] LIKE " + "'%" + DropDownList3.SelectedValue.ToString().TrimEnd().Replace("'", "''") + "%'" + " AND [CarMaker] LIKE " + "'%" + DropDownList1.SelectedValue.ToString().TrimEnd().Replace("'", "''") + "%'" + " AND [Model] LIKE " + "'%" + DropDownList2.SelectedValue.ToString().TrimEnd().Replace("'", "''") + "%' ORDER BY CarMaker ASC, Model ASC, Title ASC";
                GridView1.DataBind();
                if (GridView1.Rows.Count < 1)
                {
                    SQS_Twin.SelectCommand = "SELECT * FROM AutoModel WHERE CarMaker LIKE " + "'%" + DropDownList1.SelectedValue.ToString().TrimEnd().Replace("'", "''") + "%'" + " AND Model LIKE " + "'%" + DropDownList2.SelectedValue.ToString().TrimEnd().Replace("'", "''") + "%'";
                    GridView2.DataBind();
                    TextBox1.Text = GridView2.Rows.Count + " Records returned from Twin Database";
                }
                else
                {
                    SQS_Twin.SelectCommand = "SELECT * FROM AutoModel WHERE CarMaker IS NULL";
                    GridView2.DataBind();
                    TextBox1.Text = GridView1.Rows.Count + " Records returned from Main Database";
                }
            }
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList3.SelectedValue.ToString() != "0")
            {
                SQS_Make.SelectCommand = "SELECT DISTINCT CarMaker FROM Automotive WHERE (YearsCovered LIKE '%" + DropDownList3.Text.ToString().TrimEnd().Replace("'", "''") + "%')";
                SQS_Make.DataBind();
                DropDownList1.DataSource = SQS_Make;
                DropDownList1.DataTextField = "CarMaker";
                DropDownList1.DataBind();
                SQS_Model.SelectCommand = "SELECT DISTINCT Model FROM Automotive WHERE ([CarMaker] LIKE '%" + DropDownList1.Text.ToString().TrimEnd().Replace("'", "''") + "%') AND ([YearsCovered] LIKE '%" + DropDownList3.Text.ToString().TrimEnd().Replace("'", "''") + "%')";
                SQS_Model.DataBind();
                DropDownList2.DataSource = SQS_Model;
                DropDownList2.DataTextField = "Model";
                DropDownList2.DataBind();
            }
            else { DropDownList2.Items.Clear(); DropDownList1.Items.Clear(); }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList3.SelectedValue.ToString() != "0")
            {
                SQS_Model.SelectCommand = "SELECT DISTINCT Model FROM Automotive WHERE ([CarMaker] LIKE '%" + DropDownList1.Text.ToString().TrimEnd().Replace("'", "''") + "%') AND ([YearsCovered] LIKE '%" + DropDownList3.Text.ToString().TrimEnd().Replace("'", "''") + "%')";
                SQS_Model.DataBind();
                DropDownList2.DataSource = SQS_Model;
                DropDownList2.DataTextField = "Model";
                DropDownList2.DataBind();
            }
            else { DropDownList2.Items.Clear(); DropDownList1.Items.Clear(); }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SQS_Twin.SelectCommand = "SELECT * FROM AutoModel ORDER BY [CarMaker] ASC,[Model] ASC";
                GridView2.DataBind();
                TextBox1.Text = GridView2.Rows.Count + " Records returned from Twin Database ";
                SQS_Grid.SelectCommand = "SELECT * FROM [Automotive] WHERE [YearsCovered] IS NULL";
                GridView1.DataBind();
           
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        
    }
}