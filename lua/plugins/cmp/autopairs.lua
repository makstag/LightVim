require("nvim-autopairs").setup({
    check_ts = true,
    ts_config = {
        cmake = { "string", "source" },
        cpp = { "string", "source" },
        c = { "string", "source" }
    },
    disable_filetype = { "TelescopePrompt", "specter_panel" },
    fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        offset = 0, -- Offset from pattern match
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr"
    }
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })