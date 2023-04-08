local lib  = require("nvim-tree.lib")
local view = require("nvim-tree.view")


local function collapse_all()
    require("nvim-tree.actions.tree-modifiers.collapse-all").fn()
end

local function edit_or_open()
    -- open as vsplit on current node
    local action = "edit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
        view.close() -- Close the tree if file was opened

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
        view.close() -- Close the tree if file was opened
    end

end

local function vsplit_preview()
    -- open as vsplit on current node
    local action = "vsplit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)

    end

    -- Finally refocus on tree if it was lost
    view.focus()
end

-- ===============================================================

local function natural_cmp(left, right)
    left = left.name:lower()
    right = right.name:lower()

    if left == right then
        return false
    end

    for i = 1, math.max(string.len(left), string.len(right)), 1 do
        local l = string.sub(left, i, -1)
        local r = string.sub(right, i, -1)

        if type(tonumber(string.sub(l, 1, 1))) == "number" and type(tonumber(string.sub(r, 1, 1))) == "number" then
            local l_number = tonumber(string.match(l, "^[0-9]+"))
            local r_number = tonumber(string.match(r, "^[0-9]+"))

            if l_number ~= r_number then
                return l_number < r_number
            end
        elseif string.sub(l, 1, 1) ~= string.sub(r, 1, 1) then
            return l < r
        end
    end
end

-- ===============================================================

local function open_tab_silent(node)
  local api = require("nvim-tree.api")

  api.node.open.tab(node)
  vim.cmd.tabprev()

end

-- ===============================================================

local swap_then_open_tab = function()
	local node = require('nvim-tree.lib').get_node_at_cursor()
	vim.cmd("wincmd l")
	require('nvim-tree.api').node.open.tab(node)
end

-- ===============================================================



require("nvim-tree").setup({
    disable_netrw = false,
    
    view = {
        mappings = {
            list = {
                { key = 'T', action = "open_tab_silent",    action_cb = open_tab_silent    },
                -- { key = 't', action = "swap_then_open_tab", action_cb = swap_then_open_tab },
                { key = 'l', action = "edit",               action_cb = edit_or_open       },
                { key = 'L', action = "vsplit_preview",     action_cb = vsplit_preview     },
                { key = 'h', action = "close_node"                                         },
                { key = 'H', action = "collapse_all",       action_cb = collapse_all       }
            },
        }
    },
    
    actions = {
        open_file = {
            quit_on_open = false
        }
    },

    sort_by = function(nodes)
        table.sort(node, natural_cmp)
    end,

    renderer = {
        group_empty = true,
    },
    
    filters = {
        dotfiles = true,
    },
})
