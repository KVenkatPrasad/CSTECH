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

public partial class Create_Emp : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CSTECH"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int UserId = Convert.ToInt32(Request.QueryString["id"]);
            if (UserId != 0)
            {
                Label lbl = (Label)Page.Master.FindControl("lblPage");
                lbl.Text = "Employee Edit";
                //int UserId = Convert.ToInt32(Request.QueryString["id"]);
                btnsave.Visible = false;
                btnupdate.Visible = true;
                Update();

            }
            else
            {

                Label lbl = (Label)Page.Master.FindControl("lblPage");
                lbl.Text = "Create Employee";
                btnsave.Visible = true;
                btnupdate.Visible = false;
                Image1.Visible = false;
            }
            //{
            //    btnupdate.Visible = false;
            //    bindcountry();
            //    bindstate();
            //    bindcity();

            //}
        }
    }

    private void View()
    {
        User_bal objbal = new User_bal();
        DataSet ds = new DataSet();
        int UserId = Convert.ToInt32(Request.QueryString["uid"]);
        objbal.UserId = UserId;
        objbal.Action = "GetUserById";
        ds = objbal.GetUserById_bal(objbal);
        if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            txtname.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            txtname.Enabled = false;
            ddlDesg.SelectedIndex = ddlDesg.Items.IndexOf(ddlDesg.Items.FindByText(ds.Tables[0].Rows[0]["UserCountry"].ToString()));
            ddlDesg.Enabled = false;
            txtphno.Text = ds.Tables[0].Rows[0]["Phno"].ToString();
            txtphno.Enabled = false;
        }
    }

    private void Update()
    {
        User_bal objbal = new User_bal();
        DataSet ds = new DataSet();
        int UserId = Convert.ToInt32(Request.QueryString["id"]);
        objbal.UserId = UserId;
        objbal.Action = "GetUserById";
        ds = objbal.GetUserById_bal(objbal);
        if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            txtname.Text = ds.Tables[0].Rows[0]["f_Name"].ToString();
            txtemail.Text = ds.Tables[0].Rows[0]["f_Email"].ToString();
            txtphno.Text = ds.Tables[0].Rows[0]["f_Mobile"].ToString();
            ddlDesg.SelectedIndex = ddlDesg.Items.IndexOf(ddlDesg.Items.FindByText(ds.Tables[0].Rows[0]["f_Designation"].ToString()));
            rblGender.SelectedValue = ds.Tables[0].Rows[0]["f_gender"].ToString();
            string value = ds.Tables[0].Rows[0]["f_Course"].ToString();

            ListItem listItem = this.chkCourse.Items.FindByText(value);
            if (listItem != null) listItem.Selected = true;
            Image1.ImageUrl = ds.Tables[0].Rows[0]["f_Image"].ToString();
            HdnPath.Value = ds.Tables[0].Rows[0]["f_Image"].ToString();
            Image1.Visible = true;
            //for (int i = 0; i < chkCourse.Items.Count; i++)
            //{
            //    if ((string)chkCourse.Items[i] == value)
            //    {
            //        //chkCourse.Set SetItemChecked(i, true);
            //        chkCourse.seti
            //    }
            //}
            //ddlcity .SelectedItem.Value 

        }
    }



    private void clearbind()
    {
        txtname.Text = "";
        ddlDesg.SelectedIndex = 0;
        txtphno.Text = "";
    }
    public void showmsg(string str)
    {
        string prompt = "<script>$(document).ready(function(){{$.prompt('{0}!');}});</script>";
        string message = string.Format(prompt, str);
        ClientScript.RegisterStartupScript(typeof(Page), "message", message);
    }

    //private void binddata()
    //{

    //        SqlCommand cmd=new SqlCommand("Dropdown",con);
    //        cmd.CommandType=CommandType.StoredProcedure;
    //        DataSet ds=new DataSet();
    //        SqlDataAdapter da=new SqlDataAdapter()
    //}







    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (uploadImage.HasFile)
        {
            //txtphno.Text = Calendar.SelectedDate.ToString();
            User_bal objbal = new User_bal();
            int UserId = Convert.ToInt32(Request.QueryString["id"]);
            objbal.UserId = UserId;
            objbal.Name = txtname.Text;
            objbal.EMail = txtemail.Text;
            objbal.Phno = txtphno.Text;
            objbal.Desig = ddlDesg.SelectedValue;
            //txtcpwd.Text = txtcpwd.Text;
            objbal.Gender = rblGender.SelectedValue;
            string selectedValue = string.Empty;
            foreach (ListItem item in chkCourse.Items)
            {
                if (item.Selected)
                {
                    if (string.IsNullOrEmpty(selectedValue.Trim()))
                        selectedValue = item.Value;
                    else
                        selectedValue = selectedValue + "," + item.Value;
                }
            }

            objbal.Course = selectedValue;
            int imagefilelenth = uploadImage.PostedFile.ContentLength;
            byte[] imgarray = new byte[imagefilelenth];
            HttpPostedFile image = uploadImage.PostedFile;
            image.InputStream.Read(imgarray, 0, imagefilelenth);
            //objbal.File = imgarray;
            string filename = Path.GetFileName(uploadImage.PostedFile.FileName);
            uploadImage.SaveAs(Server.MapPath("~/Images/" + filename));
            objbal.File = "Images/" + filename;
            objbal.Action = "insert";
            int i = 0;
            i = objbal.InsertUser_Bal(objbal);
            if (i > 0)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "Javascript",
                     "<script>alert('Record Saved Successfully')</script>");
                showmsg("Record Saved Successfully");
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "Javascript",
                                "<script>alert('Record Failed to Save')</script>");
                showmsg("Record Failed to Save");
            }
            clearbind();
            //Response.Redirect("EmployeeList.aspx");
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(GetType(), "Javascript",
                                "<script>alert('Passwords are not Matched')</script>");
            showmsg("Passwords are not Matched");
        }
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        User_bal objbal = new User_bal();
        int UserId = Convert.ToInt32(Request.QueryString["id"]);
        objbal.UserId = UserId;
        objbal.Name = txtname.Text;
        objbal.EMail = txtemail.Text;
        objbal.Phno = txtphno.Text;
        objbal.Desig = ddlDesg.SelectedValue;
        //txtcpwd.Text = txtcpwd.Text;
        objbal.Gender = rblGender.SelectedValue;
        string selectedValue = string.Empty;
        foreach (ListItem item in chkCourse.Items)
        {
            if (item.Selected)
            {
                if (string.IsNullOrEmpty(selectedValue.Trim()))
                    selectedValue = item.Value;
                else
                    selectedValue = selectedValue + "," + item.Value;
            }
        }

        objbal.Course = selectedValue;
        if (uploadImage.PostedFile.ContentLength > 0)
        {
            int imagefilelenth = uploadImage.PostedFile.ContentLength;
            byte[] imgarray = new byte[imagefilelenth];
            HttpPostedFile image = uploadImage.PostedFile;
            image.InputStream.Read(imgarray, 0, imagefilelenth);
            //objbal.File = imgarray;
            string filename = Path.GetFileName(uploadImage.PostedFile.FileName);
            uploadImage.SaveAs(Server.MapPath("~/Images/" + filename));
            objbal.File = "Images/" + filename;
        }
        else
        {
            objbal.File = HdnPath.Value;
        }

        objbal.Action = "Update";
        int i = 0;
        i = objbal.InsertUser_Bal(objbal);
        if (i > 0)
        {
            ClientScript.RegisterClientScriptBlock(GetType(), "Javascript",
                 "<script>alert('Record Updated Successfully')</script>");
            showmsg("Record Updated Successfully");
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(GetType(), "Javascript",
                            "<script>alert('Record Failed to Update')</script>");
            showmsg("Record Failed to Update");
        }
        clearbind();
        Response.Redirect("EmployeeList.aspx");

    }
    protected void imgbtnCancel_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

    protected void txtemail_TextChanged(object sender, EventArgs e)
    {
        User_bal objbal = new User_bal();
        objbal.EMail = txtemail.Text.Trim();
        DataTable dt = objbal.CheckEmail(objbal);
        if (dt != null && dt.Rows.Count > 0)
        {
            if ((Convert.ToInt32(dt.Rows[0]["Check"])) == 1)
            {
                txtemail.Text = "";
                ClientScript.RegisterClientScriptBlock(GetType(), "Javascript", "<script>alert('Please Enter Unique Email')</script>");
            }

        }
    }
}