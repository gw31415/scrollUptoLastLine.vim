let g:scroll_upto_lastline_padding = &so

fu! s:winline(expr) abort
  let wi = getwininfo(win_getid())[0]
  let width = wi.width - wi.textoff
  retu (strdisplaywidth(getline(a:expr)) - 1) / width + 1
endfu

fu! s:up() abort
  let step = 3
  if line('$') == line('w$')
    let txt_h = 0
    for l in range(line('w0'), line('w$'))
      let txt_h += s:winline(l)
    endfo

    let step = min([3, txt_h + g:scroll_upto_lastline_padding - winheight(0)])
    if step <= 0
      retu ''
    endi
  endi
  retu "\<cmd>exe \"norm! " . step . "\\<c-e>\"\<cr>"
endfu
nor <expr><silent><MouseUp> <SID>up()
inor <expr><silent><MouseUp> <SID>up()
