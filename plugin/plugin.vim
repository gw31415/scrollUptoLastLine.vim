let g:scroll_upto_lastline_padding = &so

fu! s:up() abort
  let step = 3
  let [last,nr] = [line('w$'), winnr()]
  if line('$') == last
    let txt_h = screenpos(nr, last, col([last, '$'])).row - screenpos(nr, line('w0'), 0).row + 1

    let step = min([3, txt_h + g:scroll_upto_lastline_padding - winheight(0)])
    if step <= 0
      retu ''
    endi
  endi
  retu "\<cmd>exe \"norm! " . step . "\\<c-e>\"\<cr>"
endfu
nor <expr><silent><MouseUp> <SID>up()
inor <expr><silent><MouseUp> <SID>up()
