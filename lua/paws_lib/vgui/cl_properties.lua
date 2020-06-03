local MODULE = PAW_MODULE('lib')
local Colors = MODULE.Config.Colors

List = List or {}

local oldDermaMenu = DermaMenu

function DermaMenu(parentmenu, parent)
    if ( !parentmenu ) then CloseDermaMenus() end

	local dmenu = vgui.Create( "DMenu", parent )
    dmenu:TDLib()
        :ClearPaint()
        :Background(Color(40,40,40), 5)
        :FadeIn()
        :HideVBar()

    function dmenu:AddOption( strText, funcFunction )

        local pnl = vgui.Create( "DMenuOption", self )
        pnl:SetMenu( self )
        if ( funcFunction ) then pnl.DoClick = function(s) timer.Simple(.1, function() funcFunction(s) end) end end

        pnl:TDLib()
            :ClearPaint()
            :Background(Colors.Base)
            :FadeHover(Colors.ButtonHover)
            :Text(strText, 'font_sans_16')

        self:AddPanel( pnl )

        return pnl

    end

    function dmenu:AddSubMenu( strText, funcFunction )

        local pnl = vgui.Create( "DMenuOption", self )
        local SubMenu = pnl:AddSubMenu( strText, funcFunction )

        if ( funcFunction ) then pnl.DoClick = funcFunction end

        pnl:TDLib()
            :ClearPaint()
            :Background(Colors.Base)
            :FadeHover(Colors.ButtonHover)
            :Text(strText, 'font_sans_16')

        self:AddPanel( pnl )

        return SubMenu, pnl

    end

	return dmenu
end