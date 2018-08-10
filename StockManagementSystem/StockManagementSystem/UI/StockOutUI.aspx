
<%@ Page Title="Company" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StockOutUI.aspx.cs" Inherits="StockManagementSystem.UI.StockOutUI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Stock out.</h3>
    <p>Use this area to provide additional information.</p>

    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <label>Company :</label><asp:DropDownList ID="companyDropDownList" runat="server"  Height="26px" Width="156px"></asp:DropDownList>
            <br />
             <label>Item :</label><asp:DropDownList ID="itemDropDownList" runat="server" Height="16px" Width="150px"></asp:DropDownList>
            <br />
           <label>Reorder Level</label><asp:TextBox ID="reorderTextBox" runat="server"></asp:TextBox>
           <br />
           <label>Available Quantity</label><asp:TextBox ID="availableTextBox" runat="server"></asp:TextBox>
           <br />
           <label>Stock Out Quantity</label><asp:TextBox ID="stockTextBox" runat="server"></asp:TextBox>
           <br />
           
        </div>
        <div class="col-md-4"></div>
    </div>

    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <asp:GridView ID="stockOutGridView" runat="server">
                <Columns>
                    <asp:TemplateField HeaderText="SL">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("Serial") %>'></asp:Label>
                        </ItemTemplate>
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
                </Columns>
            </asp:GridView>

            <asp:Button ID="sellButton" runat="server" Text="Sell" />
            <asp:Button ID="damageButton" runat="server" Text="Damage" />
            <asp:Button ID="lostButton" runat="server" Text="Lost" />
        </div>
        <div class="col-md-2"></div>

    </div>
</asp:Content>
