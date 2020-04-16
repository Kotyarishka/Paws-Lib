/*

Loader for Paws Ecosystem.

Made by Kot from "🐾 Aw... Paws!"

*/

local function LoadModules()
    local modules_files = file.Find('paw_modules/*', 'LUA')

    for k, v in pairs(modules_files) do
        if string.StartWith(v, 'paw') then
            local info, load = include('paw_modules/'..v)
            if load then load() end

            AddCSLuaFile('paw_modules/'..v) 

            MsgC(Color(0,255,0), '[Aw... Paws!] Loaded module "'..info.Title..'" by '..info.Author..' (v: '..info.Version..')'..'\n')
        end
        if string.StartWith(v, 'ipaw') then
            local info, load = include('paw_modules/'..v)
            if load then load() end   

            AddCSLuaFile('paw_modules/'..v) 

            MsgC(Color(0,255,0), '[Aw... Paws!] Loaded important module "'..info.Title..'" by '..info.Author..' (v: '..info.Version..')'..'\n')
        end
    end
end

if GAMEMODE then
	LoadModules()
else
	hook.Add("InitPostEntity", "KTS.Load.RanksSystem", function()
        LoadModules()
	end)  
end