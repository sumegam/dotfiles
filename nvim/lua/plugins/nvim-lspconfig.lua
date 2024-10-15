local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', vim.tbl_extend('force', opts, {desc = 'Go to declaration'}))
  vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', vim.tbl_extend('force', opts, {desc = 'Go to definition'}))
  vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', vim.tbl_extend('force', opts, {desc = 'Hover documentation'}))
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', vim.tbl_extend('force', opts, {desc = 'Go to implementation'}))
  vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', vim.tbl_extend('force', opts, {desc = 'Signature help'}))
  vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', vim.tbl_extend('force', opts, {desc = 'Add workspace folder'}))
  vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', vim.tbl_extend('force', opts, {desc = 'Remove workspace folder'}))
  vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', vim.tbl_extend('force', opts, {desc = 'List workspace folders'}))
  vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', vim.tbl_extend('force', opts, {desc = 'Type definition'}))
  vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', vim.tbl_extend('force', opts, {desc = 'Rename symbol'}))
  vim.keymap.set('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', vim.tbl_extend('force', opts, {desc = 'Code action'}))
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', vim.tbl_extend('force', opts, {desc = 'Go to references'}))
  vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', vim.tbl_extend('force', opts, {desc = 'Open diagnostic float'}))
  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', vim.tbl_extend('force', opts, {desc = 'Previous diagnostic'}))
  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', vim.tbl_extend('force', opts, {desc = 'Next diagnostic'}))
  vim.keymap.set('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', vim.tbl_extend('force', opts, {desc = 'Set location list'}))
  vim.keymap.set('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', vim.tbl_extend('force', opts, {desc = 'Format buffer'}))

  -- -- Show diagnostics on hover
  -- vim.cmd 'autocmd CursorHold <buffer> lua vim.diagnostic.open_float()'

  -- Configure LSP signature plugin
  require'lsp_signature'.on_attach({
    bind = true,
    handler_opts = {
      border = "rounded"
    },
  })
end

servers_with_settings = {
  lua_ls = {
    settings = {},
  },
  pyright = {
    settings = {},
  },
  pylsp = {
    settings = {},
  },
  html = {
    settings = {},
  },
  cssls = {
    settings = {},
  },
  eslint = {
    settings = {},
  },
}

get_server_names = function(servers_table)
  server_names = {}

  for server_name, _ in pairs(servers_table) do
    table.insert(server_names, server_name)
  end

  return server_names
end

return {
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require'lsp_signature'.setup(opts) end
  },
  {
    "williamboman/mason.nvim",
    -- cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = get_server_names(servers_with_settings),
    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    opts = {
        -- options for vim.diagnostic.config()
        diagnostics = {
          underline = true,
          update_in_insert = false,
          virtual_text = {
            spacing = 4,
            source = "if_many",
            prefix = "●",
            -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
            -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
            -- prefix = "icons",
          },
          severity_sort = true,
          -- signs = {
          --   text = {
          --     [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
          --     [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
          --     [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
          --     [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
          --   },
          -- },
        },
        -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
        -- Be aware that you also will need to properly configure your LSP server to
        -- provide the inlay hints.
        inlay_hints = {
          enabled = true,
          exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
        },
        -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
        -- Be aware that you also will need to properly configure your LSP server to
        -- provide the code lenses.
        codelens = {
          enabled = false,
        },
        -- Enable lsp cursor word highlighting
        document_highlight = {
          enabled = true,
        },
        -- add any global capabilities here
        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        },
        -- options for vim.lsp.buf.format
        -- `bufnr` and `filter` is handled by the LazyVim formatter,
        -- but can be also overridden when specified
        format = {
          formatting_options = nil,
          timeout_ms = nil,
        },
        -- LSP Server Settings
        ---@type lspconfig.options
        servers = servers_with_settings,
        -- -- you can do any additional lsp server setup here
        -- -- return true if you don't want this server to be setup with lspconfig
        -- ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
        setup = {
          -- example to setup with typescript.nvim
          -- tsserver = function(_, opts)
          --   require("typescript").setup({ server = opts })
          --   return true
          -- end,
          -- Specify * to use this function as a fallback for any server
          -- ["*"] = function(server, opts) end,
        },
    },
    config = function(_, opts)
      if vim.fn.has("nvim-0.10.0") == 0 then
        if type(opts.diagnostics.signs) ~= "boolean" then
          for severity, icon in pairs(opts.diagnostics.signs.text) do
            local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
            name = "DiagnosticSign" .. name
            vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
          end
        end
      end

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      local servers = opts.servers
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        opts.capabilities or {}
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        -- Dynamic definition of root_dir
        if server == "eslint" or server == "tsserver" then
          server_opts.root_dir = function(fname)
            local util = require("lspconfig").util
            return util.root_pattern('tsconfig.json')(fname) or util.find_git_ancestor(fname)
          end
        end

        server_opts.on_attach = on_attach

        if server_opts.enabled == false then
          return
        end

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      -- get all the servers that are available through mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {} ---@type string[]
      for server_name, _ in pairs(servers_with_settings) do
        setup(server_name)
      end
    end,
  },
  -- cmdline tools and lsp servers
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
}
