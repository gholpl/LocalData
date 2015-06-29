<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Newspaper.aspx.cs" Inherits="LocalData.Newspaper" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript">

        function PrintGridData() {
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
	    #SLabel {
	        font-size: 1.2em;
            position: relative;
            display: inline;
        }
	</style>
</head>
<body onload="parent.alertsize(document.body.scrollHeight);">
    <form id="form1" runat="server">
    <div>
        
        <div id="SLabel">Keyword Search:</div>
        <asp:TextBox ID="TextBox1" runat="server" Width="172px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" Width="139px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" id="btnPrint" value="Print" onclick="PrintGridData()" />
        <br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Width="493px" BorderWidth="0px" AutoPostBack="True" ReadOnly="True"></asp:TextBox>
        <br />
        <br />

    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="OLPLServer" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#EEEEEE" />
            <Columns>
                 <asp:BoundField DataField="HEADLINE" HeaderText="HEADLINE" SortExpression="HEADLINE" />
                <asp:BoundField DataField="DATE" HeaderText="DATE" SortExpression="DATE" DataFormatString="{0:d}" />
                <asp:BoundField DataField="CITATION" HeaderText="CITATION" SortExpression="CITATION" />
                <asp:BoundField DataField="Newspaper" HeaderText="Newspaper" SortExpression="Newspaper" />
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
        <asp:SqlDataSource ID="OLPLServer" runat="server" ConnectionString="<%$ ConnectionStrings:OLPL_prodConnectionString %>" SelectCommand="SELECT        ReferenceLocalNewspapersMainHeadings.mainHeading, ReferenceLocalNewspapersSubHeadings.subHeading, Newspapers.KEYWORDS, Newspapers.HEADLINE, Newspapers.AUTHOR, Newspapers.DATE, 
                         Newspapers.CITATION, ReferenceLocalNewspapers.Newspaper
FROM            Newspapers INNER JOIN
                         ReferenceLocalNewspapers ON Newspapers.NewspaperId = ReferenceLocalNewspapers.Id INNER JOIN
                         ReferenceLocalNewspapersMainHeadings ON Newspapers.MainheadingId = ReferenceLocalNewspapersMainHeadings.Id INNER JOIN
                         ReferenceLocalNewspapersSubHeadings ON Newspapers.SubheadingId = ReferenceLocalNewspapersSubHeadings.Id
WHERE Newspapers.HEADLINE = '1'">
        </asp:SqlDataSource>
    </form>
</body>
</html>
