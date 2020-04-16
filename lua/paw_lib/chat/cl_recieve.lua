/*

Chat Messages for Paws Lib.

Made by Kot from "🐾 Aw... Paws!"

*/

Paws = Paws or {}
Paws.Lib = Paws.Lib or {}
Paws.Lib.Chat = Paws.Lib.Chat or {}
Paws.Lib.Chat.Config = Paws.Lib.Chat.Config or {}

if CLIENT then
    local function RecieveMessage()
        local MSG_TYPE = net.ReadInt(8) or -1
        local args = net.ReadData(255) 
        args = util.JSONToTable(util.Decompress(args))

        local toPrint = {Paws.Lib.Chat.PREFIX_COLOR, Paws.Lib.Chat.PREFIX} 
        
        if MSG_TYPE == Paws.Lib.Chat.Config.SUCCESS then
            table.insert(toPrint, ' ')
            table.insert(toPrint, Paws.Lib.Chat.Config.SUCCESS_COLOR)
            table.insert(toPrint, Paws.Lib.Chat.Config.SUCCESS_MSG)
        elseif MSG_TYPE == Paws.Lib.Chat.Config.WARNING then
            table.insert(toPrint, ' ')
            table.insert(toPrint, Paws.Lib.Chat.Config.WARNING_COLOR)
            table.insert(toPrint, Paws.Lib.Chat.Config.WARNING_MSG)
        elseif MSG_TYPE == Paws.Lib.Chat.Config.ERROR then
            table.insert(toPrint, ' ')
            table.insert(toPrint, Paws.Lib.Chat.Config.ERROR_COLOR)
            table.insert(toPrint, Paws.Lib.Chat.Config.ERROR_MSG)
        elseif MSG_TYPE == Paws.Lib.Chat.Config.RP then
            table.insert(toPrint, ' ')
            table.insert(toPrint, Paws.Lib.Chat.Config.ERROR_COLOR)
            table.insert(toPrint, '[RP]')
        end 

        table.insert(toPrint, Color(255,255,255))
        table.insert(toPrint, ' ') 
        table.Add(toPrint, args)

        PrintTable(toPrint)

        chat.AddText(unpack(toPrint))
    end

    net.Receive('Paws.Lib.Msg', RecieveMessage)
end