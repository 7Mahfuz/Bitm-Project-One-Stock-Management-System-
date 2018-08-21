
<%@ Page Title="Stock Out" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StockOutUI.aspx.cs" Inherits="StockManagementSystem.UI.StockOutUI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <br /><br /><br />
    

    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <label  class="control-label col-md-4">Company</label>
            <div class="col-md-4">
            <asp:DropDownList ID="companyDropDownList" CssClass="form-control" runat="server"   Width="200px" AutoPostBack="true"  OnTextChanged="companyDropDownList_TextChanged"></asp:DropDownList></div>
            <br /><br />
             <label  class="control-label col-md-4">Item</label>
            <div class="col-md-4">
            <asp:DropDownList ID="itemDropDownList" CssClass="form-control" runat="server"  Width="200px" AutoPostBack="true" OnTextChanged="itemDropDownList_TextChanged"></asp:DropDownList></div>
            <br /><br />
           <label  class="control-label col-md-4">Reorder Level</label>
            <div class="col-md-4">
            <asp:TextBox ID="reorderTextBox" CssClass="form-control" runat="server" Width="200px" ReadOnly="True"></asp:TextBox></div>
           <br /><br />
           <label  class="control-label col-md-4">Available Quantity</label>

            <div class="col-md-4">
            <asp:TextBox ID="availableTextBox" CssClass="form-control" runat="server" Width="200px" ReadOnly="True"></asp:TextBox></div>
           <br /><br />
           <label  class="control-label col-md-4">Stock Out</label>
            <div class="col-md-4">
            <asp:TextBox ID="stockTextBox" CssClass="form-control" runat="server" Width="200px"></asp:TextBox>
                <br />
                <div class="col-md-4"></div>
                <asp:Button ID="addButton" CssClass="btn btn-primary" runat="server" Text="Add" OnClick="addButton_Click" Width="52px" />
           
            </div>
           <br />
            
        </div>
        
    </div>
    <br /><br />
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="table-responsive">
            <asp:GridView ID="stockOutGridView" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered table-hove">
                <Columns>
                    <asp:TemplateField HeaderText="SL" HeaderStyle-Width="5%" HeaderStyle-HorizontalAlign="Left">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>
            </ItemTemplate>
            <HeaderStyle CssClass="table_04" HorizontalAlign="Left"></HeaderStyle>
            <ItemStyle CssClass="table_02" HorizontalAlign="Left"></ItemStyle>
        </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item">
                        <ItemTemplate>
                            <asp:Label ID="Label" runat="server" Text='<%#Eval("ItemName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Company">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("CompanyName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                </div>
            <div class="col-md-4"></div>
            <div class="col-md-6">
            <asp:Button ID="sellButton" CssClass="btn btn-primary" runat="server" Text="Sell" OnClick="sellButton_Click" /> &nbsp;&nbsp;&nbsp;
            <asp:Button ID="damageButton" CssClass="btn btn-primary" runat="server" Text="Damage" OnClick="damageButton_Click" />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="lostButton" CssClass="btn btn-primary" runat="server" Text="Lost" OnClick="lostButton_Click" />
        </div>
            </div>
        <div class="col-md-2"></div>

    </div>
</asp:Content>
