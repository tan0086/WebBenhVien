using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class HenKham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Global1.Reset();
    }

    protected void Reservation_Click(object sender, EventArgs e)
    {
        string connString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        SqlConnection conn = null;
        int mabenhnhan = -1;
        int Malich = -1;

        try
        {
            conn = new SqlConnection(connString);
            conn.Open();
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SP_DangKyKham";
                cmd.Parameters.AddWithValue("@TenBenhNhan", this.TenBenhNhan.Text);

                string dateyear = this.BornYear.SelectedValue + "-01-01";

                cmd.Parameters.AddWithValue("@NamSinh", dateyear);
                cmd.Parameters.AddWithValue("@GioiTinh", this.SexType.SelectedValue);
                cmd.Parameters.AddWithValue("@DiaChi", this.Address.Text);
                cmd.Parameters.AddWithValue("@DienThoai", this.Phone.Text);
                cmd.Parameters.AddWithValue("@Email", this.Email.Text);

                DateTime dat = DateTime.ParseExact(this.TestDay.Text, "MM/dd/yyyy", null);
                dat.AddHours(int.Parse(this.TestTime.SelectedValue));
                string format = "yyyy-MM-dd HH:MM:ss";
                string stringTimeKham = dat.ToString(format);

                cmd.Parameters.AddWithValue("@NgayKham", stringTimeKham);
                cmd.Parameters.AddWithValue("@GioKham", stringTimeKham);
                cmd.Parameters.AddWithValue("@MaKhoa", this.Department.SelectedValue);
                cmd.Parameters.AddWithValue("@MaBacSi", this.Doctors.SelectedValue);
                cmd.Parameters.AddWithValue("@MoTaBenh", this.Description.Text);
                cmd.Parameters.Add("@MaBenhNhan", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@MaLich", SqlDbType.Int).Direction = ParameterDirection.Output;

                int rowsAffected = cmd.ExecuteNonQuery();

               
                mabenhnhan = Convert.ToInt32(cmd.Parameters["@MaBenhNhan"].Value);
                Malich = Convert.ToInt32(cmd.Parameters["@MaLich"].Value);

                if (rowsAffected == 1)
                {
                    string Successnotification = "inserted";
                }
                else
                {
                    string Errornotification = "fail";
                }
               
            }
        }
        catch (Exception ex)
        {
            int test = 0;
            //log error 
            //display friendly error to user
        }
        finally
        {
            if (conn != null)
            {
                //cleanup connection i.e close 

                conn.Close();
            }

            if (mabenhnhan != -1
                   && Malich != 1)
            {
                Global1.MaLichHencuaBenhNhan = Malich;
                if (HttpContext.Current != null)
                    HttpContext.Current.Response.Redirect("ThanhCong.aspx");

            } 
        }
           
    }

    protected void Department_SelectedIndexChanged(object sender, EventArgs e)
    {
        string khoadachon = ((DropDownList)sender).SelectedItem.Text;
        this.SqlDataSourceBacSi.SelectParameters.Clear();
        this.SqlDataSourceBacSi.SelectParameters.Add("khoadachon", khoadachon);
        this.Doctors.DataBind();
    }

    protected string khoadachon = "";
  
    protected void calEventDate_SelectionChanged(object sender, EventArgs e)
    {
        this.TestDay.Text = calEventDate.SelectedDate.ToString("MM/dd/yyyy");
    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        if (HttpContext.Current != null)
            HttpContext.Current.Response.Redirect("Default.aspx");
    }
}
