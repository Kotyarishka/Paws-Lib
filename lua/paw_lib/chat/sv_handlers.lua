/*

Chat Messages handler for Paws Lib.

Made by Kot from "🐾 Aw... Paws!"

*/

local function Handler(_, sender)
    local ply = net.ReadEntity()
    local MSG_TYPE = net.ReadInt(8)
    local data = net.ReadData(255)

    net.Start('Paws.Lib.Msg')
        net.WriteInt(MSG_TYPE, 8)
        net.WriteData(data, 255)
    net.Send(ply)
end

net.Receive('Paws.Lib.Msg', Handler)