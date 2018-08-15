
<%@ Page Title="Items" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemUI.aspx.cs" Inherits="StockManagementSystem.UI.ItemUI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row">
    <div class="col-md-3"></div>
    <p class="lead">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Insert Item detail to insert in Item list</p>
    </div>
   <br />
    
    <form class="form-horizontal">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <label  class="control-label col-md-3">Category</label>
            <div class="col-md-4">
            <asp:DropDownList ID="categoryDropDownList" CssClass="form-control" runat="server"  width="200px">
                
                                   </asp:DropDownList></div>
            <br /><br />
             <label  class="control-label col-md-3">Company</label>
            <div class="col-md-4">
            <asp:DropDownList ID="companyDropDownList" CssClass="form-control" runat="server"  Width="200px"></asp:DropDownList>
            </div>
                <br /><br />
              <label  class="control-label col-md-3">Item Name</label>
            <div class="col-md-4">
            <asp:TextBox ID="itemTextBox" CssClass="form-control" runat="server" Width="200px"></asp:TextBox></div>
            <br /><br />
             <label  class="control-label col-md-3">Reorder Level</label>
            <div class="col-md-4">
            <asp:TextBox ID="reorderTextBox" CssClass="form-control" runat="server" Width="200px"></asp:TextBox>

                <br />
                <div class="col-md-5"></div>
            <asp:Button ID="saveButton" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="saveButton_Click" /></div>
            
            
            <br /><br />
            
            <asp:Label ID="msgLabel" runat="server" Text=""></asp:Label>
        </div>
        
        <div class="col-md-3"></div>
    </div>
        </form>

    
</asp:Content>
