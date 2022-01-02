using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        User_bal objbal = new User_bal();
        objbal.EMail = txtUserID.Text.Trim();
        objbal.Name = txtpwd.Text.Trim();
        DataTable dt = objbal.ValidateUser(objbal);
        if (dt != null && dt.Rows.Count > 0)
        {
            if ((Convert.ToInt32(dt.Rows[0]["Check"])) == 1)
            {
                Session["User"] = txtUserID.Text.Trim();
                Response.Redirect("DashBoard.aspx");
                //txtUserID.Text = ""; txtpwd.Text = "";
                //ClientScript.RegisterClientScriptBlock(GetType(), "Javascript", "<script>alert('Please Enter Unique Email')</script>");
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "Javascript", "<script>alert('invalid login details')</script>");
            }

        }
    }
}