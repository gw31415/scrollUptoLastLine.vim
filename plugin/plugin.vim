let g:scroll_upto_lastline_padding = &so
fu! s:up() abort
  if line('w0') + winheight(0) > line('$') + g:scroll_upto_lastline_padding
    retu ''
  el
    retu "\<cmd>exe \"norm! 3\\<c-e>\"\<cr>"
  endi
endfu
nor <expr><silent><MouseUp> <SID>up()
inor <expr><silent><MouseUp> <SID>up()
