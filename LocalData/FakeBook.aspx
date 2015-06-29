<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FakeBook.aspx.cs" Inherits="LocalData.FakeBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    
        <br />
        &nbsp;<div id="SLabel">Title, First Line or Composer </div>&nbsp;<asp:TextBox ID="TextBox1" runat="server" Width="240px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search"/>
&nbsp;<input type="button" id="btnPrint" value="Print" onclick="PrintGridData()" />
        <br />
        <br />
        &nbsp;<asp:TextBox ID="TextBox2" runat="server" Width="413px" BorderWidth="0px" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SQS_FakeBook" DataKeyNames="FAKEBOOKID" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#EEEEEE" />
            <Columns>
                <asp:BoundField DataField="TITLE" HeaderText="TITLE" SortExpression="TITLE" />
                <asp:BoundField DataField="FIRSTLINE" HeaderText="FIRSTLINE" SortExpression="FIRSTLINE" />
                <asp:BoundField DataField="COMPOSER" HeaderText="COMPOSER" SortExpression="COMPOSER" />
                <asp:BoundField DataField="CODE" HeaderText="CODE" SortExpression="CODE" />
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
        <asp:SqlDataSource ID="SQS_FakeBook_Source" runat="server" ConnectionString="<%$ ConnectionStrings:OLPL_prodConnectionString %>" SelectCommand="SELECT * FROM [FakeBookSources] WHERE SOURCESID &lt; 0"></asp:SqlDataSource>
        <br />
        <br />
        <asp:SqlDataSource ID="SQS_FakeBook" runat="server" ConnectionString="<%$ ConnectionStrings:OLPL_prodConnectionString %>" SelectCommand="SELECT * FROM [FakeBook] WHERE FAKEBOOKID &lt; 0"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
