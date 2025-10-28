" ========================================================
" ftplugin/tex.vim
" Configuración específica para archivos LaTeX (.tex)
" ========================================================

" --------------------------------------------------------
" Ajustes de formato
" --------------------------------------------------------
setlocal textwidth=80        " ancho máximo de línea
setlocal formatoptions+=t    " auto-wrap mientras escribes
setlocal wrap                " wrap visual
setlocal linebreak           " romper líneas en espacios visualmente
setlocal nolist              " no mostrar caracteres invisibles

" --------------------------------------------------------
" Ajustes de indentación para LaTeX
" --------------------------------------------------------
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

" --------------------------------------------------------
" Auto-wrap físico al guardar (aplica gq a todo el buffer)
" --------------------------------------------------------
if exists('#AutoWrapLaTeX#BufWritePre')
    augroup AutoWrapLaTeX
        autocmd!
    augroup END
endif

augroup AutoWrapLaTeX
    autocmd!
    autocmd BufWritePre *.tex silent! %normal! gggqG
augroup END

" --------------------------------------------------------
" Opcional: mostrar mensaje al cargar el ftplugin (solo debug)
" --------------------------------------------------------
" echom "ftplugin/tex.vim cargado"

