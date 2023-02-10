hs.window.animationDuration = 0

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function ()
  hs.reload()
end)
hs.alert.show("Config Loaded")

local log = hs.logger.new('mymain','debug')

function transformOrCycleScreen(x, y, w, h)
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local nextScreen = screen:next()
  local frame = win:frame()

  if frame.x == x and frame.y == y and frame.w == w and frame.h == h and screen ~= nextScreen then
    win:move(frame:toUnitRect(screen:frame()), nextScreen, true, 0)
  else
    frame.x = x
    frame.y = y
    frame.w = w
    frame.h = h
    win:setFrame(frame)
  end
end

hs.hotkey.bind({"ctrl", "alt"}, "H", function ()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local nextScreen = screen:next()
  local max = screen:frame()

  transformOrCycleScreen(max.x, max.y, max.w / 2, max.h)
end)

hs.hotkey.bind({"ctrl", "alt"}, "N", function ()
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()
  win:move(frame:toUnitRect(screen:frame()), screen:next(), true, 0)
end)

hs.hotkey.bind({"ctrl", "alt"}, "J", function ()
  log.d("Ctrl+Alt+J")
  local win = hs.window.focusedWindow()
  local winFrame = win:frame()
  local curScreen = win:screen()
  local nextScreen = curScreen:next()

  log.d('winFrame: ' .. tostring(winFrame))
  log.d('cur screen: ' .. tostring(curScreen))
  log.d('next screen: ' .. tostring(nextScreen))

  local curScreenFrame = curScreen:frame()

  x = curScreenFrame.w / 8
  y = curScreenFrame.y
  w = curScreenFrame.w * 3 / 4
  h = curScreenFrame.h

  log.d('checking size...')

  if winFrame.x == x and winFrame.y == y and winFrame.w == w and winFrame.h == h and curScreen ~= nextScreen then
    log.d('move screen')
    win:move(winFrame:toUnitRect(curScreenFrame), nextScreen, true, 0)
    log.d('resize to fit new screen')
    log.d('curScreen: ', curScreen)
    local f = nextScreen:frame()
    log.d('nextScreen frame: ', f, ' x ', f.x, ' y ', f.y, ' w ', f.w, ' h ', f.h)
    winFrame.x = f.w / 8
    winFrame.y = f.y
    winFrame.w = f.w * 3 / 4
    winFrame.h = f.h
    log.d('setFrame ', winFrame)
    win:setFrame(winFrame)
    -- log.d(tostring(frame.x) .. ',' .. tostring(frame.y) .. ' ' .. tostring(frame.w) .. 'x' .. tostring(frame.h))
  else
    log.d('resize on current screen')
    winFrame.x = x
    winFrame.y = y
    winFrame.w = w
    winFrame.h = h
    win:setFrame(winFrame)
  end
    -- log.d(tostring(frame.x) .. ',' .. tostring(frame.y) .. ' ' .. tostring(frame.w) .. 'x' .. tostring(frame.h))
end)

hs.hotkey.bind({"ctrl", "alt"}, "Left", function ()
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  frame.x = max.x
  frame.y = max.y
  frame.w = max.w * 3 / 4
  frame.h = max.h
  win:setFrame(frame)
end)

hs.hotkey.bind({"ctrl", "alt"}, "K", function ()
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  frame.x = max.x
  frame.y = max.y
  frame.w = max.w
  frame.h = max.h
  win:setFrame(frame)
end)

hs.hotkey.bind({"ctrl", "alt"}, "L", function ()
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  frame.x = max.w / 2
  frame.y = max.y
  frame.w = max.w / 2
  frame.h = max.h
  win:setFrame(frame)
end)

hs.hotkey.bind({"ctrl", "alt"}, "Right", function ()
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  frame.x = max.w / 4
  frame.y = max.y
  frame.w = max.w * 3 / 4
  frame.h = max.h
  win:setFrame(frame)
end)

hs.loadSpoon('ControlEscape'):start() -- Load Hammerspoon bits from https://github.com/jasonrudolph/ControlEscape.spoon