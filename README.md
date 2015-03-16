test-runner.vim
===============

## Features

* Uses zeus to run tests ( if zeus is running ).
* Otherwise uses binstubs ( if you have binstubs in `bin` directory ).
* Zero-config integration with `vimux` to run tests parallelly in a tmux pane.
* Works with RSpec and Cucumber.

## Usage

1. Install the plugin (See Installation section)
2. Add the following keyboard shortcuts in `~/.vimrc` :

```vimL
map <unique> <silent> <Leader>R :call TestRunnerRunAllTests()<CR>
map <unique> <silent> <Leader>r :call TestRunnerRunCurrentTest()<CR>
 ```

## Installation

This plugin follows the standard runtime path structure, and as such it can be installed with a variety of plugin managers:

*  Pathogen
  *  `git clone https://github.com/emilsoman/test-runner.vim ~/.vim/bundle/spec-outline.vim`
*  NeoBundle
  *  `NeoBundle 'emilsoman/test-runner.vim'`
*  Vundle
  *  `Plugin 'emilsoman/test-runner.vim'`
*  VAM
  *  `call vam#ActivateAddons([ 'test-runner.vim' ])`
*  manual
  *  copy all of the files into your `~/.vim` directory


## License

MIT License. Copyright (c) 2015 Emil Soman
