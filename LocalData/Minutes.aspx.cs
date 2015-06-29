using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LocalData
{
    public partial class Minutes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataView dview = (DataView)DS_Year.Select(DataSourceSelectArguments.Empty);
            foreach (DataRow drow in dview.Table.Rows)
            {
                DropDownList1.Items.Add(drow[0].ToString());
            }
            DataView dview1 = (DataView)DS_Agency.Select(DataSourceSelectArguments.Empty);
            foreach (DataRow drow1 in dview1.Table.Rows)
            {
                DropDownList3.Items.Add(drow1[0].ToString());
            }



        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool selectedBool = false;
            String selectedYear = null; ;
            if (!DropDownList3.SelectedValue.Contains("Please Select Agency"))
            {
                //if (!DropDownList1.SelectedItem.Text.Contains("Years"))
                //{
                //    selectedBool = true;
                //    selectedYear = DropDownList1.SelectedItem.Text;
                //}

                DropDownList1.Items.Clear();
                DS_Year.SelectCommand = "SELECT DISTINCT Year(Minutes.CompleteDate) FROM Minutes INNER JOIN ReferenceLocalGovernment ON Minutes.AgencyId = ReferenceLocalGovernment.AgencyId "
                    + "WHERE ReferenceLocalGovernment.Agency = '" + DropDownList3.SelectedValue.Replace("'", "''") + "'";
                DS_Year.DataBind();
                ListItem l1 = new ListItem();
                l1.Text = "ALL Years";
                l1.Value = "0";
                DropDownList1.Items.Add(l1);
                DataView dview = (DataView)DS_Year.Select(DataSourceSelectArguments.Empty);
                foreach (DataRow drow in dview.Table.Rows)
                {
                    DropDownList1.Items.Add(drow[0].ToString());
                }
                DropDownList1.SelectedValue = "0";
                //if (selectedBool)
                //{
                //    DropDownList1.SelectedValue = selectedYear;
                //}
            }
            else
            {
                DropDownList1.Items.Clear();
                DS_Year.SelectCommand = "SELECT DISTINCT Year(Minutes.CompleteDate) FROM Minutes INNER JOIN ReferenceLocalGovernment ON Minutes.AgencyId = ReferenceLocalGovernment.AgencyId";   
                DS_Year.DataBind();
                
                ListItem l1 = new ListItem();
                l1.Text = "Select Year";
                l1.Value = "0";
                DropDownList1.Items.Add(l1);
                DataView dview = (DataView)DS_Year.Select(DataSourceSelectArguments.Empty);
                foreach (DataRow drow in dview.Table.Rows)
                {
                    DropDownList1.Items.Add(drow[0].ToString());
                }
                //DropDownList1.SelectedValue = "0";
            }



        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "0")
            {
                DS_MinutesSearch.SelectCommand = "SELECT ReferenceLocalGovernment.Agency, Minutes.Link, Minutes.CompleteDate "
                    + "FROM Minutes INNER JOIN ReferenceLocalGovernment ON Minutes.AgencyId = ReferenceLocalGovernment.AgencyId "
                    + "WHERE ReferenceLocalGovernment.Agency = '" + DropDownList3.SelectedValue + "'";
                DS_MinutesSearch.DataBind();
            }
            else
            {
                DS_MinutesSearch.SelectCommand = "SELECT ReferenceLocalGovernment.Agency, Minutes.Link, Minutes.CompleteDate "
                    + "FROM Minutes INNER JOIN ReferenceLocalGovernment ON Minutes.AgencyId = ReferenceLocalGovernment.AgencyId "
                    + "WHERE Year(Minutes.CompleteDate) = '" + DropDownList1.SelectedValue + "'"
                    + " AND ReferenceLocalGovernment.Agency = '" + DropDownList3.SelectedValue + "'";
                DS_MinutesSearch.DataBind();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (DropDownList3.SelectedValue.Contains("Please Select Agency") || DropDownList3.SelectedValue.Contains("0"))
            //{
            //    DropDownList3.Items.Clear();
            //    DS_Agency.SelectCommand = "SELECT DISTINCT ReferenceLocalGovernment.Agency FROM Minutes INNER JOIN "
            //             + "ReferenceLocalGovernment ON Minutes.AgencyId = ReferenceLocalGovernment.AgencyId WHERE Year(Minutes.CompleteDate) = '" + DropDownList1.SelectedValue + "'";
            //    DS_Agency.DataBind();
            //    ListItem l1 = new ListItem();
            //    l1.Text = " Please Select Agency";
            //    l1.Value = "0";
            //    DropDownList3.Items.Add(l1);
            //    DataView dview1 = (DataView)DS_Agency.Select(DataSourceSelectArguments.Empty);
            //    TextBox1.Text = DS_Agency.SelectCommand.ToString();
            //    foreach (DataRow drow1 in dview1.Table.Rows)
            //    {
            //        DropDownList3.Items.Add(drow1[0].ToString());
            //    }
            //}


        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
             if(e.Row.RowType == DataControlRowType.DataRow)
            {
              // Get the value in the hyperlink column.
              string HyperLinkValue = e.Row.Cells[1].Text;
              // Find the label control, then set the label's visibility=false
              // to "remove" the control from the cell.
              //< do the find and set visibility here >
              // Insert a real hyperlink into Cells[1] using HyperLinkValue.
              HyperLink myLink = new HyperLink();
              myLink.NavigateUrl = HyperLinkValue;
              myLink.Text = HyperLinkValue;
              // then add the control to the cell.
              e.Row.Cells[1].Controls.Add(myLink);
            }

        }

    }
}