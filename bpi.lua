require("luasnip.session.snippet_collection").clear_snippets("bpi")
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_mode

local fmt = require("luasnip.extras.fmt").fmt
ls.add_snippets("bpi", {
	s("tt", fmt("filename: {}\nsource: {}", { i(1), i(0) })),
})
