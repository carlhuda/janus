" Normal Mode: Bubble single lines
call janus#add_mapping('unimpaired', 'nmap', '<C-Up>', '[e')
call janus#add_mapping('unimpaired', 'nmap', '<C-Down>', ']e')

" Visual Mode: Bubble multiple lines
call janus#add_mapping('unimpaired', 'vmap', '<C-Up>', '[egv')
call janus#add_mapping('unimpaired', 'vmap', '<C-Down>', ']egv')
