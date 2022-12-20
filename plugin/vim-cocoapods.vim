" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  Apache License

if exists('b:loaded_cocoapods_plugin')
    finish
endif
let b:loaded_cocoapods_plugin = 1

" MARK: Variable
if !exists('g:CocoaPodsDefaultMap')
    let g:CocoaPodsDefaultMap = 1
endif
" let g:CocoaPodsDefaultMap = get(g:, 'CocoaPodsDefaultMap', 1)

if exists('g:PodsConfigFile')
    let g:PodsConfig = json_decode(join(readfile(g:PodsConfigFile), ''))
endif

if g:CocoaPodsDefaultMap
    augroup CocoaPodsKeyMaps
        au!
        au BufNewFile,BufRead Podfile call s:AddDefaultKeyMaps()
    augroup END
endif

function! s:AddDefaultKeyMaps()
    nmap     <silent><buffer> <Leader>eb  <Plug>(CocoaPodsEditBranch)
    nmap     <silent><buffer> <Leader>et  <Plug>(CocoaPodsEditTag)
    nmap     <silent><buffer> <Leader>ev  <Plug>(CocoaPodsEditVersion)
    nmap     <silent><buffer> <Leader>dbm <Plug>(CocoaPodsDirectToMaster)
    nmap     <silent><buffer> <Leader>dlp <Plug>(CocoaPodsDirectToLocal)

    nnoremap <silent><buffer> <Leader>pu  :PodUpdate<CR>
    nnoremap <silent><buffer> <Leader>pnu :PodUpdateNoRepoUpdate<CR>
    nnoremap <silent><buffer> <Leader>pi  :PodInstall<CR>
endfunction
