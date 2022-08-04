" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License: Apache License

augroup CocoaPodsDetect
    au!
    au BufNewFile,BufRead Podfile setf ruby
    au BufNewFile,BufRead *.podspec setf ruby
augroup END
