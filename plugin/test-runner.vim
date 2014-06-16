" To make sure plugin is loaded only once,
" and to allow users to disable the plugin
" with a global conf.
if exists("g:do_not_load_test_runner")
  finish
endif
let g:do_not_load_test_runner = 1

" Default shortcuts
map <unique> <silent> <Leader>R :call TestRunnerRunAllTests()<CR>
map <unique> <silent> <Leader>r :call TestRunnerRunCurrentTest()<CR>


function! s:SetFileType()
  let s:test_type = &filetype "Default to filetype (eg: cucumber)
  if getline(1) =~ 'spec_helper'
    let s:test_type = 'rspec'
  endif
endfunction

function! s:SetTestCommand()
  if !exists("g:test_runner_command")
    let has_zeus = !empty(glob(".zeus.sock"))
    let runner = has_zeus ? "zeus " : "bundle exec "
    call s:SetFileType()
    let s:test_runner_command = runner . s:test_type
  else
    let s:test_runner_command = g:test_runner_command
  endif
endfunction

function! TestRunnerRunAllTests()
  call s:SetTestCommand()
  execute("!clear && " . s:test_runner_command . " " . expand("%p"))
endfunction

function! TestRunnerRunCurrentTest()
  call s:SetTestCommand()
  execute("!clear && " . s:test_runner_command . " " . expand("%p") . ":" . line("."))
endfunction