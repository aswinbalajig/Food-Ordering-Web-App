<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dummywebform.aspx.cs" Inherits="food_ordering_app.admin.dummywebform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter Product Price" CausesValidation="true"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Price is Required" ForeColor="Red"
    Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtPrice"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  
    ErrorMessage="Price must be in decimal" ForeColor="Red"  Display="Dynamic" 
    SetFocusOnError="true" ControlToValidate="txtPrice" ValidationExpression="^\d{1,8}(\.\d{1,4})?$"></asp:RegularExpressionValidator>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"/>
        </div>
    </form>
</body>
</html>
