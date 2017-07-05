using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Zongsoft.Web.Launcher
{
	public class MvcApplication : System.Web.HttpApplication
	{
		protected void Application_Start()
		{
			Zongsoft.Plugins.Application.Started += Application_Started;
			Zongsoft.Plugins.Application.Start(Zongsoft.Plugins.Web.ApplicationContext.Current, null);
		}

		protected void Application_End(object sender, EventArgs e)
		{
			Zongsoft.Plugins.Application.Exit();
		}

		private void Application_Started(object sender, Zongsoft.Plugins.ApplicationEventArgs e)
		{
			var context = Zongsoft.Plugins.Application.Context;

			//将应用上下文对象保存到ASP.NET的全局应用缓存容器中
			Application["ApplicationContext"] = context;

			//注册主页的控制器
			context.PluginContext.PluginTree.Mount("/Workspace/Web/Controllers/Home", new Func<IController>(() => new DefaultController()));

			//注销插件应用的启动完成事件的通知
			Zongsoft.Plugins.Application.Started -= Application_Started;
		}
	}
}