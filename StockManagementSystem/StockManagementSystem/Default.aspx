<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StockManagementSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <hr /><hr />

    <div class="row">
  <div class="col-md-4">
    <div class="thumbnail">
      <a href="UI/CategoryUI.aspx">
             <img src="Image/Category.png" alt="Category" style="width:100%"/>
              <%--  <div class="caption">
          <p>Insert Category</p>
        </div>--%>
      </a>
    </div>
  </div>
  <div class="col-md-4">
    <div class="thumbnail">
      <a href="UI/CompanyUI.aspx">
             <img src="Image/Company.png" alt="Company" style="width:100%"/>
        <%--<div class="caption">
          <p> Insert Company </p>
        </div>--%>
      </a>
    </div>
  </div>
  <div class="col-md-4">
    <div class="thumbnail">
      <a href="UI/ItemUI.aspx">
             <img src="Image/SaveItem.png" alt="Items" style="width:100%"/>
        <%--<div class="caption">
          <p>  Insert Item Detail  </p>
        </div>--%>
      </a>
    </div>
  </div>
</div>

    <hr /><hr />

 <div class="row">
  <div class="col-md-3">
    <div class="thumbnail">
      <a href="UI/SearchItemUI.aspx">
             <img src="Image/SearchItem.png" alt="SearchItem" style="width:100%"/>
               <%-- <div class="caption">
          <p>  Search Items Details  </p>
        </div>--%>
      </a>
    </div>
  </div>
  <div class="col-md-3">
    <div class="thumbnail">
      <a href="UI/StockInUI.aspx">
             <img src="Image/StockIn.png" alt="StockIn" style="width:100%"/>
        <%--<div class="caption">
          <p> Stock In Items  </p>
        </div>--%>
      </a>
    </div>
  </div>
  <div class="col-md-3">
    <div class="thumbnail">
      <a href="UI/StockOutUI.aspx">
             <img src="Image/StockOut.png" alt="StockOut" style="width:100%"/>
        <%--<div class="caption">
          <p>  Stock Out Items  </p>
        </div>--%>
      </a>
    </div>
  </div>

     <div class="col-md-3">
    <div class="thumbnail">
      <a href="UI/ViewSalesUI.aspx">
             <img src="Image/ViewSales.png" alt="ViewSales" style="width:100%"/>
                <%--<div class="caption">
          <p>  View Sales History </p>
        </div>--%>
      </a>
    </div>
  </div>
</div>   

</asp:Content>


