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
using System.Timers;

public partial class EmployeeList : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CSTECH"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Label lbl = (Label)Page.Master.FindControl("lblPage");
            lbl.Text = "Employee List";
            Back.Visible = false;
            gridbind();

        }
    }
    private void gridbind()
    {
        try
        {
            Dropdown_bal objbal = new Dropdown_bal();
            DataSet ds = new DataSet();
            objbal.Action = "getUser";
            ds = objbal.GetUser_bal(objbal);
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                lblCount.Text = Convert.ToString(ds.Tables[0].Rows.Count);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                GridView1.UseAccessibleHeader = true;
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }
        catch (Exception EX)
        {

            throw EX;
        }

    }




    protected void lnkreg_Click(object sender, EventArgs e)
    {
        Response.Redirect("Create_Emp.aspx");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            int UserId = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "edit")
            {
                Session["id"] = UserId;
                Response.Redirect("Create_Emp.aspx?id=" + UserId);
            }
            if (e.CommandName == "delete")
            {
                Delete(UserId);
            }

        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    private void Delete(int UserId)
    {
        try
        {

            User_bal objbal = new User_bal();
            objbal.UserId = UserId;
            objbal.Action = "Deletuser";
            int i = objbal.DeleteUser_Bal(objbal);
            if (i > 0)
            {
                ClientScript.RegisterStartupScript(GetType(), "DelAlert", "<script>alert('Deleted Successfully') </script>");
                gridbind();
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "Javascript",
        "<script>alert('Record Deletetion Failed')</script>");
                gridbind();
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    //private void Delete()
    //{
    //    User_bal objbal = new User_bal();
    //    objbal.UserId = UserId;
    //    objbal.Action = "Deletuser";
    //    int i = objbal.DeleteUser_Bal(objbal);
    //    if (i > 0)
    //    {
    //        //        ClientScript.RegisterClientScriptBlock(GetType(), "Javascript",
    //        //"<script>alert('Record Deleted Successfully')</script>");
    //        ClientScript.RegisterStartupScript(GetType(), "DelAlert", "<script>alert('Deleted Successfully') </script>");
    //        Response.Redirect("Default.aspx");
    //    }
    //    else
    //    {
    //        ClientScript.RegisterClientScriptBlock(GetType(), "Javascript",
    //"<script>alert('Record Deletetion Failed')</script>");
    //        Response.Redirect("Default.aspx");
    //    }
    //}
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {

            GridView1.PageIndex = e.NewPageIndex;
            gridbind();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    //protected void btnsearch_Click(object sender, EventArgs e)
    //{

    //    User_bal objbal = new User_bal();
    //    objbal.Name = txtsearch.Text;
    //    DataSet ds = new DataSet();
    //    objbal.Action = "Search";
    //    ds = objbal.GetUserByName_bal(objbal);
    //    if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
    //    {
    //        GridView2.DataSource = ds;
    //        GridView2.DataBind();
    //        GridView2.Visible = true;
    //        GridView1.Visible = false;
    //    }
    //    else
    //    {
    //        ClientScript.RegisterClientScriptBlock(GetType(), "Javascript",
    //  "<script>alert('Record is not founded')</script>");
    //        GridView1.Visible = true;  
    //    }



    //}

    protected void imgbtnCancel_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            Response.Redirect("UserReg.aspx");
        }
        catch (Exception ex)
        {

            throw ex;
        }

    }
    

    protected void Back_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            Response.Redirect("DashBoard.aspx");

        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
}