
<%@ Page Title="Company" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewSalesUI.aspx.cs" Inherits="StockManagementSystem.UI.ViewSalesUI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>View Sales.</h3>
    <p>Use this area to provide additional information.</p>
     <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <label>From Date :</label><asp:DropDownList ID="fromDateDropDownList" runat="server"  Height="26px" Width="156px"></asp:DropDownList>
            <br />
             <label>To Date :</label><asp:DropDownList ID="toDateDropDownList" runat="server" Height="16px" Width="150px"></asp:DropDownList>
            <br />
            <asp:Button ID="searchButton" runat="server" Text="Button" />
           
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
                    <asp:TemplateField HeaderText="Sale Quantity">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                </Columns>
            </asp:GridView>

        </div>
        <div class="col-md-2"></div>

    </div>

</asp:Content>
