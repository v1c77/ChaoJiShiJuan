<%@ Page Language="C#"  AutoEventWireup="true"
    CodeFile="MessageShow.aspx.cs" Inherits="subject_SubjectAdd" Title="无标题页" ValidateRequest="false" %>
<%@ Register TagName="CKEditor" TagPrefix="XG" Src="~/js/CKEditor.ascx" %>
<html lang="en" class="no-js">
<head runat="server">
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="demo/bootstrap/css/bootstrap.min.css">
    <!-- mystyle.css-->
    <link rel="stylesheet" href="demo/assets/css/mystyle.css" />
    <title>欢迎登陆超级试卷</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <!-- remember, jQuery is completely optional -->
    <!-- <script type='text/javascript' src='demo/bootstrap/js/jquery-1.11.1.min.js'></script> -->
    
    
    <script src="demo/bootstrap/js/bootstrap.min.js"></script>
    <script src="demo/assets/js/placeholderForCP.js"></script>
   
</head>
    <body runat="server">
        <div style="width: 600px;padding-top: 15px;padding-left:15px;">
        <div style="text-align: center;">
            <asp:Label ID="lblTitle" runat="server" Text="Label" Font-Size="Large" Font-Bold="true"></asp:Label><br />
            <div style="font-size:14px;padding-top:10px;">时间：<asp:Label ID="lblTime" runat="server" Text="Label"></asp:Label>&nbsp;&nbsp;&nbsp;访问量：<asp:Label
                ID="lblVisitCount" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
        <div style="font-size: 16px; line-height: 28px;">
            <asp:Localize ID="locContent" runat="server"></asp:Localize>
        </div>
    </div>
    </body>
    </html>

