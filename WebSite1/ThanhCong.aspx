
<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ThanhCong.aspx.cs" Inherits="Default2" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   
    <asp:SqlDataSource id="SqlDataSourceKQDangKy"
          runat="server"
          DataSourceMode="DataReader"
          ConnectionString="<%$ ConnectionStrings:ApplicationServices%>"
          SelectCommand="SP_KetQua_DangKy" SelectCommandType="StoredProcedure"> 
          <SelectParameters>
            <asp:Parameter Name="MaLich" Type="Int32" DefaultValue="52"/>
          </SelectParameters> 
      </asp:SqlDataSource>


    <center><h2>Chúc mừng bạn đã đăng kí thành công</h2></center>
    <br /> 
    
    <table width="621" border="0" align="center">  
        <tr>
            <td>
                <asp:Label ID="UserNameLabel" runat="server" Width="110">Họ và Tên:</asp:Label>               
            </td>
            <td >
                <asp:TextBox ID="UserName" runat="server" CssClass="textEntry" Width="300"></asp:TextBox>
            </td>   
            
            <td>
                <asp:Label ID="Label12" runat="server">Năm Sinh:</asp:Label>                
            </td>
            <td>
                <asp:TextBox ID="bornyear" runat="server" CssClass="textEntry" Width="100"></asp:TextBox>
            </td>                               
        </tr>
        <tr>
            <td>
                <asp:Label ID="Sexlabel" runat="server">Giới tính:</asp:Label>               
            </td>
            <td>
                <asp:TextBox ID="SexType" runat="server" CssClass="textEntry" Width="300"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server">Địa chỉ:</asp:Label>                
            </td>
            <td>
                <asp:TextBox ID="Address" runat="server" CssClass="textEntry" Width="300"></asp:TextBox>
            </td>
        </tr>  
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server">Số điện thoại:</asp:Label>               
            </td>
            <td >
                <asp:TextBox ID="Phone" runat="server" CssClass="textEntry" Width="300"></asp:TextBox>
            </td>   
            
                                   
        </tr>
        <tr>
             <td>
                <asp:Label ID="Label3" runat="server">Email:</asp:Label>               
            </td>
            <td>
                <asp:TextBox ID="Email" runat="server" CssClass="textEntry" Width="300"></asp:TextBox>
            </td>      
        </tr>
     </table>

    <br />

    <table width="621" border="0" align="center">  
            <tr>
                <asp:Label ID="Label9" runat="server"> Đã đặt lịch khám thành công với</asp:Label>  
            </tr>
        
        </table>
    <table width="621" border="0" align="center">
         <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Width="110">Ngày khám:</asp:Label>                
            </td>
            <td >
                <asp:TextBox ID="TestDay" runat="server" CssClass="textEntry" Width="300"></asp:TextBox>
            </td>   
            
            <td>
                <asp:Label ID="Label5" runat="server">Giờ khám:</asp:Label>               
            </td>
            <td>
                <asp:TextBox ID="TestTime" runat="server" CssClass="textEntry" Width="100"></asp:TextBox>
            </td>                               
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label6" runat="server">Chuyên khóa khám:</asp:Label>            
            </td>
            <td>
                <asp:TextBox ID="Department" runat="server" CssClass="textEntry" Width="300"></asp:TextBox>
            </td>
        </tr>

          <tr>
            <td>
                <asp:Label ID="Label7" runat="server">Bác sĩ:</asp:Label>              
            </td>
            <td>
                <asp:TextBox ID="Doctors" runat="server" CssClass="textEntry" Width="300"></asp:TextBox>
            </td>
        </tr>

          <tr>
            <td>
                <asp:Label ID="Label8" runat="server">Mô tả bệnh:</asp:Label>              
            </td>
            <td>
                <asp:TextBox ID="Description" runat="server" CssClass="textEntry" Width="300"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label10" runat="server">Phòng khám:</asp:Label>            
            </td>
            <td>
                <asp:TextBox ID="TestRoom" runat="server" CssClass="textEntry" Width="300"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label11" runat="server">Số thứ tự:</asp:Label>              
            </td>
            <td>
                <asp:TextBox ID="OderNumber" runat="server" CssClass="textEntry" Width="300"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label13" runat="server">Mã xác nhận:</asp:Label>              
            </td>
            <td>
                <asp:TextBox ID="MaLich" runat="server" CssClass="textEntry" Width="300" Text="52" Value="52">52</asp:TextBox>
            </td>
        </tr>
         
           
    </table>


    <br />
    <br />

    
    <table width="621" border="0" align="center">  
            <tr>
                <asp:Label ID="Label14" runat="server"> Vui lòng in bản này và đem theo khi đến khám bệnh <br /> Nếu không in được, vui lòng nhớ mã xác nhận</asp:Label>  
            </tr>        
     </table>
   
    
</asp:Content>
