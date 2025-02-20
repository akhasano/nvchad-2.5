local dap, dapui = require("dap"), require("dapui")

dap.adapters.go = {
  type = 'server',
  port = 62345,
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
    args = { "dap", "-l", "127.0.0.1:62345" },
    detached = true,
  }
}

dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
}

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
