
<%@ Page Title="Company" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StockInUI.aspx.cs" Inherits="StockManagementSystem.UI.StockInUI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Stock in</h3>
    <p>Use this area to provide additional information.</p>

   <div class="row">
       <div class="col-md-4"></div>
       <div class="col-md-4">
           <label>Company :</label><asp:DropDownList ID="companyDropDownList" runat="server"  Height="26px" Width="156px" 
               AutoPostBack="true"
               OnTextChanged="companyDropDownList_TextChanged"></asp:DropDownList>
            <br />
             <label>Item :</label><asp:DropDownList ID="itemDropDownList" runat="server" Height="16px" Width="150px"
                AutoPostBack="true"  OnTextChanged="itemDropDownList_TextChanged"></asp:DropDownList>
            <br />
           <label>Reorder Level</label><asp:TextBox ID="reorderTextBox" runat="server"></asp:TextBox>
           <br />
           <label>Available Quantity</label><asp:TextBox ID="availableTextBox" runat="server"></asp:TextBox>
           <br />
           <label>Stock In Quantity</label><asp:TextBox ID="stockTextBox" runat="server"></asp:TextBox>
           <br />
           <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" Width="66px" />
           <asp:Label ID="msgLabel" runat="server" Text=""></asp:Label>
       </div>
       
       <div class="col-md-4"></div>
   </div>

</asp:Content>
