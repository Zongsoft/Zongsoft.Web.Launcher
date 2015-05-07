using System;
using System.Collections.Generic;
using System.Linq;
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
			Zongsoft.Plugins.Application.Start(Zongsoft.Web.Plugins.ApplicationContext.Current, null);
		}

		protected void Application_End(object sender, EventArgs e)
		{
			Zongsoft.Plugins.Application.Exit();
		}

		private void Application_Started(object sender, Zongsoft.Plugins.ApplicationEventArgs e)
		{
			Application["ApplicationContext"] = Zongsoft.Plugins.Application.Context;
		}
	}
}