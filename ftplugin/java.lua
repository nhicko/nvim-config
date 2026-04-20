local jdtls = require("jdtls")
local home = os.getenv("HOME")
local java_home = os.getenv("JAVA_HOME")

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name

jdtls.start_or_attach({
  cmd = {
    home .. "/.local/share/nvim/mason/packages/jdtls/bin/jdtls",
    "-configuration", home .. "/.cache/jdtls/config",
    "-data", workspace_dir,
    "-vmargs",
    "-Djava.home=" .. java_home,
  },

  root_dir = jdtls.setup.find_root({ ".git", "pom.xml", "build.gradle" }),

  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-21",
            path = java_home,
            default = true,
          },
        },
      },
    },
  },
})
