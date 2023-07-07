" my filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.dj		setfiletype dj
    au! BufRead,BufNewFile *.bia	setfiletype bia
    au! BufRead,BufNewFile *.ale	setfiletype ale
    au! BufRead,BufNewFile *.ewe	setfiletype ewe
augroup END
