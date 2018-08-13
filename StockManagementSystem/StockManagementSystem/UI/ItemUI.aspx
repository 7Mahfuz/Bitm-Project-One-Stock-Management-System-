
<%@ Page Title="Company" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemUI.aspx.cs" Inherits="StockManagementSystem.UI.ItemUI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>items.</h3>
    <p>Use this area to provide additional information.</p>

    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <label>Category</label><asp:DropDownList ID="categoryDropDownList" runat="server"  Height="26px" Width="156px">
                
                                   </asp:DropDownList>
            <br />
             <label>Company</label><asp:DropDownList ID="companyDropDownList" runat="server" Height="16px" Width="150px"></asp:DropDownList>
            <br />
             <label>Item Name</label><asp:TextBox ID="itemTextBox" runat="server" Width="132px"></asp:TextBox>
            <br />
             <label>Reorder Level</label><asp:TextBox ID="reorderTextBox" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" />
            <asp:Label ID="msgLabel" runat="server" Text=""></asp:Label>
        </div>
        
        <div class="col-md-4"></div>
    </div>


</asp:Content>
