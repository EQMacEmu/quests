function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". It is grand to make your acquaintance. I am the in-house merchant-slash-file clerk. I have goods to offer and I handle all the Gemchopper paperwork. Thrilling, don't you think?");
	elseif (e.message:findi("red 5")) then
		e.self:Say("Red 5 is rumored to be a haywire clockwork. They say he pieced himself back together and lives in the scrapyard. If he IS there, you must hunt him down and take his blackbox to Manik Compolten. Be careful, if Red 5 rebuilt himself, he may have rebuilt minions as well.");
	elseif (e.message:findi("blackbox")) then
		e.self:Say("If you have a clockwork blackbox which is still intact, take it to [Manik Compolten].  All clockwork matters go through him.");
	elseif (e.message:findi("manik compolten")) then
		if(e.other:GetFactionValue(e.self) >= 0) then -- Needs indifferent
			e.self:Say("Manik is a trainer within this guild. The clockworks are his responsibility. Speak with him - I am sure he is here somewhere.");
		else
			e.self:Say("You are lucky I do not cut you in half right where you stand. Your actions so far have proven you an enemy to the Gemchoppers. Leave while you still can!");
		end
	elseif (e.message:findi("meldrath")) then
		e.self:Say("Meldrath is the mad gnome.  He used to be a member of the Eldritch Collective.  Some say he lost his mind while he was working on a formula he obtained from other worlds.  He used to lead the cult called the [Asylum of the Mad].");
	elseif (e.message:findi("asylum")) then
		e.self:Say("The Asylum of the Mad was formed by the mad gnome, Meldrath. Under his direction, they were trying to build some giant mechanical titan.  We recently sent all of our clockworks into the Steamfont Mountains to destroy their evil cult.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 18837},0)) then
		e.self:Say("Why, thank you. Hey!! This log indicates some messy business is going on at the scrapyard. Something happened to a group of gnomes. They never came out!! Go check out the scrapyard! I believe the rumors of [Red 5] are true.");
		-- verified live faction
		e.other:Faction(e.self,255,5); -- Faction: Gem Choppers
		e.other:Faction(e.self,288,1); -- Faction: Merchants of Ak'Anon
		e.other:Faction(e.self,333,1); -- Faction: King Ak'Anon
		e.other:Faction(e.self,238,-1); -- Faction: Dark Reflection
		e.other:Faction(e.self,1604,-1); -- Faction: Clan Grikbar
		e.other:AddEXPPercent(11,1); -- 11% xp at level 1
		
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 18838},0)) then
		e.self:Say("Oh my! It seems two of the obsolete duster models were not fully shut down. You must find them. They could be anywhere in Ak'Anon! After you destroy them, take their scraps to Sanfyrd Montop. He is the operator of the scrapyard.");
		eq.unique_spawn(55001,39,0,-300,1504,-120,0); -- NPC: Duster_X
		e.other:Faction(e.self,255,5); -- Faction: Gem Choppers
		e.other:Faction(e.self,288,1); -- Faction: Merchants of Ak'Anon
		e.other:Faction(e.self,333,1); -- Faction: King Ak'Anon
		e.other:Faction(e.self,238,-1); -- Faction: Dark Reflection
		e.other:Faction(e.self,1604,-1); -- Faction: Clan Grikbar
		e.other:AddEXPPercent(11,1); -- 11% xp at level 1
		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
