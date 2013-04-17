aknow's vimrc
=============

something refer from vgod's vimrc
https://github.com/vgod/vimrc

MANUALLY INSTALL
----------------

1. Check out from github

        git clone git://github.com/aknow/.vim.git ~/.vim
        cd ~/.vim
        git submodule update --init

2. Install ~/.vimrc and ~/.gvimrc

        ./install-vimrc.sh

3. Install plug-ins

        Launch `vim`, run `:BundleInstall`

4. (Optional, if you want Command-T) Compile the Command-T plugin

        cd .vim/bundle/command-t/ruby/command-t
        ruby extconf.rb
        make

MANUALLY INSTALL ON WINDOWS
---------------------------

1. Check out from github

        cd C:\Program Files\Vim   (or your installed path to Vim)
        rmdir /s vimfiles         (This deletes your old vim configurations. If you want to keep it, use move instead of rmdir.)
        git clone git://github.com/aknow/.vim.git vimfiles
        git submodule update --init

2. Install vimrc. Add the following line at the end of C:\Program Files\Vim\vimrc.

        source $VIM/vimfiles/vimrc

3. Install plug-ins ??

HOW TO USE
----------

see the "USEFUL SHORTCUTS" section in vimrc to learn my shortcuts.

PLUGINS
-------

* [Pathogen](http://www.vim.org/scripts/script.php?script_id=2332): Pathogen let us install a plugin as a bundle in ~/.vim/bundle seprately.

* [Nerd Tree](http://www.vim.org/scripts/script.php?script_id=1658): A tree explorer plugin for navigating the filesystem.

  Useful commands:
    `:Bookmark [name]` - bookmark any directory as name
    `:NERDTree [name]` - open the bookmark [name] in Nerd Tree

* [AutoClose](http://www.vim.org/scripts/script.php?script_id=1849):  Inserts matching bracket, paren, brace or quote.

* [vim-surround](https://github.com/tpope/vim-surround/blob/master/doc/surround.txt): deal with pairs of surroundings.

* [matchit](http://www.vim.org/scripts/script.php?script_id=39): extended % matching for HTML, LaTeX, and many other languages.

* [xmledit](http://www.vim.org/scripts/script.php?script_id=301): XML/HTML tags will be completed automatically.

* [Command-T](https://github.com/wincent/Command-T): open and navigate between files with `cmd-t`.

* [SuperTab](http://www.vim.org/scripts/script.php?script_id=1643): Do all your insert-mode completion with Tab.

* [snipMate](http://www.vim.org/scripts/script.php?script_id=2540): TextMate-style snippets for Vim

  `:help snipMate` to see more info.

* [YankRing](http://www.vim.org/scripts/script.php?script_id=1234): Maintains a history of previous yanks, changes and deletes

  `:help yankring` to see more info.

* [VisIncr](http://www.vim.org/scripts/script.php?script_id=670): Produce increasing/decreasing columns of numbers, dates, or daynames.

* [Cute Error Marker](http://www.vim.org/scripts/script.php?script_id=2653): showing error and warning icons on line.

   MacVim users need to enable "Use experimental renderer" to see
   graphical icons.

* [vim-latex](http://vim-latex.sourceforge.net/): Latex support.

* [JavaComplete](http://www.vim.org/scripts/script.php?script_id=1785): Java Omni-completion.

* [EasyMotion](https://github.com/Lokaltog/vim-easymotion): An easy way to jump to a word.

  Useful commands:
    `,,w` forward EasyMotion
    `,,b` backward EasyMotion

* [TagBar](http://majutsushi.github.com/tagbar/): browsing the tags of source files ordered by classes.

  Useful commands:
    `F7` toggles the TagBar

* [Indent Motion](https://github.com/vim-scripts/indent-motion): Vim motions to the start and end of the current indentation-delimited block

  Useful commands:
    `,]` move to the end of the current indentation-delimited block (very useful in Python and CoffeeScript)
    `,[` move to the beginning of the current indentation-delimited block (very useful in Python and CoffeeScript)

* [Zen Coding](https://github.com/mattn/zencoding-vim): expanding abbreviation like zen-coding.

  Useful commands:
    `<ctrl-y>,` expand zen-coding abbreviation.

* [ack.vim](https://github.com/mileszs/ack.vim): run ack (a better grep) from vim, and shows the results in a split window.

  `:Ack [options] {pattern} [{directory}]`

* [Git Gutter](https://github.com/airblade/vim-gitgutter): shows a git diff in the 'gutter' (sign column). It shows whether each line has been added, modified, and where lines have been removed.

Language specific supports
--------------------------

* Latex: Read `:help latex-suite.txt`
* Restructured Text: `ctrl-u 1~5` inserts Part/Chapter/Section headers
* HTML, Javascript, CoffeeScript, Python, CSS, C, C++, Java: use `TAB` to do omni-completion.
* HTML/XML: End tags are automatically completed after typing a begin tag. (Typing > twice pushes the end tag to a new line.)

Other good references
---------------------

* http://amix.dk/vim/vimrc.html
* http://spf13.com/post/perfect-vimrc-vim-config-file


Vim Visual Cheat Sheet
----------------------

Some cheat sheet from vgod.

![vgod's Visual Cheat Sheet](http://people.csail.mit.edu/vgod/vim/vim-cheat-sheet-en.png "My Vim Visual Cheat Sheet")

* [Vim Visual Cheat Sheet (PNG)](http://people.csail.mit.edu/vgod/vim/vim-cheat-sheet-en.png)
* [Vim Visual Cheat Sheet (PDF)](http://people.csail.mit.edu/vgod/vim/vim-cheat-sheet-en.pdf)
* [Vim入門圖解 Chinese Ver. (PNG)](http://blog.vgod.tw/wp-content/uploads/2009/12/vim-cheat-sheet-full.png)
* [Vim入門圖解 Chinese Ver. (PDF)](http://blog.vgod.tw/wp-content/uploads/2009/12/vgod-vim-cheat-sheet-full.pdf)

These Vim Visual Cheat Sheets are released under [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US).


License
-------

This vimrc project is released under [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US).

