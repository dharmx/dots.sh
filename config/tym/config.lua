local tym = require('tym')

-- xdg vars
local xdg = {
    config = os.getenv('XDG_CONFIG_HOME'),
    cache = os.getenv('XDG_CACHE_HOME'),
    desktop = os.getenv('XDG_DESKTOP_DIR'),
    download = os.getenv('XDG_DOWNLOAD_DIR'),
    templates = os.getenv('XDG_TEMPLATES_DIR'),
    public = os.getenv('XDG_PUBLICSHARE_DIR'),
    documents = os.getenv('XDG_DOCUMENTS_DIR'),
    music = os.getenv('XDG_MUSIC_DIR'),
    pictures = os.getenv('XDG_PICTURES_DIR'),
    videos = os.getenv('XDG_VIDEOS_DIR')
}

-- set individually
tym.set('width', 80)
tym.set('height', 20)

local font_size = '14'
tym.set('font', 'JetBrainsMono Nerd Font 14')

-- set by table
tym.set_config({
    shell = xdg.config .. '/zsh/start.zsh pi',
    cursor_shape = 'block',
    autohide = true,
    padding_horizontal = 20,
    padding_vertical = 20,
    term = 'xterm-256color',
    cjk_width = 'narrow'
})

function update_alpha(delta)
    r, g, b, a = tym.color_to_rgba(tym.get('color_background'))
    a = math.max(math.min(1.0, a + delta), 0.0)
    bg = tym.rgba_to_color(r, g, b, a)
    tym.set('color_background', bg)
    tym.notify(
        string.format('%s alpha to %f', (delta > 0 and 'Inc' or 'Dec'), a))
end

-- dynamic opacity
tym.set_keymaps({
    ['<Ctrl><Shift>Up'] = function() update_alpha(0.05) end,
    ['<Ctrl><Shift>Down'] = function() update_alpha(-0.05) end
})

-- font scaling
tym.set_hook('scroll', function(dx, dy, x, y)
    if tym.check_mod_state('<Ctrl>') then
        if dy > 0 then
            s = tym.get('scale') - 10
        else
            s = tym.get('scale') + 10
        end
        tym.set('scale', s)
        tym.notify('set scale: ' .. s .. '%')
        return true
    end
    if tym.check_mod_state('<Shift>') then
        update_alpha(dy < 0 and 0.05 or -0.05)
        return true
    end
end)

-- also can set keymap
tym.set_keymap('<Ctrl><Shift>o', function()
    local h = tym.get('height')
    tym.set('height', h + 1)
    tym.notify('Set window height :' .. h)
end)

-- set by table
tym.set_keymaps({
    ['<Ctrl><Shift>t'] = function()
        tym.reload()
        tym.notify('reload config')
    end,
    ['<Ctrl><Shift>r'] = function()
        -- reload and notify
        tym.send_key('<Ctrl><Shift>t')
    end,

    ['<Shift>y'] = function()
        tym.notify('Y has been pressed')
        return true -- notification is shown and `Y` will be inserted
    end,
    ['<Shift>w'] = function()
        tym.notify('W has been pressed')
        -- notification is shown but `W` is not inserted
    end
})

-- tmux leader delay fix
local remap =
    function(a, b) tym.set_keymap(a, function() tym.send_key(b) end) end
remap('<Alt>h', '<Alt>Left') -- remap as meta key inputs
remap('<Alt>l', '<Alt>Right')
remap('<Alt><Shift>h', '<Alt><Shift>Left')
remap('<Alt><Shift>l', '<Alt><Shift>Right')

-- vim:ft=lua:nowrap