/*

Module for Paws Lib.

Made by Kot from "🐾 Aw... Paws!"

*/

local MODULE = {}

MODULE.Title = 'Paws Lib'
MODULE.Author = 'Kot'
MODULE.Version = '0.1'

MODULE.MAIN_ROOT = 'paw_lib'
MODULE.CONFIG = 'config.lua'
MODULE.INIT = 'init.lua'

local function Load()
    AddCSLuaFile(MODULE.MAIN_ROOT..'/'..MODULE.CONFIG)
    include(MODULE.MAIN_ROOT..'/'..MODULE.CONFIG)

    AddCSLuaFile(MODULE.MAIN_ROOT..'/'..MODULE.INIT)
    include(MODULE.MAIN_ROOT..'/'..MODULE.INIT)
end 

return MODULE, Load()