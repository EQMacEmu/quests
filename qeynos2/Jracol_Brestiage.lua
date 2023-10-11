function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Say("Look what I found! I hear there's a good market for these back in Highpass.. lucky me!");
		end
	end	
end


local proof = 0;

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("You'd better run along, if ya know what's best for ya!");
		else
			e.self:Say("Carson hates you, and I hate you... I'd kill you where you stand, but I just polished my dagger last night.");
		end			
	elseif(e.message:findi("lovely night for a stroll")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Yes, it is a lovely night for a walk, especially with a good friend. Tell me, are you a [friend]?");
		else
			e.self:Say("Carson hates you, and I hate you... I'd kill you where you stand, but I just polished my dagger last night.");
		end
	elseif(e.message:findi("friend")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("My memory is a bit fuzzy. If you are a friend, prove it to me.");
		else
			e.self:Say("Carson hates you, and I hate you... I'd kill you where you stand, but I just polished my dagger last night.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13903})) then -- Bent Card -- no faction requirement
		e.self:Say("'Ah, good, it seems we have much in common after all. Take this back to the Circle, before the city guards come nosing around over here.");
		e.other:Faction(e.self,329,5,0); -- Carson McCabe
		e.other:Faction(e.self,336,3,0); -- Coalition of Tradefolk Underground
		e.other:Faction(e.self,304,-1,0); -- Ring of Scale
		e.other:Faction(e.self,332,5,0); -- Highpass Guards
		e.other:Faction(e.self,331,5,0); -- Merchants of Highpass
		e.other:QuestReward(e.self,0,0,0,0,18722,100);	-- confirmed Live exp
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
