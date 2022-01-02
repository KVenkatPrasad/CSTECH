<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Create_Emp.aspx.cs" Inherits="Create_Emp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">

        $(document).ready(function () {
            $('.numbersOnly').on('input', function () {
                var position = this.selectionStart - 1;

                fixed = this.value.replace(/[^0-9\.]/g, '');  //remove all but number and .
                if (fixed.charAt(0) === '.')                  //can't start with .
                    fixed = fixed.slice(1);

                var pos = fixed.indexOf(".") + 1;
                if (pos >= 0)
                    fixed = fixed.substr(0, pos) + fixed.slice(pos).replace('.', '');  //avoid more than one .

                if (this.value !== fixed) {
                    this.value = fixed;
                    this.selectionStart = position;
                    this.selectionEnd = position;
                }
            });
        });




        function ValidationFunction() {
            var isValide = true;
            if ($("[id*=txtname]").val() == "") {
                alert("Name Should not be empty");
                return false;
            }
            if ($("[id*=txtemail]").val() == "") {
                alert("Email Should not be empty");
                return false;
            }
            else {
                var testEmail = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
                if (!testEmail.test($("[id*=txtemail]").val())) {
                    alert('Please Enter Valid Email');
                    return false;
                }
            }
            if ($("[id*=txtphno]").val() == "") {
                alert("Phone No should not be empty");
                return false;
            }

            if ($("[id*=ddlDesg]").val() == "0") {
                alert("Please Select Designation");
                return false;
            }

            //var gender = ("[id*=rblGender]").val();
            if ($("input[id*='rblGender']:checked").length == 0) {
                alert("Please Select Gender.");
                return false;
            }
            if ($("input[id*='chkCourse']:checked").length == "0") {
                alert("Please Select Course");
                return false;
            }
            if ($("[id*=uploadImage]").val() == "" && $("[id*=HdnPath]").val() == "") {
                alert("Please Select File");
                return false;
            }
            else {
                if ($("[id*=uploadImage]").val() != "") {
                    var fileName = $("[id*=uploadImage]").val()
                    var idxDot = fileName.lastIndexOf(".") + 1;
                    var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
                    if (extFile == "jpg" || extFile == "jpeg" || extFile == "png") {
                        //TO DO
                    } else {
                        alert("Only jpg/jpeg and png files are allowed!");
                        return false;
                    }
                }
                return true;
            }
            // Your jQuery validation
            if (isValide) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="background-color: #e5e5e5" align="center">
        <tr>
            <td>
                <asp:ScriptManager ID="script" runat="server"></asp:ScriptManager>
                <%--<fieldset style="background-color: ThreeDShadow">
                    <legend style="font-family: Courier; background-color: Maroon" align="center">USER REGISTRATION<asp:ImageButton ID="ImageButton1" runat="server" src="Images/1361021146_Error.png"
                        CssClass="cancel" Height="22px" Width="22px"
                        ToolTip="Close" OnClick="imgbtnCancel_Click"
                        CausesValidation="False" /></legend>
                <div class="style1" style="text-align: center; background-color: #1F2C4E">
                    NEW USER
                </div>--%>

                <div>
                    <table class="style2">

                        <tr>
                            <td>NAME</td>
                            <td>
                                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>
                                <asp:TextBox ID="txtemail" runat="server" AutoPostBack="true" OnTextChanged="txtemail_TextChanged"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Mobile No</td>
                            <td>
                                <asp:TextBox ID="txtphno" runat="server" class="numbersOnly" MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Designation</td>
                            <td>
                                <asp:DropDownList ID="ddlDesg" runat="server" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem Value="HR">HR</asp:ListItem>
                                    <asp:ListItem Value="Manager">Manager</asp:ListItem>
                                    <asp:ListItem Value="Sales">Sales</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td>
                                <asp:RadioButtonList runat="server" ID="rblGender" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="Male">M</asp:ListItem>
                                    <asp:ListItem Value="FeMale">F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>Course</td>
                            <td>
                                <asp:CheckBoxList runat="server" RepeatDirection="Horizontal" ID="chkCourse">
                                    <asp:ListItem Value="MCA">MCA</asp:ListItem>
                                    <asp:ListItem Value="BCA">BCA</asp:ListItem>
                                    <asp:ListItem Value="BSC">BSC</asp:ListItem>
                                </asp:CheckBoxList>
                            </td>
                        </tr>

                        <tr>
                            <td>Img Upload</td>
                            <td>
                                <asp:FileUpload runat="server" ID="uploadImage"></asp:FileUpload>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("f_Image") %>' Height="80px" Width="100px" />
                                <asp:HiddenField ID="HdnPath" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <p style="text-align: center">
                                    &nbsp;
        <asp:Button ID="btnsave" runat="server" OnClick="btnsave_Click" Text="Submit" OnClientClick="return ValidationFunction();" BackColor="#66FF33"/>
                                    &nbsp;&nbsp;
        <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click" OnClientClick="return ValidationFunction();"  BackColor="#66FF33"/>
                                </p>
                            </td>
                        </tr>
                    </table>

                </div>
                <%--</fieldset>--%>
            </td>
        </tr>
    </table>
</asp:Content>

