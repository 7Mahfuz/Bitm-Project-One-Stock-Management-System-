
<%@ Page Title="Search Sales" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewSalesUI.aspx.cs" Inherits="StockManagementSystem.UI.ViewSalesUI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     
    <br /><br /><br />
   
    
     <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <label  class="control-label col-md-3">From Date</label>
            <div class="col-md-4">
            <asp:TextBox ID="fromTextBox" CssClass="form-control" runat="server" Width="200px"></asp:TextBox><br /></div>
            <br /><br /><br />
             <label  class="control-label col-md-3">To Date</label>
            <div class="col-md-4">
            <asp:TextBox ID="toTextBox" CssClass="form-control" runat="server" Width="200px"></asp:TextBox><br />
                <div class="col-md-4"></div>
                <asp:Button ID="searchButton" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="searchButton_Click" />
            </div>

            
           
        </div>
        <div class="col-md-4">
            
         </div>
    </div>
    <br /><br />
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="table-responsive">
            <asp:GridView ID="searchSellGridView" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered table-hove">
                <Columns>
                     <asp:TemplateField HeaderText="SL" HeaderStyle-Width="5%" HeaderStyle-HorizontalAlign="Left" >
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
                    <asp:TemplateField HeaderText="Sale Quantity">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                </Columns>
            </asp:GridView>
                </div>
        </div>
        <div class="col-md-2"></div>

    </div>

 <script>
  $( function() {
    $( "#MainContent_fromTextBox" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
    $( "#MainContent_toTextBox" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
  } );
  </script> 
</asp:Content>




