function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("turns to face you. You can see a faint green glow emanating from his vacant eye sockets. 'Are you a [new worker]? Huh? Speak or go!!'");
	elseif(e.message:findi("new worker")) then
		if(e.other:GetFaction(e.self) <= 4) then
			e.self:Say("Hmmph!! Too much flesh!! If you want to work, you must first fill my eye sockets with my favorite gem. This shall be your payment for your sledgehammer.");
		else
			e.self:Say("I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) <= 4 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10023})) then --Handin: 1x Jade (10023)
		e.self:Emote("an undead foreman places the gem deep within his hollow eye socket. He pulls a giant sledgehammer from thin air and hands it to you.");
		e.self:Say("Here!! You shall be assigned to the lower decks of the Scaled Trident.");
		e.other:QuestReward(e.self,0,0,0,0,12863); --Summon: a worker sledgemallet (12863)
	end
	local returned = item_lib.return_items(e.self, e.other, e.trade, false)
	if ( returned ) then
		e.self:Say("I do not know you well enough to entrust such an item to you, yet.");
	end
end
