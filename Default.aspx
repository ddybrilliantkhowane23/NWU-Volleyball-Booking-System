<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VolleyballBooking._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Volleyball Coaching Classes – Booking</title>
    <link href="mystyle7.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1>🏐 NWU Volleyball Coaching Classes</h1>
                <p>Book your virtual class – Mondays & Fridays only</p>
            </div>

            <!-- Student Details -->
            <div class="section">
                <h3>Student Information</h3>
                <div class="row">
                    <asp:Label ID="lblName" runat="server" Text="Full Name:" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="textbox" AutoPostBack="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                        ErrorMessage="Name is required" Text="Name is required" ForeColor="Red" Display="Dynamic" />
                </div>
                <div class="row">
                    <asp:Label ID="lblSurname" runat="server" Text="Surname:" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtSurname" runat="server" CssClass="textbox" AutoPostBack="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSurname" runat="server" ControlToValidate="txtSurname"
                        ErrorMessage="Surname is required" Text="Surname is required" ForeColor="Red" Display="Dynamic" />
                </div>
                <div class="row">
                    <asp:Label ID="lblEmail" runat="server" Text="Email Address:" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" AutoPostBack="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Email is required" Text="*" ForeColor="Red" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ErrorMessage="Invalid email format" Text="Invalid email format missing '@ or @gmail.com'" ForeColor="Red" Display="Dynamic" />
                </div>
            </div>

            <!-- Campus Selection -->
            <div class="section">
                <h3>Select Campus</h3>
                <asp:RadioButtonList ID="rblCampus" runat="server" RepeatDirection="Vertical" CssClass="radiolist" AutoPostBack="True">
                    <asp:ListItem Value="Mahikeng">Mahikeng (10:00 – 12:00, class 8 days after booking)</asp:ListItem>
                    <asp:ListItem Value="Potchefstroom">Potchefstroom (11:00 – 13:00, class 4 days after booking)</asp:ListItem>
                    <asp:ListItem Value="Vanderbijlpark">Vanderbijlpark (08:00 – 10:00, class 6 days after booking)</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="rfvCampus" runat="server" ControlToValidate="rblCampus"
                    ErrorMessage="Please select a campus" Text="Please select a campus" ForeColor="Red" Display="Dynamic" />
            </div>

            <!-- Calendar Control -->
            <div class="section">
                <h3>Select Booking Date (Monday or Friday only)</h3>
                <asp:Calendar ID="calBooking" runat="server" OnSelectionChanged="calBooking_SelectionChanged"
                    CssClass="calendar" />
                <asp:Label ID="lblDateError" runat="server" ForeColor="Red" Visible="false"></asp:Label>
            </div>

            <!-- Validation Summary -->
            <div class="validation-summary">
                <asp:ValidationSummary ID="vsSummary" runat="server" HeaderText="Please correct the following errors:" ForeColor="#66FFFF" />
            </div>

            <!-- Buttons -->
            <div class="button-row">
                <asp:Button ID="btnBook" runat="server" Text="Book Class" CssClass="button" OnClick="btnBook_Click" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="button-clear" OnClick="btnClear_Click" CausesValidation="false" />
            </div>

            <!-- Confirmation Section -->
            <div id="divConfirmation" runat="server" visible="false" class="confirmation">
                <h3>Booking Confirmation</h3>
                <asp:Label ID="lblConfirmation" runat="server" CssClass="confirmation-text"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>