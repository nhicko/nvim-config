return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
	config = function()
		local builtin = require 'telescope.builtin'
		local actions = require 'telescope.actions'
		local action_state = require 'telescope.actions.state'
		local pickers = require 'telescope.pickers'
		local finders = require 'telescope.finders'
		local conf = require 'telescope.config'.values
		local function cd_to_selected_dir()
			pickers.new({}, {
				prompt_title = "Directories",
				finder = finders.new_oneshot_job(
					{ "fd", "--type", "d", "--hidden", "--follow", "--exclude", ".git" },
					{ cwd = vim.loop.cwd() }
				),
				sorter = conf.generic_sorter({}),
				attach_mappings = function(prompt_bufnr,map)
					actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					if selection then
						vim.cmd("cd " .. vim.fn.fnameescape(selection[1]))
						print("Changed directory to: " ..selection[1])
					end
					end)
				return true
				end,
			}):find()
		end

		vim.api.nvim_create_user_command("TelescopeCd", cd_to_selected_dir, {})
			
		vim.keymap.set('n', '<leader>sf', builtin.find_files)
		vim.keymap.set('n', '<leader>sg', builtin.live_grep)
		vim.keymap.set('n', '<leader>ch', builtin.command_history)
		vim.keymap.set('n', '<leader>b', builtin.buffers)
		vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find)
		vim.keymap.set('n', '<leader>cd', ":TelescopeCd<CR>")
	end,
}
