local function bind(globalkeys, clientkeys, clientbuttons)
  -- Media Control
  globalkeys, clientkeys, clientbuttons = require('keymapping.mediacontrol').bind(globalkeys, clientkeys, clientbuttons)
    
  return globalkeys, clientkeys, clientbuttons
end

return {
  bind = bind
}