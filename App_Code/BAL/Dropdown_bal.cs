using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for dropdown_bal
/// </summary>
public class Dropdown_bal
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CSTECH"].ToString());
    public Dropdown_bal()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private string _Action = string.Empty;

    public string Action
    {
        get { return _Action; }
        set { _Action = value; }
    } 

    public System.Data.DataSet GetUser_bal(Dropdown_bal objbal)
    {
        try
        {
            Dropdown_dal objdal = new Dropdown_dal();
            DataSet ds = new DataSet();
            ds = objdal.GetUser_dal(objbal);
            return ds;
        }
        catch (Exception)
        {

            throw;
        }


    }

}