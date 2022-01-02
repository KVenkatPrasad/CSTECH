using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Dropdown_dal
/// </summary>
public class Dropdown_dal
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CSTECH"].ToString());
    public Dropdown_dal()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    internal DataSet GetUser_dal(Dropdown_bal objbal)
    {
        SqlCommand cmd = new SqlCommand("Dropdown", con);
        cmd.CommandType = CommandType.StoredProcedure;
        DataSet ds = new DataSet();
        cmd.Parameters.AddWithValue("@Action", objbal.Action);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }
}