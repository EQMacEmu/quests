--############
--# Quest Name: Black Burrow Stout (Northern Karana)
--#################

function event_waypoint_arrive(e)
	if(e.wp == 2) then
		e.self:Emote("stumbles and says, 'Hey fools.  Blackburrow stout for sale five gold.  Load up now 'cause it's going fast!  Just make sure you enjoy it in privacy or you might get arrested, ha haaaa!'");
	elseif(e.wp == 3) then
		e.self:Emote("burps loudly and says, 'Your loss.  Back to the bridge I go to keep us safe from the enemy or whatever it is I'm supposed to be doing out there.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey, hey! I have some Blackburrow Stout for sale. Just hand over five gold and I'll give you a bottle of it. Don't get caught though because it is considered [contraband]. [Antonius] don't like it being smuggled and all that but what does he know, anyway?");
	elseif(e.message:findi("contraband")) then
		e.self:Say("Well it's brewed by gnolls, ya know. Don't know exactly why it's considered contraband but I think it's because they use the money they get from selling the stout to buy arms. I dunno. I buy low and sell high. Blackburrow Stout is good for you though! It does wonders for me! Now buy some already before someone hears us talking.");
	elseif(e.message:findi("antonius")) then
		e.self:Say("That man is as clueless as a froglok tad swimming in a keg of dwarven ale! He has no idea what is going on around him. He won't be around for much longer I wager.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {gold = 5})) then
		e.self:Say("There you go, sport. If you get caught with that, you didn't get it from me!");
		-- Confirmed Live Factions
		e.other:Faction(e.self,230,1,0); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,262,-1,0); -- Guards of Qeynos
		e.other:Faction(e.self,273,1,0); -- Kane Bayle		
		e.other:Faction(e.self,223,1,0); -- Circle Of Unseen Hands
		e.other:Faction(e.self,221,1,0); -- Bloodsabers
		e.other:QuestReward(e.self,0,0,0,0,13107); -- Item: Black Burrow Stout
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:northkarana  ID:13021 -- Guard_Shilster
