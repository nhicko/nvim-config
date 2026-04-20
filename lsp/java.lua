local jdtls = require("jdtls")

local home = os.getenv("HOME")
local java_home = os.getenv("JAVA_HOME")

-- Safety check
if not java_home or java_home == "" then
  vim.notify("JAVA_HOME is not set (required for jdtls)", vim.log.levels.ERROR)
  return
end

-- Project-specific workspace (VERY IMPORTANT)
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name

-- Root detection
local root_dir = jdtls.setup.find_root({
  "pom.xml",
  "build.gradle",
  "settings.gradle",
  ".git",
})

if root_dir == nil then
  vim.notify("jdtls root dir not found", vim.log.levels.WARN)
  return
end

-- jdtls configuration
local config = {
  cmd = {
    home .. "/.local/bin/jdtls",
    "-configuration", home .. "/.cache/jdtls/config",
    "-data", workspace_dir,
    "-vmargs",
    "-Xmx1g",
    "-Djava.home=/mnt/c/bpi/openjdk21-linux",
  },

  root_dir = root_dir,

  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "OpenJDK-21",   -- MUST be JavaSE-*
            path = "/mnt/c/bpi/openjdk21-linux",    -- MUST be the JDK root
            default = true,
          },
        },
      },
    },
  },
}

-- Start or attach jdtls (REQUIRED for Neovim 0.12)
jdtls.start_or_attach(config)
