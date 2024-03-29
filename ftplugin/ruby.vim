" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  Apache License

if exists('b:loaded_cocoapods_ftplugin')
    finish
endif
let b:loaded_cocoapods_ftplugin = 1

" MARK: Commands
command! -buffer PodUpdate call cocoapods#execute('pod update')
command! -buffer PodInstall call cocoapods#execute('pod install')
command! -buffer PodUpdateNoRepoUpdate call cocoapods#execute('pod update --no-repo-update')
command! -buffer PodTrim2NameBranch silent call cocoapods#trimPodsToNameAndBranch()

" MARK: Maps
nnoremap <silent> <Plug>(CocoaPodsEditBranch)   :<C-U>call cocoapods#edit_pod_git('branch')<Bar>silent! call repeat#set("\<lt>Plug>(CocoaPodsEditBranch)")<CR>
nnoremap <silent> <Plug>(CocoaPodsEditTag)      :<C-U>call cocoapods#edit_pod_git('tag')<Bar>silent! call repeat#set("\<lt>Plug>(CocoaPodsEditTag)")<CR>
nnoremap <silent> <Plug>(CocoaPodsEditVersion)  :<C-U>call cocoapods#edit_pod_version()<Bar>silent! call repeat#set("\<lt>Plug>(CocoaPodsEditVersion)")<CR>
nnoremap <silent> <Plug>(CocoaPodsDirectToMaster) :<C-U>call cocoapods#direct_to_branch_master()<Bar>silent! call repeat#set("\<lt>Plug>(CocoaPodsDirectToMaster)")<CR>
nnoremap <silent> <Plug>(CocoaPodsDirectToLocal) :<C-U>call cocoapods#direct_to_local_path()<Bar>silent! call repeat#set("\<lt>Plug>(CocoaPodsDirectToLocal)")<CR>

