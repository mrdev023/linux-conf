-------------------- HELPERS -------------------------------
local helpers = require('helpers')

-------------------- OPTIONS -------------------------------
helpers.call_with_helpers(require('options').init)

-------------------- PLUGINS -------------------------------
helpers.call_with_helpers(require('plugins').init)

-------------------- MAPPINGS ------------------------------
helpers.call_with_helpers(require('mappings').init)