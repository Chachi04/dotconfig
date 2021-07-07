----------------------------------------------------------
----------------------------------------------------------
--               _       _ __    __                     --
--              (_)___  (_) /_  / /_  ______ _          --
--             / / __ \/ / __/ / / / / / __ `/          --
--            / / / / / / /__ / / /_/ / /_/ /           --
--           /_/_/ /_/_/\__(_)_/\__,_/\__,_/            --
--                                                      --
----------------------------------------------------------
----------------------------------------------------------

-- bootstrap packer.nvim
require("bootstrap")

-- settings
require("settings")

-- plugins
require("plugins")

-- keymappings
require("mappings")

-- configuration
require("config.telescope")
require("config.lsp")
require("config.term")
require("config.file-explorer")
