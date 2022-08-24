# vim-cocoapods

A bundle of tools for CocoaPods of Vim.

## Installation

```vim
Plug 'hanleylee/vim-cocoapods'
```

## Configuration

```vim
" This property is necessary!
let g:POD_MODULE_URL = {
    \ 'module1': 'git@github.com:xxx/xxx.git', 
    \ 'module2': 'https://github.com/xxx/xxx.git', 
    \ 'module3': 'xxx', 
    \ }

" set this if you don't want any default map
let g:CocoaPodsDefaultMap = 0
" The default map as as below:
" nmap <silent><buffer> <Leader>eb  <Plug>(CocoaPodsEditBranch)
" nmap <silent><buffer> <Leader>et  <Plug>(CocoaPodsEditTag)
" nmap <silent><buffer> <Leader>ev  <Plug>(CocoaPodsEditVersion)
" nnoremap <silent><buffer> <Leader>pu  :PodUpdate<CR>
" nnoremap <silent><buffer> <Leader>pnu :PodUpdateNoRepoUpdate<CR>
" nnoremap <silent><buffer> <Leader>pi  :PodInstall<CR>
```

## Usage

This plugin provides the following Commands & Maps

### Commands

- `PodUpdate`: Run `pod update`
- `PodUpdateNoRepoUpdate`: Run `pod update --no-repo-update`
- `PodInstall`: Run `pod install`

### Maps

- `<Plug>(CocoaPodsEditBranch)`: Edit pod git branch
- `<Plug>(CocoaPodsEditTag)`: Edit pod git tag
- `<Plug>(CocoaPodsEditVersion)`: Edit pod version

## Dependency

This plugin is built to make my iOS development workflow more efficient, so it uses the following plugins that I commonly use:

- [`vim-repeat`](https://github.com/tpope/vim-repeat)
- [`asyncrun.vim`](https://github.com/skywind3000/asyncrun.vim)

---

Please give this plugin a star if it if this plugin helps you.
