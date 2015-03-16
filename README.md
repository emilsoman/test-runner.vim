test-runner.vim
===============

## Features

* Uses zeus to run tests ( if zeus is running ).
* Works with binstubs if you're using [spring](https://github.com/rails/spring)
* Defaults to "bundle exec" if no zeus or binstubs available
* Zero-config integration with `vimux` to run tests parallelly in a tmux pane.
* Works with RSpec and Cucumber.

## Usage

Install the plugin (See Installation section) and add the following
keyboard shortcuts in your `~/.vimrc` :

```vimL
map <unique> <silent> <Leader>R :call TestRunnerRunAllTests()<CR>
map <unique> <silent> <Leader>r :call TestRunnerRunCurrentTest()<CR>
 ```

Whenever you want to run all the tests in a file, press <Leader>R and if you
want to run the innermost test w.r.t current cursor position, press <Leader>r.

## Installation

This plugin follows the standard runtime path structure, and as such it can be installed with a variety of plugin managers:

*  Pathogen
  *  `git clone https://github.com/emilsoman/test-runner.vim ~/.vim/bundle/test-runner.vim`
*  NeoBundle
  *  `NeoBundle 'emilsoman/test-runner.vim'`
*  Vundle
  *  `Plugin 'emilsoman/test-runner.vim'`
*  manual
  *  copy all of the files into your `~/.vim` directory


## License

MIT License. Copyright (c) 2015 Emil Soman
