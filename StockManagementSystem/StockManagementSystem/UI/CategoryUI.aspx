
<%@ Page Title="Category" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoryUI.aspx.cs" Inherits="StockManagementSystem.UI.CategoryUI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="row">
    <div class="col-md-3"></div>
    <p class="lead">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Insert A Category Name to entry in Category list</p>
    </div>
   <br />
   <%-- <form class="form-horizontal">   </form>--%>

     <form class="form-horizontal">
    <div class="form-group">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-7">
                <label  class="control-label col-md-2">Category =</label>
                <div class="col-xs-5 col-md-5 col-lg-5">
                <asp:TextBox ID="categoryTextBox" CssClass="form-control" runat="server" ></asp:TextBox>
                    </div>
                <div class="col-md-2">
                <asp:Button ID="saveButton" runat="server" CssClass="btn btn-primary" Text="Save" Width="76px" OnClick="saveButton_Click" />
            <asp:Label ID="msgLabel" runat="server" Text=""></asp:Label>
            </div>
            </div>
            
        </div>        
                </form>
    
   <br /><br />    
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="table-responsive">
            <asp:GridView ID="categoryGridView" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered table-hove">
                <Columns>
                     <asp:TemplateField HeaderText="SL" HeaderStyle-Width="5%" HeaderStyle-HorizontalAlign="Left">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>
            </ItemTemplate>
            <HeaderStyle CssClass="table_04" HorizontalAlign="Left"></HeaderStyle>
            <ItemStyle CssClass="table_02" HorizontalAlign="Left"></ItemStyle>
        </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                </div>
        </div>
        <div class="col-md-3"></div>
            </div>


</asp:Content>