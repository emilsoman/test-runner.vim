test-runner.vim
===============

`<Leader>r` Runs the innermost test where the cursor is.
`<Leader>R` Runs all the tests in the file.

## Features

* test-runner.vim will use zeus if zeus is running.
* Works with RSpec and Cucumber.


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

MIT License. Copyright (c) 2014 Emil Soman