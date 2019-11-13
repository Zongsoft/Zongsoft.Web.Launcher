# Zongsoft.Web 宿主程序

![license](https://img.shields.io/github/license/Zongsoft/Zongsoft.Web.Launcher) ![download](https://img.shields.io/nuget/dt/Zongsoft.Web.Launcher) ![version](https://img.shields.io/github/v/release/Zongsoft/Zongsoft.Web.Launcher?include_prereleases) ![github stars](https://img.shields.io/github/stars/Zongsoft/Zongsoft.Web.Launcher?style=social)

README: [English](https://github.com/Zongsoft/Zongsoft.Web.Launcher/blob/master/README.md) | [简体中文](https://github.com/Zongsoft/Zongsoft.Web.Launcher/blob/master/README-zh_CN.md)

-----

这是 [**Zongsoft**](https://github.com/Zongsoft) 插件应用的 **Web** 宿主程序。

这只是一个普通的 ASP.NET Web API 应用程序，在实际生产中应该为你的产品或项目创建自己的 Web 宿主程序（譬如：`{Organization}.Web.Server`），以便增加一些辅助代码和相关资源文件。

## 启动

[**Zongsoft**](https://github.com/Zongsoft) 插件应用宿主程序都是一样的运行机制：在宿主进程的启动点调用插件应用的启动方法。以本 Web 宿主程序为例（[`Global.asax.cs`](https://github.com/Zongsoft/Zongsoft.Web.Launcher/blob/master/Global.asax.cs) 文件）。更多插件应用的加载机制、运行原理等信息请参考 [**Zongsoft.Plugins**](https:github.com/Zongsoft/Zongsoft.Plugins) 项目的相关文档。

```csharp
namespace Zongsoft.Web.Launcher
{
	public class MvcApplication : System.Web.HttpApplication
	{
		protected void Application_Start()
		{
			Zongsoft.Plugins.Application.Start(Zongsoft.Plugins.Web.ApplicationContext.Current, null);
		}
	}
}
```

<a name="files"></a>
## 部署

### 部署文件

位于项目根目录的 [`.deploy`](https://github.com/Zongsoft/Zongsoft.Web.Launcher/blob/master/.deploy) 文件，这是一个 `INI` 格式的配置文件，它定义了需要将哪些源文件拷贝到本项目的特定目录中的文件，由 [Zongsoft.Utilities.Deployer](https://github.com/Zongsoft/Zongsoft.Utilities.Deployer) 部署工具解析使用。

> 提示：可以参考 [Zongsoft.CoreLibrary](https://github.com/Zongsoft/Zongsoft.CoreLibrary) 核心库的 `Zongsoft.Options.Profiles` 命名空间了解 `INI` 配置文件的解析。

#### 部署命令
执行部署命令文件，即调用 [Zongsoft.Utilities.Deployer](https://github.com/Zongsoft/Zongsoft.Utilities.Deployer) 部署工具进行一系列文件复制。你可以在宿主项目的设置中添加“生成事件(前)”的执行命令（如下所示），以便每次重建自动更新部署：
```bash
cd $(ProjectDir)
$(ProjectDir)\deploy-$(ConfigurationName).bat
```

> **注意：** 宿主项目本身没有多少代码，而当宿主项目没有代码变更时，在某些 **V**isual **S**tudio 版本中重新构建就 **不会** 激发“**生成事件**”，因此也就没有执行在项目设置中定义的部署命令，所以这种情况下当插件项目更新后务必手动执行一遍宿主项目根目录中的部署命令以确保更新后的插件被正确复制过来。

- `deploy-debug.bat` 命令文件
> ```bash
> Zongsoft.Utilities.Deployer.exe -edition:Debug ".deploy"
> ```

- `deploy-release.bat` 命令文件
> ```bash
> Zongsoft.Utilities.Deployer.exe -edition:Release ".deploy"
> ```


## 插件

执行部署命令之后，本宿主项目的 `plugins` 目录结构大概如下所示：

```
[plugins]
├── Main.plugin
├── Web.plugin
│
└── Zongsoft
　   ├── Community
　   │   ├── Zongsoft.Community.dll
　   │   ├── Zongsoft.Community.option
　   │   ├── Zongsoft.Community.plugin
　   │   ├── Zongsoft.Community.mapping
　   │   ├── Zongsoft.Community.Web.dll
　   │   └── Zongsoft.Community.Web.plugin
　   │
　   ├── Security
　   │   ├── Zongsoft.Security.dll
　   │   ├── Zongsoft.Security.option
　   │   ├── Zongsoft.Security.plugin
　   │   ├── Zongsoft.Security.mapping
　   │   ├── Zongsoft.Security.Redis.plugin
　   │   ├── Zongsoft.Security.Web.dll
　   │   └── Zongsoft.Security.Web.plugin
　   │
　   ├── Data
　   │   ├── mssql
　   │   │   ├── Zongsoft.Data.MsSql.dll
　   │   │   └── Zongsoft.Data.MsSql.plugin
　   │   │
　   │   └── mysql
　   │       ├── MySql.Data.dll
　   │       ├── Zongsoft.Data.MySql.dll
　   │       └── Zongsoft.Data.MySql.plugin
　   │
　   └── Externals
　       ├── Json
　       │   ├── Newtonsoft.Json.dll
　       │   ├── Zongsoft.Externals.Json.dll
　       │   └── Zongsoft.Externals.Json.plugin
　       │
　       └── Redis
　           ├── StackExchange.Redis.dll
　           ├── Zongsoft.Externals.Redis.dll
　           ├── Zongsoft.Externals.Redis.option
　           └── Zongsoft.Externals.Redis.plugin
```

### 插件部署
- 移除插件：将待移除的插件目录或插件文件(_`.plugin`_)删除；
- 添加插件：将新插件的相关文件复制到宿主程序的 `plugins` 子目录中。

### 部署文件

下面是本宿主项目的部署文件 [`.deploy`](https://github.com/Zongsoft/Zongsoft.Web.Launcher/blob/master/.deploy) 的内容：

```ini
[plugins]
/Zongsoft/Zongsoft.Plugins/Main.plugin
/Zongsoft/Zongsoft.Plugins.Web/Web.plugin

[plugins Zongsoft Data]
/Zongsoft/Zongsoft.Data/.deploy
[plugins Zongsoft Data mssql]
/Zongsoft/Zongsoft.Data/drivers/mssql.deploy
[plugins Zongsoft Data mysql]
/Zongsoft/Zongsoft.Data/drivers/mysql.deploy
[plugins Zongsoft Data oracle]
/Zongsoft/Zongsoft.Data/drivers/oracle.deploy
[plugins Zongsoft Data postgres]
/Zongsoft/Zongsoft.Data/drivers/postgres.deploy

[plugins Zongsoft Community]
/Zongsoft/Zongsoft.Community/src/.deploy
/Zongsoft/Zongsoft.Community/src/api/.deploy

[plugins Zongsoft Security]
/Zongsoft/Zongsoft.Security/src/.deploy
/Zongsoft/Zongsoft.Security/src/api/.deploy

[plugins Zongsoft Externals Json]
/Zongsoft/Zongsoft.Externals.Json/.deploy

[plugins Zongsoft Externals Redis]
/Zongsoft/Zongsoft.Externals.Redis/.deploy
```

对照插件目录结构和部署文件内容，不难发现该部署文件的含义：
> - **Section** 段（方括号内部）表示目标位置的相对目录，目录层级之间以空格分隔；
> - **Entry** 条目（方括号后面）表示源文件的路径，如果源文件扩展名为 `.deploy` 则源文件由该源部署文件定义并以此类推。

> 如果需要部署你自己的插件，建议在宿主程序根目录添加对应的部署文件（譬如：`xxx.deploy`），然后编辑 “`deploy-debug.bat`” 或 “`deploy-release.bat`” 文件，在命令参数部分加上你的部署文件名即可，大致如下所示：<br />
> `Zongsoft.Utilities.Deployer.exe -edition:Debug ".deploy" "xxx.deploy"`


<a name="other"></a>
## 其他

最后，希望你能喜欢 _**Zongsoft**_ 面向服务的插件架构和插件化开发方式。


<a name="contribution"></a>
## 贡献

请不要在项目的 **I**ssues 中提交询问(**Q**uestion)以及咨询讨论，**I**ssue 是用来报告问题(**B**ug)和功能特性(**F**eature)。如果你希望参与贡献，欢迎提交 代码合并请求(_[**P**ull**R**equest](https://github.com/Zongsoft/Zongsoft.Security/pulls)_) 或问题反馈(_[**I**ssue](https://github.com/Zongsoft/Zongsoft.Security/issues)_)。

对于新功能，请务必创建一个功能反馈(_[**I**ssue](https://github.com/Zongsoft/Zongsoft.Security/issues)_)来详细描述你的建议，以便我们进行充分讨论，这也将使我们更好的协调工作防止重复开发，并帮助你调整建议或需求，使之成功地被接受到项目中。

欢迎你为我们的开源项目撰写文章进行推广，如果需要我们在官网(_[http://zongsoft.com/blog](http://zongsoft.com/blog)_) 中转发你的文章、博客、视频等可通过 [**电子邮件**](mailto:zongsoft@qq.com) 联系我们。

> 强烈推荐阅读 [《提问的智慧》](https://github.com/ryanhanwu/How-To-Ask-Questions-The-Smart-Way/blob/master/README-zh_CN.md)、[《如何向开源社区提问题》](https://github.com/seajs/seajs/issues/545) 和 [《如何有效地报告 Bug》](http://www.chiark.greenend.org.uk/~sgtatham/bugs-cn.html)、[《如何向开源项目提交无法解答的问题》](https://zhuanlan.zhihu.com/p/25795393)，更好的问题更容易获得帮助。


<a name="sponsor"></a>
### 支持赞助

非常期待您的支持与赞助，可以通过下面几种方式为我们提供必要的资金支持：

1. 关注 **Zongsoft 微信公众号**，对我们的文章进行打赏；
2. 加入 [**Zongsoft 知识星球号**](https://t.zsxq.com/2nyjqrr)，可以获得在线问答和技术支持；
3. 如果您的企业需要现场技术支持与辅导，又或者需要特定新功能、即刻的错误修复等请[发邮件](mailto:zongsoft@qq.com)给我。

[![微信公号](https://raw.githubusercontent.com/Zongsoft/Guidelines/master/zongsoft-qrcode%28wechat%29.png)](http://weixin.qq.com/r/zy-g_GnEWTQmrS2b93rd)

[![知识星球](https://raw.githubusercontent.com/Zongsoft/Guidelines/master/zongsoft-qrcode%28zsxq%29.png)](https://t.zsxq.com/2nyjqrr)
