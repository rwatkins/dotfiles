hs.window.animationDuration = 0

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function ()
  hs.reload()
end)
hs.alert.show("Config Loaded")

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
  local max = screen:frame()

  transformOrCycleScreen(max.x, max.y, max.w / 2, max.h)
end)

hs.hotkey.bind({"ctrl", "alt"}, "J", function ()
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  -- frame.x = max.w / 8
  -- frame.y = max.y
  -- frame.w = max.w * 3 / 4
  -- frame.h = max.h
  transformOrCycleScreen(max.w / 8, max.y, max.w * 3 / 4, max.h)
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
