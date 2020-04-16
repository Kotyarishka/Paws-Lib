Paws = Paws or {}
Paws.Lib = Paws.Lib or {}
Paws.Modules = Paws.Modules or {}

/*

Module META setup

*/
 
local meta = {}
function meta.__call( self, var )
	return self
end 

/*

Module META

*/

local m = {}

m.Title = "Title"
m.Author = "None"
m.Version = "None"

m.MAIN_ROOT = 'paw'
m.CONFIG = 'config.lua'
m.INIT = 'init.lua'



meta.__index = m

/*

New module

*/

function Paws.Lib.Module(UID)
    for k, v in ipairs(Paws.Modules) do
        if v.UID == UID then return Paws.Modules[k] end
    end
    
    local MODULE = {}
    MODULE.UID = UID
    setmetatable( MODULE, meta )
    local i = table.insert(Paws.Modules, MODULE)
    return Paws.Modules[i]
end

function Paws.GetModule(UID)
    for k, v in ipairs(Paws.Modules) do
        if v.UID == UID then return Paws.Modules[k] end
    end

    return nil
end