<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Obits.aspx.cs" Inherits="LocalData.Obits" %>

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
    </head>

<body onload="parent.alertsize(document.body.scrollHeight);">
    <form id="form1" runat="server">
    <div>
    
        Keyword Search
        <asp:TextBox ID="TextBox1" runat="server" Width="172px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" Width="139px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" id="btnPrint" value="Print" onclick="PrintGridData()" />
        <br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Width="493px"></asp:TextBox>
        <br />
        <br />

    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OBITSID" DataSourceID="OLPLServer" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnDataBinding="GridView1_DataBinding">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="LASTNAME" HeaderText="LASTNAME" SortExpression="LASTNAME" />
                <asp:BoundField DataField="FIRSTNAME" HeaderText="FIRSTNAME" SortExpression="FIRSTNAME" />
                <asp:BoundField DataField="MAIDENNAME" HeaderText="MAIDENNAME" SortExpression="MAIDENNAME" />
                <asp:BoundField DataField="DEATHDATE" DataFormatString="{0:d}" HeaderText="DEATHDATE" SortExpression="DEATHDATE" />
                <asp:BoundField DataField="DEATHPLACE" HeaderText="DEATHPLACE" SortExpression="DEATHPLACE" />
                <asp:BoundField DataField="NEWSPAPER" HeaderText="NEWSPAPER" SortExpression="NEWSPAPER" />
                <asp:BoundField DataField="DATE" DataFormatString="{0:d}" HeaderText="DATE" SortExpression="DATE" />
                <asp:BoundField DataField="CITATION" HeaderText="CITATION" SortExpression="CITATION" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="OLPLServer" runat="server" ConnectionString="<%$ ConnectionStrings:OLPL_prodConnectionString %>" SelectCommand="SELECT * FROM [Obits] WHERE ([FIRSTNAME] LIKE '%' + @FIRSTNAME + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" DefaultValue="zzzzzzzzzz" Name="FIRSTNAME" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
