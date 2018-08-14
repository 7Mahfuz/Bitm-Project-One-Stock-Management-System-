
<%@ Page Title="Company" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewSalesUI.aspx.cs" Inherits="StockManagementSystem.UI.ViewSalesUI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     
    <h2><%: Title %>.</h2>
    <h3>View Sales.</h3>
    <p>Use this area to provide additional information.</p>
    
     <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <label>From Date :</label><asp:TextBox ID="fromTextBox" runat="server"></asp:TextBox><br />
             <label>To Date :</label><asp:TextBox ID="toTextBox" runat="server"></asp:TextBox>
            <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" />
           
        </div>
        <div class="col-md-4">
            
         </div>
    </div>

    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <asp:GridView ID="searchSellGridView" runat="server" AutoGenerateColumns="false">
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




