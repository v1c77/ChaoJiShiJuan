<%@ Page Language="C#" MasterPageFile="~/master/admin.master" AutoEventWireup="true"
    CodeFile="ExamList.aspx.cs" Inherits="subject_SubjectList" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <style>
        .panel-footer {
            padding: 0;
            background-color: #FFFFFF;
            height: 34px;
        }

            .panel-footer ul {
                margin: 0;
            }

        .pagination > li:first-child > a {
            border-top-left-radius: 0;
        }

        .pagination > li:last-child > a {
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
        }

        .panel {
            margin-bottom: 5px;
            border: none;
        }

        .panel-body {
            padding: 0;
        }

        .panel-heading {
            border: none;
        }

        .panel-footer {
            bottom: 0;
            width: 100%;
        }

        .table {
            margin: 0;
        }

            .table tr td {
                margin: 0;
            }
    </style>
    <script type="text/javascript">
        $(function () {
            $('#oe_iframe').window('close');
            $('#oe_iframe2').window('close');
            $('#oe_iframe3').window('close');
        })
        function oe_add() {
            $('#oe_iframe').window({
                title: '考试添加',
                iconCls: 'icon-add',
                onClose: function () {
                    $('#<%=btnHide.ClientID %>').click();
                 }
            });
             $('#oe_iframe').window('open');
             $('#oe_iframe').window('resize', {
                 width: 500,
                 height: 450
             });
             $('#oe_iframe').window('move', {
                 left: 150,
                 top: 0
             });
             return false;
         }
         function oe_edit() {
             $('#oe_iframe2').window('open');
             $('#oe_iframe2').window({
                 title: '考试编辑',
                 iconCls: 'icon-cut',
                 onClose: function () {
                     $('#<%=btnHide.ClientID %>').click();
                 }
            });
            $('#oe_iframe2').window('resize', {
                width: 500,
                height: 450
            });
            $('#oe_iframe2').window('move', {
                left: 150,
                top: 0
            });
            return false;
        }
        function oe_control() {
            $('#oe_iframe3').window('open');
            $('#oe_iframe3').window({
                title: '考试监控',
                iconCls: 'icon-redo',
                onClose: function () {
                    $('#<%=btnHide.ClientID %>').click();
                 }
            });
             $('#oe_iframe3').window('resize', {
                 width: 700,
                 height: 450
             });
             $('#oe_iframe3').window('move', {
                 left: 150,
                 top: 0
             });
             return false;
         }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="row" id="box">
            <div class="col-sm-12 col-xs-12 ">
                <div class="panel panel-default" style="height: 100%;">
                    <div id="box_top" class="panel-heading">
                        <asp:TextBox ID="txtWord" CssClass="form-control" placeholder="考试名" runat="server"></asp:TextBox>
                         <asp:DropDownList    CssClass="form-control" ID="ddlSubject" runat="server">
                        </asp:DropDownList>
                        <asp:LinkButton ID="lbtnSearch" runat="server" CssClass="btn btn-default"  data-options="plain:true,iconCls:'icon-search'"
                            OnClick="lbtnSearch_Click"><span class="glyphicon glyphicon-search marginRight" ></span>搜索</asp:LinkButton>
                        <asp:LinkButton ID="lbtnAdd" runat="server" CssClass="btn btn-default" data-options="plain:true,iconCls:'icon-add'"
                            OnClientClick="return oe_add();"><span class="glyphicon glyphicon-plus marginRight" ></span>添加</asp:LinkButton>
                        <asp:LinkButton ID="lbtnDelete" runat="server" CssClass="btn btn-default" data-options="plain:true,iconCls:'icon-cancel'"
                            OnClick="lbtnDelete_Click" OnClientClick="return confirm('您确定删除所选的吗？')"><span class="glyphicon glyphicon-remove marginRight" ></span>删除所选</asp:LinkButton>
                    </div>
                </div>
                
                <div class="panel-body" id="box_middle">
                    <div class="table-responsive">
                <asp:GridView ID="gvwData" runat="server" AutoGenerateColumns="false" CssClass="table table_style"
                    HorizontalAlign="Center"  BorderColor="White" GridLines="None">
                    <Columns>
                        <asp:TemplateField HeaderText="" ControlStyle-BorderColor="White" ControlStyle-BorderWidth="0">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1+pageSize*(pageIndex-1) %>
                            </ItemTemplate>
                            
                        </asp:TemplateField>
                        <asp:TemplateField  >
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkbAll" runat="server"  />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkbOne" runat="server" />
                            </ItemTemplate>
                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="科目名" >
                            <ItemTemplate>
                                <%# Eval("subjectname")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="考试名">
                            <ItemTemplate>
                                <%# Eval("arrangetitle")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="试卷名">
                            <ItemTemplate>
                                <%# Eval("papertitle")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="开始时间">
                            <ItemTemplate>
                                <%# Eval("starttime")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="结束时间">
                            <ItemTemplate>
                                <%# Eval("endtime")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit" runat="server" CssClass="btn btn-default" data-options="plain:true,iconCls:'icon-cut'"
                                    CommandArgument='<%#Eval("id") %>' OnClick="lbtnEdit_Click"><span class="glyphicon glyphicon-pencil marginRight" ></span>编辑考试</asp:LinkButton>
                                <asp:LinkButton ID="lbtnControl" runat="server" CssClass="btn btn-default" data-options="plain:true,iconCls:'icon-redo'"
                                    CommandArgument='<%#Eval("id") %>' OnClick="lbtnControl_Click">进入监控</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        没有返回任何数据！
                    </EmptyDataTemplate>
                    
                    <RowStyle HorizontalAlign="Center" />
                    <EmptyDataRowStyle Font-Size="16px" ForeColor="Red" Font-Bold="true" />
                </asp:GridView>
                    </div>
            </div>
                </div>
        </div>
    </div>
    <div id="pp" class="easyui-pagination" style="background: #efefef; border: 1px solid #ccc;"
        data-options="  
        total:<%=pageTotal%>,
        onSelectPage:function(pageIndex, pageSize){  
             $('#<%=hfPageIndex.ClientID %>').val(pageIndex);
             $('#<%=hfPageSize.ClientID %>').val(pageSize);
             $('#<%=btnHide.ClientID %>').click();
        },
        showRefresh:false,
        pageNumber:<%=pageIndex %>,
        pageSize:<%=pageSize %>  
    ">
    </div>
    <div style="display: none;">
        <asp:HiddenField ID="hfPageIndex" runat="server" />
        <asp:HiddenField ID="hfPageSize" runat="server" />
        <asp:Button ID="btnHide" runat="server" Text="" OnClick="btnHide_Click" />
    </div>
    <div id="oe_iframe" class="easyui-window" style="padding: 5px;">
        <iframe src="ExamAdd.aspx" frameborder="0" scrolling="auto" width="100%" height="100%"></iframe>
    </div>
    <div id="oe_iframe2" class="easyui-window" style="padding: 5px;">
        <iframe src="ExamAdd.aspx<%=editString %>" frameborder="0" scrolling="auto" width="100%"
            height="100%"></iframe>
    </div>
    <div id="oe_iframe3" class="easyui-window" style="padding: 5px;">
        <iframe src="ExamControl.aspx<%=editString2 %>" frameborder="0" scrolling="auto" width="100%"
            height="100%"></iframe>
    </div>
</asp:Content>
