let g:scroll_upto_lastline_padding = &so

fu! s:up() abort
  let step = 3
  if line('$') == line('w$')
    let txt_h = screenpos(winnr(), line('w$'), col([line('w$'), '$'])).row - screenpos(winnr(), line('w0'), 0).row + 1

    let step = min([3, txt_h + g:scroll_upto_lastline_padding - winheight(0)])
    if step <= 0
      retu ''
    endi
  endi
  retu "\<cmd>exe \"norm! " . step . "\\<c-e>\"\<cr>"
endfu
nor <expr><silent><MouseUp> <SID>up()
inor <expr><silent><MouseUp> <SID>up()
