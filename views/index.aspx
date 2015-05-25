<%@ Page Language="C#" Title="主页" MasterPageFile="site.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <h2><%: ViewData["Message"] %></h2>
    <p>
        若要了解有关 ASP.NET MVC 的更多信息，请访问 <a href="http://asp.net/mvc" title="ASP.NET MVC 网站">http://asp.net/mvc</a>。
    </p>

	<zs:TextBox ID="txt1" CssClass=":MyTextBox" Visible="true" Enabled="false" Label="消息文本：" Text="${ViewData[Message]}" data-tags="a, b, c ${ViewData[Message]}" runat="server" />
	<zs:TextBox ID="txt2" Visible="true" Enabled="true" Label="当前服务器时间：" Text="${ViewData[Now]:yyyy-MM-dd hh:mm:ss}" runat="server" />
	<zs:NumericBox ID="txtNumber" Text="${ViewData[Random]}" runat="server" />
	<zs:TextBox ID="txtColor" type="Color" runat="server" />
	<zs:CheckBox ID="chk1" Label="CheckeBox-Label" Checked="false" runat="server" />

	<hr />

	<zs:ComboBox Label="性别：" DataSource="${ViewData[Genders]}" Binding-TextMember="Description" Binding-ValueMember="Value" SelectedValue="male" runat="server" />

	<zs:Grid DataSource="${Model}" DataKeys="Id" runat="server">
		<Columns>
			<zs:GridColumn Name="Id" Alignment="Center" Title="编号" Value="Id" />
			<zs:GridColumn Name="Name" Alignment="Left" Title="姓名" />
			<zs:GridColumn Name="Gender" Alignment="Center" Title="性别" />
			<zs:GridColumn Name="Birthdate" Alignment="Left" Title="出生日期" Text="${Birthdate:D}" />
		</Columns>
	</zs:Grid>
</asp:Content>
