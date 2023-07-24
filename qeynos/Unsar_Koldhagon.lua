function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ", I am Unsar, student of Mespha. I am working on a spell. . . I call it [Unsar's Glory]. Great name, huh?");
	elseif(e.message:findi("unsar's glory")) then
		e.self:Say("Ah, Unsar's Glory. . . Mind you, I haven't perfected it yet, but bring me some [rat whiskers], [snake scales], and two [bat wings], and I'll show you how it works.");
	elseif(e.message:findi("snake scales") or e.message:findi("rat whiskers") or e.message:findi("bat wings")) then
		e.self:Say("They seem to be very plentiful right outside the city gates.");		
	end
end

function event_trade(e)
	local item_lib =require("items");
	local text = "Thanks, but remember, I need all four items to show you the spell.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13071,item2 = 13070,item3 = 13068,item4 = 13068},1,text)) then
		e.self:Say("All right, check this out. . . Maybe one day you'll be good enough to do this, too");
		-- Confirmed Live Faction
		e.other:Faction(e.self,342,5,0); -- Faction: Order of Three
		e.other:Faction(e.self,221,-1,0); -- Faction: Bloodsabers
		e.other:Faction(e.self,262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,296,-1,0); -- Faction: Opal Dark Briar
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
