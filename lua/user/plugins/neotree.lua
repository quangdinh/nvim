local config = {
  sources = { "filesystem", "git_status", "document_symbols" },
  log_level = "error", -- "trace", "debug", "info", "warn", "error", "fatal"
  source_selector = {
    winbar = true,    -- toggle to show selector on winbar
    sources = {
      { source = "filesystem", display_name = " 󰉓 Files " },
      { source = "git_status", display_name = " 󰊢 Git " },
      { source = "document_symbols" },
    },
  },
  default_component_configs = {
    diagnostics = {
      symbols = { hint = "", info = "󰋽", warn = "", error = "" },
      highlights = {
        hint = "DiagnosticSignHint",
        info = "DiagnosticSignInfo",
        warn = "DiagnosticSignWarn",
        error = "DiagnosticSignError",
      },
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "󰜌",
      folder_empty_open = "󰜌",
    },
    modified = { symbol = "[+] " },
    git_status = {
      symbols = {
        -- Change type
        added = "", -- NOTE: you can set any of these to an empty string to not show them
        deleted = "",
        modified = "",
        renamed = "",
        -- Status type
        untracked = "",
        ignored = "",
        unstaged = "󰄱",
        staged = "",
        conflict = "",
      },
      align = "right",
    },
  },

  window = {                 -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
    -- possible options. These can also be functions that return these options.
    position = "left",       -- left, right, top, bottom, float, current
    width = 40,              -- applies to left and right positions
    height = 15,             -- applies to top and bottom positions
    auto_expand_width = false, -- expand the window when file exceeds the window width. does not work with position = "float"
    popup = {                -- settings that apply to float position only
      size = { height = "80%", width = "50%" },
      position = "50%",      -- 50% means center it
      -- you can also specify border here, if you want a different setting from
      -- the global popup_border_style.
    },
    same_level = false, -- Create and paste/move files/directories on the same level as the directory under cursor (as opposed to within the directory under cursor).
    insert_as = "child", -- Affects how nodes get inserted into the tree during creation/pasting/moving of files if the node under the cursor is a directory:
    -- "child":   Insert nodes as children of the directory under cursor.
    -- "sibling": Insert nodes  as siblings of the directory under cursor.
    -- Mappings for tree window. See `:h neo-tree-mappings` for a list of built-in commands.
    -- You can also create your own commands by providing a function instead of a string.
    mapping_options = { noremap = true, nowait = true },
    mappings = {
      ["<space>"] = {
        "toggle_node",
        nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
      },
      ["<2-LeftMouse>"] = "open",
      ["<cr>"] = "open",
      ["<esc>"] = "revert_preview",
      ["P"] = { "toggle_preview", config = { use_float = true } },
      ["l"] = "focus_preview",
      ["S"] = "open_split",
      -- ["S"] = "split_with_window_picker",
      ["s"] = "open_vsplit",
      -- ["s"] = "vsplit_with_window_picker",
      ["t"] = "open_tabnew",
      -- ["<cr>"] = "open_drop",
      -- ["t"] = "open_tab_drop",
      ["w"] = "open_with_window_picker",
      ["C"] = "close_node",
      ["z"] = "close_all_nodes",
      -- ["Z"] = "expand_all_nodes",
      ["R"] = "refresh",
      ["a"] = {
        "add",
        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
        config = {
          show_path = "none", -- "none", "relative", "absolute"
        },
      },
      ["A"] = "add_directory", -- also accepts the config.show_path and config.insert_as options.
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["c"] = "copy", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
      ["m"] = "move", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
      ["e"] = "toggle_auto_expand_width",
      ["q"] = "close_window",
      ["?"] = "show_help",
      ["<Tab>"] = "next_source",
      ["<"] = "prev_source",
      [">"] = "next_source",
    },
  },
  filesystem = {
    window = {
      mappings = {
        ["H"] = "toggle_hidden",
        ["/"] = "fuzzy_finder",
        ["D"] = "fuzzy_finder_directory",
        -- ["/"] = "filter_as_you_type", -- this was the default until v1.28
        ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
        -- ["D"] = "fuzzy_sorter_directory",
        ["f"] = "filter_on_submit",
        ["<C-x>"] = "clear_filter",
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["[g"] = "prev_git_modified",
        ["]g"] = "next_git_modified",
      },
      fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
        ["<down>"] = "move_cursor_down",
        ["<C-n>"] = "move_cursor_down",
        ["<up>"] = "move_cursor_up",
        ["<C-p>"] = "move_cursor_up",
      },
    },
    async_directory_scan = "auto", -- "auto"   means refreshes are async, but it's synchronous when called from the Neotree commands.
    -- "always" means directory scans are always async.
    -- "never"  means directory scans are never async.
    scan_mode = "shallow", -- "shallow": Don't scan into directories to detect possible empty directory a priori
    -- "deep": Scan into directories to detect empty or grouped empty directories a priori.
    bind_to_cwd = true,  -- true creates a 2-way binding between vim's cwd and neo-tree's root
    cwd_target = {
      sidebar = "tab",   -- sidebar is when position = left or right
      current = "window", -- current is when position = current
    },
    -- The renderer section provides the renderers that will be used to render the tree.
    --   The first level is the node type.
    --   For each node type, you can specify a list of components to render.
    --       Components are rendered in the order they are specified.
    --         The first field in each component is the name of the function to call.
    --         The rest of the fields are passed to the function as the "config" argument.
    filtered_items = {
      visible = false,                    -- when true, they will just be displayed differently than normal items
      force_visible_in_empty_folder = false, -- when true, hidden files will be shown if the root folder is otherwise empty
      show_hidden_count = true,           -- when true, the number of hidden items in each folder will be shown as the last entry
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_hidden = true, -- only works on Windows for hidden files/directories
      hide_by_name = {
        ".DS_Store",
        "thumbs.db",
        -- "node_modules",
      },
      hide_by_pattern = { -- uses glob style patterns
        -- "*.meta",
        -- "*/src/*/tsconfig.json"
      },
      always_show = { -- remains visible even if other settings would normally hide it
        -- ".gitignored",
      },
      never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
        -- ".DS_Store",
        -- "thumbs.db"
      },
      never_show_by_pattern = { -- uses glob style patterns
        -- ".null-ls_*",
      },
    },
    find_by_full_path_words = false, -- `false` means it only searches the tail of a path.
    -- `true` will change the filter into a full path
    -- search with space as an implicit ".*", so
    -- `fi init`
    -- will match: `./sources/filesystem/init.lua
    -- find_command = "fd", -- this is determined automatically, you probably don't need to set it
    -- find_args = {  -- you can specify extra args to pass to the find command.
    --  fd = {
    --  "--exclude", ".git",
    --  "--exclude",  "node_modules"
    --  }
    -- },
    ---- or use a function instead of list of strings
    -- find_args = function(cmd, path, search_term, args)
    --  if cmd ~= "fd" then
    --    return args
    --  end
    --  --maybe you want to force the filter to always include hidden files:
    --  table.insert(args, "--hidden")
    --  -- but no one ever wants to see .git files
    --  table.insert(args, "--exclude")
    --  table.insert(args, ".git")
    --  -- or node_modules
    --  table.insert(args, "--exclude")
    --  table.insert(args, "node_modules")
    --  --here is where it pays to use the function, you can exclude more for
    --  --short search terms, or vary based on the directory
    --  if string.len(search_term) < 4 and path == "/home/cseickel" then
    --    table.insert(args, "--exclude")
    --    table.insert(args, "Library")
    --  end
    --  return args
    -- end,
    group_empty_dirs = false,              -- when true, empty folders will be grouped together
    search_limit = 50,                     -- max number of search results when using filters
    follow_current_file = { enable = true }, -- This will find and focus the file in the active buffer every time
    -- the current file is changed while the tree is open.
    hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
    -- in whatever position is specified in window.position
    -- "open_current",-- netrw disabled, opening a directory opens within the
    -- window like netrw would, regardless of window.position
    -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
    -- instead of relying on nvim autocmd events.
  },
  buffers = {
    bind_to_cwd = true,
    follow_current_file = { enable = true }, -- This will find and focus the file in the active buffer every time
    -- the current file is changed while the tree is open.
    group_empty_dirs = true,               -- when true, empty directories will be grouped together
    show_unloaded = false,                 -- When working with sessions, for example, restored but unfocused buffers
    -- are mark as "unloaded". Turn this on to view these unloaded buffer.
    window = {
      mappings = {
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["bd"] = "buffer_delete",
      },
    },
  },
  git_status = {
    window = {
      mappings = {
        ["A"] = "git_add_all",
        ["gu"] = "git_unstage_file",
        ["ga"] = "git_add_file",
        ["gr"] = "git_revert_file",
        ["gc"] = "git_commit",
        ["gp"] = "git_push",
        ["gg"] = "git_commit_and_push",
      },
    },
  },
  document_symbols = {
    kinds = {
      File = { icon = "󰈙", hl = "Tag" },
      Namespace = { icon = "󰌗", hl = "Include" },
      Package = { icon = "󰏖", hl = "Label" },
      Class = { icon = "󰌗", hl = "Include" },
      Property = { icon = "󰆧", hl = "@property" },
      Enum = { icon = "󰒻", hl = "@number" },
      Function = { icon = "󰊕", hl = "Function" },
      String = { icon = "󰀬", hl = "String" },
      Number = { icon = "󰎠", hl = "Number" },
      Array = { icon = "󰅪", hl = "Type" },
      Object = { icon = "󰅩", hl = "Type" },
      Key = { icon = "󰌋", hl = "" },
      Struct = { icon = "󰌗", hl = "Type" },
      Operator = { icon = "󰆕", hl = "Operator" },
      TypeParameter = { icon = "󰊄", hl = "Type" },
      StaticMethod = { icon = "󰠄 ", hl = "Function" },
    },
  },
  example = {
    renderers = {
      custom = { { "indent" }, { "icon", default = "C" }, { "custom" }, { "name" } },
    },
    window = {
      mappings = {
        ["<cr>"] = "toggle_node",
        ["<C-e>"] = "example_command",
        ["d"] = "show_debug_info",
      },
    },
  },
}

local M = {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  config = function()
    local neotree = require("neo-tree")
    neotree.setup(config)
  end,
}

return M
