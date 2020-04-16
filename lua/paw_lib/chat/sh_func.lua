/*

Chat Messages for Paws Lib.

Made by Kot from "🐾 Aw... Paws!"

*/

Paws = Paws or {}
Paws.Lib = Paws.Lib or {}
Paws.Lib.Chat = Paws.Lib.Chat or {}
Paws.Lib.Chat.Config = Paws.Lib.Chat.Config or {}

function Paws.Lib:SendMessage(ply, MSG_TYPE, ...)
    local args = {...}
    args = util.Compress(util.TableToJSON(args))
    
    if SERVER then
        net.Start('Paws.Lib.Msg')
            net.WriteInt(MSG_TYPE, 8)
            net.WriteData(args, 255)
        net.Send(ply)
    end
    
    if CLIENT then
        net.Start('Paws.Lib.Msg')
            net.WriteEntity(ply)
            net.WriteInt(MSG_TYPE, 8)
            net.WriteData(args, 255)
        net.SendToServer()
    end
end

function Paws.Lib:SendMessageDist(ply, MSG_TYPE, dist, ...) 
    if !IsValid(ply) then return end

    local args = {...}

    if dist == 0 then
        for _, v in pairs( player.GetAll() ) do
            Paws.Lib:SendMessage(v, MSG_TYPE, unpack(args))
        end
    else
        for _, v in ipairs(player.GetAll()) do
            if IsValid(v) and v:GetPos():Distance(ply:GetPos()) <= dist then
                Paws.Lib:SendMessage(v, MSG_TYPE, unpack(args))
            end
        end
    end
end