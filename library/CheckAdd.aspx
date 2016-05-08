﻿<%@ Page Language="C#" MasterPageFile="~/master/admin.master" AutoEventWireup="true"
    CodeFile="CheckAdd.aspx.cs" Inherits="subject_SubjectAdd" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                <asp:TextBox ID="txtQues" runat="server" TextMode="MultiLine" Rows="3" Width="300px"></asp:TextBox>
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
            <td colspan="2">
                <table>
                    <tr>
                        <td>
                            选项A：
                        </td>
                        <td>
                            <asp:TextBox ID="txtA" runat="server" TextMode="MultiLine" Rows="2" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                                ControlToValidate="txtA"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            选项B：
                        </td>
                        <td>
                            <asp:TextBox ID="txtB" runat="server" TextMode="MultiLine" Rows="2" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                ControlToValidate="txtB"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            选项C：
                        </td>
                        <td>
                            <asp:TextBox ID="txtC" runat="server" TextMode="MultiLine" Rows="2" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                                ControlToValidate="txtC"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            选项D：
                        </td>
                        <td>
                            <asp:TextBox ID="txtD" runat="server" TextMode="MultiLine" Rows="2" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                                ControlToValidate="txtD"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            选项E：
                        </td>
                        <td>
                            <asp:TextBox ID="txtE" runat="server" TextMode="MultiLine" Rows="2" Width="250px"></asp:TextBox>
                        </td>
                        <td>
                            选项F：
                        </td>
                        <td>
                            <asp:TextBox ID="txtF" runat="server" TextMode="MultiLine" Rows="2" Width="250px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            选项G：
                        </td>
                        <td>
                            <asp:TextBox ID="txtG" runat="server" TextMode="MultiLine" Rows="2" Width="250px"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                答案：
            </td>
            <td>
                <asp:TextBox ID="txtAns" runat="server" Width="160px"></asp:TextBox>
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
                <asp:LinkButton ID="lbtnAdd" runat="server" class="btn btn-default" data-options="iconCls:'icon-save'"
                    OnClick="lbtnAdd_Click">保存</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
