local dap = require('dap')

-- Настройка для Clang (C/C++)
dap.adapters.lldb = {
  type = 'executable',
  command = 'lldb', -- или полный путь к lldb-vscode
  name = 'lldb',
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'app')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- Настройка для Go
dap.adapters.go = {
  type = 'server',
  host = '127.0.0.1',
  port = 38697,
}
dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}",
  },
}

-- Настройка для Python
dap.adapters.python = {
  type = 'executable',
  command = 'python3', -- или путь к вашему Python
  args = { '-m', 'debugpy.adapter' },
}
dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch file',
    program = '${file}',        -- Запуск текущего файла
    pythonPath = function()
      return '/usr/bin/python3' -- Или путь к вашему Python
    end,
  },
}

-- Подключение DAP UI
require('dapui').setup()
local dapui = require('dapui')

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Подключение виртуального текста
require('nvim-dap-virtual-text').setup()
