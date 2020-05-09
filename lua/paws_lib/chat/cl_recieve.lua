local MODULE = PAW_MODULE('lib')
local Chat = MODULE.Config.Chat or {}

if CLIENT then
    local function RecieveMessage()
        local MSG_TYPE = net.ReadInt(8) or -1
        local args = net.ReadData(255) 
        args = util.JSONToTable(util.Decompress(args))

        local toPrint = {Chat.PREFIX_COLOR, Chat.PREFIX} 
        
        if MSG_TYPE == Chat.MESSAGES_TYPE.SUCCESS then
            table.insert(toPrint, ' ')
            table.insert(toPrint, Chat.SUCCESS_COLOR)
            table.insert(toPrint, Chat.SUCCESS_MSG)
        elseif MSG_TYPE == Chat.MESSAGES_TYPE.WARNING then
            table.insert(toPrint, ' ')
            table.insert(toPrint, Chat.WARNING_COLOR)
            table.insert(toPrint, Chat.WARNING_MSG)
        elseif MSG_TYPE == Chat.MESSAGES_TYPE.ERROR then
            table.insert(toPrint, ' ')
            table.insert(toPrint, Chat.ERROR_COLOR)
            table.insert(toPrint, Chat.ERROR_MSG)
        elseif MSG_TYPE == Chat.MESSAGES_TYPE.RP then
            table.insert(toPrint, ' ')
            table.insert(toPrint, Chat.ERROR_COLOR)
            table.insert(toPrint, '[RP]')
        end 

        table.insert(toPrint, Color(255,255,255))
        table.insert(toPrint, ' ')
        table.Add(toPrint, args)

        chat.AddText(unpack(toPrint))
    end

    net.Receive('Paws.Lib.Msg', RecieveMessage)
end