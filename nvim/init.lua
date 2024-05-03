require("config.lazy")

require("neocord").setup({
  logo = "auto",                     -- "auto" or url
  logo_tooltip = nil,                -- nil or string
  main_image = "logo",               -- "language" or "logo"
  client_id = "1157438221865717891", -- Use your own Discord application client id (not recommended)
  log_level = nil,                   -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
  debounce_timeout = 10,             -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
  blacklist = {},                    -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
  file_assets = {},                  -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
  show_time = true,                  -- Show the timer
  global_timer = true,               -- if set true, timer won't update when any event are triggered

  -- Rich Presence text options
  editing_text = "Editing %s",              -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
  file_explorer_text = "Browsing %s",       -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
  git_commit_text = "Committing changes",   -- Format string rendered when committing changes in git (either string or function(filename: string): string)
  plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
  reading_text = "Reading %s",              -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
  workspace_text = "Working on %s",         -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
  line_number_text = "Line %s out of %s",   -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
  terminal_text = "Using Terminal",         -- Format string rendered when in terminal mode.
})

require("nvim-highlight-colors").setup {
  ---Render style
  ---@usage 'background'|'foreground'|'virtual'
  render = 'background',

  ---Set virtual symbol (requires render to be set to 'virtual')
  virtual_symbol = '■',

  ---Highlight named colors, e.g. 'green'
  enable_named_colors = true,

  ---Highlight tailwind colors, e.g. 'bg-blue-500'
  enable_tailwind = false,

  ---Set custom colors
  ---Label must be properly escaped with '%' to adhere to `string.gmatch`
  --- :help string.gmatch
  custom_colors = {
    { label = '%-%-theme%-primary%-color',   color = '#0f1219' },
    { label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
  }
}
