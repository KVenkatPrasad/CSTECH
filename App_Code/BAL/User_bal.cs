using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;


/// <summary>
/// Summary description for User
/// </summary>
public class User_bal
{
    public User_bal()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string Action { get; set; }

    private int _UserId = 0;

    public int UserId
    {
        get { return _UserId; }
        set { _UserId = value; }
    }



    private String _Name = string.Empty;

    public String Name
    {
        get { return _Name; }
        set { _Name = value; }
    }

    private string _EMail = string.Empty;

    public string EMail
    {
        get { return _EMail; }
        set { _EMail = value; }
    }


    private string _Phno = string.Empty;

    public string Phno
    {
        get { return _Phno; }
        set { _Phno = value; }
    }

    private string _Desig = string.Empty;

    public string Desig
    {
        get { return _Desig; }
        set { _Desig = value; }
    }

    private string _Gender = string.Empty;

    public string Gender
    {
        get { return _Gender; }
        set { _Gender = value; }
    }

    private string _Course = string.Empty;

    public string Course
    {
        get { return _Course; }
        set { _Course = value; }
    }



    private string _Image = string.Empty;

    public string Image
    {
        get { return _Image; }
        set { _Image = value; }

    }

    private string _File = string.Empty;

    public string File
    {
        get { return _File; }
        set { _File = value; }

    }

    public int InsertUser_Bal(User_bal objbal)
    {
        User_dal objdal = new User_dal();
        int i = 0;
        i = objdal.InsertUser_dal(objbal);
        return i;
    }
    public int DeleteUser_Bal(User_bal objbal)
    {
        User_dal objdal = new User_dal();
        int i = 0;
        i = objdal.DeleteUser_dal(objbal);
        return i;
    }
    public DataSet GetUserById_bal(User_bal objbal)
    {
        User_dal objdal = new User_dal();
        DataSet ds = new DataSet();
        ds = objdal.GetUserById_dal(objbal);
        return ds;

    } 

    public DataTable CheckEmail(User_bal objbal)
    {
        User_dal objdal = new User_dal();
        DataTable ds = new DataTable();
        ds = objdal.CheckEmail(objbal);
        return ds;
    }

    public DataTable ValidateUser(User_bal objbal)
    {
        User_dal objdal = new User_dal();
        DataTable ds = new DataTable();
        ds = objdal.ValidateUser(objbal);
        return ds;
    }
}