# vim-groovy

This plugin is a collection of useful features for working in the
[Groovy](http://www.groovy-lang.org) language.

_Note: This plugin is in the idea stages, and is a work in progress.
If you have ideas for things you'd like to see included, drop me a line
or create an issue here on GitHub._

## Future Features

* Syntax highlighting (adapt from [groovy.vim](github.com/vim-scripts/groovy.vim))
* Proper indentation (adapt from [groovyindent-unix](github.com/vim-scripts/groovyindent-unix))
* Tab completion, which would incidentally be great for Java development also

## Tab Completion Ideas

Perhaps the GroovyShell class could be leveraged with its tab-completion built
in. The Vim plugin could call out to an externally running Groovy process
listening on a socket, and get back a list of tab-complete candidates.
