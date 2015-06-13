Zongsoft.Web.Launcher
=====================

这是一个ASP.NET MVC应用的宿主程序，支持可插拔的插件式的开发、部署。

## 关于运行

本项目定义了编译前事件，当开始编译时会自动执行项目目录中的 `deploy-debug.bat` 或 `deploy-release.bat` 脚本以部署相关插件、配置、视图等文件。更多关于部署的信息请参考：Zongsoft.Utilities.Deployer 项目说明。
