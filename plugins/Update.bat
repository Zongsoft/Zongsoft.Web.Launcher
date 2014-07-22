copy ..\..\Zongsoft.Plugins\Main.plugin
copy ..\..\Zongsoft.Web.Plugins\Web.plugin

if not exist views md views

copy ..\..\Zongsoft.Web.Plugins\Mvc\Views\*.aspx	.\views
