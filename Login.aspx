<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1381px;
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript">
        function ValidateUser() {
            var isValide = true;
            if ($("[id*=txtUserID]").val() == "") {
                alert("UserID Should not be empty");
                return false;
            }
            if ($("[id*=txtpwd]").val() == "") {
                alert("Password Should not be empty");
                return false;
            }
            return isValide;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1" border="1">
                <tr>
                    <td colspan="5">
                        <img class="auto-style2" src="Images/Logo.png" /></td>
                </tr>
                <tr style="background-color: yellow;">
                    <td colspan="5">Login page</td>
                </tr>

                <tr>
                    <td></td>
                    <td>Login</td>
                    <td>
                        <asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
                    </td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td>Password</td>
                    <td>
                        <asp:TextBox ID="txtpwd" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" BackColor="#66FF33" OnClientClick="return ValidateUser();" />
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
