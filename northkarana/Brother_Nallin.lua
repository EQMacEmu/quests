function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("May the Prime Healer watch over your body as you pass through  these dangerous lands.  I am Brother Nallin of the [Temple of Life].  I was dispatched to aid the guards and residents of the plains.  I can assist you if you have need of me to [cure poison] or [cure disease].");
		else
			e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
		end
	elseif(e.message:findi("cure disease")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Yes,  I can cast the disease from your body with the power of the Prime Healer.  First, you must make an offering to the Temple of Life.  The offering is five gold coins.");
		else
			e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
		end
	elseif(e.message:findi("cure poison")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("If you would like me to cure poison, you must offer me four water flasks.  I shall see that the residents of the plains get your donation and we shall try to cast the toxin from your body.");
		else
			e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
		end
	elseif(e.message:findi("temple of life")) then
		e.self:Say("Within the walls of Qeynos can be found the home of the Priests of Life, the Temple of Life.  It is there that good people pay tribute to the great Prime Healer, Rodcet Nife.");
	elseif(e.message:findi("heal")) then
		e.self:Say("I am afraid I was not authorized by the High Priests of the Temple of Life to perform such an act, however, I'm certain you can obtain such a service within the walls of Qeynos.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13006, item2 = 13006, item3 = 13006, item4 = 13006})) then
		e.self:Say("May Rodcet Nife breathe upon your body and soul and banish the evil from within.");
		e.self:CastSpell(203,e.other:GetID()); -- Cure Poison
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {gold = 5}, 0)) then
		e.self:Say("May Rodcet Nife breathe upon your body and soul and banish the evil from within.");
		e.self:CastSpell(213,e.other:GetID()); -- Cure Disease
	else	
		e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end