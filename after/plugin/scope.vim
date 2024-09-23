vim9script

if exists("g:loaded_scope")

  import autoload 'scope/fuzzy.vim'

  # scope#fuzzy#OptionsSet({
  #   mru_rel_path: true,
  # })

  nnoremap <localleader>b <scriptcmd>fuzzy.Buffer(v:none, false)<cr>

  nnoremap <localleader>f <scriptcmd>fuzzy.File('fd -tf --follow')<cr>

  nnoremap <localleader>+ <scriptcmd>fuzzy.BufSearch()<cr>

  # ripgrep
  nnoremap <localleader>g <scriptcmd>fuzzy.Grep('rg --vimgrep --no-heading --smart-case')<cr>

  nnoremap <localleader>m <scriptcmd>fuzzy.Mark()<cr>
  nnoremap <localleader>r <scriptcmd>fuzzy.Register()<cr>
  nnoremap <localleader>j <scriptcmd>fuzzy.Jumplist()<cr>

  nnoremap <localleader>. <scriptcmd>fuzzy.Command()<cr>
  nnoremap <localleader>º <scriptcmd>fuzzy.CmdHistory()<cr>

  nnoremap <localleader>o <scriptcmd>fuzzy.MRU()<cr>
  nnoremap <localleader>ñ <scriptcmd>fuzzy.Colorscheme()<cr>

  nnoremap <localleader>w <scriptcmd>fuzzy.Window()<cr>

  nnoremap <localleader>h <scriptcmd>fuzzy.Help()<cr>
endif

# fuzzy.Autocmd(): Vim autocommands, go to their declaration on <cr>
# fuzzy.BufSearch(): Words in current buffer
# fuzzy.Buffer(): Open buffers (option to search 'unlisted' buffers)
# fuzzy.CmdHistory(): Command history
# fuzzy.Colorscheme(): Available color schemes
# fuzzy.Command(): Vim commands
# fuzzy.File(): Files in current working directory
# fuzzy.Filetype(): File types
# fuzzy.GitFile(): Files under git
# fuzzy.Grep(): Live grep in current working directory (spaces allowed)
# fuzzy.Help(): Help topics
# fuzzy.HelpfilesGrep(): Live grep Vim help files (doc/*.txt)
# fuzzy.Highlight(): Highlight groups
# fuzzy.Jumplist(): :h jumplist
# fuzzy.Keymap(): Key mappings, go to their declaration on <cr>
# fuzzy.LspDocumentSymbol(): Symbols supplied by (yegappan) Lsp client
# fuzzy.Loclist(): Items in the location list (sets 'current entry')
# fuzzy.LoclistHistory(): Entries in the location list stack
# fuzzy.MRU(): :h v:oldfiles
# fuzzy.Mark(): Vim marks (:h mark-motions)
# fuzzy.Option(): Vim options and their values
# fuzzy.Quickfix(): Items in the quickfix list (sets 'current entry')
# fuzzy.QuickfixHistory(): Entries in the quickfix list stack
# fuzzy.Register(): Vim registers, paste contents on <cr>
# fuzzy.Tag(): :h ctags search
# fuzzy.Window(): Open windows
