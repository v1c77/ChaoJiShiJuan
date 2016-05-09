<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaperAdd.aspx.cs" Inherits="paper_PaperAdd"
    ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link id="Link1" href="~/js/themes/gray/easyui.css" rel="stylesheet" type="text/css"        runat="server" />
    <link id="Link2" href="~/js/themes/icon.css" rel="stylesheet" type="text/css" runat="server" />
    <link id="Link3" href="~/css/all.css" rel="stylesheet" type="text/css" runat="server" />
    <script src="../js/jquery-1.8.0.min.js"></script>
    <script src="../js/jquery.easyui.min.js" type="text/javascript"></script>

    

    

    <script src='<%=ResolveClientUrl("~/js/easyui-lang-zh_CN.js") %>' type="text/javascript"></script>
    


    <script src='<%=ResolveClientUrl("~/js/site.js") %>' type="text/javascript"></script>

    <script src="../js/paper.js"></script>

    <link href="../css/paper.css" rel="stylesheet" type="text/css" />

    
    <!--新版呦~~-->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!--禁止缩放，启动响应式-->
    <link rel="stylesheet" href="~/demo/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="~/demo/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
    <!-- mystyle.css-->
    <link rel="stylesheet" href="~/demo/assets/css/mystyle.css" />

    <script type="text/javascript">
        $(function () {
            closeDiv('viewSRTop');
            closeDiv('viewCBTop');
            closeDiv('viewJDTop');
            closeDiv('viewBFTop');
            closeDiv('viewSATop');
        })
    </script>

    <style type="text/css">
        #main {
            width: 100%;
            padding: 20px;
            font-size: 14px;
        }

        #viewSR, #viewCB, #viewJD, #viewBF, #viewSA {
            width: 666px;
            height: 444px;
            background-color: White;
        }
    </style>
</head>
<body>
    <form id="form1" class="form-inline" runat="server">
        <table id="main">
            <div  class="panel-heading" >					   
         <asp:TextBox  class="form-control" ID="txtPaperTitle" runat="server"  placeholder="试卷标题" Width="200px"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能为空"
                                     ControlToValidate="txtPaperTitle"></asp:RequiredFieldValidator>
         
             <label>科目名</label>
         <asp:DropDownList ID="ddlSubject" runat="server" class="form-control" Width="200px" OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged"
                           AutoPostBack="true"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="ddlSubject"></asp:RequiredFieldValidator>
             <label>时间(分钟)</label>
             <asp:DropDownList ID="ddlDurationTime" runat="server" class="form-control"
                               Width="160px">
                 <asp:ListItem Text="30" Value="30"></asp:ListItem>
                 <asp:ListItem Text="60" Value="60"></asp:ListItem>
                 <asp:ListItem Text="90" Value="90"></asp:ListItem>
                 <asp:ListItem Text="120" Value="120"></asp:ListItem>
             </asp:DropDownList>
             
