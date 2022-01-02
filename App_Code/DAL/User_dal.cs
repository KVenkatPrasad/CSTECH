using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for User_dal
/// </summary>
public class User_dal
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CSTECH"].ToString());
	public User_dal()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    internal int DeleteUser_dal(User_bal objbal)
    {
        
        try
        {
            SqlCommand cmd = new SqlCommand("UserDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            cmd.Parameters.AddWithValue("@f_Id", objbal.UserId);
            cmd.Parameters.AddWithValue("@Action", objbal.Action);

            int i = 0;
            con.Open();
            i = cmd.ExecuteNonQuery();
            return i;
        }
        catch(Exception ex)
        {
            throw ex;
        }
    }

    internal int InsertUser_dal(User_bal objbal)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("UserDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();

            cmd.Parameters.AddWithValue("@Name", objbal.Name);
            cmd.Parameters.AddWithValue("@EMail", objbal.EMail);
            cmd.Parameters.AddWithValue("@Phno", objbal.Phno);
            cmd.Parameters.AddWithValue("@Desig", objbal.Desig);
            cmd.Parameters.AddWithValue("@Gender", objbal.Gender);
            cmd.Parameters.AddWithValue("@Course", objbal.Course);
            cmd.Parameters.AddWithValue("@Image", objbal.File);
            cmd.Parameters.AddWithValue("@Action", objbal.Action);
            if (objbal.Action == "insert")
            {
                cmd.Parameters.AddWithValue("@UserId", objbal.UserId);
            }
            else if (objbal.Action == "Update")
            {
                cmd.Parameters.AddWithValue("@f_Id", objbal.UserId);
            }

            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();

            return i;
        }
        catch (Exception ex)
        {
            return 0;
            // throw ex;
        }
        
        
    }



    internal System.Data.DataSet GetUserById_dal(User_bal objbal)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("UserDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@f_Id", objbal.UserId);
            cmd.Parameters.AddWithValue("@Action", objbal.Action);

            //int i = 0;
            //con.Open();
            //i = cmd.ExecuteNonQuery();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch (Exception ex)
        {
            
            throw ex;
        }
        
    }   

    internal DataTable CheckEmail(User_bal objbal)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("CheckEmail", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Email", objbal.EMail);
            DataTable ds = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }


    internal DataTable ValidateUser(User_bal objbal)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("ValidateUser", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@User", objbal.EMail);
            cmd.Parameters.AddWithValue("@pwd", objbal.Name);
            DataTable ds = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
}