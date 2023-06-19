call wilder#enable_cmdline_enter()
set wildcharm=<c-n>
cmap <expr> <c-n> wilder#in_context() ? wilder#next() : "\<c-n>"
cmap <expr> <c-p> wilder#in_context() ? wilder#previous() : "\<c-p>"
cmap <expr> <C-D> wilder#can_accept_completion() ? wilder#accept_completion(0) : "\<C-D>"
call wilder#set_option('modes', [':'])

"DONT FUZZY MATCH COMMANDS IT IS ANNOYING (cmdpipeline)
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'fuzzy': 2,
      \       'fuzzy_filter': wilder#lua_fzy_filter(),
      \ }),
      \     wilder#python_search_pipeline({
      \       'dir_command': ['fd', '-td'],
      \       'pattern': 'fuzzy',
      \     }),
      \   ),
      \ ])

let s:highlighters = [
        \ wilder#lua_fzy_highlighter(),
        \ wilder#basic_highlighter(),
        \ ]


call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlighter': s:highlighters,
      \ 'highlights': {
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#fc0362'}]),
      \ },
      \   'left': [
      \     wilder#popupmenu_devicons(),
      \   ],
      \   'right': [
      \     ' ',
      \     wilder#popupmenu_scrollbar(),
      \   ],
      \ 'min_width': '80%',
      \ 'min_height': '0%',
      \ 'max_height': '30%',
      \ 'reverse': 0,
      \ 'border': 'rounded',
      \ })))
