<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeList.aspx.cs" Inherits="EmployeeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .cancel {
            text-align: left;
        }

        .style2 {
            float: right;
        }
    </style>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
    <script type="text/javascript" src="/media/js/site.js?_=0c32e5cdbe9b575086edb0b907646184"></script>
    <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript">


        $(document).ready(function () {
            $("[id*=GridView1]").DataTable({
                //'columnDefs': [{
                //    "targets": [0, 3],
                //    "orderable": false
                //}]
                "aLengthMenu": [[2, 4, 8, -1], [2, 4, 8, "All"]],
                "columnDefs": [
                    {
                        "targets": [1, 4, 5, 6, 7, 9, 10],
                        "orderable": false
                    }
                ]
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <span class="style2">Total Count :
            <asp:Label ID="lblCount" runat="server" Text="0"> </asp:Label>
        <asp:LinkButton ID="lnkreg" runat="server" Font-Size="X-Large" ForeColor="#003366" ToolTip="NEW USER" OnClick="lnkreg_Click">Create Employee </asp:LinkButton>
        <asp:ImageButton ID="ImageButton1" runat="server" src="Images/user.png" CssClass="cancel" Height="22px" Width="22px"
            ToolTip="Close" OnClick="imgbtnCancel_Click"
            CausesValidation="False" />
    </span>


    <div style="text-align: center">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" class="display"
            OnRowCommand="GridView1_RowCommand" BackColor="#d6e0f4"
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"
            CellPadding="4" OnRowDeleting="GridView1_RowDeleting">
            <RowStyle BackColor="White" ForeColor="Black" />
            <Columns>
                <asp:BoundField DataField="f_Id" HeaderText="Unique ID" SortExpression="f_Id" />
                <asp:TemplateField HeaderText="Image" HeaderStyle-Width="200px">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("f_Image") %>'
                            Height="80px" Width="100px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="f_Name" HeaderText="Name" SortExpression="f_Name" />
                <asp:BoundField DataField="f_Email" HeaderText="Email" SortExpression="f_Email" />
                <asp:BoundField DataField="f_Mobile" HeaderText="Mobile No" />
                <asp:BoundField DataField="f_Designation" HeaderText="Designation" />
                <asp:BoundField DataField="f_gender" HeaderText="Gender" />
                <asp:BoundField DataField="f_Course" HeaderText="Course" />
                <asp:BoundField DataField="f_Createdate" HeaderText="Created Date" SortExpression="f_Createdate" />
                <asp:TemplateField HeaderText="EDIT">
                    <ItemTemplate>
                        <asp:ImageButton ID="edit" runat="server" src="Images/brush.png"
                            CssClass="cancel" Height="22px" Width="22px" ToolTip="Close"
                            CausesValidation="False" Enabled="False" />
                        <asp:LinkButton ID="lnkedit" runat="server" Style="text-align: center" CommandName="edit" CommandArgument='<%#Eval("f_Id") %>'>EDIT</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DELETE">
                    <ItemTemplate>
                        <asp:ImageButton ID="delete" runat="server" src="Images/delete.png"
                            CssClass="cancel" Height="22px" Width="22px" ToolTip="Close"
                            CausesValidation="False" Enabled="False" />
                        <asp:LinkButton ID="lnkdelete" runat="server" Style="text-align: center" CommandName="delete" CommandArgument='<%#Eval("f_Id") %>'>DELETE</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="#d6e0f4" Font-Bold="True" ForeColor="Black" />
        </asp:GridView>

        <asp:ImageButton ID="Back" runat="server" src="Images/back.png" CssClass="cancel" Height="22px" Width="22px" ToolTip="Close" OnClick="Back_Click" CausesValidation="False" />
    </div>


</asp:Content>

