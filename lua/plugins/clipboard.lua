return {
  "ojroques/nvim-osc52",
  config = function()
    require("osc52").setup({})  -- defaults are fine

    -- Make OSC52 the clipboard provider
    local function copy(lines, _)
      require("osc52").copy(table.concat(lines, "\n"))
    end
    local function paste()
      return { vim.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
    end
    vim.g.clipboard = {
      name = "osc52",
      copy = { ["+"] = copy, ["*"] = copy },
      paste = { ["+"] = paste, ["*"] = paste },
    }

    -- Use system clipboard by default
    vim.opt.clipboard = "unnamedplus"
  end,
}
