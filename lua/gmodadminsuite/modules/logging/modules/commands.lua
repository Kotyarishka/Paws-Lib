local MODULE = GAS.Logging:MODULE() -- This creates our module object, which we interface with to define its behaviours and characteristics

MODULE.Category = 'Чат'
MODULE.Name = 'Все команды'
MODULE.Colour = Color(0,106,193)

MODULE:Setup(function()
	MODULE:Hook('Paws.Lib.CommandRun', 'CommandRun', function(command, actor, text)
		MODULE:Log('{1}: {2}', GAS.Logging:FormatPlayer(actor), GAS.Logging:Highlight(command .. ' ' .. text))
	end)
end)

GAS.Logging:AddModule(MODULE)

local MODULE = GAS.Logging:MODULE() -- This creates our module object, which we interface with to define its behaviours and characteristics

MODULE.Category = 'Чат'
MODULE.Name = 'Чат'
MODULE.Colour = Color(0,106,193)

MODULE:Setup(function()
	MODULE:Hook('Paws.Lib.CommandRun.OOC', 'CommandAllChatOOCRun', function(command, actor, text)
        MODULE:Log('{1} {2}: {3}', GAS.Logging:Highlight('[OOC]'), GAS.Logging:FormatPlayer(actor), GAS.Logging:Escape(text))
	end)
    MODULE:Hook('Paws.Lib.CommandRun.LOOC', 'CommandAllChatLOOCRun', function(command, actor, text)
        MODULE:Log('{1} {2}: {3}', GAS.Logging:Highlight('[LOOC]'), GAS.Logging:FormatPlayer(actor), GAS.Logging:Escape(text))
	end)
    MODULE:Hook('Paws.Lib.CommandRun.All', 'CommandAllChatSpeakRun', function(command, actor, text)
        if command == 'chat' then
            MODULE:Log('{1} {2}: {3}', GAS.Logging:Highlight('[Речь]'), GAS.Logging:FormatPlayer(actor), GAS.Logging:Escape(text))
        end
	end)
    MODULE:Hook('Paws.Lib.CommandRun.Chat', 'CommandAllChatRPModificatorsRun', function(command, actor, text)
		local t = {
            ['y'] = '[Крик]',
            ['w'] = '[Шёпот]'
        }
        MODULE:Log('{1} {2}: {3}', GAS.Logging:Highlight(t[command]), GAS.Logging:FormatPlayer(actor), GAS.Logging:Escape(text))
	end)
    MODULE:Hook('Paws.Lib.CommandRun.RP', 'CommandAllChatRPStuffRun', function(command, actor, text, chance)
		if isbool(chance) then
            chance = chance and 'Успешный!' or 'Безуспешный!'
        elseif isnumber(chance) then
            chance = chance
        else
            chance = 'Ошибка...'
        end
        local t = {
            ['me'] = '[ME]',
            ['do'] = '[DO]',
            ['try'] = '[TRY] ' .. chance,
            ['roll'] = '[ROLL]' .. chance,
        }
        MODULE:Log('{1} {2}: {3}', GAS.Logging:Highlight(t[command]), GAS.Logging:FormatPlayer(actor), GAS.Logging:Escape(text))
	end)
    MODULE:Hook('Paws.Lib.CommandRun.Comlink', 'CommandAllChatComlinkRun', function(command, actor, text)
        MODULE:Log('{1} {2}: {3}', GAS.Logging:Highlight('[Комлинк]'), GAS.Logging:FormatPlayer(actor), GAS.Logging:Escape(text))
	end)
end)

GAS.Logging:AddModule(MODULE)

local MODULE = GAS.Logging:MODULE() -- This creates our module object, which we interface with to define its behaviours and characteristics

MODULE.Category = 'Чат'
MODULE.Name = 'OOC Чат'
MODULE.Colour = Color(0,106,193)

MODULE:Setup(function()
	MODULE:Hook('Paws.Lib.CommandRun.OOC', 'CommandOOCChatRun', function(command, actor, text)
        MODULE:Log('{1} {2}: {3}', GAS.Logging:Highlight('[OOC]'), GAS.Logging:FormatPlayer(actor), GAS.Logging:Escape(text))
	end)
    MODULE:Hook('Paws.Lib.CommandRun.LOOC', 'CommandLOOCChatRun', function(command, actor, text)
        MODULE:Log('{1} {2}: {3}', GAS.Logging:Highlight('[LOOC]'), GAS.Logging:FormatPlayer(actor), GAS.Logging:Escape(text))
	end)
end)

GAS.Logging:AddModule(MODULE)

