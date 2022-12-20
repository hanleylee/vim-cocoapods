" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  Apache License

function! s:current_pod() 
    let line_num = line('.')
    let line_content = getline('.')
    let matched_pod = matchstr(line_content, "pod '\\zs.\\{-}\\ze'")
    return matched_pod
endfunction

function! s:current_pod_url(pod)
    let pod_url = g:PodsConfig[a:pod]["url"]

    if empty(pod_url)
        let pod_url = 'git@github.com:xxx/xxx.git'
    endif

    return pod_url
endfunction

function! s:current_pod_path(pod)
    let pod_path = g:PodsConfig[a:pod]["path"]

    if empty(pod_path)
        let pod_path = '/path/to/pod'
    endif

    return pod_path
endfunction

func! s:current_pod_prefix_space()
    let line_content = getline('.')
    let matched_space = matchstr(line_content, '\zs.\{-}\zepod')
    return matched_space
endfunction

function! cocoapods#execute(cmd)
    silent update | execute "AsyncRun " . a:cmd . " --project-directory=\"$VIM_FILEDIR\""
endfunction

function! cocoapods#edit_pod_git(type)
    let line_num = line('.')
    let matched_space = s:current_pod_prefix_space()
    let matched_pod = s:current_pod()
    let pod_url = s:current_pod_url(matched_pod)

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
    let line_num = line('.')
    let matched_space = s:current_pod_prefix_space()
    let matched_pod = s:current_pod()
    let pod_url = s:current_pod_url(matched_pod)
    let final_content = matched_space . "pod '" . matched_pod . "', :git => '" . pod_url . "', :branch => 'master'"
    call setline(line_num, final_content)
endfunction

function! cocoapods#direct_to_local_path()
    let line_num = line('.')
    let matched_space = s:current_pod_prefix_space()
    let matched_pod = s:current_pod()
    let pod_path = s:current_pod_path(matched_pod)
    let final_content = matched_space . "pod '" . matched_pod . "', :path => '" . pod_path . "'"
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
