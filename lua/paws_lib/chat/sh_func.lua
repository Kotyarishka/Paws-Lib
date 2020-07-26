local MODULE = PAW_MODULE('lib')
local Chat = MODULE.Config.Chat or {}

function MODULE:SendMessage(ply, MSG_TYPE, ...)
    local args = {...}
    
    if SERVER then
        net.Start('Paws.Lib.Msg')
            net.WriteInt(MSG_TYPE, 8)
            net.WriteTable(args)
        net.Send(ply)
    end
    
    if CLIENT then
        net.Start('Paws.Lib.Msg')
            net.WriteEntity(ply)
            net.WriteInt(MSG_TYPE, 8)
            net.WriteTable(args)
        net.SendToServer()
    end
end 

function MODULE:SendMessageDist(ply, MSG_TYPE, dist, ...) 
    if !IsValid(ply) then return end

    local args = {...}

    if dist == 0 then
        for _, v in pairs( player.GetAll() ) do
            MODULE:SendMessage(v, MSG_TYPE, unpack(args))
        end
    else
        for _, v in ipairs(player.GetAll()) do
            if IsValid(v) and v:GetPos():Distance(ply:GetPos()) <= dist then
                MODULE:SendMessage(v, MSG_TYPE, unpack(args))
            end
        end
    end
end