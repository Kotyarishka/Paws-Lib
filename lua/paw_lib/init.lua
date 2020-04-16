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

FILESYSTEM = {
    'meta'
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
end

LoadLib()
