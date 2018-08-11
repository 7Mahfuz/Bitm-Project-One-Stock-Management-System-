
<%@ Page Title="Company" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StockOutUI.aspx.cs" Inherits="StockManagementSystem.UI.StockOutUI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Stock out.</h3>
    <p>Use this area to provide additional information.</p>

    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <label>Company :</label><asp:DropDownList ID="companyDropDownList" runat="server"  Height="26px" Width="156px" AutoPostBack="true"  OnTextChanged="companyDropDownList_TextChanged"></asp:DropDownList>
            <br />
             <label>Item :</label><asp:DropDownList ID="itemDropDownList" runat="server" Height="16px" Width="150px" AutoPostBack="true" OnTextChanged="itemDropDownList_TextChanged"></asp:DropDownList>
            <br />
           <label>Reorder Level</label><asp:TextBox ID="reorderTextBox" runat="server"></asp:TextBox>
           <br />
           <label>Available Quantity</label><asp:TextBox ID="availableTextBox" runat="server"></asp:TextBox>
           <br />
           <label>Stock Out Quantity</label><asp:TextBox ID="stockTextBox" runat="server"></asp:TextBox>
           <br />
            <asp:Button ID="addButton" runat="server" Text="Add" OnClick="addButton_Click" Width="52px" />
        </div>
        <div class="col-md-4"></div>
    </div>

    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <asp:GridView ID="stockOutGridView" runat="server" AutoGenerateColumns="false">
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

            <asp:Button ID="sellButton" runat="server" Text="Sell" />
            <asp:Button ID="damageButton" runat="server" Text="Damage" />
            <asp:Button ID="lostButton" runat="server" Text="Lost" />
        </div>
        <div class="col-md-2"></div>

    </div>
</asp:Content>
