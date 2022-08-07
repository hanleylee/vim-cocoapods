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

" This part is config keymap for the provided command and maps, you can provide your prefer keymap.
nmap <silent><buffer> <Leader>pb  <Plug>(CocoaPodsEditBranch)
nmap <silent><buffer> <Leader>pt  <Plug>(CocoaPodsEditTag)
nmap <silent><buffer> <Leader>pv  <Plug>(CocoaPodsEditVersion)
nnoremap <silent><buffer> <Leader>pu  :PodUpdate<CR>
nnoremap <silent><buffer> <Leader>pnu :PodUpdateNoRepoUpdate<CR>
nnoremap <silent><buffer> <Leader>pi  :PodInstall<CR>
```

## Usage

This plugin provide the following Commands & Maps

### Commands

- `<Plug>(CocoaPodsEditBranch)`: Edit pod git branch
- `<Plug>(CocoaPodsEditTag)`: Edit pod git tag
- `<Plug>(CocoaPodsEditVersion)`: Edit pod version

### Maps

- `PodUpdate`: Run `pod update`
- `PodUpdateNoRepoUpdate`: Run `pod update --no-repo-update`
- `PodInstall`: Run `pod install`

## Dependency

This plugin is built to make my iOS development workflow more efficient, so it use the following plugins that I commonly use:

- [`vim-repeat`](https://github.com/tpope/vim-repeat)
- [`asyncrun.vim`](https://github.com/skywind3000/asyncrun.vim)

---

Please star it if this plugin helps you.

