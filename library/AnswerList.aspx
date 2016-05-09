<%@ Page Language="C#" MasterPageFile="~/master/admin.master" AutoEventWireup="true"
    CodeFile="AnswerList.aspx.cs" Inherits="subject_SubjectList" Title="无标题页" %>

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
    <script type="text/javascript">
        $(function(){
           $('#oe_iframe').window('close');
           $('#oe_iframe2').window('close');
           $('#oe_iframe3').window('close');
        })
        function oe_add()
        {
            $('#oe_iframe').window({   
                 title:'简答添加',
                 iconCls:'icon-add',                 
                 onClose:function(){   
                    $('#<%=btnHide.ClientID %>').click();
                 }   
            });  
            $('#oe_iframe').window('open');
            $('#oe_iframe').window('resize',{  
                width: 550,  
                height: 480  
            }); 
            $('#oe_iframe').window('move',{   
                left:150,   
                top:0   
            });
            return false;    
        }
        function oe_edit()
        {
            $('#oe_iframe2').window('open');
            $('#oe_iframe2').window({   
                 title:'简答编辑', 
                 iconCls:'icon-cut',                
                 onClose:function(){   
                    $('#<%=btnHide.ClientID %>').click();
                 }   
            }); 
            $('#oe_iframe2').window('resize',{  
                width: 550,  
                height: 480  
            }); 
            $('#oe_iframe2').window('move',{   
                left:150,   
                top:0   
            });
            return false;    
        }
        function oe_import()
        {
            $('#oe_iframe3').window({   
                 title:'简答导入',
                 iconCls:'icon-help',                 
                 onClose:function(){   
                    $('#<%=btnHide.ClientID %>').click();
                 }   
            });  
            $('#oe_iframe3').window('open');
            $('#oe_iframe3').window('resize',{  
                width: 500,  
                height: 200  
            }); 
            $('#oe_iframe3').window('move',{   
                left:150,   
                top:50   
            });
            return false;    
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="box" class="panel panel-default" style="height:100%;">
       <div id="box_top" class="panel-heading">
            题目：<asp:TextBox  class="form-control"   ID="txtWord" CssClass="form-control"  runat="server"></asp:TextBox>
              <asp:DropDownList   CssClass="form-control"   ID="ddlSubject" runat="server" Width="160px" OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged"
                AutoPostBack="true">
            </asp:DropDownList>
              <asp:DropDownList   CssClass="form-control"   ID="ddlChapter" runat="server" Width="160px">
            </asp:DropDownList>
            <asp:LinkButton ID="lbtnSearch" runat="server" class="btn btn-default" data-options="plain:true,iconCls:'icon-search'"
                OnClick="lbtnSearch_Click"><span class="glyphicon glyphicon-search marginRight" ></span>搜索</asp:LinkButton>
            <asp:LinkButton ID="lbtnAdd" runat="server" class="btn btn-default" data-options="plain:true,iconCls:'icon-add'"
                OnClientClick="return oe_add();"><span class="glyphicon  glyphicon-plus marginRight" ></span>添加</asp:LinkButton>
            <asp:LinkButton ID="lbtnImport" runat="server" class="btn btn-default" data-options="plain:true,iconCls:'icon-help'"
                OnClientClick="return oe_import();"><span class="glyphicon glyphicon-download-alt marginRight" ></span>导入</asp:LinkButton>
            <asp:LinkButton ID="lbtnDelete" runat="server" class="btn btn-default" data-options="plain:true,iconCls:'icon-cancel'"
                OnClick="lbtnDelete_Click" OnClientClick="return confirm('您确定删除所选的吗？')"><span class="glyphicon glyphicon-remove marginRight" ></span>删除所选</asp:LinkButton>
        </div>
        <div class="panel-body" id="box_middle">
            <asp:GridView ID="gvwData" runat="server" runat="server" AutoGenerateColumns="false" CssClass="table table_style"  GridLines="None" 
                HorizontalAlign="Center" OnRowDataBound="gvwData_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1+pageSize*(pageIndex-1) %></ItemTemplate>
                        <ItemStyle  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="">
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkbAll" runat="server"  />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkbOne" runat="server"  />
                        </ItemTemplate>
                        <ItemStyle  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="科目名">
                        <ItemTemplate>
                            <%# Eval("subjectname")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="章节名">
                        <ItemTemplate>
                            <%# Eval("chaptername")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="题目">
                        <ItemTemplate>
                            <%#GetSmallQues(Eval("ques").ToString())%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="答案">
                        <ItemTemplate>
                            <%#GetSmallQues(Eval("ans").ToString())%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="难度">
                        <ItemTemplate>
                            <%# Eval("diff")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="已选数">
                        <ItemTemplate>
                            <%# Eval("selectcount")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" class="btn btn-default" data-options="plain:true,iconCls:'icon-cut'"
                                CommandArgument='<%#Eval("id") %>' OnClick="lbtnEdit_Click"><span class="glyphicon glyphicon-pencil  marginRight" ></span>编辑题目</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    没有返回任何数据！
                </EmptyDataTemplate>
                <HeaderStyle  />
                <RowStyle HorizontalAlign="Center" />
                <EmptyDataRowStyle Font-Size="16px" ForeColor="Red" Font-Bold="true" />
            </asp:GridView>
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
        <iframe src="AnswerAdd.aspx" frameborder="0" scrolling="auto" width="100%" height="100%">
        </iframe>
    </div>
    <div id="oe_iframe2" class="easyui-window" style="padding: 5px;">
        <iframe src="AnswerAdd.aspx<%=editString %>" frameborder="0" scrolling="auto" width="100%"
            height="100%"></iframe>
    </div>
    <div id="oe_iframe3" class="easyui-window" style="padding: 5px;">
        <iframe src="AnswerImport.aspx" frameborder="0" scrolling="auto" width="100%" height="100%">
        </iframe>
    </div>
</asp:Content>
