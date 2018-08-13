
<%@ Page Title="Company" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchItemUI.aspx.cs" Inherits="StockManagementSystem.UI.SearchItemUI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Search Item.</h3>
    <p>Use this area to provide additional information.</p>

    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <label>Company :</label><asp:DropDownList ID="companyDropDownList" runat="server"  Height="26px" Width="156px"> </asp:DropDownList>
            <br />
             <label>Category :</label><asp:DropDownList ID="categoryDropDownList" runat="server" Height="16px" Width="150px"></asp:DropDownList>
            <br />
            <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" />
           
        </div>
        <div class="col-md-4"></div>
    </div>

    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <asp:GridView ID="showItemsGridView" runat="server" AutoGenerateColumns="false">
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
        <div class="col-md-2"></div>

    </div>

</asp:Content>
