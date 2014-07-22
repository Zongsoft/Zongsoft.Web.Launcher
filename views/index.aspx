<%@ Page Language="C#" Title="主页" MasterPageFile="~/views/site.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <h2><%: ViewData["Message"] %></h2>
    <p>
        若要了解有关 ASP.NET MVC 的更多信息，请访问 <a href="http://asp.net/mvc" title="ASP.NET MVC 网站">http://asp.net/mvc</a>。
    </p>
</asp:Content>
