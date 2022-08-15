" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  Apache License

if exists('b:loaded_cocoapods_ftplugin')
    finish
endif
let b:loaded_cocoapods_ftplugin = 1

" MARK: Variable
if !exists('g:CocoaPodsDefaultMap')
    let g:CocoaPodsDefaultMap = 1
endif
" let g:CocoaPodsDefaultMap = get(g:, 'CocoaPodsDefaultMap', 1)

" MARK: Commands
command! -buffer PodUpdate call cocoapods#execute('pod update')
command! -buffer PodInstall call cocoapods#execute('pod install')
command! -buffer PodUpdateNoRepoUpdate call cocoapods#execute('pod update --no-repo-update')

" MARK: Maps
nnoremap <silent> <Plug>(CocoaPodsEditBranch)   :<C-U>call cocoapods#edit_pod_git('branch')<Bar>silent! call repeat#set("\<lt>Plug>(CocoaPodsEditBranch)")<CR>
nnoremap <silent> <Plug>(CocoaPodsEditTag)      :<C-U>call cocoapods#edit_pod_git('tag')<Bar>silent! call repeat#set("\<lt>Plug>(CocoaPodsEditTag)")<CR>
nnoremap <silent> <Plug>(CocoaPodsEditVersion)  :<C-U>call cocoapods#edit_pod_version()<Bar>silent! call repeat#set("\<lt>Plug>(CocoaPodsEditVersion)")<CR>

if g:CocoaPodsDefaultMap
    nmap <silent><buffer> <Leader>pb  <Plug>(CocoaPodsEditBranch)
    nmap <silent><buffer> <Leader>pt  <Plug>(CocoaPodsEditTag)
    nmap <silent><buffer> <Leader>pv  <Plug>(CocoaPodsEditVersion)
    nnoremap <silent><buffer> <Leader>pu  :PodUpdate<CR>
    nnoremap <silent><buffer> <Leader>pnu :PodUpdateNoRepoUpdate<CR>
    nnoremap <silent><buffer> <Leader>pi  :PodInstall<CR>
endif
