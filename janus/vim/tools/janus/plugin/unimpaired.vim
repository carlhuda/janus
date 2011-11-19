" Normal Mode: Bubble single lines
call vimius#add_mapping('unimpaired', 'nmap', '<C-Up>', '[e')
call vimius#add_mapping('unimpaired', 'nmap', '<C-Down>', ']e')

" Visual Mode: Bubble multiple lines
call vimius#add_mapping('unimpaired', 'vmap', '<C-Up>', '[egv')
call vimius#add_mapping('unimpaired', 'vmap', '<C-Down>', ']egv')
