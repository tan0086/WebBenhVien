<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="HenKham.aspx.cs" Inherits="HenKham" %>

    

  

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   
    <script type="text/javascript">

        function displayCalendar() {
            var datePicker = document.getElementById('datePicker');
            if (datePicker.style.display == 'block')
                datePicker.style.display = 'none';
            else
                datePicker.style.display = 'block';
        }
     </script>

       <style type="text/css">
        #datePicker
        {
            left:745px;
            display:none;
            position:absolute;
            border:solid 2px black;
            background-color:white;
        }
        .content
        {
            width:400px;
            background-color:white;
            margin:auto;
            padding:10px;
        }
        html
        {
            background-color:silver;
        }
        .textEntry
        {}
    </style>

         <center><h2>Đặt hẹn khám chữa bệnh</h2></center>
   
    <br /> 

    <asp:SqlDataSource id="SqlDataSourceTestTime"
          runat="server"
          DataSourceMode="DataReader"
          ConnectionString="<%$ ConnectionStrings:ApplicationServices%>"
          SelectCommand="SP_Gio_Kham_List" SelectCommandType="StoredProcedure">          
      </asp:SqlDataSource>

    <asp:SqlDataSource id="SqlDataSourceYear"
          runat="server"
          DataSourceMode="DataReader"
          ConnectionString="<%$ ConnectionStrings:ApplicationServices%>"
          SelectCommand="SP_Year_List" SelectCommandType="StoredProcedure">          
      </asp:SqlDataSource>

    <asp:SqlDataSource id="SqlDataSourceKhoa"
          runat="server"
          DataSourceMode="DataReader"
          ConnectionString="<%$ ConnectionStrings:ApplicationServices%>"
          SelectCommand="SP_Chuyen_Khoa_List" SelectCommandType="StoredProcedure">          
      </asp:SqlDataSource>

    <asp:sqlDataSource ID="SqlDataSourceBacSi" 
          DataSourceMode="DataReader"
          ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
          SelectCommand="SP_Bac_Si_List" SelectCommandType="StoredProcedure"
          RunAt="server">
          <SelectParameters>
            <asp:Parameter Name="Khoadachon" Type="String" DefaultValue="Da Khoa"/>
          </SelectParameters>
       </asp:sqlDataSource>

      


    

    <table width="621" border="0" align="center">  
        <tr>
            <td>
                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="TenBenhNhan" Width="150">Họ và Tên:</asp:Label>
                <font color="#FF0000"><strong><strong>*</strong></strong></font>
            </td>
            <td >
                <asp:TextBox ID="TenBenhNhan" runat="server" CssClass="textEntry" Width="300"></asp:TextBox>
            </td>   
            
            <td>
                <asp:Label ID="Label12" runat="server" AssociatedControlID="BornYear">Năm Sinh</asp:Label>
                <font color="#FF0000"><strong><strong>*</strong></strong></font>
            </td>
            <td>
                <asp:DropDownList 
                    ID="BornYear" 
                    runat="server"
                    DataTextField="nam"                    
                    DataSourceID="SqlDataSourceYear" AutoPostBack="True">
                </asp:DropDownList>
            </td>                               
        </tr>
        <tr>
            <td>
                <asp:Label ID="Sexlabel" runat="server" AssociatedControlID="SexType" >Giới tính:</asp:Label>
                <font color="#FF0000"><strong><strong>*</strong></strong></font>
            </td>
            <td>
                <asp:DropDownList ID="SexType" runat="server">
                    <asp:ListItem>Nam</asp:ListItem>
                    <asp:ListItem>Nữ</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" AssociatedControlID="Address" >Địa chỉ:</asp:Label>
                <font color="#FF0000"><strong><strong>*</strong></strong></font>
            </td>
            <td>
                <asp:TextBox ID="Address" runat="server" CssClass="textEntry" Width="300"></asp:TextBox>
            </td>
        </tr>  

         <tr>
            <td>
                <asp:Label ID="Label2" runat="server" AssociatedControlID="Phone" Width="150">Số điện thoại:</asp:Label>
                <font color="#FF0000"><strong><strong>*</strong></strong></font>
            </td>
            <td >
                <asp:TextBox ID="Phone" runat="server" CssClass="textEntry" Width="300px"></asp:TextBox>
            </td>   
            
            <td>
                <asp:Label ID="Label3" runat="server" AssociatedControlID="Email">Email</asp:Label>
                <font color="#FF0000"><strong><strong>*</strong></strong></font>
            </td>
            <td>
                <asp:TextBox ID="Email" runat="server" CssClass="textEntry" Width="100"></asp:TextBox>
            </td>                               
        </tr>

          <tr>
            <td>
                <asp:Label ID="Label4" runat="server" AssociatedControlID="TestDay" Width="150">Ngày khám:</asp:Label>
                <font color="#FF0000"><strong><strong>*</strong></strong></font>
            </td>
            <td >               
                <asp:TextBox ID="TestDay" runat="server" CssClass="textEntry" Width="272px"></asp:TextBox>
                  <img src="Images/calendarIcon.jpg" onclick="displayCalendar()" 
                    style="height: 19px; width: 20px" />
                <div id="datePicker">
                    <asp:Calendar
                        id="calEventDate"                                   
                        Runat="server" onselectionchanged="calEventDate_SelectionChanged"/>
                </div>
            </td>   
            
            <td>
                <asp:Label ID="Label5" runat="server" AssociatedControlID="TestTime">Giờ khám</asp:Label>
                <font color="#FF0000"><strong><strong>*</strong></strong></font>
            </td>
            <td>
                 <asp:DropDownList 
                    ID="TestTime" 
                    runat="server"
                    DataTextField="GioKham"
                    DataValueField="GioKham"
                    DataSourceID="SqlDataSourceTestTime" AutoPostBack="True">                 
                </asp:DropDownList>
            </td>                               
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" AssociatedControlID="Department" >Chuyên khóa khám:</asp:Label>            
            </td>
            <td>
                <asp:DropDownList 
                    ID="Department" 
                    runat="server"
                    DataTextField="TenKhoa"
                    DataValueField="MaKhoa"
                    DataSourceID="SqlDataSourceKhoa" AutoPostBack="True" 
                    onselectedindexchanged="Department_SelectedIndexChanged">                 
                </asp:DropDownList>
            </td>
        </tr>

          <tr>
            <td>
                <asp:Label ID="Label7" runat="server" AssociatedControlID="Doctors" >Bác sĩ:</asp:Label>
                           
                            
            </td>
            <td>
                <asp:DropDownList 
                    ID="Doctors" 
                    runat="server"                     
                    DataTextField="TenBacSi"
                    DataValueField="MaBacSi"
                    DataSourceID="SqlDataSourceBacSi">
                </asp:DropDownList>
            </td>
        </tr>

          <tr>
            <td>
                <asp:Label ID="Label8" runat="server" AssociatedControlID="Description" >Mô tả bệnh:</asp:Label>              
            </td>
            <td>
                <asp:TextBox ID="Description" runat="server" CssClass="textEntry" Width="300px" 
                    Height="96px" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </td>
        </tr>
         
           
    </table>
    <br />
    <br />
    <center>
      
        <asp:Button ID="Reservation" runat="server" Text="Đặt lịch khám" 
            onclick="Reservation_Click" />
        <asp:Button ID="Cancel" runat="server" Text="Hủy" href="~Default.aspx"
            onclick="Cancel_Click"/>
    </center>

    

    
</asp:Content>
