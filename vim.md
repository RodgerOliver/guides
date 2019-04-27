# Vim

Vim is a cli IDE.

Change default text editor to Vim: `sudo update-alternatives --config editor`

**Pattern**: `[number] [operator] [number] [motion | text object]`

Numbers are optional.

## Open n Exit n Save
- `vim [file]`: open "file" with Vim.
- `:q!`: exit and discard changes.
- `:w [filename]`: save file.
- `:wq`: save and exit.
- `:e [file]`: open file.
- `ZZ`: save and exit.
- `ctrl + Z`: background session.
- `fg`: restore session.

## Operators
Make something to the motion.
If they are followed by themselves the operation will affect the line.

- `d`: delete.
- `c`: change.
- `y`: yank (copy).
- `>, <`: indent, dedent.
- `=`: reformat (reindent, break long lines, etc).

## Motions
Motions move the cursor.

## Cursor Motions
- `h`: left arrow.
- `l`: right arrow.
- `j`: down arrow.
- `k`: up arrow.
- `gk`: move in visual lines up.
- `gj`: move in visual lines down.
- `0`: line start.
- `$`: line end.
- `gg`: file start.
- `G`: file end.
- `50G`: move to the line 50.
- `^`: first non blank character of the line.
- `g_`: last non blank character of the line.

### Other Ways to Move The Cursor
- `ctrl + G`: show cursor location.
- `H`: move cursor top window.
- `M`: move cursor middle window.
- `L`: move cursor end window.
- `zz`: puts the cursor in the middle of the screen.
- `zt`: puts the cursor in the top of the screen.
- `zb`: puts the cursor in the bottom of the screen.

## Word Motions
Lower case: affect ponctuation too.

Capital case: affect only words.

- `w`: word start.
- `e`: word end.
- `b`: word start backwards.

## Sentences and Paragraphs Motions

- `)`: sentece forward.
- `(`: sentece backward.
- `}`: paragraph forward.
- `{`: paragraph backward.

## Other Motions
- `f [char]`: find char forward.
- `F [char]`: find char backward.
- `t [char]`: find till char forward.
- `T [char]`: find till char backward.
- `;`: repeats the motion forward.
- `,`: repeats the motion backward.

## Text Objects
- Objects
  - `w`: word.
  - `s`: sentence.
  - `p`: paragraph.
  - `t`: tag.
  - `)`
  - `'`
  - `"`
- `a[obj]`: around object (inner plus white space).
- `i[obj]`: inner object.
- `gn`: operate on the last search.

## Scoll Page
- `ctrl + E`: scroll window down.
- `ctrl + Y`: scroll window up.
- `ctrl + F`: scroll page down.
- `ctrl + B`: scroll page up.
- `ctrl + U`: scroll half page up.
- `ctrl + D`: scroll half page down.

## Normal Mode
Move the cursor and change text.

- `<ESC>`: return to Normal mode.
- `.`: repeats the last command.
- `*`: highlight all words the same as where the cursor is at.
- `J`: join lines.
- `50%`: go to 50% of the file.
- `Ctrl + A`: increment.
- `Ctrl + I`: decrement.
- `:retab`: correct undentation.
- `:ab [abreviation] [word]`: create an abreviation.

## Insert Mode
Insert text.

- `i`: insert text before the cursor.
- `a`: insert text after the cursor.
- `o`: create a line under the cursor and go to Insert mode.
- `s`: delete the character under the cursor and go to Insert mode.
- `c`: change something. Deletes and go to Insert mode.
- `I`: insert text at the start of the line.
- `A`: append text at the end of the line.
- `O`: create a line above the cursor and go to Insert mode.
- `S`: delete line and go to Insert mode.
- `C`: delete everything after the cursor and go to Insert mode.
- `ci)`: change inside parens.
- `c/word`: change every before word.

## Visual Mode
Select text.

- Use the arrows or motions to select text.
- `v`: go to Visual mode.
- `V`: go to Visual mode in lines.
- `ctrl + V`: Visual mode in blocks.
- :w [filename]`: save the selected text to a file.

## Command Mode
- `ctrl + P`: go up in the command mode.
- `ctrl + N`: go down in the command mode.
- `ctrl + R [register]`: paste the register in the command mode.
- `ctrl + R [ctrl + W]`: paste the word unser the cursor in the command mode.

## Registers
- Almost all registers start with `"`.
- Macros start with `@`.
- The default register to read and write is `""`, the "unmaned" register.
- Yanked text goes into register `"0`.
- Deleted text goes into register `"1`.
- `".`: last inserted text.
- `":`: most recent command.
- `"+`: system clipboard register.

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
- `:v/[word]/d`: remove everything that is not "word".

## Shell Cmds
- `:!`: execute an external command. `!` means execute in shell.

