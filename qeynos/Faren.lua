function event_spawn(e)
	eq.set_timer("fishing",300000);
end

function event_timer(e)
	e.self:Say("Whoo!!! I think I got a [bite]! Darn.. Seaweed.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh.. Hiya, I'm just out here fishing, since I can't find a job. I hope this [bait] I just bought catches me a big ol' fish.");
	elseif(e.message:findi("bait")) then
		e.self:Say("I use Captain Rohand's Secret Recipe Super Magic Catch-A-Lot brand bait. I bought my pole from Sneed's up by the north pond.");	
	elseif(e.message:findi("tacklebox")) then
		e.self:Say("Oh. That mean [dwarf], Trumpy, just knocked my tacklebox into the water. Could you please get it for me? I can't swim.");	
	elseif(e.message:findi("dwarf")) then
		e.self:Say("His name is Trumpy. He is one of those [Irontoes] I think. I've seen him hanging out in the Fish's Ale. I don't know why he likes to torment me.");
	elseif(e.message:findi("irontoe")) then
		e.self:Say("Ah! The Irontoes are a rough bunch of dwarves from Kaladim. The seem to get quite drunk on a frequent basis.");
	elseif(e.message:findi("fishing") or e.message:findi("bite"))then
		e.self:Say("Huh?  OH!  Sorry, I was dozing off!  It's been a slow day.  A few fish and an old shoe are all I have reeled in.  I did see a shark swim by, though!");
	elseif(e.message:findi("kane"))then
		e.self:Say("Commander Kane Bayle is the commander of all the Qeynos Guard.  He is second only to his brother, Antonius Bayle.  His post is in the guard house at the city gates.  Mind you, do not bother him, he has a bit of a temper.");		
	elseif(e.message:findi("circle.* unseen hand"))then
		e.self:Say("The Circle of the Unseen Hand?  I have heard nothing of them.  Are they some sort of performing magic troupe?");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Oh, hi, Beren. Not too good so far. That [dwarf] keeps bothering me, too.");
		eq.signal(1090,2); -- NPC: Guard_Beren
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13702})) then
		e.self:Say("Thank you so much! If you want some free advice, steer clear of those [Irontoes]! They are nothing but trouble. Here, It's not much but I must thank you somehow.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,262,10); -- Guards of Qeynos
		e.other:Faction(e.self,219,1); -- Antonius Bayle
		e.other:Faction(e.self,230,-1); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,223,-2); -- Circle Of Unseen Hands
		e.other:Faction(e.self,291,1); -- Merchants of Qeynos
		e.other:QuestReward(e.self,math.random(20),0,0,0,13129,200); -- Hurrieta's Tunic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
