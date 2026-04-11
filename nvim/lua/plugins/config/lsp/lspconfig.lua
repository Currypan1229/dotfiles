-- JS/TS/JSON/CSS/HTMLのフォーマットのみ
require("plugins.config.lsp.lspconfig.biome")

-- 型チェックと補完のみ
require("plugins.config.lsp.lspconfig.vtsls")

-- Biome未対応言語のみに
require("plugins.config.lsp.lspconfig.eslint")

-- JSONのスキーマ検証(整形はBiome)
require("plugins.config.lsp.lspconfig.jsonls")

-- htmlタグ補完用(整形はBiome)
require("plugins.config.lsp.lspconfig.html")

-- CSS補完用(整形はBiome)
require("plugins.config.lsp.lspconfig.cssls")
