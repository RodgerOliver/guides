# Vim

Vim is an cli IDE.

- Avoid the escape key.
- `:help`: help.
- `ctrl + D`: while in command mode, type this to show other like cmds.
- `vim [file]`: open "file" with Vim.
- `[number] [operator] [motion]`
- `[number]`: how many times.
- `[operator]`: what is going to be done.
- `[motion]`: what the operator will operate on: `w`, `e`, `$`.
- Pressing just the motion wile in Normal mode will just move the cursor.
- `.`: repeats the last command.
- `:echo expand('%:t')`: echo current file name.
- `: <ctrl + P>`: go up in the command mode.
- `: <ctrl + N>`: go down in the command mode.
- `:reg`: shows all registers.
- `"1p`: paste register 1.

## Motions
- `a`: around (inner plus white space).
- `i`: inner.
- `f`: find forward.
- `F`: find backward.
- `t`: till forward.
- `T`: till backward.

### Text Objects
- `w`: word start.
- `e`: word end.
- `b`: word start backwards.
- `s`: sentence.
- `p`: paragraph.
- `t`: tag.

## Normal mode
- Pressing just the motion will just move the cursor.
- `<ESC>`: return to normal mode.
- `h`: left arrow.
- `l`: right arrow.
- `j`: down arrow.
- `k`: up arrow.
- `gk`: move in visual lines up.
- `gj`: move in visual lines down.
- `0`: line start.
- `$`: line end.
- `ctrl+G`: show cursor location.
- `gg`: move the cursor to the start of the file.
- `G`: move the cursor to the end of the file.
- `50G`: move to the line 50.
- `ctrl + E`: scroll window down.
- `ctrl + Y`: scroll window up.
- `ctrl + F`: scroll page down.
- `ctrl + B`: scroll page up.
- `H`: move cursor top window.
- `M`: move cursor middle window.
- `L`: move cursor end window.
- `zz`: puts the cursor in the middle of the screen.
- `zt`: puts the cursor in the top of the screen.
- `ctrl + U`: moves the screen up a half.
- `ctrl + D`: moves the screen down a half.
- `^`: go to first non blank character of the line.
- `g_`: go to last non blank character of the line.
- `*`: highlight all words the same as where the cursor is at.
- `>`: indent.
- `<`: outdent.
- `:ab [abreviation] [word]`: create an abreviation.
 
## Insert mode
- `i`: insert text before the cursor.
- `a`: insert text after the cursor.
- `A`: append text at the end oh the line.
- `o`: create a line under the cursor and go to Insert mode.
- `O`: create a line above the cursor and go to Insert mode.
- `s`: delete the character under the cursor and go to Insert mode.
- `S`: delete line and go to Insert mode.
- `c`: change something. Deletes and go to Insert mode.
- `C`: delete everything after the cursor and go to Insert mode.
- `ci)`: change inside parens.
- `c/word`: change every before word.

## Visual mode
- Use the arrows or motions to select text.
- `v`: go to Visual mode where you can select text with arrows or operators.
- `ctrl + V`: Visual mode in blocks.
- :w [filename]`: save the selected text to a file.

## Exit n Save
- `:q!`: exit and discard changes.
- `:wq`: save and exit.
- `x`: save and exit.
- `ZZ`: save and exit.
- `:w [filename]`: save file.
- `ctrl + Z`: background session.
- `fg`: restore session.
- `:e [file]`: open file.

## Delete
- `x`: delete the character under the cursor.
- `dw`: delete word.
- `D`: delete everything after the cursor.
- `d$`: delete everything after the cursor that is in the line.
- `dd`: delete the whole line.

## Undo
- `u`: unmake changes.
- `U`: unmake changes of a whole line.
- `ctrl+R`: undo undo's.
- `p`: put previously deleted text after the cursor.
- `P`: put previously deleted text before the cursor.

## Copy n Paste
- `y`: copy line.
- `p`: paste.
- `:r [filename]`: retrieve the file below the cursor line.
- `:reg`: shows all registers.
- `"1p`: paste register 1.

## Search
- `/[phrase]`: search "phrase".
- `?[phrase]`: search in the opposite direction.
- `n`: go to the next phrase searched.
- `N`: go to the previous phrase searched.
- `ctrl+O`: go back to where you where.
- `ctrl+I`: go forward.
- `/ignore\c`: ignore case one search.

## Replace
- `rx`: replace the character with the `x`.
- `R`: Insert mode and substitute letters.

## Substitute
- `%`: with the cursor on a parenthesis or brackets type this and find the matching symbol.
- `:s/old/new/g`: to substitute 'new' for 'old'. The flag "g" means change all the words in the line.
- `:x,ys/old/new/g`: change words between "x" and "y" range, "x" and "y" been numbers.
- `:%s/old/new/g`: change words in the whole file.
- `:%s/new/old/gc`: change words in the whole file, but prompt to change or not.

## Shell Cmds
- `:!`: execute an external command. `!` means execute in shell.

## Split Screen
- `:sp [file]`: split horizontally.
- `:vs [file]`: split vertically.
- `crtl+WW`: move between windows.

## Tab Navigation

## Macros
- Sequence of commands recorded to a register.
- `q [register | key] [commands] q`: create macros.
- `@[register]`: run macros.
- `m[register]`: mark where the cursor is at on the register.
- `\`[register]`: go to the register location.

## Mapping
- Medium article.

## Plugins and Scripts
- Install a plugin manager like Vim-Plug.
- vimawesome.com for plugins.
- `:Plug<tab>`: see plug options.

```
call plug#begin()

Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()
```
## Completion
- `ctrl + P`: looks backwards in the files opened to get completions.
- `ctrl + N`: looks forwards in the files opened to get completions.
- `ctrl + X`: go to completion mode to complete in different ways.
- `ctrl + XF`: completes file names.

## Snippets
- Read a file into the current buffer, the file can be a template of the language.
- `nnoremap ,html :-1read ~/.vim/templates/skeleton.html<CR>`

## Options
- Start a .vimrc file to keep the preferences (add `<CR>` to represent ENTER).
- `:set ic`: ignore case on search.
- `:set noic`: remove ignore case.
- `:set hls is`: highlight search. Show partial matches.
- `:sintax on`
- `:set nu`: set number
- `:set ai`: set auto indentation.
- `:set tabstop=3`
- `:set showmatch`: show match of parens, brackets.
- `:set showcmd`
- `:setlocal spell! spelllang=pt_br`
- `:w !diff % -`: see changes.

## Vim-Airline
Vim-Airline without **powerline** fonts and symbols is weird. Airline is a pure vim version of powerline.

In the README.md file has the instructions to install this font. Then change the ****font of the terminal**.

- `:Airline<TAB>`: change airline settings.
