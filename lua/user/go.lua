--[[ -- NOTE: all LSP and formatting related options are disabeld. ]]
--[[ -- NOTE: LSP is handled by lsp.lua and formatting is handled by null-ls.lua ]]
--[[ -- NOTE: via `lsp_on_attach` the custom callback used by all other LSPs is called ]]
--[[ require("go").setup({ ]]
--[[   go = "go", -- go command, can be go[default] or go1.18beta1 ]]
--[[   goimport = "gopls", -- goimport command, can be gopls[default] or goimport ]]
--[[   fillstruct = "gopls", -- can be nil (use fillstruct, slower) and gopls ]]
--[[   gofmt = "gofumpt", -- gofmt cmd, ]]
--[[   max_line_len = 120, -- max line length in goline format ]]
--[[   tag_transform = false, -- tag_transfer  check gomodifytags for details ]]
--[[   test_template = "", -- default to testify if not set; g:go_nvim_tests_template  check gotests for details ]]
--[[   test_template_dir = "", -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details ]]
--[[   comment_placeholder = "", -- comment_placeholder your cool placeholder e.g. ﳑ        ]]
--[[   icons = { breakpoint = "🧘", currentpos = "🏃" }, ]]
--[[   verbose = false, -- output loginf in messages ]]
--[[   lsp_cfg = true, -- true: use non-default gopls setup specified in go/lsp.lua ]]
--[[   -- false: do nothing ]]
--[[   -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g. ]]
--[[   --   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}} ]]
--[[   lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt ]]
--[[   lsp_on_attach = function(client, bufnr) ]]
--[[     require("functions").custom_lsp_attach(client, bufnr) ]]
--[[     local wk = require("which-key") ]]
--[[     local default_options = { silent = true } ]]
--[[     wk.register({ ]]
--[[       c = { ]]
--[[         name = "Coding", ]]
--[[         a = { "<cmd>GoCodeAction<cr>", "Code action" }, ]]
--[[         e = { "<cmd>GoIfErr<cr>", "Add if err" }, ]]
--[[         h = { ]]
--[[           name = "Helper", ]]
--[[           a = { "<cmd>GoAddTag<cr>", "Add tags to struct" }, ]]
--[[           r = { "<cmd>GoRMTag<cr>", "Remove tags to struct" }, ]]
--[[           c = { "<cmd>GoCoverage<cr>", "Test coverage" }, ]]
--[[           g = { "<cmd>lua require('go.comment').gen()<cr>", "Generate comment" }, ]]
--[[           v = { "<cmd>GoVet<cr>", "Go vet" }, ]]
--[[           t = { "<cmd>GoModTidy<cr>", "Go mod tidy" }, ]]
--[[           i = { "<cmd>GoModInit<cr>", "Go mod init" }, ]]
--[[         }, ]]
--[[         i = { "<cmd>GoToggleInlay<cr>", "Toggle inlay" }, ]]
--[[         l = { "<cmd>GoLint<cr>", "Run linter" }, ]]
--[[         o = { "<cmd>GoPkgOutline<cr>", "Outline" }, ]]
--[[         r = { "<cmd>GoRun<cr>", "Run" }, ]]
--[[         s = { "<cmd>GoFillStruct<cr>", "Autofill struct" }, ]]
--[[         t = { ]]
--[[           name = "Tests", ]]
--[[           r = { "<cmd>GoTest<cr>", "Run tests" }, ]]
--[[           a = { "<cmd>GoAlt!<cr>", "Open alt file" }, ]]
--[[           s = { "<cmd>GoAltS!<cr>", "Open alt file in split" }, ]]
--[[           v = { "<cmd>GoAltV!<cr>", "Open alt file in vertical split" }, ]]
--[[           u = { "<cmd>GoTestFunc<cr>", "Run test for current func" }, ]]
--[[           f = { "<cmd>GoTestFile<cr>", "Run test for current file" }, ]]
--[[         }, ]]
--[[         x = { ]]
--[[           name = "Code Lens", ]]
--[[           l = { "<cmd>GoCodeLenAct<cr>", "Toggle Lens" }, ]]
--[[           a = { "<cmd>GoCodeAction<cr>", "Code Action" }, ]]
--[[         }, ]]
--[[       }, ]]
--[[     }, { prefix = "<leader>", mode = "n", default_options }) ]]
--[[     wk.register({ ]]
--[[       c = { ]]
--[[         name = "Coding", ]]
--[[         j = { "<cmd>'<,'>GoJson2Struct<cr>", "Json to struct" }, ]]
--[[       }, ]]
--[[     }, { prefix = "<leader>", mode = "v", default_options }) ]]
--[[   end, -- nil: use on_attach function defined in go/lsp.lua, ]]
--[[   --      when lsp_cfg is true ]]
--[[   -- if lsp_on_attach is a function: use this function as on_attach function for gopls ]]
--[[   lsp_codelens = true, -- set to false to disable codelens, true by default ]]
--[[   lsp_keymaps = false, -- set to false to disable gopls/lsp keymap ]]
--[[   lsp_diag_hdlr = true, -- hook lsp diag handler ]]
--[[   lsp_diag_virtual_text = { space = 0, prefix = "" }, -- virtual text setup ]]
--[[   lsp_diag_signs = true, ]]
--[[   lsp_diag_update_in_insert = true, ]]
--[[   lsp_document_formatting = false, ]]
--[[   -- set to true: use gopls to format ]]
--[[   -- false if you want to use other formatter tool(e.g. efm, nulls) ]]
--[[   lsp_inlay_hints = { ]]
--[[     enable = true, ]]
--[[     -- Only show inlay hints for the current line ]]
--[[     only_current_line = false, ]]
--[[     -- Event which triggers a refersh of the inlay hints. ]]
--[[     -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but ]]
--[[     -- not that this may cause higher CPU usage. ]]
--[[     -- This option is only respected when only_current_line and ]]
--[[     -- autoSetHints both are true. ]]
--[[     only_current_line_autocmd = "CursorHold", ]]
--[[     -- whether to show variable name before type hints with the inlay hints or not ]]
--[[     -- default: false ]]
--[[     show_variable_name = true, ]]
--[[     -- prefix for parameter hints ]]
--[[     parameter_hints_prefix = " ", ]]
--[[     show_parameter_hints = true, ]]
--[[     -- prefix for all the other hints (type, chaining) ]]
--[[     other_hints_prefix = "=> ", ]]
--[[     -- whether to align to the length of the longest line in the file ]]
--[[     max_len_align = false, ]]
--[[     -- padding from the left if max_len_align is true ]]
--[[     max_len_align_padding = 1, ]]
--[[     -- whether to align to the extreme right or not ]]
--[[     right_align = false, ]]
--[[     -- padding from the right if right_align is true ]]
--[[     right_align_padding = 6, ]]
--[[     -- The color of the hints ]]
--[[     highlight = "Comment", ]]
--[[   }, ]]
--[[   gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" } ]]
--[[   gopls_remote_auto = true, -- add -remote=auto to gopls ]]
--[[   gocoverage_sign = "█", ]]
--[[   dap_debug = false, -- set to false to disable dap ]]
--[[   dap_debug_keymap = false, -- true: use keymap for debugger defined in go/dap.lua ]]
--[[   -- false: do not use keymap in go/dap.lua.  you must define your own. ]]
--[[   dap_debug_gui = false, -- set to true to enable dap gui, highly recommended ]]
--[[   dap_debug_vt = false, -- set to true to enable dap virtual text ]]
--[[   build_tags = "", -- set default build tags ]]
--[[   textobjects = true, -- enable default text jobects through treesittter-text-objects ]]
--[[   test_runner = "go", -- richgo, go test, richgo, dlv, ginkgo ]]
--[[   run_in_floaterm = false, -- set to true to run in float window. ]]
--[[   -- float term recommended if you use richgo/ginkgo with terminal color ]]
--[[   luasnip = true, ]]
--[[ }) ]]
--[[]]
--[[]]
--[[]]
--[[]]
return {
  init = function(use, mason_install)
    -- use {
    --   'ray-x/go.nvim',
    --   require = 'ray-x/guihua.lua', -- floating window support
    --   config = function()
    --     require('go').setup()
    --   end
    -- }

    mason_install('delve')

    local go_augroup = vim.api.nvim_create_augroup('GoConfig', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter' }, {
      group = go_augroup,
      pattern = '*.go',
      command = "setlocal noexpandtab"
    })
  end,
  lsp = function(setup_lsp)
    setup_lsp('gopls', {
      staticcheck = true,
      codelenses = {
        generate = true
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    })
    -- local api = vim.api
    -- local inlays = {}
    -- local config

    -- -- Update inlay hints when opening a new buffer and when writing a buffer to a
    -- -- file
    -- -- opts is a string representation of the table of options
    -- function inlays.setup()
    --   local events = { 'BufWritePost', 'CursorHold' }
    --   config = {
    --     enable = true,
    --     -- Only show inlay hints for the current line
    --     only_current_line = false,
    --     -- Event which triggers a refersh of the inlay hints.
    --     -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
    --     -- not that this may cause higher CPU usage.
    --     -- This option is only respected when only_current_line and
    --     -- autoSetHints both are true.
    --     only_current_line_autocmd = "CursorHold",
    --     -- whether to show variable name before type hints with the inlay hints or not
    --     -- default: false
    --     show_variable_name = true,
    --     -- prefix for parameter hints
    --     parameter_hints_prefix = " ",
    --     show_parameter_hints = true,
    --     -- prefix for all the other hints (type, chaining)
    --     other_hints_prefix = "=> ",
    --     -- whether to align to the lenght of the longest line in the file
    --     max_len_align = false,
    --     -- padding from the left if max_len_align is true
    --     max_len_align_padding = 1,
    --     -- whether to align to the extreme right or not
    --     right_align = false,
    --     -- padding from the right if right_align is true
    --     right_align_padding = 6,
    --     -- The color of the hints
    --     highlight = "Comment",
    --   }
    --   if config.only_current_line then
    --     local user_events = vim.split(config.only_current_line_autocmd, ',')
    --     events = vim.tbl_extend('keep', events, user_events)
    --   end

    --   -- local cmd_group = api.nvim_create_augroup('gopls_inlay', {})
    --   -- api.nvim_create_autocmd(events, {
    --   --   group = cmd_group,
    --   --   pattern = { '*.go', '*.mod' },
    --   --   callback = function()
    --   --     require('go.inlay').set_inlay_hints()
    --   --   end,
    --   -- })

    --   -- api.nvim_create_user_command('GoToggleInlay', function(_)
    --   --   require('go.inlay').toggle_inlay_hints()
    --   -- end, { desc = 'toggle gopls inlay hints' })
    --   -- vim.defer_fn(function()
    --   --   require('go.inlay').set_inlay_hints()
    --   -- end, 1000)
    -- end

    -- local function get_params()
    --   local start_pos = api.nvim_buf_get_mark(0, '<')
    --   local end_pos = api.nvim_buf_get_mark(0, '>')
    --   local params = { range = { start = { character = 0, line = 0 }, ['end'] = { character = 0, line = 0 } } }
    --   local len = vim.api.nvim_buf_line_count(0)
    --   if end_pos[1] <= len then
    --     params = vim.lsp.util.make_given_range_params()
    --   end

    --   params['range']['start']['line'] = 0
    --   params['range']['end']['line'] = vim.api.nvim_buf_line_count(0) - 1
    --   return params
    -- end

    -- local namespace = vim.api.nvim_create_namespace('kasama/go/inlayHints')
    -- -- whether the hints are enabled or not
    -- local enabled = false

    -- -- parses the result into a easily parsable format
    -- -- input
    -- -- { {
    -- --     kind = 1,
    -- --     label = { {
    -- --         value = "[]int"
    -- --       } },
    -- --     paddingLeft = true,
    -- --     position = {
    -- --       character = 7,
    -- --       line = 8
    -- --     }
    -- --   }, {
    -- --     kind = 2,
    -- --     label = { {
    -- --         value = "stack:"
    -- --       } },
    -- --     paddingRight = true,
    -- --     position = {
    -- --       character = 29,
    -- --       line = 8
    -- --     }
    -- --   },

    -- -- example:
    -- -- {
    -- --  ["12"] = { {
    -- --      kind = "TypeHint",
    -- --      label = "String"
    -- --    } },
    -- -- }

    -- local function parseHints(result)
    --   local map = {}
    --   local only_current_line = config.only_current_line

    --   if type(result) ~= 'table' then
    --     return {}
    --   end
    --   for _, value in pairs(result) do
    --     local range = value.position
    --     local line = value.position.line
    --     local label = value.label
    --     local kind = value.kind
    --     local current_line = vim.api.nvim_win_get_cursor(0)[1]

    --     local function add_line()
    --       if map[line] ~= nil then
    --         table.insert(map[line], { label = label, kind = kind, range = range })
    --       else
    --         map[line] = { { label = label, kind = kind, range = range } }
    --       end
    --     end

    --     if only_current_line then
    --       if line == tostring(current_line - 1) then
    --         add_line()
    --       end
    --     else
    --       add_line()
    --     end
    --   end
    --   return map
    -- end

    -- local function get_max_len(bufnr, parsed_data)
    --   local max_len = -1

    --   for key, _ in pairs(parsed_data) do
    --     local line = tonumber(key)
    --     local current_line = vim.api.nvim_buf_get_lines(bufnr, line, line + 1, false)[1]
    --     if current_line then
    --       local current_line_len = string.len(current_line)
    --       max_len = math.max(max_len, current_line_len)
    --     end
    --   end

    --   return max_len
    -- end

    -- local function handler(err, result, ctx)
    --   if err then
    --     return
    --   end
    --   local bufnr = ctx.bufnr

    --   if vim.api.nvim_get_current_buf() ~= bufnr then
    --     return
    --   end

    --   local function unpack_label(label)
    --     local labels = ''
    --     for _, value in pairs(label) do
    --       labels = labels .. ' ' .. value.value
    --     end
    --     return labels
    --   end

    --   -- clean it up at first
    --   inlays.disable_inlay_hints()

    --   local parsed = parseHints(result)

    --   for key, value in pairs(parsed) do
    --     local virt_text = ''
    --     local line = tonumber(key)

    --     local current_line = vim.api.nvim_buf_get_lines(bufnr, line, line + 1, false)[1]

    --     if current_line then
    --       local current_line_len = string.len(current_line)

    --       local param_hints = {}
    --       local other_hints = {}

    --       -- segregate paramter hints and other hints
    --       for _, value_inner in ipairs(value) do
    --         if value_inner.kind == 2 then
    --           table.insert(param_hints, unpack_label(value_inner.label))
    --         end

    --         if value_inner.kind == 1 then
    --           table.insert(other_hints, value_inner)
    --         end
    --       end

    --       -- show parameter hints inside brackets with commas and a thin arrow
    --       if not vim.tbl_isempty(param_hints) and config.show_parameter_hints then
    --         virt_text = virt_text .. config.parameter_hints_prefix .. '('
    --         for i, value_inner_inner in ipairs(param_hints) do
    --           virt_text = virt_text .. value_inner_inner:sub(2, -2)
    --           if i ~= #param_hints then
    --             virt_text = virt_text .. ', '
    --           end
    --         end
    --         virt_text = virt_text .. ') '
    --       end

    --       -- show other hints with commas and a thicc arrow
    --       if not vim.tbl_isempty(other_hints) then
    --         virt_text = virt_text .. config.other_hints_prefix
    --         for i, value_inner_inner in ipairs(other_hints) do
    --           if value_inner_inner.kind == 2 and config.show_variable_name then
    --             local char_start = value_inner_inner.range.start.character
    --             local char_end = value_inner_inner.range['end'].character
    --             local variable_name = string.sub(current_line, char_start + 1, char_end)
    --             virt_text = virt_text .. variable_name .. ': ' .. value_inner_inner.label
    --           else
    --             local label = unpack_label(value_inner_inner.label)
    --             if string.sub(label, 1, 2) == ': ' then
    --               virt_text = virt_text .. label:sub(3)
    --             else
    --               virt_text = virt_text .. label
    --             end
    --           end
    --           if i ~= #other_hints then
    --             virt_text = virt_text .. ', '
    --           end
    --         end
    --       end

    --       if config.right_align then
    --         virt_text = virt_text .. string.rep(' ', config.right_align_padding)
    --       end

    --       if config.max_len_align then
    --         local max_len = get_max_len(bufnr, parsed)
    --         virt_text = string.rep(' ', max_len - current_line_len + config.max_len_align_padding) .. virt_text
    --       end

    --       -- set the virtual text if it is not empty
    --       if virt_text ~= '' then
    --         vim.api.nvim_buf_set_extmark(bufnr, namespace, line, 0, {
    --           virt_text_pos = config.right_align and 'right_align' or 'eol',
    --           virt_text = {
    --             { virt_text, config.highlight },
    --           },
    --           hl_mode = 'combine',
    --         })
    --       end

    --       -- update state
    --       enabled = true
    --     end
    --   end
    -- end

    -- function inlays.toggle_inlay_hints()
    --   if enabled then
    --     inlays.disable_inlay_hints()
    --   else
    --     inlays.set_inlay_hints()
    --   end
    --   enabled = not enabled
    -- end

    -- function inlays.disable_inlay_hints()
    --   -- clear namespace which clears the virtual text as well
    --   vim.api.nvim_buf_clear_namespace(0, namespace, 0, -1)
    -- end

    -- local found = false
    -- -- Sends the request to gopls to get the inlay hints and handle them
    -- function inlays.set_inlay_hints()
    --   -- check if lsp is ready
    --   if not found then
    --     for _, lsp in pairs(vim.lsp.buf_get_clients()) do
    --       if lsp.name == 'gopls' then
    --         found = true
    --         break
    --       end
    --     end
    --   end
    --   if not found then
    --     return
    --   end
    --   vim.lsp.buf_request(0, 'textDocument/inlayHint', get_params(), handler)
    -- end

    -- inlays.setup()

    -- vim.api.nvim_create_user_command(
    --   'InlayToggle',
    --   function()
    --     inlays.set_inlay_hints()
    --   end,
    --   {}
    -- )

    -- setup_lsp('golangci_lint_ls', {})
  end,
  snippets = function()
    local ls = require('luasnip')
    local s, i, t, d, f = ls.s, ls.insert_node, ls.text_node, ls.dynamic_node, ls.function_node
    local c = ls.choice_node
    -- local c = require('kasama.snippet-utils').choice_node_with_virtual_text
    local fmt = require('luasnip.extras.fmt').fmt
    local ts_utils = require('nvim-treesitter.ts_utils')
    local ts_locals = require('nvim-treesitter.locals')

    vim.treesitter.set_query(
      'go',
      'ClosestFuncReturnTypes',
      [[ [
        (method_declaration result: (_) @id)
        (function_declaration result: (_) @id)
        (func_literal result: (_) @id)
      ] ]]
    )
    local function_nodes = {
      ['function_declaration'] = true,
      ['method_declaration'] = true,
      ['func_literal'] = true,
    }

    local get_default_value_for_type = function(_type, info)

      local for_error = info and info.err_name
      local n = function(content, inff)
        if for_error then
          return t(content)
        else
          inff.index = inff.index + 1
          return i(inff.index, content)
        end
      end
      if _type == 'int' then
        return n("0", info)
      elseif _type == 'error' then
        if for_error then
          info.index = info.index + 1

          return ls.sn(info.index, {
            t 'fmt.Errorf("',
            i(1, string.format('error in %s', info.func_name)),
            t(string.format(': %%w", %s)', info.err_name)),
          })
        else
          return n('nil', info)
        end
      elseif _type == 'bool' then
        return n('false', info)
      elseif _type == 'string' then
        return n('""', info)
      elseif string.find(_type, '*', 1, true) then
        if for_error then
          return n('nil', info)
        else
          info.index = info.index + 2
          return c(info.index - 1, {
            ls.sn(info.index, { t '&', t(string.sub(_type, 2, #_type)), t '{', i(1), t '}' }),
            i(info.index)
          })
        end
      elseif string.find(_type, '[]', 1, true) then
        if for_error then
          return n('nil', info)
        else
          info.index = info.index + 2
          return c(info.index - 1, {
            ls.sn(info.index, { t(_type), t '{', i(1), t '}' }),
            i(info.index)
          })
        end
      else
        info.index = info.index + 1
        return ls.sn(nil, { t(_type), t '{', i(1), t '}' })
      end
    end

    local go_return_type = function(info, value_for_type)
      local cursor_node = ts_utils.get_node_at_cursor()
      -- current treesitter scope, from more to less specific
      local scope = ts_locals.get_scope_tree(cursor_node, 0)

      local function_node -- get closest function node
      for _, node in pairs(scope) do
        if function_nodes[node:type()] then
          function_node = node
          break
        end
      end

      if function_node == nil then
        return {}
      end

      local node_name = vim.treesitter.get_node_text(function_node:named_child('name'), 0)
      if node_name ~= nil then
        info.func_name = node_name
      else
        info.func_name = "anonymous func"
      end

      local handlers = {
        ['parameter_list'] = function(node)
          local result = {}
          local count = node:named_child_count()
          for index = 0, count - 1 do
            table.insert(result, value_for_type(vim.treesitter.get_node_text(node:named_child(index), 0), info))
            if index ~= count - 1 then
              table.insert(result, t { ', ' })
            end
          end
          return result
        end,
        ['type_identifier'] = function(node)
          local text = vim.treesitter.get_node_text(node, 0)
          return { value_for_type(text, info) }
        end,
      }

      local query = vim.treesitter.get_query('go', 'ClosestFuncReturnTypes')
      for _, node in query:iter_captures(function_node, 0) do
        if handlers[node:type()] then
          return handlers[node:type()](node)
        end
      end
      return {}
    end

    local go_return_error = function(args)
      return ls.sn(
        nil,
        go_return_type({
          index = 0,
          err_name = args[1][1],
          func_name = 'test_func', -- args[2][1],
        }, get_default_value_for_type)
      )
    end

    local go_return_value = function()
      return ls.sn(
        nil,
        go_return_type({
          index = 0,
        }, get_default_value_for_type)
      )
    end

    -- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/snips/ft/go.lua
    ls.add_snippets('go', {
      s('pack', fmt([[package {}]], { i(1) }, {})),
      s(
        'ife',
        {
          t 'if ', i(1, { 'err' }), t { ' != nil {', '\treturn ' },
          d(2, go_return_error, { 1 }), i(3),
          t { '', '}' }, i(0),
        }
      ),
      s('ret', { t 'return ', d(1, go_return_value, {}) }),
      s(
        'forr',
        {
          t 'for ', i(1, "i"), t ', ', i(2, "v"), t ' := range ', i(3, "variable"), t { ' {', '\t' },
          i(0),
          t { '', '}' }
        }
      ),
      s(
        'if',
        {
          t 'if ', i(1, "i"), t { ' {', '\t' },
          i(0),
          t { '', '}' }
        }
      ),
      s(
        'for',
        {
          t 'for ', i(1, "i"), t { ' {', '\t' },
          i(0),
          t { '', '}' }
        }
      )
    }, { key = 'go' })
  end,
}