## Split Screen
- `:sp [file]`: split horizontally.
- `:vs [file]`: split vertically.
- `ctrl + W s`: split horizontally.
- `ctrl + W v`: split vertically.
- `crtl + W [h|j|k|l|w]`: move between windows.
- `crtl + W q`: closes the current window.
- `crtl + W x`: exchange windows.
- `crtl + W [r|R]`: move window.
- `crtl + W =`: reset window sizes.
- `crtl + W _`: maximize width of the window.
- `crtl + W |`: maximize height of the window.
- `crtl + W o`: focus on one split, and the others go to the buffer.
- `:resize 50`: resize windo to 50%.
- `:vertical resize 50`: resize windo to 50%.
- `:only`: focus on one split, and the others go to the buffer.

## Tab Navigation
- `:tabnew [file]`: open a net tab.
- `:tabnext`: go to the next tab.
- `:tabprev`: go to the previous tab.
- `:tabfirst`: go to the first tab.
- `:tablast`: go to the last tab.
- `gt`: go the the next tab.
- `gT`: go the the previous tab.

## Buffers
- `:buffers`: show buffers.
- `:ls`: show buffers.
- `:ba`: open all buffers in the screen.
- `:b[num]`: open specific buffer.
- `:b [file]`: open an already opened file that is in the buffer.

## Macros
Sequence of commands recorded to a register.

- `q [register | key] [commands] q`: create macros.
- `@[register]`: run macros.
- `m[register]`: mark where the cursor is at on the register.
- `M[register]`: mark where the cursor is at on the register and be be used in different files.
- `\`[register]`: go to the register location.

## Mapping
- `:map [lhs] [rhs]`: map in "rhs" the "lhs", both are sequece of keys.
- `:noremap`: non recursive map, the "rhs"can't call the "lhs".
- `:nmap`: map only on Normal mode.
- `:imap`: map only on Insert mode.
- `:vmap`: map only on Visual mode.
- 'nore', `n`, `i` and `v` are prefixes for `map` and can be combined.

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
- `:set splitbelow splitright`

## Help

- `:help`: help.
- `ctrl + D`: while in command mode, type this to show other like cmds.

## Plugins

### Plugins and Scripts
- Install a plugin manager like Vim-Plug.
- vimawesome.com for plugins.
- `:Plug<tab>`: see plug options.

```
call plug#begin()

Plug 'flazz/vim-colorschemes'

call plug#end()
```

### Vim-Airline
Vim-Airline without **powerline** fonts and symbols is weird. Airline is a pure vim version of powerline.

In the README.md file has the instructions to install this font. Then change the **font of the terminal**.

- `:Airline<TAB>`: change airline settings.

### Vim Wiki
Create notes in Vim.

- `[number]<leader>ww`: open index page.
- `[number]<leader>wt`: open index page in a new tab.
- Number is relative wiki order as defined in `.vimrc`, deafult 1.
- `<leader>ws`: list and select wikis.
- `<leader>wd`: delete wiki page.
- `<leader>wr`: rename wiki page.
- `<CR>`: follow/create link.
- `<Tab>`: go to the next link on current page.
- `<S-Tab>`: go to the previous link on current page.
- `<backspace>`: go to the previous page.
- `<C-space>`: toggle todo on/off.
- `gln`: increase todo.
- `glp`: decrease todo.
- `=`: add header level.
- `-`: remove header level.
- `+`: create links.

### Commentary.vim
Comment things on Vim.

- `gcc`: toggle comment.

### Vim Instant Markdown
Live preview of markdown.

- `sudo npm -g install instant-markdown-d`
- `let g:instant_markdown_autostart = 0`
- `nnoremap <leader>p :InstantMarkdownPreview<CR>`

## Plugin's Features

### Completion
- `ctrl + P`: looks backwards in the files opened to get completions.
- `ctrl + N`: looks forwards in the files opened to get completions.
- `ctrl + X`: go to completion mode to complete in different ways.
- `ctrl + XF`: completes file names.
- `ctrl + XO`: omni complete.

#### Omni Completion
Omni completion is a smart autocomplete method.

- `filetype plugin on`: configuration.
- `set omnifunc=syntaxcomplete#Complete`: configuration.
- Use with Ctags (creates a tags file with more things to complete).
- `sudo ctags -R -f ~/.vim/systags /usr/include /usr/local/include`: create tags file.
- `set tags+=~/.vim/systags`: configuration.

### Snippets
- Read a file into the current buffer, the file can be a template of the language.
- `nnoremap ,html :-1read ~/.vim/templates/skeleton.html<CR>`

### Multiple Cursors Feature
- `/var`: search a word.
- `cgn`: change the word.
- `.`: repeat for the other words.
- `n`: skip a word.

### Move Lines Vertically
Mappings for moving.

- `nnoremap K :m.-2<CR>==`
- `nnoremap J :m.+1<CR>==`
- `vnoremap K :m'<-2<CR>gv=gv`
- `vnoremap J :m'>+1<CR>gv=gv`

### Folding
- `zf[motion]`: create a fold
- `za`: toggle.
- `zo | zc`: open and close.
- `zR | zM`: open and close all.
- `zk | zj`: go to next and previous fold.

### Find File
- `:set path+=**`
- `:find [file]`: find file from the root path.