</div><!--panel-heading-->
            <tr>
               
                <td   style="text-align:center">
                    <div class="table-responsive">
                    <table style="width: 100%" id="sumtable"  class="table table_style">
                        <tr class="table_head">
                            <th>题型
                            </th>
                            <th>可选道数
                            </th>
                            <th>该出道数
                            </th>
                            <th>每题分值
                            </th>
                            <th>难度系数
                            </th>
                            <th>详细设置
                            </th>
                            <th>总分
                            </th>
                        </tr>
                        <tr>
                            <td class="leftitem">单选
                            </td>
                            <td   style="text-align:center">
                                <asp:Label ID="lblSRAll" runat="server" Text=""></asp:Label>
                            </td>
                            <td   style="text-align:center">
                                <asp:TextBox  class="form-control" ID="txtSRCount" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td   style="text-align:center">
                                <asp:DropDownList ID="ddlSRScore" runat="server"  class="form-control easyui-combobox"   Width="100px">
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td   style="text-align:center">
                                <asp:DropDownList ID="ddlSRDiff" runat="server" class="form-control" Width="100px">
                                    <asp:ListItem Value="1" Text="容易"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="较易"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="一般" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="较难"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="困难"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td   style="text-align:center">
                                <asp:LinkButton ID="txtSRSet" runat="server" OnClick="txtSRSet_Click" CssClass="btn btn-default" ><span class="glyphicon glyphicon-wrench  marginRight" ></span>设置</asp:LinkButton>
                            </td>
                            <td id="SRCount"></td>
                        </tr>
                        <tr>
                            <td class="leftitem">多选
                            </td>
                            <td   style="text-align:center">
                                <asp:Label ID="lblCBAll" runat="server" Text=""></asp:Label>
                            </td>
                            <td   style="text-align:center">
                                <asp:TextBox  class="form-control" ID="txtCBCount" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td   style="text-align:center">
                                <asp:DropDownList ID="ddlCBScore" runat="server"  class="form-control easyui-combobox"   Width="100px">
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td   style="text-align:center">
                                <asp:DropDownList ID="ddlCBDiff" runat="server" class="form-control" Width="100px">
                                    <asp:ListItem Value="1" Text="容易"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="较易"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="一般" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="较难"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="困难"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td   style="text-align:center">
                                <asp:LinkButton ID="txtCBSet" runat="server" OnClick="txtCBSet_Click" CssClass="btn btn-default" ><span class="glyphicon glyphicon-wrench  marginRight" ></span>设置</asp:LinkButton>
                            </td>
                            <td id="CBCount"></td>
                        </tr>
                        <tr>
                            <td class="leftitem">判断
                            </td>
                            <td   style="text-align:center">
                                <asp:Label ID="lblJDAll" runat="server" Text=""></asp:Label>
                            </td>
                            <td   style="text-align:center">
                                <asp:TextBox  class="form-control" ID="txtJDCount" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td   style="text-align:center">
                                <asp:DropDownList ID="ddlJDScore" runat="server"  class="form-control easyui-combobox"   Width="100px">
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td   style="text-align:center">
                                <asp:DropDownList ID="ddlJDDiff" runat="server" class="form-control" Width="100px">
                                    <asp:ListItem Value="1" Text="容易"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="较易"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="一般" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="较难"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="困难"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td   style="text-align:center">
                                <asp:LinkButton ID="txtJDSet" runat="server" OnClick="txtJDSet_Click" CssClass="btn btn-default" ><span class="glyphicon glyphicon-wrench  marginRight" ></span>设置</asp:LinkButton>
                            </td>
                            <td id="JDCount"></td>
                        </tr>
                        <tr>
                            <td class="leftitem">填空
                            </td>
                            <td   style="text-align:center">
                                <asp:Label ID="lblBFAll" runat="server" Text=""></asp:Label>
                            </td>
                            <td   style="text-align:center">
                                <asp:TextBox  class="form-control" ID="txtBFCount" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td   style="text-align:center">
                                <asp:DropDownList ID="ddlBFScore" runat="server"  class="form-control easyui-combobox"   Width="100px">
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td   style="text-align:center">
                                <asp:DropDownList ID="ddlBFDiff" runat="server" class="form-control" Width="100px">
                                    <asp:ListItem Value="1" Text="容易"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="较易"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="一般" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="较难"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="困难"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td   style="text-align:center">
                                <asp:LinkButton ID="txtBFSet" runat="server" OnClick="txtBFSet_Click" CssClass="btn btn-default" ><span class="glyphicon glyphicon-wrench  marginRight" ></span>设置</asp:LinkButton>
                            </td>
                            <td id="BFCount"></td>
                        </tr>
                        <tr>
                            <td class="leftitem">简答
                            </td>
                            <td   style="text-align:center">
                                <asp:Label ID="lblSAAll" runat="server" Text=""></asp:Label>
                            </td>
                            <td   style="text-align:center">
                                <asp:TextBox  class="form-control" ID="txtSACount" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td   style="text-align:center">
                                <asp:DropDownList ID="ddlSAScore" runat="server"  class="form-control easyui-combobox"   Width="100px">
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td   style="text-align:center">
                                <asp:DropDownList ID="ddlSADiff" runat="server" class="form-control" Width="100px">
                                    <asp:ListItem Value="1" Text="容易"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="较易"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="一般" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="较难"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="困难"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td   style="text-align:center">
                                <asp:LinkButton ID="txtSASet" runat="server" OnClick="txtSASet_Click" CssClass="btn btn-default" ><span class="glyphicon glyphicon-wrench  marginRight" ></span>设置</asp:LinkButton>
                            </td>
                            <td id="SACount"></td>
                        </tr>
                        <tr>
                            <td class="leftitem">合计
                            </td>
                            <td   style="text-align:center"></td>
                            <td   style="text-align:center"></td>
                            <td   style="text-align:center"></td>
                            <td   style="text-align:center"></td>
                            <td   style="text-align:center"></td>
                            <td id="AllCount"></td>
                        </tr>
                        <tr>
                
                <td   style="text-align:center">
                    <asp:Label ID="lblInfo" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                
                <td   style="text-align:center">
                    <a href="#"  class="btn btn-info"  onclick="return compute()" data-options="iconCls:'icon-print'"><span class="glyphicon glyphicon-calendar  marginRight" ></span>计算</a>
                    <asp:LinkButton ID="lbtnAdd" runat="server" class="btn btn-info"  data-options="iconCls:'icon-save'"
                        OnClick="lbtnAdd_Click" OnClientClick="return checkall()"><span class="glyphicon glyphicon-file  marginRight" ></span>保存</asp:LinkButton>
                </td>
            </tr>
                    </table>
                       </div>
                </td>
            </tr>
            
        </table>
        <div style="display: none;">
            <asp:Button ID="btnHide" runat="server" Text="" />
        </div>
        <div id="viewSRTop" class="panel window" style="display: block; width: 688px; z-index: 100; position: absolute; left: 150px; top: 0px;">
            <div class="panel-header panel-header-noborder window-header" style="width: 688px;">
                <div class="panel-title panel-with-icon" style="">
                    单选详细设置
                </div>
                <div class="panel-icon icon-cut">
                </div>
                <div class="panel-tool">
                    <a class="panel-tool-min" href="javascript:void(0)"></a><a class="panel-tool-max"
                        href="javascript:void(0)"></a><a class="panel-tool-close" onclick="closeDiv('viewSRTop')"></a>
                </div>
            </div>
            <div id="viewSR">
                <div class="viewTitle">
                    科目：<asp:Label ID="lblSRSubject" runat="server" Text="" ForeColor="Red"></asp:Label>
                    应出总道数：<asp:Label ID="lblSRCount" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
                <div class="viewContent" id="SR">
                    <asp:Repeater ID="rptSR" runat="server" EnableViewState="true">
                        <HeaderTemplate>
                            <table class="table">
                                <tr class="table_head">
                                    <td   style="text-align:center">章节
                                    </td>
                                    <td   style="text-align:center">章节题目
                                    </td>
                                    <td   style="text-align:center">可选道数
                                    </td>
                                    <td   style="text-align:center">该出道数
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td   style="text-align:center">第<%#Eval("chapterno") %>章<asp:HiddenField ID="hfSRRange" runat="server" Value='<%#Eval("id") %>' />
                                </td>
                                <td   style="text-align:center">
                                    <%#Eval("chaptername") %>
                                </td>
                                <td   style="text-align:center">
                                    <span>
                                        <%#Eval("AllCount")%></span>
                                </td>
                                <td   style="text-align:center">
                                    <asp:TextBox  class="form-control" ID="txtSRChapterCount" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <div class="viewBottom">
                    <a href="#"  class="btn btn-info"  onclick="becancel('SR')">取消</a> <a href="#"
                         class="btn btn-info"  onclick="besure('SR')">确定</a>
                </div>
            </div>
        </div>
        <div id="viewCBTop" class="panel window" style="display: block; width: 688px; z-index: 100; position: absolute; left: 150px; top: 0px;">
            <div class="panel-header panel-header-noborder window-header" style="width: 688px;">
                <div class="panel-title panel-with-icon" style="">
                    多选详细设置
                </div>
                <div class="panel-icon icon-cut">
                </div>
                <div class="panel-tool">
                    <a class="panel-tool-min" href="javascript:void(0)"></a><a class="panel-tool-max"
                        href="javascript:void(0)"></a><a class="panel-tool-close" onclick="closeDiv('viewCBTop')"></a>
                </div>
            </div>
            <div id="viewCB">
                <div class="viewTitle">
                    科目：<asp:Label ID="lblCBSubject" runat="server" Text="" ForeColor="Red"></asp:Label>
                    应出总道数：<asp:Label ID="lblCBCount" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
                <div class="viewContent" id="CB">
                    <asp:Repeater ID="rptCB" runat="server">
                        <HeaderTemplate>
                            <table class="table">
                                <tr class="table_head">
                                    <td   style="text-align:center">章节
                                    </td>
                                    <td   style="text-align:center">章节题目
                                    </td>
                                    <td   style="text-align:center">可选道数
                                    </td>
                                    <td   style="text-align:center">该出道数
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td   style="text-align:center">第<%#Eval("chapterno") %>章<asp:HiddenField ID="hfCBRange" runat="server" Value='<%#Eval("id") %>' />
                                </td>
                                <td   style="text-align:center">
                                    <%#Eval("chaptername") %>
                                </td>
                                <td   style="text-align:center">
                                    <span>
                                        <%#Eval("AllCount")%></span>
                                </td>
                                <td   style="text-align:center">
                                    <asp:TextBox  class="form-control" ID="txtCBChapterCount" runat="server" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <div class="viewBottom">
                    <a href="#"  class="btn btn-info"  onclick="becancel('CB')">取消</a> <a href="#"
                         class="btn btn-info"  onclick="besure('CB')">确定</a>
                </div>
            </div>
        </div>
        <div id="viewJDTop" class="panel window" style="display: block; width: 688px; z-index: 100; position: absolute; left: 150px; top: 0px;">
            <div class="panel-header panel-header-noborder window-header" style="width: 688px;">
                <div class="panel-title panel-with-icon" style="">
                    判断详细设置
                </div>
                <div class="panel-icon icon-cut">
                </div>
                <div class="panel-tool">
                    <a class="panel-tool-min" href="javascript:void(0)"></a><a class="panel-tool-max"
                        href="javascript:void(0)"></a><a class="panel-tool-close" onclick="closeDiv('viewJDTop')"></a>
                </div>
            </div>
            <div id="viewJD">
                <div class="viewTitle">
                    科目：<asp:Label ID="lblJDSubject" runat="server" Text="" ForeColor="Red"></asp:Label>
                    应出总道数：<asp:Label ID="lblJDCount" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
                <div class="viewContent" id="JD">
                    <asp:Repeater ID="rptJD" runat="server">
                        <HeaderTemplate>
                            <table class="table">
                                <tr class="table_head">
                                    <td   style="text-align:center">章节
                                    </td>
                                    <td   style="text-align:center">章节题目
                                    </td>
                                    <td   style="text-align:center">可选道数
                                    </td>
                                    <td   style="text-align:center">该出道数
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td   style="text-align:center">第<%#Eval("chapterno") %>章<asp:HiddenField ID="hfJDRange" runat="server" Value='<%#Eval("id") %>' />
                                </td>
                                <td   style="text-align:center">
                                    <%#Eval("chaptername") %>
                                </td>
                                <td   style="text-align:center">
                                    <span>
                                        <%#Eval("AllCount")%></span>
                                </td>
                                <td   style="text-align:center">
                                    <asp:TextBox  class="form-control" ID="txtJDChapterCount" runat="server" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <div class="viewBottom">
                    <a href="#"  class="btn btn-info"  onclick="becancel('JD')">取消</a> <a href="#"
                         class="btn btn-info"  onclick="besure('JD')">确定</a>
                </div>
            </div>
        </div>
        <div id="viewBFTop" class="panel window" style="display: block; width: 688px; z-index: 100; position: absolute; left: 150px; top: 0px;">
            <div class="panel-header panel-header-noborder window-header" style="width: 688px;">
                <div class="panel-title panel-with-icon" style="">
                    单选详细设置
                </div>
                <div class="panel-icon icon-cut">
                </div>
                <div class="panel-tool">
                    <a class="panel-tool-min" href="javascript:void(0)"></a><a class="panel-tool-max"
                        href="javascript:void(0)"></a><a class="panel-tool-close" onclick="closeDiv('viewBFTop')"></a>
                </div>
            </div>
            <div id="viewBF">
                <div class="viewTitle">
                    科目：<asp:Label ID="lblBFSubject" runat="server" Text="" ForeColor="Red"></asp:Label>
                    应出总道数：<asp:Label ID="lblBFCount" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
                <div class="viewContent" id="BF">
                    <asp:Repeater ID="rptBF" runat="server">
                        <HeaderTemplate>
                            <table class="table">
                                <tr class="table_head">
                                    <td   style="text-align:center">章节
                                    </td>
                                    <td   style="text-align:center">章节题目
                                    </td>
                                    <td   style="text-align:center">可选道数
                                    </td>
                                    <td   style="text-align:center">该出道数
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td   style="text-align:center">第<%#Eval("chapterno") %>章<asp:HiddenField ID="hfBFRange" runat="server" Value='<%#Eval("id") %>' />
                                </td>
                                <td   style="text-align:center">
                                    <%#Eval("chaptername") %>
                                </td>
                                <td   style="text-align:center">
                                    <span>
                                        <%#Eval("AllCount")%></span>
                                </td>
                                <td   style="text-align:center">
                                    <asp:TextBox  class="form-control" ID="txtBFChapterCount" runat="server" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <div class="viewBottom">
                    <a href="#"  class="btn btn-info"  onclick="becancel('BF')">取消</a> <a href="#"
                         class="btn btn-info"  onclick="besure('BF')">确定</a>
                </div>
            </div>
        </div>
        <div id="viewSATop" class="panel window" style="display: block; width: 688px; z-index: 100; position: absolute; left: 150px; top: 0px;">
            <div class="panel-header panel-header-noborder window-header" style="width: 688px;">
                <div class="panel-title panel-with-icon" style="">
                    简答详细设置
                </div>
                <div class="panel-icon icon-cut">
                </div>
                <div class="panel-tool">
                    <a class="panel-tool-min" href="javascript:void(0)"></a><a class="panel-tool-max"
                        href="javascript:void(0)"></a><a class="panel-tool-close" onclick="closeDiv('viewSATop')"></a>
                </div>
            </div>
            <div id="viewSA">
                <div class="viewTitle">
                    科目：<asp:Label ID="lblSASubject" runat="server" Text="" ForeColor="Red"></asp:Label>
                    应出总道数：<asp:Label ID="lblSACount" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
                <div class="viewContent" id="SA">
                    <asp:Repeater ID="rptSA" runat="server">
                        <HeaderTemplate>
                            <table class="table">
                                <tr class="table_head">
                                    <td   style="text-align:center">章节
                                    </td>
                                    <td   style="text-align:center">章节题目
                                    </td>
                                    <td   style="text-align:center">可选道数
                                    </td>
                                    <td   style="text-align:center">该出道数
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td   style="text-align:center">第<%#Eval("chapterno") %>章<asp:HiddenField ID="hfSARange" runat="server" Value='<%#Eval("id") %>' />
                                </td>
                                <td   style="text-align:center">
                                    <%#Eval("chaptername") %>
                                </td>
                                <td   style="text-align:center">
                                    <span>
                                        <%#Eval("AllCount")%></span>
                                </td>
                                <td   style="text-align:center">
                                    <asp:TextBox  class="form-control" ID="txtSAChapterCount" runat="server" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <div class="viewBottom">
                    <a href="#"  class="btn btn-info"  onclick="becancel('SA')">取消</a> <a href="#"
                         class="btn btn-info"  onclick="besure('SA')">确定</a>
                </div>
            </div>
        </div>
    </form>
    <script src="../js/paper.js" type="text/javascript"></script>
    
    </body>
</html>
