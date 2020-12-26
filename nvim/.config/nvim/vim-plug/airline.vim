" Airline
let g:airline_theme='oceanicnext'
let g:airline_extensions = ['coc', 'ale']
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled=1
function! AirlineInit()
  let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', ':%v'])
  let g:airline_section_b = "%{airline#extensions#branch#get_head()}"
endfunction
autocmd User AirlineAfterInit call AirlineInit()