local MODULE = GAS.Logging:MODULE() -- This creates our module object, which we interface with to define its behaviours and characteristics

MODULE.Category = 'Чат'
MODULE.Name = 'РП Чат'
MODULE.Colour = Color(0,106,193)

MODULE:Setup(function()
	MODULE:Hook('Paws.Lib.CommandRun.All', 'CommandRPChatRun', function(command, actor, text)
        if command == 'chat' then
            MODULE:Log('{1} {2}: {3}', GAS.Logging:Highlight('[Речь]'), GAS.Logging:FormatPlayer(actor), GAS.Logging:Escape(text))
        end
	end)
    MODULE:Hook('Paws.Lib.CommandRun.Chat', 'CommandRPChatModificatorsRun', function(command, actor, text)
		local t = {
            ['y'] = '[Крик]',
            ['w'] = '[Шёпот]'
        }
        MODULE:Log('{1} {2}: {3}', GAS.Logging:Highlight(t[command]), GAS.Logging:FormatPlayer(actor), GAS.Logging:Escape(text))
	end)
    MODULE:Hook('Paws.Lib.CommandRun.RP', 'CommandRPChatRPStuffRun', function(command, actor, text, chance)
        if isbool(chance) then
            chance = chance and 'Успешный!' or 'Безуспешный!'
        elseif isnumber(chance) then
            chance = chance
        else
            chance = 'Ошибка...'
        end
		local t = {
            ['me'] = '[ME]',
            ['do'] = '[DO]',
            ['try'] = '[TRY] ' .. chance,
            ['roll'] = '[ROLL]' .. chance,
        }
        MODULE:Log('{1} {2}: {3}', GAS.Logging:Highlight(t[command]), GAS.Logging:FormatPlayer(actor), GAS.Logging:Escape(text))
	end)
    MODULE:Hook('Paws.Lib.CommandRun.Comlink', 'CommandRPChatComlinkRun', function(command, actor, text)
        MODULE:Log('{1} {2}: {3}', GAS.Logging:Highlight('[Комлинк]'), GAS.Logging:FormatPlayer(actor), GAS.Logging:Escape(text))
	end)
end)

GAS.Logging:AddModule(MODULE)

local MODULE = GAS.Logging:MODULE() -- This creates our module object, which we interface with to define its behaviours and characteristics

MODULE.Category = 'Чат'
MODULE.Name = 'РП'
MODULE.Colour = Color(0,106,193)

MODULE:Setup(function()
	MODULE:Hook('Paws.Lib.CommandRun.Chat', 'CommandRPModificatorsRun', function(command, actor, text)
		local t = {
            ['y'] = '[Крик]',
            ['w'] = '[Шёпот]'
        }
        MODULE:Log('{1} {2}: {3}', GAS.Logging:Highlight(t[command]), GAS.Logging:FormatPlayer(actor), GAS.Logging:Escape(text))
	end)
end)

GAS.Logging:AddModule(MODULE)

local MODULE = GAS.Logging:MODULE() -- This creates our module object, which we interface with to define its behaviours and characteristics

MODULE.Category = 'Чат'
MODULE.Name = 'Действия'
MODULE.Colour = Color(0,106,193)

MODULE:Setup(function()
	MODULE:Hook('Paws.Lib.CommandRun.RP', 'CommandRPStuffRun', function(command, actor, text, chance)
		chance = chance or false
        
        if isbool(chance) then
            chance = chance and 'Успешный!' or 'Безуспешный!'
        elseif isnumber(chance) then
            chance = chance
        else
            chance = 'Ошибка...'
        end

        local t = {
            ['me'] = '[ME]',
            ['do'] = '[DO]',
            ['try'] = '[TRY] ' .. chance,
            ['roll'] = '[ROLL]' .. chance,
        }
        MODULE:Log('{1} {2}: {3}', GAS.Logging:Highlight(t[command]), GAS.Logging:FormatPlayer(actor), GAS.Logging:Escape(text))
	end)
end)

GAS.Logging:AddModule(MODULE)

local MODULE = GAS.Logging:MODULE() -- This creates our module object, which we interface with to define its behaviours and characteristics

MODULE.Category = 'Чат'
MODULE.Name = 'Комлинк'
MODULE.Colour = Color(0,106,193)

MODULE:Setup(function()
	MODULE:Hook('Paws.Lib.CommandRun.Comlink', 'CommandComlinkRun', function(command, actor, text)
        MODULE:Log('{1} {2}: {3}', GAS.Logging:Highlight('[Комлинк]'), GAS.Logging:FormatPlayer(actor), GAS.Logging:Escape(text))
	end)
end)

GAS.Logging:AddModule(MODULE)
