" To make sure plugin is loaded only once,
" and to allow users to disable the plugin
" with a global conf.
if exists("g:loaded_test_runner")
  finish
endif
let g:loaded_test_runner = 1

" Sample shortcuts
"map <unique> <silent> <Leader>R :call TestRunnerRunAllTests()<CR>
"map <unique> <silent> <Leader>r :call TestRunnerRunCurrentTest()<CR>


function! s:SetFileType()
  let s:test_type = &filetype "Default to filetype (eg: cucumber)

  call s:DetectRspec()
endfunction

function s:DetectRspec()
  if &filetype == "ruby" && expand("%") =~ "spec"
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
      if (expand('%') =~ 'test_') || (expand('%') =~ '_test')
        let s:test_type = 'test'
      endif
      let runner = "zeus " "Run with zeus
    elseif has_binstub
      let runner = "bin/" "Run with binstub hoping spring is running
    endif

    let s:test_runner_command = runner . s:test_type
  else
    let s:test_runner_command = g:test_runner_command
  endif
endfunction

function! s:TestRunnerExecute(command)
  if(get(g:, 'loaded_vimux', 0) && exists('$TMUX'))
    call VimuxRunCommand(a:command)
  else
    execute("!" . a:command)
  endif
endfunction

function! TestRunnerGetRunAllTestsCommand()
  call s:SetTestCommand()
  return "clear && " . s:test_runner_command . " " . expand("%")
endfunction

function! TestRunnerGetRunCurrentTestCommand()
  call s:SetTestCommand()
  return "clear && " . s:test_runner_command . " " . expand("%") . ":" . line(".")
endfunction

function! TestRunnerRunAllTests()
  call s:TestRunnerExecute(TestRunnerGetRunAllTestsCommand())
endfunction

function! TestRunnerRunCurrentTest()
  call s:TestRunnerExecute(TestRunnerGetRunCurrentTestCommand())
endfunction
