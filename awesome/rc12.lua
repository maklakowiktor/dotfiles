-- Импортируем необходимые библиотеки
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

-- Задаем тему
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme1.lua")

local terminal = "terminal"

-- Ключевые биндинги
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    -- Остальные биндинги...
})

-- Настройки панелей
awful.screen.connect_for_each_screen(function(s)
    -- Создаем теговый лист и панель задач
    awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])

    -- Панель сверху
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Добавляем виджеты
    local layout = wibox.layout.align.horizontal()
    layout:set_left(wibox.widget.textbox("Awesome WM"))
    s.mywibox:set_widget(layout)
end)

-- Запуск приложений при старте
awful.spawn.with_shell("picom --config ~/.config/picom/picom.conf &") -- Прозрачность

