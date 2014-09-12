Zongsoft.Web.Launcher
=====================

这是一个ASP.NET MVC应用的宿主程序，支持可插拔的插件式的开发、部署。

## 关于运行

编译成功后，请首先执行 plugins 文件夹中的 `Update.bat(Windows)` 或 `update.sh(Linux)` 脚本文件。该Shell脚本会将 `/Zongsoft.Plugins/Main.plugin` 和 `/Zongsoft.Web.Plugins/Web.plugin` 两个插件文件复制到本项目的 plugins 目录中，以及将 `/Zongsoft.Web.Plugins/Mvc/Views` 目录中的Web页面文件复制到 plugins/views 目录中。因此，如果上述目录中的源文件发生了改变，可根据需要重新执行 `update.bat` 或 `update.sh` 脚本文件以获取最新版本。
