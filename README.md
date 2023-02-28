# vim-cocoapods

A bundle of tools for CocoaPods of Vim.

## Installation

```vim
Plug 'hanleylee/vim-cocoapods'
```

## Configuration

- `g:PodsConfigFile`: pods config file, filetype should be json

    ```vim
    " This property is necessary!
    let g:PodsConfigFile = '/path/to/pods_config.json'
    ```

    And the json file format should be following:

    ```json
    "pod1": {
        "url": "git@github.com:xxx/pod1.git",
        "path": "path/to/pod1"
    },
    "pod2": {
        "url": "git@github.com:xxx/pod2.git",
        "path": "path/to/pod2"
    }
    ```

- `g:CocoaPodsDefaultMap`: set `g:CocoaPodsDefaultMap` to `0` if you don't want any default map

    ```vim
    let g:CocoaPodsDefaultMap = 0
    " The default map as as below:
    " nmap     <silent><buffer> <Leader>eb  <Plug>(CocoaPodsEditBranch)
    " nmap     <silent><buffer> <Leader>et  <Plug>(CocoaPodsEditTag)
    " nmap     <silent><buffer> <Leader>ev  <Plug>(CocoaPodsEditVersion)
    " nmap     <silent><buffer> <Leader>dbm <Plug>(CocoaPodsDirectToMaster)
    " nmap     <silent><buffer> <Leader>dlp <Plug>(CocoaPodsDirectToLocal)
    " nnoremap <silent><buffer> <Leader>pu  :PodUpdate<CR>
    " nnoremap <silent><buffer> <Leader>pnu :PodUpdateNoRepoUpdate<CR>
    " nnoremap <silent><buffer> <Leader>pi  :PodInstall<CR>
    " nnoremap <silent><buffer> <Leader>pt  :PodTrim2NameBranch<CR>
    ```

## Usage

This plugin provides the following Commands & Maps

### Commands

- `PodUpdate`: Run `pod update`
- `PodUpdateNoRepoUpdate`: Run `pod update --no-repo-update`
- `PodInstall`: Run `pod install`
- `PodTrim2NameBranch`: Trim pod line to format `pod_name:branch`

### Maps

- `<Plug>(CocoaPodsEditBranch)`: Edit pod git branch
- `<Plug>(CocoaPodsEditTag)`: Edit pod git tag
- `<Plug>(CocoaPodsEditVersion)`: Edit pod version
- `<Plug>(CocoaPodsDirectToMaster)`: Direct to branch master
- `<Plug>(CocoaPodsDirectToLocal)`: Direct to local path

## Dependency

This plugin is built to make my iOS development workflow more efficient, so it uses the following plugins that I commonly use:

- [`vim-repeat`](https://github.com/tpope/vim-repeat)
- [`asyncrun.vim`](https://github.com/skywind3000/asyncrun.vim)

---

Please give this plugin a star if it if this plugin helps you.
