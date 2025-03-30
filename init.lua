require 'config.lazy'
require 'config.set'
require 'config.keymap'
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    -- Check if the 'clipboard' is available and yank was not empty
    if vim.v.event.operator == 'y' and vim.v.event.regname == '' then
      local yank_content = vim.fn.getreg(vim.v.event.regname)
      if yank_content and #yank_content > 0 then
        -- Use clip.exe to copy the yanked content to clipboard
        local handle = io.popen('echo ' .. vim.fn.shellescape(yank_content) .. ' | /mnt/c/Windows/system32/clip.exe')
        handle:close()
      end
    end
  end
})
