hs.loadSpoon('EmmyLua')

-- Defining hyper key
local hyper = {'cmd', 'alt', 'ctrl', 'shift'}

 -- Application Switcher
local HyperKey = hs.loadSpoon('HyperKey')
hyperKey = HyperKey:new(hyper, {
  overlayTimeoutMs = 1000
})

hyperKey
  :bind('c'):toApplication('/Applications/Google Chrome.app')
  :bind('t'):toApplication('/Applications/kitty.app')
  :bind('s'):toApplication('/Applications/Spotify.app')
  :bind('o'):toApplication('/Applications/Obsidian.app')
  :bind('h'):toFunction('Hello world', helloWorld)


-- Mute on start
local function mute()
  local audioDevices = hs.audiodevice.allOutputDevices()
  -- hs
  -- audioDevices:setMuted(true)
end

hs.hotkey.bind('hyper', 'p', mute())
