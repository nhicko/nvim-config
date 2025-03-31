require 'config.lazy'
require 'config.set'
require 'config.keymap'
-- autocmd TextYankPost * if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe',@0) | endif
