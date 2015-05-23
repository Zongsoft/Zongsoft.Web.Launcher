<%@ Page Language="C#" Title="主页" MasterPageFile="site.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <h2><%: ViewData["Message"] %></h2>
    <p>
        若要了解有关 ASP.NET MVC 的更多信息，请访问 <a href="http://asp.net/mvc" title="ASP.NET MVC 网站">http://asp.net/mvc</a>。
    </p>

	<zs:TextBox ID="txt1" CssClass=":MyTextBox" Visible="true" Enabled="false" Label="消息文本：" Text="${ViewData[Message]}" data-tags="a, b, c ${ViewData[Message]}" runat="server" />
	<zs:TextBox ID="txt2" Visible="true" Enabled="true" Label="当前服务器时间：" Text="${ViewData[Now]:yyyy-MM-dd hh:mm:ss}" runat="server" />

	<zs:InputBox ID="input1" type="color" runat="server" />

	<zs:CheckBox ID="chk1" Label="CheckeBox-Label" Checked="false" runat="server" />
</asp:Content>
