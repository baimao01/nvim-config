local opt = { noremap = true, silent = true }
local pluginKeys = {}
local keys = {
    { "n", "<c-h>", "<c-w>h"                                      },
    { "n", "<c-j>", "<c-w>j"                                      },
    { "n", "<c-k>", "<c-w>k"                                      },
    { "n", "<c-l>", "<c-w>l"                                      },

    { "i", "<a-h>", "<left>"                                      },
    { "i", "<a-j>", "<down>"                                      },
    { "i", "<a-k>", "<up>"                                        },
    { "i", "<a-l>", "<right>"                                     },

    { "v", "J", ":m '>+1<cr>gv=gv"                                },
    { "v", "K", ":m '<-2<cr>gv=gv"                                },

    { "n", "<leader>nh", "<cmd>nohl<cr>"                          },

    { "n", "<leader>lz", "<cmd>Lazy<cr>"                          },

    -- bufferline
    { "n", "<a-h>", "<cmd>BufferLineCyclePrev<cr>"                },
    { "n", "<a-l>", "<cmd>BufferLineCycleNext<cr>"                },

    -- neo-tree
    { "n", "<leader>fe", "<cmd>NeoTreeFloatToggle<cr>"            },

    -- telescope
    { "n", "<leader>ff", "<cmd>Telescope find_files<cr>"          },
    { "n", "<leader>fg", "<cmd>Telescope live_grep<cr>"           },
    { "n", "<leader>fb", "<cmd>Telescope buffers<cr>"             },
    { "n", "<leader>fh", "<cmd>Telescope help_tags<cr>"           },

    -- lsp
    { "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>"      },
    { "n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>"  },
    { "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>" },
    { "i", "<c-a>", "<cmd>lua vim.lsp.buf.signature_help()<cr>"   },
    { "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>"          },
    { "n", "gh", "<cmd>lua vim.lsp.buf.hover()<cr>"               },
    { "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>"         },
    { "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>"      },
    { "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>"          },
    { "n", "go", "<cmd>lua vim.diagnostic.open_float()<cr>"       },
    { "n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<cr>"        },
    { "n", "gn", "<cmd>lua vim.diagnostic.goto_next()<cr>"        },
    { "n", "gT", "<cmd>lua vim.lsp.buf.type_definitipn()<cr>"     },

    -- dropbar
    { "n", "<leader>dd", "<cmd>lua require('dropbar.api').pick()<cr>"        },
}

for _, key in ipairs(keys) do
    vim.keymap.set(key[1], key[2], key[3], opt)
end

pluginKeys.cmp = function(cmp)
    return {
        -- 上一个
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        -- 下一个
        ['<C-j>'] = cmp.mapping.select_next_item(),
        -- 出现补全
        ['<C-e>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        -- 取消
        ['<C-n>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- 确认
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<cr>'] = cmp.config.disable,
        -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    }
end

return pluginKeys
