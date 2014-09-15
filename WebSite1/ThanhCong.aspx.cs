using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.GetData();
        }
    }

    private void GetData()
    {
        if (Global1.MaLichHencuaBenhNhan == -1)
            return;

        this.SqlDataSourceKQDangKy.SelectParameters.Clear();
        this.SqlDataSourceKQDangKy.SelectParameters.Add("MaLich", DbType.Int32, Global1.MaLichHencuaBenhNhan.ToString());
        SqlDataSourceKQDangKy.DataSourceMode = SqlDataSourceMode.DataSet;
        SqlDataSourceKQDangKy.DataBind();

        DataView dv = (DataView)this.SqlDataSourceKQDangKy.Select(DataSourceSelectArguments.Empty);
        DataRowView drv = dv[0];
        this.UserName.Text = drv["TenBenhNhan"].ToString();
        this.SexType.Text = drv["GioiTinh"].ToString();
        this.bornyear.Text = drv["NamSinh"].ToString();
        this.Address.Text = drv["DiaChi"].ToString();
        this.Phone.Text = drv["DienThoai"].ToString();
        this.Email.Text = drv["Email"].ToString();
        this.TestDay.Text = drv["NgayKham"].ToString();
        this.TestTime.Text = drv["GioKham"].ToString();
        this.Department.Text = drv["TenKhoa"].ToString();
        this.Doctors.Text = drv["TenBacSi"].ToString();

        string hash = Global1.MaLichHencuaBenhNhan.ToString();
        this.MaLich.Text = hash.GetHashCode().ToString();
       
    }
}