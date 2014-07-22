#!/bin/sh

cp ../../Zongsoft.Plugins/Main.plugin .
cp ../../Zongsoft.Web.Plugins/Web.plugin .

if [ ! -d 'views' ]; then
	mkdir views
fi

cp ../../Zongsoft.Web.Plugins/Mvc/Views/*.aspx	./views/

