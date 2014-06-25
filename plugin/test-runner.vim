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
    call s:SetFileType()

    let has_zeus = !empty(glob(".zeus.sock"))
    let binstub_command = "bin/" . s:test_type
    let has_binstub = !empty(glob(binstub_command))

    let runner = "bundle exec " "Default runner

    if has_zeus
      let runner = "zeus " "Run with zeus
    elseif has_binstub
      let runner = "bin/" "Run with binstub hoping spring is running
    endif

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
