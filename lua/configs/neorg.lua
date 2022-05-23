local M = {}

function M.config()
  require('neorg').setup {
    load = {
      ['core.defaults'] = {},
      ['core.norg.dirman'] = {
        config = {
          workspaces = {
            work = '~/Dropbox/notes/work',
            home = '~/Dropbox/notes/personal',
            project_ideas = '~/Dropbox/notes/project_ideas',
          },
        },
      },
      ['core.norg.concealer'] = {},
      ['core.gtd.base'] = {config = {workspace = 'work'}},
      ['core.norg.qol.toc'] = {config = {close_split_on_jump = false, toc_split_placement = 'right'}},
      ['core.norg.journal'] = {config = {workspace = 'personal', strategy = 'flat'}},

      ['core.norg.completion'] = {config = {engine = 'nvim-cmp'}},
      ['core.integrations.nvim-cmp'] = {},
      ['core.integrations.telescope'] = {}, -- Enable the telescope module

      ['external.context'] = {},
      ['external.gtd-project-tags'] = {},
      ['external.kanban'] = {},
    },
  }

  require'core.utils'.add_cmp_source('neorg')
end

return M
