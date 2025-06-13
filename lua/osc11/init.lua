--- *OSC11* Terminal OSC 11 theme synchronization
--- *Osc11*
---
--- MIT License
---
--- ==============================================================================
---
--- Features:
--- - Automatic detection of terminal light/dark theme changes via OSC 11
--- - Configurable callbacks for light and dark theme switches

-- Module definition ==========================================================
local OSC11 = {}
local H = {}

--- Module setup
---
---@param config table|nil Module config table.
OSC11.setup = function(config)
    -- Setup config
    config = H.setup_config(config)

    -- Apply config and enable immediately
    H.apply_config(config)
end

--- Module config
OSC11.config = {
    -- Function to call when switching to dark theme
    on_dark = nil,

    -- Function to call when switching to light theme
    on_light = nil,
}

-- Helper data ================================================================
-- Module default config
H.default_config = vim.deepcopy(OSC11.config)

-- Helper functionality =======================================================
-- Settings -------------------------------------------------------------------
H.setup_config = function(config)
    H.check_type("config", config, "table", true)
    config = vim.tbl_deep_extend("force", vim.deepcopy(H.default_config), config or {})

    H.check_type("on_dark", config.on_dark, "callable", true)
    H.check_type("on_light", config.on_light, "callable", true)

    return config
end

H.apply_config = function(config)
    OSC11.config = config

    -- Set up listener for OSC 11 responses
    H.setup_osc11_listener()
end

-- Core functionality ---------------------------------------------------------
H.setup_osc11_listener = function()
    vim.api.nvim_create_autocmd('TermResponse', {
        pattern = "*",
        callback = function(args)
            local sequence = args.data.sequence

            local theme = H.parse_osc11_response(sequence)
            if theme then
                H.handle_theme_change(theme)
            end
        end,
    })
end

-- Theme handling -------------------------------------------------------------
H.handle_theme_change = function(theme)
    vim.schedule(function()
        if theme == "dark" and OSC11.config.on_dark then
            OSC11.config.on_dark()
        elseif theme == "light" and OSC11.config.on_light then
            OSC11.config.on_light()
        end

        vim.cmd("redraw!")
    end)
end

H.parse_osc11_response = function(sequence)
    local r, g, b = sequence:match("\027%]11;rgb:(%x+)/(%x+)/(%x+)")

    if r and g and b then
        -- Convert hex to decimal and calculate luminance
        local rr = tonumber(r, 16) / 65535
        local gg = tonumber(g, 16) / 65535
        local bb = tonumber(b, 16) / 65535

        -- Same luminance calculation as Neovim uses
        local luminance = (0.299 * rr) + (0.587 * gg) + (0.114 * bb)

        return luminance < 0.5 and 'dark' or 'light'
    end

    return nil
end

-- Utilities ------------------------------------------------------------------
H.error = function(msg)
    error("(OSC11) " .. msg, 0)
end

H.check_type = function(name, val, ref, allow_nil)
    if
        type(val) == ref
        or (ref == "callable" and vim.is_callable(val))
        or (allow_nil and val == nil)
    then
        return
    end
    H.error(
        string.format("`%s` should be %s, not %s", name, ref, type(val))
    )
end

return OSC11
