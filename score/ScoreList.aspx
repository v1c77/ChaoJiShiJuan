<%@ Page Language="C#" MasterPageFile="~/master/admin.master" AutoEventWireup="true"
    CodeFile="ScoreList.aspx.cs" Inherits="subject_SubjectList" Title="无标题页" %>

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
    <style type="text/css">
        .table th
        {
            padding: 5px;
        }
        .table td
        {
            padding: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="box" class="panel panel-default" style="height:100%;">
        <div id="box_top" style="height:60px;">
            <asp:TextBox  class="form-control"   ID="txtWord" CssClass="form-control"  placeholder="学生名" runat="server"></asp:TextBox>
            分数 <asp:DropDownList  CssClass="form-control"   ID="ddlRange1" runat="server" Width="80px">
                <asp:ListItem Text="0" Value="0"></asp:ListItem>
                <asp:ListItem Text="60" Value="60"></asp:ListItem>
                <asp:ListItem Text="70" Value="80"></asp:ListItem>
                <asp:ListItem Text="90" Value="90"></asp:ListItem>
                <asp:ListItem Text="100" Value="100"></asp:ListItem>
                <asp:ListItem Text="150" Value="150"></asp:ListItem>
                <asp:ListItem Text="200" Value="200"></asp:ListItem>
            </asp:DropDownList>
            至
             <asp:DropDownList  CssClass="form-control"   ID="ddlRange2" runat="server"  Width="80px">
                <asp:ListItem Text="60" Value="60"></asp:ListItem>
                <asp:ListItem Text="70" Value="80"></asp:ListItem>
                <asp:ListItem Text="90" Value="90"></asp:ListItem>
                <asp:ListItem Text="100" Value="100" Selected="True"></asp:ListItem>
                <asp:ListItem Text="150" Value="150"></asp:ListItem>
                <asp:ListItem Text="200" Value="200"></asp:ListItem>
            </asp:DropDownList>
             <asp:DropDownList  CssClass="form-control"   ID="ddlArrange" runat="server" Width="200px" AutoPostBack="true"
                OnSelectedIndexChanged="ddlArrange_SelectedIndexChanged">
            </asp:DropDownList>
            
             <asp:DropDownList  CssClass="form-control"   ID="ddlClass" runat="server">
            </asp:DropDownList>
             <asp:DropDownList  CssClass="form-control"   ID="ddlScoreStatus" runat="server">
                <asp:ListItem Text="所有状态" Value="0"></asp:ListItem>
                <asp:ListItem Text="还没考试" Value="1"></asp:ListItem>
                <asp:ListItem Text="正在考试" Value="2"></asp:ListItem>
                <asp:ListItem Text="考试成功" Value="3"></asp:ListItem>
                <asp:ListItem Text="考试失败" Value="4"></asp:ListItem>
                <asp:ListItem Text="等待批改" Value="5"></asp:ListItem>
                <asp:ListItem Text="重新考试" Value="6"></asp:ListItem>
            </asp:DropDownList>
            <asp:LinkButton ID="lbtnSearch" runat="server" class="btn btn-default" data-options="plain:true,iconCls:'icon-search'"
                OnClick="lbtnSearch_Click"><span class="glyphicon glyphicon-search marginRight" ></span>搜索</asp:LinkButton>
            <asp:LinkButton ID="lbtnDelete" runat="server" class="btn btn-default" data-options="plain:true,iconCls:'icon-cancel'"
                OnClick="lbtnDelete_Click" OnClientClick="return confirm('您确定重考所选的吗？')">重考所选</asp:LinkButton>
            <asp:LinkButton ID="lbtnExport" runat="server" class="btn btn-default" data-options="plain:true,iconCls:'icon-sum'"
                OnClick="lbtnExport_Click">导出</asp:LinkButton>
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
                    <asp:TemplateField HeaderText="班级">
                        <ItemTemplate>
                            <%# Eval("classname")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="学生名">
                        <ItemTemplate>
                            <%# Eval("realname")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="科目名">
                        <ItemTemplate>
                            <%# Eval("subjectname")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="考试标题">
                        <ItemTemplate>
                            <%# Eval("arrangetitle")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="分数">
                        <ItemTemplate>
                            <%# Eval("score")%>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText="考试状态">
                        <ItemTemplate>
                            <%# Eval("scorestatus")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" class="btn btn-default" data-options="plain:true,iconCls:'icon-cut'"
                                CommandArgument='<%#Eval("id") %>' OnClick="lbtnEdit_Click" OnClientClick="return confirm('您确定允许该学生重考的吗？')">重考</asp:LinkButton>
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
</asp:Content>
