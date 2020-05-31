local EP = {
    m = 'paws_modules',
    l = 'paws_lib'
}

local MODULES = MODULES or {}
 
local meta = {}
function meta.__call( self, var )
	return self
end 

local m = {
    uID = 'newmodule',
    Title = 'New Module',
    Author = 'Newbie',
    Version = '0.0.1',

    ROOT = 'paw_newmodule',
    CONFIG = 'config.lua',

    FILESYSTEM = {},
    NETS = {},

    OnLoad = function(self)

    end,

    SetTitle = function(self, sString)
        self.Title = sString
        return self
    end,
    SetAuthor = function(self, sString)
        self.Author = sString
        return self
    end,
    SetVersion = function(self, sString)
        self.Version = sString
        return self
    end,

    SetRoot = function(self, sString)
        self.ROOT = sString
        return self
    end,
    SetConfig = function(self, sString)
        self.CONFIG = sString
        return self
    end,

    SetFileSystem = function(self, tTable)
        self.FILESYSTEM = tTable
        return self
    end,

    SetNets = function(self, tTable)
        self.NETS = tTable
        return self
    end,

    SetOnLoadFunction = function(self, fFuntion)
        self.OnLoad = fFuntion(self)
        return self
    end
}

meta.__index = m

function PAW_MODULE(uid)

    for k, v in ipairs(MODULES) do
        if v.uID == uid then return MODULES[k] end
    end

    local ModuleTable = {
        uID = uid 
    }

    setmetatable(ModuleTable, meta)
    local i = table.insert(MODULES, ModuleTable)

    return MODULES[i]
end

local function load()
    local modules = file.Find(EP.m..'/*', 'LUA')

    for k, v in pairs(modules) do
        local m = include(EP.m..'/'..v)

        // if not istable(m) then continue end

        AddCSLuaFile(EP.m..'/'..v) 

        MsgC(Color(0,255,0), '[Aw... Paws!] Loading module "'..m.Title..'" by '..m.Author..' (v: '..m.Version..')'..'\n')
        hook.Run('Paws.'..m.uID..'.Loading', m)

        include(m.ROOT..'/'..m.CONFIG)
        AddCSLuaFile(m.ROOT..'/'..m.CONFIG)

        for k, dir in pairs(m.FILESYSTEM) do
            local files = file.Find(m.ROOT..'/'..dir..'/*', 'LUA')

            for k, v in pairs(files) do
                if string.StartWith(v, 'sv') then
                    if SERVER then
                        local load = include(m.ROOT..'/'..dir..'/'..v)
                        if load then load() end
                    end 
                end

                if string.StartWith(v, 'cl') then
                    if CLIENT then
                        local load = include(m.ROOT..'/'..dir..'/'..v)
                        if load then load() end 
                    end

                    AddCSLuaFile(m.ROOT..'/'..dir..'/'..v)
                end

                if string.StartWith(v, 'sh') then
                    local load = include(m.ROOT..'/'..dir..'/'..v)
                    if load then load() end

                    AddCSLuaFile(m.ROOT..'/'..dir..'/'..v)
                end 

                MsgC(Color(190, 252, 3), '[Aw... Paws!]', '[', m.Title, ']', ' Loaded "'..v..'" successfully\n')
            end 
        end

        for k, v in pairs(m.NETS) do
            if SERVER then
                util.AddNetworkString(v)
                MsgC(Color(0, 255, 0), '[Aw... Paws!]', '[', m.Title, ']', ' Registered Network string "'..v..'" successfully\n' )
            end
        end

        MsgC(Color(0,255,0), '[Aw... Paws!] Loaded module "'..m.Title..'" by '..m.Author..' (v: '..m.Version..')'..'\n')
        m.Loaded = true
        hook.Run('Paws.'..m.uID..'.Loaded', m)
    end
end

if GAMEMODE then
	load()
else
	hook.Add('InitPostEntity', 'KTS.Load.RanksSystem', function()
        load()
	end)
end
