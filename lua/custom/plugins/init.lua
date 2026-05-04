-- This file is used by `require('lazy').setup({ import = 'custom.plugins' })`
-- Place plugin specs as separate files in this directory and import them here.
-- The directory contains individual plugin spec files (e.g. yazi.lua).
return {
  -- Import all plugin specs in this folder via filename modules.
  -- Keep this list small and explicit so it's easy to reason about what's installed.
  { import = 'custom.plugins.yazi' },
  { import = 'custom.plugins.quicker' },
}
