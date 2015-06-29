<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Minutes.aspx.cs" Inherits="LocalData.Minutes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript">

        function PrintGridData1() {
            var prtGrid = document.getElementById('<%=GridView1.ClientID %>');
            prtGrid.border = 0;
            var prtwin = window.open('', 'PrintGridViewData', 'left=100,top=100,width=1000,height=1000,tollbar=0,scrollbars=1,status=0,resizable=1');
            prtwin.document.write(prtGrid.outerHTML);
            prtwin.document.close();
            prtwin.focus();
            prtwin.print();
            prtwin.close();
        }
        
    </script>
    <script>
        function toggle(obj) {
            var el = document.getElementById(obj);
            if (el.style.display != 'block') el.style.display = 'block';
            else el.style.display = 'none';
            parent.alertsize(document.body.scrollHeight);
        }
    </script>
	<style type="text/css">
		*{
			font-family: Geneva, Arial, Helvetica, sans-serif;
			font-size:	12px;
		}
	</style>
</head>
<body onload="parent.alertsize(document.body.scrollHeight);">
    <form id="form1" runat="server">
    <div>
    
        Agency&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" Height="20px" Width="188px" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
            
        </asp:DropDownList>
        <br />
        <br />
        Year&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" Height="20px" Width="188px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Selected="True" Value="0">Select Year</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" Width="105px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="btnPrint" value="Print" onclick="PrintGridData1()" />
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" BorderWidth="0px" Width="753px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="DS_MinutesSearch" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnRowDataBound="GridView1_RowDataBound">
            <AlternatingRowStyle BackColor="#EEEEEE" />
            <Columns>
                <asp:BoundField DataField="Agency" HeaderText="Agency" SortExpression="Agency" />
                <asp:TemplateField HeaderText="Link" SortExpression="Link">
                    <EditItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Bind("Link") %>'></asp:HyperLink>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Link") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CompleteDate" HeaderText="CompleteDate" SortExpression="CompleteDate" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="#DDDDDD" Font-Bold="True" ForeColor="Black" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="#666666" HorizontalAlign="Right" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="Black" />
            <SortedAscendingCellStyle BackColor="#EEEEEE" />
            <SortedAscendingHeaderStyle BackColor="#EEEEEE" />
            <SortedDescendingCellStyle BackColor="#EEEEEE" />
            <SortedDescendingHeaderStyle BackColor="#EEEEEE" />
        </asp:GridView>
        <br />
&nbsp;<br />
    
    </div>
        <asp:SqlDataSource ID="DS_Agency" runat="server" ConnectionString="<%$ ConnectionStrings:OLPL_prodConnectionString %>" SelectCommand="SELECT DISTINCT [Agency] FROM [ReferenceLocalGovernment]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DS_Year" runat="server" ConnectionString="<%$ ConnectionStrings:OLPL_prodConnectionString %>" SelectCommand="SELECT DISTINCT Year(Minutes.CompleteDate)
FROM            Minutes INNER JOIN
                         ReferenceLocalGovernment ON Minutes.AgencyId = ReferenceLocalGovernment.AgencyId"></asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="DS_MinutesSearch" runat="server" ConnectionString="<%$ ConnectionStrings:OLPL_prodConnectionString %>" SelectCommand="SELECT        ReferenceLocalGovernment.Agency, Minutes.Link, Minutes.CompleteDate
FROM            Minutes INNER JOIN
                         ReferenceLocalGovernment ON Minutes.AgencyId = ReferenceLocalGovernment.AgencyId
WHERE Minutes.Link = null"></asp:SqlDataSource>
    </form>
</body>
</html>

