using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Zongsoft.Web.Launcher
{
	[HandleError]
	public class DefaultController : Controller
	{
		public ActionResult Index()
		{
			this.ViewData["Now"] = DateTime.Now;
			this.ViewData["Message"] = "Welcome to ASP.NET MVC on Zongsoft.Plugins™";

			return View();
		}

		[HttpPost]
		public ActionResult Index(int? id)
		{
			return View();
		}

		public ActionResult About()
		{
			return View();
		}
	}
}
