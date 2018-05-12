print('Make_Settings.lua V.1 by Sebyg666 loaded')	
	
if not windower.dir_exists(windower.addon_path..'data/settings') then
	windower.create_dir(windower.addon_path..'data/settings')
end

if not windower.file_exists(windower.addon_path..'data/settings/'..player.name..'_'..player.main_job:upper()..'_data.lua') then
	
	defaults = {}
	defaults.display = {}
	defaults.display.pos = {}
	defaults.display.pos.x = 0
	defaults.display.pos.y = 0
	defaults.display.bg = {}
	defaults.display.bg.red = 0
	defaults.display.bg.green = 0
	defaults.display.bg.blue = 0
	defaults.display.bg.alpha = 150
	defaults.display.bg.visible = true
	defaults.display.flags = {}
	defaults.display.flags.draggable = true
	defaults.display.text = {}
	defaults.display.text.font = 'Tahoma'
	defaults.display.text.red = 255
	defaults.display.text.green = 255
	defaults.display.text.blue = 255
	defaults.display.text.alpha = 255
	defaults.display.text.size = 12
	defaults.display.text.stroke = {}
	defaults.display.text.stroke.width = 2
	defaults.display.text.stroke.alpha = 255
	defaults.display.text.stroke.red = 0
	defaults.display.text.stroke.green = 0
	defaults.display.text.stroke.blue = 0
		
	local f = io.open(windower.addon_path..'data/settings/'..player.name..'_'..player.main_job:upper()..'_data.lua','w+')
	f:write('return ' .. T(defaults):tovstring())
	f:close()
end

function load_settings()
	
	local f = io.open(windower.addon_path..'data/settings/'..player.name..'_'..player.main_job:upper()..'_data.lua','r')
	local t = f:read("*all")
	t = assert(loadstring(t))()
	f:close()
	
	return t
	
end

function save_settings()
	
	local f = io.open(windower.addon_path..'data/settings/'..player.name..'_'..player.main_job:upper()..'_data.lua','w+')
	settings.display.text.stroke.alpha = 255
	f:write('return ' .. T(settings):tovstring())
	f:close()
	
end