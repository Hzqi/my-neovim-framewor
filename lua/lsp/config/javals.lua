local lspconfig = require("lspconfig")

local opts = {
  cmd = {
    vim.fn.expand("$HOME/.local/share/nvim/mason/bin/jdtls"),
    ("--jvm-arg=-javaagent:%s"):format(vim.fn.expand("$HOME/.local/share/nvim/mason/share/lombok-nightly//lombok.jar")),
    "--jvm-arg=-Dosgi.bundles.defaultStartLevel=4",          -- ✅ Modify OSGi bundle start level
    "--jvm-arg=-Xms2G",                                      -- ✅ Allocate 2GB RAM to Java process
    "--jvm-arg=-Xmx4G",                                      -- ✅ Set max RAM usage to 4GB
    "--jvm-arg=--add-modules=ALL-SYSTEM",                    -- ✅ Ensure all Java modules are available
    "--jvm-arg=--add-opens=java.base/java.util=ALL-UNNAMED", -- ✅ Enable reflection for Java 9+
    "--jvm-arg=--add-opens=java.base/java.lang=ALL-UNNAMED", -- ✅ Prevent illegal access warnings
    "--jvm-arg=-Dlog.level=ALL",
    "-data", vim.fn.expand("$HOME/jdtls/workspace"),
  },
  filetypes = { "java" },
  root_dir = lspconfig.util.root_pattern('.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'),-- vim.fs.root(0, { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }),
  init_options = {
    bundles = {
      --vim.fn.glob(vim.fn.expand("$HOME/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.1.jar"), 1)
    },
  },
  settings = {
    java = {
      eclipse = {
        downloadSources = true
      },
      configuration = {
        updateBuildConfiguration = "interactive"
      },
      gradle = {
        enabled = true,
      },
      maven = {
        downloadSources = true
      },
      implementationsCodeLens = {
        enabled = true
      },
      referencesCodeLens = {
        enabled = true
      },
      references = {
        includeDecompiledSources = true
      },
      format = {
        enabled = true
      }
    },
    signatureHelp = {enabled = true},
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
  },
  --[[on_attach = function(client, bufnr)
    print("LSP attached to buffer " .. bufnr)

    -- Ensure the client is valid before reattaching
    if client then
      local success = vim.lsp.buf_attach_client(bufnr, client.id)
      if success then
        print("Reattached client ID: " .. client.id)
      else
        print("Failed to attach client ID: " .. client.id)
      end
    end
  end]]--
}

return {
  on_setup = function(server)
    --server:setup(opts)
    require('java').setup({
      jdk = {
        auto_install = false,
      },
    })
    lspconfig.jdtls.setup(opts)

    vim.api.nvim_create_user_command("JavaAddWorkspace", function()
      -- Prompt the user to enter the folder name
      vim.ui.input({ prompt = "Enter folder path (relative to current file): " }, function(input)
        if input and input ~= "" then
          local folder_path = vim.fn.fnamemodify(input, ":p") -- Convert to absolute path
          vim.lsp.buf.add_workspace_folder(folder_path)
          print("Added workspace folder: " .. folder_path)
        else
          print("No folder provided.")
        end
      end)
    end, {})

    vim.api.nvim_create_user_command("JavaAddWorkspaces", function() 
      vim.ui.input({ prompt = "Enter folder path for all subfolders: " }, function(path)
        local uv = vim.loop
        local handle = uv.fs_scandir(path)
        local dirs = {}
        if handle then
          while true do
            local name, t = uv.fs_scandir_next(handle)
            if not name then break end
            if t == "directory" then
              table.insert(dirs, path .. name)
            end
          end
        end

        for _, folder in ipairs(dirs) do
          local folder_path = vim.fn.fnamemodify(folder, ":p")
          vim.lsp.buf.add_workspace_folder(folder_path)
        end
      end)
    end, {})

    vim.api.nvim_create_user_command("DapInitConfig", function()
      local dap = require("dap")
      dap.configurations.java = {
        {
          type = 'java',
          name = 'Debug (Attach)',
          request = 'attach',
          hostName = '127.0.0.1',
          port = 5005,
          mainClass = "org.springframework.boot.loader.JarLauncher",
          projectName = vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
          classPaths = {
            vim.fn.glob(vim.fn.expand("$HOME/.gradle/caches/**/*.jar")) -- Include Gradle dependencies
          }
        },
      }
    end, {})
    
  end,
}
