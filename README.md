# scrollUptoLastLine.vim
A Vim plugin to stop mouse scrolling at the last line, similar to setting `scrollBeyondLastLine` to `false` in VSCode.

![output](https://github.com/gw31415/scrollUptoLastLine.vim/assets/24710985/5522ead9-9bbb-4542-b206-ad8806af562f)

## DESCRIPTION

This plugin modifies the behavior of mouse scrolling in Vim. When installed and enabled, it prevents the mouse from scrolling beyond the last line of the document.

`scrollUptoLastLine.vim` is designed for users who prefer the editor's viewport to stop at the last line of the file, avoiding extra empty space below the last line during scrolling. This feature is akin to the `scrollBeyondLastLine` setting in VSCode when set to `false`.

## OPTIONS

`g:scroll_upto_lastline_padding` - This global variable sets the number of lines to show after the last line of the file when scrolling reaches the end. For instance, setting this variable to 5 will allow the user to see five lines past the last line of the file while scrolling. The default value is `&scrolloff`.

## INSTALLATION

To install `scrollUptoLastLine.vim`, use your preferred Vim plugin manager.

- plug.vim
```vim
Plug 'gw31415/scrollUptoLastLine.vim'
```

- dein.vim
```vim
call dein#add('gw31415/scrollUptoLastLine.vim')
```

## USAGE

After installing, the plugin works automatically. You can adjust the padding by setting `g:scroll_upto_lastline_padding` in your `.vimrc` file, like so:

```vim
let g:scroll_upto_lastline_padding = 3
```

## Q/A

### Issue: Strange Behavior When Push <SHIFT> After Scrolling

**Q**: When I hold Shift after scroll, the behavior seems erratic. What's happening?

**A**: This issue is likely due to `<S-MouseUp>` being unintentionally active. To resolve this, remap `<S-MouseUp>` to `<Nop>` (No operation). You can do this by adding the following line to your `.vimrc`:

```vim
noremap <S-MouseUp> <Nop>
inoremap <S-MouseUp> <Nop>
```

This remapping prevents any unintended actions when shift-scrolling.
