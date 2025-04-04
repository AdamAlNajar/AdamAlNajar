return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap-python",
            "mfussenegger/nvim-dap-java",
			"mfussenegger/nvim-jdtls",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local dap_python = require("dap-python")
            local dap_java = require('dap-java')

            -- JAVA DAP setup
            dap_java.setup({
                java_debug_path = '/home/adam_najjar/.local/share/nvim/mason/packages/java-debug-adapter/',
                java_test_path = '/home/adam_najjar/.local/share/nvim/mason/packages/java-test/',
            })

            -- Default DAP Config for Java
            dap.configurations.java = {
            {
                type = 'java',
                name = 'Launch Java Program',
                request = 'launch',
                mainClass = "${file}",  -- Launch the current file (or specify main class)
                projectName = "${workspaceFolder}", -- Project name for the workspace
            }

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
