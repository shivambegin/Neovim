local ok, saga = pcall(require, 'lspsaga')
if not ok then
    print 'lspsaga not installed'
    return
end

print 'lspsaga init'
saga.init_lsp_saga {
    border_style = 'double', -- 'single' | 'double' | 'rounded' | 'plus'
    code_action_icon = ' ',
    code_action_lightbulb = {
        enable = true,
        enable_in_insert = true,
        cache_code_action = true,
        sign = true,
        update_time = 150,
        sign_priority = 20,
        virtual_text = true,
    },
    symbol_in_winbar = {
        in_custom = false,
        enable = true,
        show_file = true,
        file_formatter = '%:t',
        click_support = false,
    },
}
