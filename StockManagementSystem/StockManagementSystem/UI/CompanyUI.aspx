
<%@ Page Title="Company" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompanyUI.aspx.cs" Inherits="StockManagementSystem.UI.CompanyUI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row">
    <div class="col-md-3"></div>
    <p class="lead">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Insert A Company Name to entry in Company list</p>
    </div>
   <br />
   <form class="form-horizontal">
    <div class="form-group">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-7">
                <label  class="control-label col-md-2">Company =</label>
                <div class="col-xs-5 col-md-5 col-lg-5">
                <asp:TextBox ID="companyNameTextBox" CssClass="form-control" runat="server" ></asp:TextBox>
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
            <asp:GridView ID="companyGridView" runat="server" AutoGenerateColumns="false"  CssClass="table table-striped table-bordered table-hove">
                <Columns>
                    <asp:TemplateField HeaderText="SL" HeaderStyle-Width="5%" HeaderStyle-HorizontalAlign="Left">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>
            </ItemTemplate>
            <HeaderStyle CssClass="table_04" HorizontalAlign="Left"></HeaderStyle>
            <ItemStyle CssClass="table_02" HorizontalAlign="Left"></ItemStyle>
        </asp:TemplateField>
                    <asp:TemplateField HeaderText="Company">
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
