<%@ Page Language="C#" MasterPageFile="~/master/admin.master" AutoEventWireup="true"
    CodeFile="AnswerAdd.aspx.cs" Inherits="subject_SubjectAdd" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <style>
  .panel-footer{
   padding:0;
   background-color:#FFFFFF;
   height:34px;
  }
  .panel-footer ul{
   margin:0;
  }
  .pagination>li:first-child>a{
  border-top-left-radius:0;
  }
  .pagination>li:last-child>a{
  border-top-right-radius:0;
  border-bottom-right-radius:0;
  }
  .panel{
   margin-bottom:5px;
   border:none;
   border-color:
  }
  .panel-body{
   padding:0;
  }
  .panel-heading{
   border:none; 
  }
  .panel-footer{
   bottom:0;
   width:100%;
  }
  .table{
  margin:0;	
  }
  .table tr td{

  margin:0;	
  }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table id="addtable">
        <tr>
            <td>
                科目名：
            </td>
            <td>
                 <asp:DropDownList  CssClass="form-control"   ID="ddlSubject" runat="server" Width="160px" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                章节名：
            </td>
            <td>
                 <asp:DropDownList  CssClass="form-control"   ID="ddlChapter" runat="server" Width="160px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                    ControlToValidate="ddlChapter"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                题目：
            </td>
            <td>
                <asp:TextBox  class="form-control"   ID="txtQues" runat="server" TextMode="MultiLine" Rows="3" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="txtQues"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                难度：
            </td>
            <td>
                 <asp:DropDownList  CssClass="form-control"   ID="ddlDiff" runat="server" Width="160px">
                    <asp:ListItem Value="1" Text="容易"></asp:ListItem>
                    <asp:ListItem Value="2" Text="较易"></asp:ListItem>
                    <asp:ListItem Value="3" Text="一般" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="4" Text="较难"></asp:ListItem>
                    <asp:ListItem Value="5" Text="困难"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                    ControlToValidate="ddlDiff"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                答案：
            </td>
            <td>
                <asp:TextBox  class="form-control"   ID="txtAns" runat="server" TextMode="MultiLine" Rows="3" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"
                    ControlToValidate="txtAns"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Label ID="lblInfo" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:LinkButton ID="lbtnAdd" runat="server" class="btn btn-info" data-options="iconCls:'icon-save'"
                    OnClick="lbtnAdd_Click">保存</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
