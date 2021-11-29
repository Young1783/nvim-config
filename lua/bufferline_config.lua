local normal_bg = {
  attribute = "bg",
  highlight = "Normal",
}
local comment_fg = {
  attribute = "fg",
  highlight = "Comment",
}
require'bufferline'.setup{
  options = {
    view = "default",-- "multiwindow" | "default",
    numbers = "ordinal",--  "none" | "ordinal" | "buffer_id" | "both",
    --number_style = "", -- "superscript" | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
    -- mappings = true,-- true | false,
    buffer_close_icon= '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is deduplicated
    tab_size = 18,
    diagnostics = false,--  false | "nvim_lsp"
    diagnostics_indicator = function(count, level, diagnostics_dict)
      return "("..count..")"
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
    end,
    show_buffer_close_icons = false,-- true | false,
    show_close_icon = false,-- true | false,
    show_tab_indicators = true,-- true | false,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thick",--  "slant" | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,-- false | true,
    always_show_bufferline = true,-- true | false,
    -- sort_by = 'extension' | 'relative_directory' | 'directory' | function(buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
  };
  highlights = {
    tab = {
      guifg = {
        attribute = 'fg',
        highlight = 'Normal'
      },
      guibg = {
        attribute = 'bg',
        highlight = 'LineNr'
      }
    },
    tab_selected = {
      guifg = {
        attribute = 'bg',
        highlight = 'TebLineSel'
      },
      guibg = {
        attribute = 'fg',
        highlight = 'TabLineSel',
      },
    },
    buffer_selected = {
      guifg = {
        attribute = 'fg',
        highlight = 'SpecialChar',
      },
      guibg = {
        attribute = 'bg',
        highlight = 'Normal',
      },
      gui = "bold,italic",
    },
    separator_selected = {
      guifg = normal_bg,
      guibg = normal_bg,
    },
    -- separator_visible = {
    --   guifg = separator_background_color,
    --   guibg = visible_bg,
    -- },
    -- separator = {
    --   guifg = comment_fg,
    --   guibg = normal_bg,
    -- },
    fill = {
      guibg = {
        attribute = 'bg',
        highlight = 'Normal'
      },
      guifg = {
        attribute = 'bg',
        highlight = 'Normal'
      },
    },
  },

}
