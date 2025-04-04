return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap-python", 
        },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local dap_python = require("dap-python")
            
			require("dap-python").setup("python3")
			require("dapui").setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
			vim.keymap.set("n", "<Leader>dbt", dap.toggle_breakpoint, {}) -- space + d + b t (d)ebbuger (t)oggle (b)reakpoint
			vim.keymap.set("n", "<Leader>dc", dap.continue, {}) -- space + d + c (d)ebugger + (c)ontinue
		end,
	},
}
