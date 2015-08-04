<%@ Page Language="C#" Title="主页" MasterPageFile="site.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ContentPlaceHolderID="OutlinePlaceHolder" runat="server">
	<h2>插件树</h2>

	<zs:TreeView ID="PluginTree" runat="server"
		CssClass="atm ui list left rail"
		ItemCssClass="item"
		LoadingPath="root"
		ListCssClass="list"
		RenderMode="List"
		DataSource="${ViewData['PluginTree'].RootNode.Children}"
		DataPropertyName="Children">
		<Nodes>
			<zs:TreeViewNode Name="root" Text="根节点" NavigateUrl="#" NavigateCssClass="content" />
		</Nodes>

		<NodeTemplate>
			<div class="content">
				<zs:Literal TagName="abbr" title="${DataItem.FullPath}" Text="${DataItem.Name}" runat="server" />
				<% if(DataBinder.Eval(this.GetDataContext(), "NodeType").ToString() == "Builtin") { %>
					(<zs:Literal TagName="span" style="color: blue;" Text="${DataItem.NodeType}" runat="server" />)
				<% } else { %>
					(<zs:Literal TagName="span" style="color: red;" Text="${DataItem.NodeType}" runat="server" />)
				<% } %>
			</div>
		</NodeTemplate>
	</zs:TreeView>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <h2><%: ViewData["Message"] %></h2>
    <p>
        若要了解有关 ASP.NET MVC 的更多信息，请访问 <a href="http://asp.net/mvc" title="ASP.NET MVC 网站">http://asp.net/mvc</a>。
    </p>

	<zs:Widget ID="Inputs" Title="输入框" Description="描述文本" Icon="Edit" runat="server">
		<BodyTemplate>
			<zs:ToolBar runat="server">
				<Items>
					<zs:ToolBarItem Name="AddNew" Icon="AddNew" Text="新增" />
					<zs:ToolBarItem Name="Edit" Icon="Edit" Text="编辑" />
					<zs:ToolBarItem Name="Delete" Icon="Delete" Text="删除" />
				</Items>
			</zs:ToolBar>

			<hr />

			<zs:ImageBox NavigateUrl="~/article/${ViewData[Now]:yyyy/MM/dd}" ImageUrl="~/images/${ViewData[Random]}.png" runat="server" />

			<zs:LayoutPanel LayoutMode="Fluid" LayoutColumnCount="2" runat="server">
				<zs:TextBox ID="txt1" CssClass=":MyTextBox" Visible="true" Enabled="false" Label="消息文本：" Text="${ViewData[Message]}" data-tags="a, b, c ${ViewData[Message]}" runat="server" />
				<zs:TextBox ID="txt2" Visible="true" Enabled="true" Label="当前服务器时间：" Text="${ViewData[Now]:yyyy-MM-dd hh:mm:ss}" runat="server" />
				<zs:NumericBox ID="txtNumber" Text="${ViewData[Random]}" runat="server" />
				<zs:InputBox ID="txtColor" type="Color" runat="server" />

				<zs:LayoutFluidCell runat="server">
					<zs:CheckBox ID="chk1" CssClass=":field-inline" Label="我是一个复选框" Checked="false" runat="server" />

					<zs:CheckBox Name="RadioX" Label="我是单选框 #1" Checked="false" InputType="Radio" runat="server" />
					<zs:CheckBox Name="RadioX" Label="我是单选框 #2" Checked="false" InputType="Radio" runat="server" />
					<zs:CheckBox Name="RadioX" Label="我是单选框 #3" Checked="false" InputType="Radio" runat="server" />
				</zs:LayoutFluidCell>
			</zs:LayoutPanel>
		</BodyTemplate>
	</zs:Widget>

	<hr />

	<h3>下拉框控件(手动与数据绑定)</h3>
	<zs:ComboBox ID="cboGender" Label="性别：" RenderMode="Classic" DataSource="${ViewData[Genders]}" Binding-TextMember="Description" Binding-ValueMember="Value" SelectedValue="male" runat="server">
		<Items>
			<zs:ComboBoxItem Text="(你猜)" Value="" />
		</Items>
	</zs:ComboBox>

	<hr />

	<zs:Editor ID="editor" Label="文本编辑器" runat="server" />

	<hr />

	<zs:Grid ID="dataGrid" DataKeys="Id" border="1" DataSource="${Model}" runat="server">
		<Columns>
			<zs:GridTemplateColumn Name="Index" Alignment="Center" Title="序号">
				<Content>
					<zs:Literal Text="${Index}" runat="server">
							<zs:Button Value="${DataItem.Id}" runat="server">
								<zs:Literal Text="${DataItem.Name}" runat="server" />
							</zs:Button>
					</zs:Literal>
				</Content>
			</zs:GridTemplateColumn>

			<zs:GridColumn Name="Id" Alignment="Center" Title="编号" Value="Id" />
			<zs:GridColumn Name="Name" Alignment="Left" Title="姓名" />
			<zs:GridColumn Name="Gender" Alignment="Center" Title="性别" />
			<zs:GridColumn Name="Birthdate" Alignment="Left" Title="出生日期" Text="${Birthdate:D}" />
		</Columns>

		<EmptyTemplate>
			<p>没有数据，我是空模板！</p>
		</EmptyTemplate>

		<FooterTemplate>
			<tr>
				<th>a</th>
				<th>b</th>
				<th>c</th>
				<th>d</th>
				<th>e</th>
			</tr>
		</FooterTemplate>
	</zs:Grid>

	<hr />

	<zs:ListView ID="listView" ListType="OrderedList" DataSource="${Model}" runat="server">
		<ItemTemplate>
			<zs:Literal TagName="span" Text="${Index}" runat="server" />
			<zs:TextBox Text="${DataItem.Id}" runat="server" />
			<zs:TextBox Text="${DataItem.Name}" runat="server" />
			<zs:TextBox Text="${DataItem.Birthdate:D}" runat="server" />
		</ItemTemplate>
	</zs:ListView>

	<hr />

	<zs:Button ID="btnOK" Value="OK" runat="server">确认</zs:Button>
</asp:Content>
