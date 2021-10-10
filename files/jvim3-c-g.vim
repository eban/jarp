function! s:Status_Line()
  let rows = line("$")
  let row = line(".")
  let cols = col("$") - 1
  let col = col(".")
  let modified = &modified ? " [+]" : ""
  let modifiable = &modifiable ? "" : "[RO]"
  let filename = expand("%")
  if filename == ""
    let filename = "[No File]" 
  endif
  let encoding = &fenc == "" ? &enc : &fenc
  let percent = row * 100 / rows
  let c = getline(line("."))[col(".") - 1]

  let status = '"' . filename . '"'
  let status = status . ' ' . row . '/' . rows . 'L'
  let status = status . '(' . percent . '%)'
  let status = status . ' ' . col . '/' . cols . 'C'
  let status = status . ' '
  let status = status . modified
  let status = status . modifiable
  let status = status . '[' . &fileformat . ']'
  if &filetype != ""
    let status = status . '[' . &filetype . ']'
  endif
  let status = status . '[' . encoding . ']'
  echo status
endfunction
map <C-G> :call <SID>Status_Line()<CR>
