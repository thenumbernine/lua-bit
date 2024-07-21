package = "bit"
version = "dev-1"
source = {
	url = "git+https://github.com/thenumbernine/lua-bit"
}
description = {
	summary = "for lua compatability with the luajit bit library",
	detailed = [[
for lua compatability with the luajit bit library
]],
	homepage = "https://github.com/thenumbernine/lua-bit",
	license = "MIT"
}
dependencies = {
	"lua >= 5.1",
}
build = {
	type = "builtin",
	modules = {
		bit = "bit.lua"
	}
}
