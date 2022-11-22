" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  Apache License

function! cocoapods#execute(cmd)
    silent update | execute "AsyncRun " . a:cmd . " --project-directory=\"$VIM_FILEDIR\""
endfunction

function! cocoapods#edit_pod_git(type)
  " pod 'BNCConnector', '0.6.4'#:git => 'git@192.168.138.192:BNC_iOS/BNCConnector.git', :branch => 'Indonesia'
    let line_num = line('.')
    let line_content = getline('.')
    let matched_space = matchstr(line_content, '\zs.\{-}\zepod')
    let matched_pod = matchstr(line_content, "pod '\\zs.\\{-}\\ze'")
    let pod_url = g:PodModuleUrl[matched_pod]

    if empty(pod_url)
        let pod_url = 'git@github.com:xxx/xxx.git'
    endif

    if a:type == 'branch'
        let final_content = matched_space . "pod '" . matched_pod . "', :git => '" . pod_url . "', :branch => ''"
    elseif a:type == 'tag'
        let final_content = matched_space . "pod '" . matched_pod . "', :git => '" . pod_url . "', :tag => ''"
    else
        echoerr 'not support type' . a:type
    endif
    call setline(line_num, final_content)
    normal! A
    startinsert
endfunction

function! cocoapods#direct_to_branch_master()
  " pod 'BNCConnector', '0.6.4'#:git => 'git@192.168.138.192:BNC_iOS/BNCConnector.git', :branch => 'Indonesia'
    let line_num = line('.')
    let line_content = getline('.')
    let matched_space = matchstr(line_content, '\zs.\{-}\zepod')
    let matched_pod = matchstr(line_content, "pod '\\zs.\\{-}\\ze'")
    let pod_url = g:PodModuleUrl[matched_pod]

    if empty(pod_url)
        let pod_url = 'git@github.com:xxx/xxx.git'
    endif

    let final_content = matched_space . "pod '" . matched_pod . "', :git => '" . pod_url . "', :branch => 'master'"
    call setline(line_num, final_content)
endfunction

function! cocoapods#edit_pod_version()
    let line_num = line('.')
    let line_content = getline('.')
    let first_part = matchstr(line_content, "\\s*pod '.\\{-}',")
    let first_part_with_version = first_part . " ''"
    let second_part = matchstr(line_content, "\\s*pod '.\\{-}',\\zs.*\\ze")
    let buf_num = bufnr()


    let final_content = first_part_with_version . ' #' . second_part
    call setline(line_num, final_content)
    call setpos('.', [buf_num, line_num, len(first_part_with_version)])
    startinsert
endfunction
