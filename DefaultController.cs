using System;
using System.ComponentModel;
using System.Collections.Generic;
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
			this.ViewData["Random"] = Zongsoft.Common.Randomizer.GenerateInt32();
			this.ViewData["Message"] = "Welcome to ASP.NET MVC on Zongsoft.Plugins™";
			this.ViewData["Genders"] = Zongsoft.Common.EnumUtility.GetEnumEntries(typeof(Gender), false);
			this.ViewData["PluginTree"] = Zongsoft.Plugins.Application.Context.PluginContext.PluginTree;

			var people = new Person[]
			{
				new Person()
				{
					Id = 101,
					Name = "Administrator",
					Gender = Gender.Male,
					Birthdate = new DateTime(1980, 1, 1),
				},
				new Person()
				{
					Id = 102,
					Name = "Popeye Zhong",
					Gender = Gender.Male,
					Birthdate = new DateTime(1979, 5, 15),
				},
				new Person()
				{
					Id = 103,
					Name = "Lily",
					Gender = Gender.Female,
					Birthdate = new DateTime(1989, 6, 1),
				},
			};

			return View(people);
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

	#region 测试数据
	public enum Gender
	{
		[Description("先生")]
		Male = 1,

		[Description("女士")]
		Female = 0,
	}

	[Serializable]
	public class Person
	{
		public int Id
		{
			get;
			set;
		}

		public string Name
		{
			get;
			set;
		}

		public Gender? Gender
		{
			get;
			set;
		}

		public DateTime Birthdate
		{
			get;
			set;
		}
	}
	#endregion
}
