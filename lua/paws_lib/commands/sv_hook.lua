local MODULE = PAW_MODULE('lib')

local function ParseCommand(pPlayer, sText)

    local sPrefix = string.sub(sText, 0, 1)

    if sPrefix == '/' or sPrefix == '!' then
        local sText = string.sub(sText, 2)
        local tArgs = string.Split(sText, ' ')
        local sCommand = tArgs[1]

        sText = string.sub(sText, string.len(sCommand) + 2)

        local tCommand = MODULE:Command(sCommand, true)

        if tCommand != nil then
            tCommand:OnRun(pPlayer, sText)

            return ''
        end        
    end
end 



hook.Add('PlayerSay', 'Paws.Lib.Command.Hook', function( pPlayer, sText )
    return ParseCommand(pPlayer, sText)  
end)

 