<%@ Page Language="C#" Title="主页" MasterPageFile="site.master" Inherits="System.Web.Mvc.ViewPage" %>

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

			<zs:ImageBox ImageUrl="~/images/photo.png" runat="server" />

			<zs:LayoutPanel LayoutMode="Fluid" LayoutColumnCount="2" runat="server">
				<zs:TextBox ID="txt1" CssClass=":MyTextBox" Visible="true" Enabled="false" Label="消息文本：" Text="${ViewData[Message]}" data-tags="a, b, c ${ViewData[Message]}" runat="server" />
				<zs:TextBox ID="txt2" Visible="true" Enabled="true" Label="当前服务器时间：" Text="${ViewData[Now]:yyyy-MM-dd hh:mm:ss}" runat="server" />
				<zs:NumericBox ID="txtNumber" Text="${ViewData[Random]}" runat="server" />
				<zs:InputBox ID="txtColor" type="Color" runat="server" />

				<zs:LayoutPanelCell ID="CellID" FluidCellSettings-Flex="6" runat="server">
					<zs:CheckBox ID="chk1" CssClass=":field-inline" Label="我是一个复选框" Checked="false" runat="server" />

					<zs:CheckBox Name="RadioX" Label="我是单选框 #1" Checked="false" InputType="Radio" runat="server" />
					<zs:CheckBox Name="RadioX" Label="我是单选框 #2" Checked="false" InputType="Radio" runat="server" />
					<zs:CheckBox Name="RadioX" Label="我是单选框 #3" Checked="false" InputType="Radio" runat="server" />
				</zs:LayoutPanelCell>
			</zs:LayoutPanel>
		</BodyTemplate>
	</zs:Widget>

	<hr />

	<h3>手动添加(Toggle 控件)</h3>
	<zs:Toggle ID="Gender1" Title="性别" CssClass=":inline" Type="Single" runat="server">
		<Items>
			<zs:ToggleItem Text="男" Value="Male" Checked="true" />
			<zs:ToggleItem Text="女" Value="Female" />
		</Items>
	</zs:Toggle>

	<hr />

	<h3>通过数据绑定(Toggle 控件)</h3>
	<zs:Toggle Name="Gender2" Title="性别" CssClass=":inline" Type="Single" runat="server" DataSource="${ViewData[Genders]}">
		<Binding TextMember="Description" ValueMember="Value" />
	</zs:Toggle>

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

	<zs:Grid DataKeys="Id" DataSource="${Model}" runat="server">
		<Columns>
			<zs:GridTemplateColumn Name="Index" Alignment="Center" Title="序号">
				<Content>
					<zs:Literal Text="${Index}" runat="server" />
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
				<td>a</td>
				<td>b</td>
				<td>c</td>
				<td>d</td>
			</tr>
		</FooterTemplate>
	</zs:Grid>

	<hr />

	<zs:Button ID="btnOK" Value="OK" runat="server">确认</zs:Button>
</asp:Content>
