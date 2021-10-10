fun! s:Status_Line()
  ruby <<
    row, col = $curwin.cursor
    rows = $curbuf.length
    line = $curbuf[row]
    cols = line.size
    modified = VIM::evaluate("&modified") == "1" ? "+," : ""
    modifiable = VIM::evaluate("&modifiable") == "1" ? "" : "RO,"
    filename = VIM::evaluate('expand("%")')
#    filename = $curbuf.name
    filename = "[New]" if filename == ""
    fenc = VIM::evaluate("&fenc")
    encoding = fenc == "" ? VIM::evaluate("&enc") : fenc

    percent = row * 100 / rows
    filetype = VIM::evaluate("&filetype")
    c = line[col] || 0
    s = %Q["#{filename}" #{row}/#{rows}L(#{percent}%) #{col+1}/#{cols}C ]
    s << '[' + modified + modifiable
    s << VIM::evaluate("&fileformat") + ','
    if filetype != ""
      s << filetype + ','
    end
    s << encoding + ']'
    s << format(" 0x%x", c)
    s << format("%x", $curbuf[row][col+1]) if c > 0x80
    print s
.
endfunction
map <C-G> :call <SID>Status_Line()<CR>
" vim: set sw=2:
