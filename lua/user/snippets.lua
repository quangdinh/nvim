local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
  return
end

local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.conditions")
-- local conds_expand = require("luasnip.extras.conditions.expand")

ls.add_snippets("go", {
  s(
    "test",
    fmt(
      [[
    func Test{}(t *testing.T) {{
      {}
    }}
    ]],
      {
        i(1, "Name"),
        i(0),
      }
    )
  ),
  s(
    "oerr",
    fmt(
      [[
      {}, {} := {}({})
      if {} := nil {{
        {}
      }}
      ]],
      {
        i(1, "value"),
        i(2, "err"),
        i(3, "function"),
        i(4),
        rep(2),
        i(0, "//do something with error"),
      }
    )
  ),
  s(
    "forr",
    fmt(
      [[
      for {}, {} := range {} {{
        {}
      }}
      ]],
      {
        i(1, "index"),
        i(2, "value"),
        i(3, "slice"),
        i(0, "// do something within the loop"),
      }
    )
  ),
  s(
    "ims",
    fmt(
      [[
      import (
        {}
      )
      ]],
      {
        i(0),
      }
    )
  ),
  s(
    "ife",
    fmt(
      [[
      if {} != nil {{
        {}
      }}
      ]],
      {
        i(1, "err"),
        i(0),
      }
    )
  ),
  s(
    "ifok",
    fmt(
      [[
      if {}, {} := {}({}); {} {{
        {}
      }}
      ]],
      {
        i(1, "value"),
        i(2, "ok"),
        i(3, "function"),
        i(4),
        rep(2),
        i(0, "// do something"),
      }
    )
  ),
  s(
    "in",
    fmt(
      [[
      type {} interface {{
        {}
      }}
      ]],
      {
        i(1, "interfaceName"),
        i(0, "// Interface functions"),
      }
    )
  ),
  s(
    "st",
    fmt(
      [[
      type {} struct {{
        {}
      }}
      ]],
      {
        i(1, "structName"),
        i(0, "// Struct fields"),
      }
    )
  ),
  s("js", fmt('`json:"{}"`', { i(0, "jsonFieldName") })),
})
