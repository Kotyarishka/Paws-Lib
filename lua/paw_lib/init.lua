/*

Init for Paws Lib.

Made by Kot from "🐾 Aw... Paws!"

*/

/*

Module info:

Name: Main Lib
Author: Kot
Version: 0.1

*/

Paws = Paws or {}
Paws.Lib = Paws.Lib or {}

local FILESYSTEM = {
    'meta',
    'chat'
}

local NETS = {
    'Paws.Lib.Msg'
}

local function LoadLib()
    for k, dir in pairs(FILESYSTEM) do
        local files = file.Find('paw_lib/'..dir..'/*', 'LUA')

        for k, v in pairs(files) do
            if string.StartWith(v, 'sv') then
                local load = include('paw_lib/'..dir..'/'..v)
                if load then load() end
            end
        end 
    end

    for k, v in pairs(NETS) do
        util.AddNetworkString(v)
        MsgC(Color(0, 255, 0), '[Aw... Paws!]', '[Lib]', ' Registered Network string "'..v..'" successfully\n' )
    end
end

LoadLib()
