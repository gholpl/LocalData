<%@ Page Title="" Language="C#" MasterPageFile="~/LocalDataAdmin.Master" AutoEventWireup="true" CodeBehind="Obits.aspx.cs" Inherits="LocalDataAdmin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 325px;
        }
        .auto-style6 {
            width: 154px;
        }
        .auto-style7 {
            width: 504px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table style="width:100%;">
        <tr>
            <td class="auto-style6">Enter Search Term Here</td>
            <td class="auto-style5">
                <asp:TextBox ID="TextBox1" runat="server" Width="297px"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Search" Width="255px" OnClick="Button1_Click" />
                <br />
                <br />
            </td>
        </tr>
        </table>
    <table style="width:100%;">
        <tr>
            <td valign="top" class="auto-style7">
                <br />
                <asp:TextBox ID="TextBox_Status" runat="server" Width="65%"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="New Record" Width="126px" />
                <br />
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                    Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox_LN" runat="server" Width="267px"></asp:TextBox>
                    <br />
                    <br />
                    First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox_FN" runat="server" Width="232px"></asp:TextBox>
                    <br />
                    <br />
                    Maiden Name
                    <asp:TextBox ID="TextBox_MN" runat="server" Width="216px"></asp:TextBox>
                    <br />
                    <br />
                    Death Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox_DD" runat="server" TextMode="Date" Width="222px"></asp:TextBox>
                    <br />
                    <br />
                    Death Place&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox_DP" runat="server" Width="222px"></asp:TextBox>
                    <br />
                    <br />
                    Newspaper&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox_NP" runat="server" Width="221px"></asp:TextBox>
                    <br />
                    <br />
                    Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox_DA" runat="server" TextMode="Date" Width="221px"></asp:TextBox>
                    <br />
                    <br />
                    Citation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox_CI" runat="server" TextMode="Date" Width="221px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button5" runat="server" Text="Insert" Width="341px" OnClick="Button3_Click" />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button6" runat="server" Text="Close Insert" Width="341px" OnClick="Button4_Click" />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td valign="top" class="auto-style7">
                
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="OBITSID" DataSourceID="SQS_ObitsAdmin" ForeColor="#333333" GridLines="None" PageSize="30">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="OBITSID" HeaderText="OBITSID" InsertVisible="False" ReadOnly="True" SortExpression="OBITSID" />
                        <asp:BoundField DataField="LASTNAME" HeaderText="LASTNAME" SortExpression="LASTNAME" />
                        <asp:BoundField DataField="FIRSTNAME" HeaderText="FIRSTNAME" SortExpression="FIRSTNAME" />
                        <asp:BoundField DataField="MAIDENNAME" HeaderText="MAIDENNAME" SortExpression="MAIDENNAME" />
                        <asp:BoundField DataField="DEATHDATE" HeaderText="DEATHDATE" SortExpression="DEATHDATE" />
                        <asp:BoundField DataField="DEATHPLACE" HeaderText="DEATHPLACE" SortExpression="DEATHPLACE" />
                        <asp:BoundField DataField="NEWSPAPER" HeaderText="NEWSPAPER" SortExpression="NEWSPAPER" />
                        <asp:BoundField DataField="DATE" HeaderText="DATE" SortExpression="DATE" />
                        <asp:BoundField DataField="CITATION" HeaderText="CITATION" SortExpression="CITATION" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                
            </td>
        </tr>
    </table>
&nbsp;

<asp:SqlDataSource ID="SQS_ObitsAdmin" runat="server" ConnectionString="<%$ ConnectionStrings:OLPL_prodConnectionString %>" OnSelecting="SQS_ObitsAdmin_Selecting" SelectCommand="SELECT * FROM [Obits]" UpdateCommand="UPDATE Obits SET LASTNAME=@LASTNAME,FIRSTNAME=@FIRSTNAME,MAIDENNAME=@MAIDENNAME,DEATHDATE=@DEATHDATE,NEWSPAPER=@NEWSPAPER,DATE=@DATE,CITATION=@CITATION
 WHERE [OBITSID] = @OBITSID" InsertCommand="INSERT INTO Obits (LASTNAME, FIRSTNAME, MAIDENNAME, DEATHDATE, NEWSPAPER, DATE, CITATION) 
VALUES (@LASTNAME, @FIRSTNAME, @MAIDENNAME, @DEATHDATE, @NEWSPAPER, @DATE, @CITATION)
">
    <InsertParameters>
        <asp:Parameter Name="LASTNAME" />
        <asp:Parameter Name="FIRSTNAME" />
        <asp:Parameter Name="MAIDENNAME" />
        <asp:Parameter Name="DEATHDATE" />
        <asp:Parameter Name="NEWSPAPER" />
        <asp:Parameter Name="DATE" />
        <asp:Parameter Name="CITATION" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="LASTNAME" />
        <asp:Parameter Name="FIRSTNAME" />
        <asp:Parameter Name="MAIDENNAME" />
        <asp:Parameter Name="DEATHDATE" />
        <asp:Parameter Name="NEWSPAPER" />
        <asp:Parameter Name="DATE" />
        <asp:Parameter Name="CITATION" />
        <asp:Parameter Name="OBITSID" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>
