
<%@ Page Title="Company" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompanyUI.aspx.cs" Inherits="StockManagementSystem.UI.CompanyUI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Company.</h3>
    <p>Use this area to provide additional information.</p>

     <div class="row">
   <div class="col-md-4"></div>
        <div class="col-md-4">
             <label> Company Name :</label>
                 <asp:TextBox ID="companyNameTextBox" runat="server" Width="194px"></asp:TextBox>
                     <br />
            <asp:Button ID="saveButton" runat="server" Text="Save" Width="76px" OnClick="saveButton_Click" />
            <asp:Label ID="msgLabel" runat="server" Text=""></asp:Label>
           </div>
        <div class="col-md-4"></div>
    </div>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">

            <asp:GridView ID="companyGridView" runat="server" AutoGenerateColumns="false">
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
        <div class="col-md-3"></div>

    </div>


</asp:Content>
