﻿<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="food_ordering_app.user.contact"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };

    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- book section -->
  <section class="book_section layout_padding">
    <div class="container">
      <div class="heading_container">
          <div class="align-self-end">
                <asp:Label runat="server" ID="Label1"></asp:Label>
                <asp:Label runat="server" ID="lblMsg"></asp:Label>
          </div>
        <h2>
          Send Your Feedback
        </h2>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="form_container">
            
              <div>
                 <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is Required" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
              </div>
              <div>
                  <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Your Email" TextMode="Email"></asp:TextBox>
 <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is Required" ControlToValidate="txtEmail" 
     ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
              </div>
              <div>
                  <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control">
                      <asp:ListItem Value="0">Tell us whats your feedback is related to </asp:ListItem>
                      <asp:ListItem>Delivery</asp:ListItem>
                      <asp:ListItem>FoodQuality</asp:ListItem>
                      <asp:ListItem>Payment</asp:ListItem>
                  </asp:DropDownList>           
                  <%--<asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Subject" ></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="Subject is Required" ControlToValidate="txtSubject" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
              </div>
              <div>
                                             <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" placeholder="Enter your Feedback" ></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvMessage" runat="server" ErrorMessage="Message is Required" ControlToValidate="txtMessage" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
              </div>
              
              <div class="btn_box">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-warning rounded-pill pl-4 pr-4 text-white" Onclick="btnSubmit_Click" />
              </div>
            
          </div>
        </div>
        </div>
    </div>
  </section>
  <!-- end book section -->
</asp:Content>