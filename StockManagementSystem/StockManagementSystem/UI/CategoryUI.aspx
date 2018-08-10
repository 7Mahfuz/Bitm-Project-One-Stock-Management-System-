
<%@ Page Title="Company" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoryUI.aspx.cs" Inherits="StockManagementSystem.UI.CategoryUI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Category.</h3>
    <p>Use this area to provide additional information.</p>

    <div class="row">
   <div class="col-md-4"></div>
        <div class="col-md-4">
             <label> Category Name :</label>
                 <asp:TextBox ID="categoryTextBox" runat="server" Width="194px"></asp:TextBox>
                     
            <asp:Button ID="saveButton" runat="server" Text="Save" Width="76px" />
           </div>
        <div class="col-md-4"></div>
    </div>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">

            <asp:GridView ID="categoryGridView" runat="server">
                <Columns>
                    <asp:TemplateField HeaderText="SL">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("Serial") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-md-3"></div>

    </div>
</asp:Content>