<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="dummy.aspx.cs" Inherits="food_ordering_app.admin.dummy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter Product Price"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Price is Required" ForeColor="Red"
    Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtPrice"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
    ErrorMessage="Price must be in decimal" ForeColor="Red"  Display="Dynamic" 
    SetFocusOnError="true" ControlToValidate="txtPrice" ValidationExpression="﻿^\d{0,8}(\.\d{1,4})?$"></asp:RegularExpressionValidator>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"/>
</asp:Content>
