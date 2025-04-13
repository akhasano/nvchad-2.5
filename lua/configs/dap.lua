local dap, dapui = require("dap"), require("dapui")

dap.adapters.go = {
  type = 'server',
  port = 62345,
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
    args = { "dap", "--log", "-l", "127.0.0.1:62345" },
    detached = true,
  }
}

dap.configurations.go = {
  {
    type = "go",
    name = "Debug (.arg.debug + .env.debug)",
    request = "launch",
    -- program = "${file}",
    program = "${workspaceFolder}",
    outputMode = "remote",
    showLog = true,
    showRegisters = false,
    stopOnEntry = false,

    args = function()
      local arg_file = vim.fn.getcwd() .. "/.arg.debug"

      if vim.fn.filereadable(arg_file) == 0 then
        -- print("⚠️ .arg.debug not found")
        return {}
      end

      local args = {}
      for line in io.lines(arg_file) do
        if line:match("^%s*$") == nil and not line:match("^%s*#") then
          local trimmed = line:match("^%s*(.-)%s*$")
          if trimmed ~= "" then
            table.insert(args, trimmed)
          end
        end
      end

      if #args == 0 then
        print("⚠️ .arg.debug найден, но пуст или нераспознан")
      else
        print("✅ .arg.debug загружен.")
        -- print("✅ .arg.debug загружен. Аргументы: " .. table.concat(args, " | "))
      end

      return args
    end,

    env = function()
      local env_file = vim.fn.getcwd() .. "/.env.debug"

      if vim.fn.filereadable(env_file) == 0 then
        -- print("⚠️ .env.debug not found")
        return nil
      end

      local envs = {}
      for line in io.lines(env_file) do
        if line:match("^%s*$") == nil and not line:match("^%s*#") then
          local key, val = line:match("^%s*([%w_]+)%s*=%s*(.*)%s*$")
          if key and val then
            envs[key] = val
          else
            print("⚠️ Невозможно распарсить строку: " .. line)
          end
        end
      end

      if next(envs) == nil then
        print("⚠️ .env.debug найден, но пуст или нераспознан")
        return nil
      end

      print("✅ .env.debug загружен")
      return envs
    end,
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
