let g:scroll_upto_lastline_padding = &so
fu! s:up() abort
  let step = min([line('$') + g:scroll_upto_lastline_padding - (line('w0') + winheight(0)) + 1, 3])
  if step <= 0
    retu ''
  el
    retu $"\<cmd>exe \"norm! {step}\\<c-e>\"\<cr>"
  endi
endfu
nor <expr><silent><MouseUp> <SID>up()
inor <expr><silent><MouseUp> <SID>up()
