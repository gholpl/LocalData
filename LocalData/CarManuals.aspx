<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarManuals.aspx.cs" Inherits="LocalData.CarManuals" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        function PrintGridData2() {
            var prtGrid = document.getElementById('<%=GridView2.ClientID %>');
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
    
        Year&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" Height="20px" Width="188px" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" DataTextField="Select Year">
            <asp:ListItem>1925</asp:ListItem>
            <asp:ListItem>1926</asp:ListItem>
            <asp:ListItem>1927</asp:ListItem>
            <asp:ListItem>1928</asp:ListItem>
            <asp:ListItem>1929</asp:ListItem>
            <asp:ListItem>1930</asp:ListItem>
            <asp:ListItem>1931</asp:ListItem>
            <asp:ListItem>1932</asp:ListItem>
            <asp:ListItem>1933</asp:ListItem>
            <asp:ListItem>1934</asp:ListItem>
            <asp:ListItem>1935</asp:ListItem>
            <asp:ListItem>1936</asp:ListItem>
            <asp:ListItem>1937</asp:ListItem>
            <asp:ListItem>1938</asp:ListItem>
            <asp:ListItem>1939</asp:ListItem>
            <asp:ListItem>1940</asp:ListItem>
            <asp:ListItem>1941</asp:ListItem>
            <asp:ListItem>1942</asp:ListItem>
            <asp:ListItem>1943</asp:ListItem>
            <asp:ListItem>1944</asp:ListItem>
            <asp:ListItem>1945</asp:ListItem>
            <asp:ListItem>1946</asp:ListItem>
            <asp:ListItem>1947</asp:ListItem>
            <asp:ListItem>1948</asp:ListItem>
            <asp:ListItem>1949</asp:ListItem>
            <asp:ListItem>1950</asp:ListItem>
            <asp:ListItem>1951</asp:ListItem>
            <asp:ListItem>1952</asp:ListItem>
            <asp:ListItem>1953</asp:ListItem>
            <asp:ListItem>1954</asp:ListItem>
            <asp:ListItem>1955</asp:ListItem>
            <asp:ListItem>1956</asp:ListItem>
            <asp:ListItem>1957</asp:ListItem>
            <asp:ListItem>1958</asp:ListItem>
            <asp:ListItem>1959</asp:ListItem>
            <asp:ListItem>1960</asp:ListItem>
            <asp:ListItem>1961</asp:ListItem>
            <asp:ListItem>1962</asp:ListItem>
            <asp:ListItem>1963</asp:ListItem>
            <asp:ListItem>1964</asp:ListItem>
            <asp:ListItem>1965</asp:ListItem>
            <asp:ListItem>1966</asp:ListItem>
            <asp:ListItem>1967</asp:ListItem>
            <asp:ListItem>1968</asp:ListItem>
            <asp:ListItem>1969</asp:ListItem>
            <asp:ListItem>1970</asp:ListItem>
            <asp:ListItem>1971</asp:ListItem>
            <asp:ListItem>1972</asp:ListItem>
            <asp:ListItem>1973</asp:ListItem>
            <asp:ListItem>1974</asp:ListItem>
            <asp:ListItem>1975</asp:ListItem>
            <asp:ListItem>1976</asp:ListItem>
            <asp:ListItem>1977</asp:ListItem>
            <asp:ListItem>1978</asp:ListItem>
            <asp:ListItem>1979</asp:ListItem>
            <asp:ListItem>1980</asp:ListItem>
            <asp:ListItem>1981</asp:ListItem>
            <asp:ListItem>1982</asp:ListItem>
            <asp:ListItem>1983</asp:ListItem>
            <asp:ListItem>1984</asp:ListItem>
            <asp:ListItem>1985</asp:ListItem>
            <asp:ListItem>1986</asp:ListItem>
            <asp:ListItem>1987</asp:ListItem>
            <asp:ListItem>1988</asp:ListItem>
            <asp:ListItem>1989</asp:ListItem>
            <asp:ListItem>1990</asp:ListItem>
            <asp:ListItem>1991</asp:ListItem>
            <asp:ListItem>1992</asp:ListItem>
            <asp:ListItem>1993</asp:ListItem>
            <asp:ListItem>1994</asp:ListItem>
            <asp:ListItem>1995</asp:ListItem>
            <asp:ListItem>1996</asp:ListItem>
            <asp:ListItem>1997</asp:ListItem>
            <asp:ListItem>1998</asp:ListItem>
            <asp:ListItem>1999</asp:ListItem>
            <asp:ListItem>2000</asp:ListItem>
            <asp:ListItem>2001</asp:ListItem>
            <asp:ListItem>2002</asp:ListItem>
            <asp:ListItem>2003</asp:ListItem>
            <asp:ListItem>2004</asp:ListItem>
            <asp:ListItem>2005</asp:ListItem>
            <asp:ListItem>2006</asp:ListItem>
            <asp:ListItem>2007</asp:ListItem>
            <asp:ListItem>2008</asp:ListItem>
            <asp:ListItem>2009</asp:ListItem>
            <asp:ListItem>2010</asp:ListItem>
            <asp:ListItem>2011</asp:ListItem>
            <asp:ListItem>2012</asp:ListItem>
            <asp:ListItem>2013</asp:ListItem>
            <asp:ListItem>2014</asp:ListItem>
            <asp:ListItem>2015</asp:ListItem>
            
            <asp:ListItem Selected="True" Value="0">Select Year</asp:ListItem>
            
        </asp:DropDownList>
        <br />
        <br />
        Make&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="20px" Width="188px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        Model&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server" Height="20px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Width="188px" OnTextChanged="DropDownList2_TextChanged">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" Width="105px" />
        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Display Twin DataBase" Width="141px" />
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="btnPrint" value="Print" onclick="PrintGridData1()" />
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" BorderWidth="0px" Width="753px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AUTOID" DataSourceID="SQS_Grid" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#EEEEEE" />
            <Columns>
                <asp:BoundField DataField="CarMaker" HeaderText="CarMaker" SortExpression="CarMaker" />
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="YearsCovered" HeaderText="YearsCovered" SortExpression="YearsCovered" />
                <asp:BoundField DataField="Format" HeaderText="Format" SortExpression="Format" />
                <asp:BoundField DataField="CallNo" HeaderText="CallNo" SortExpression="CallNo" />
                <asp:BoundField DataField="ComputerNo" HeaderText="ComputerNo" SortExpression="ComputerNo" />
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
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="AutoModelID" DataSourceID="SQS_Twin" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#EEEEEE" />
            <Columns>
                <asp:BoundField DataField="CarMaker" HeaderText="CarMaker" SortExpression="CarMaker" />
                <asp:BoundField DataField="ModelCRef" HeaderText="Other Name" SortExpression="ModelCRef" />
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                <asp:BoundField DataField="ModelCTwin" HeaderText="Corporate Twin" SortExpression="ModelCTwin" />
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
        <asp:SqlDataSource ID="SQS_Twin" runat="server" ConnectionString="<%$ ConnectionStrings:OLPL_prodConnectionString %>" SelectCommand="SELECT * FROM [AutoModel] WHERE ([CarMaker] IS NULL)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SQS_Grid" runat="server" ConnectionString="<%$ ConnectionStrings:OLPL_prodConnectionString %>" SelectCommand="SELECT * FROM [Automotive] WHERE ([CarMaker] IS NULL)"></asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="SQS_Model" runat="server" ConnectionString="<%$ ConnectionStrings:OLPL_prodConnectionString %>" SelectCommand="SELECT DISTINCT Model FROM AutoModel WHERE ([CarMaker] LIKE '%' + @CarMaker + '%') UNION SELECT DISTINCT Model FROM Automotive WHERE ([CarMaker] LIKE '%' + @CarMaker + '%') AND ([YearsCovered] LIKE '%' + @YearsCovered + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="CarMaker" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList3" Name="YearsCovered" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
&nbsp;<asp:SqlDataSource ID="SQS_Make" runat="server" ConnectionString="<%$ ConnectionStrings:OLPL_prodConnectionString %>" SelectCommand="SELECT DISTINCT CarMaker FROM AutoModel UNION SELECT DISTINCT CarMaker FROM Automotive WHERE (YearsCovered LIKE '%' + @YearsCovered + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="YearsCovered" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>
