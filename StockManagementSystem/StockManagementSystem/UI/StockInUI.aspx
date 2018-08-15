
<%@ Page Title="Stock In" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StockInUI.aspx.cs" Inherits="StockManagementSystem.UI.StockInUI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="row">
    <div class="col-md-3"></div>
    <p class="lead">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Insert Item's Stock detail to insert in Item in Stock list</p>
    </div>
   <br />
   

   <div class="row">
       <div class="col-md-4"></div>
       <div class="col-md-6">
           <label  class="control-label col-md-4">Company</label>
            <div class="col-md-4">
           <asp:DropDownList ID="companyDropDownList" CssClass="form-control" runat="server"   Width="200px" 
               AutoPostBack="true"
               OnTextChanged="companyDropDownList_TextChanged"></asp:DropDownList></div>
            <br /><br />
             <label  class="control-label col-md-4">Item</label>
            <div class="col-md-4">
                <asp:DropDownList ID="itemDropDownList" CssClass="form-control" runat="server" Width="200px"
                AutoPostBack="true"  OnTextChanged="itemDropDownList_TextChanged"></asp:DropDownList></div>
            <br /><br />
           <label  class="control-label col-md-4">Reorder Level</label>
            <div class="col-md-4">
           <asp:TextBox ID="reorderTextBox" CssClass="form-control" runat="server" Width="200px"></asp:TextBox>
            </div>
           <br /><br />
             <label  class="control-label col-md-4">Available Quantity</label>
            <div class="col-md-4">
           <asp:TextBox ID="availableTextBox" CssClass="form-control" runat="server" Width="200px" ></asp:TextBox></div>
           <br /><br />
           <label  class="control-label col-md-4">Stock In</label>
            <div class="col-md-4">
           <asp:TextBox ID="stockTextBox" CssClass="form-control" runat="server" Width="200px"></asp:TextBox>
                <br />
                <div class="col-md-5"></div>
                <asp:Button ID="saveButton" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="saveButton_Click" Width="66px" />
           <asp:Label ID="msgLabel" runat="server" Text=""></asp:Label>
            </div>
           
           
       </div>
       
       
   </div>

</asp:Content>
