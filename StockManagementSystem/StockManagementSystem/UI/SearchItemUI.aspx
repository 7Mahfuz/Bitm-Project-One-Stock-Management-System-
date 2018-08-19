
<%@ Page Title="Search Item" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchItemUI.aspx.cs" Inherits="StockManagementSystem.UI.SearchItemUI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <br /><br /><br />
    

    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-5">
            <label  class="control-label col-md-3">Company</label>
            <div class="col-md-5">
            <asp:DropDownList ID="companyDropDownList" CssClass="form-control" runat="server"   Width="200px"> </asp:DropDownList></div>
            <br /><br />
             <label  class="control-label col-md-3">Category</label>
            <div class="col-md-5">
            <asp:DropDownList ID="categoryDropDownList" CssClass="form-control" runat="server"  Width="200px"></asp:DropDownList>
            <br />
                <div class="row">
                <div class="col-md-5"></div>
            <asp:Button ID="searchButton" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="searchButton_Click" />
                </div>
            </div>
        </div>
        <div class="col-md-4"></div>
    </div>
    <br /><br />
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="table-responsive">
            <asp:GridView ID="showItemsGridView" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered table-hove">
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
                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("ItemName") %>'></asp:Label>
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
                    
                    <asp:TemplateField HeaderText="Reorder Level">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("Reorderlvl") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                </div>
        </div>
        <div class="col-md-2"></div>

    </div>

</asp:Content>
