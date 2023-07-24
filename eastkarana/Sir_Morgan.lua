--#############
--#Quest Name: Sir Morgan's Armor
--#Author: Blaz
--#NPCs Involved: 1
--#Items Involved: 5 Gold for a random reward
--#################

function event_waypoint_arrive(e)
	if(e.wp == 1) then
		e.self:Say("Hello, Wimbley, old chap!");
	elseif(e.wp == 8) then
		e.self:Say("Almost there...");
	elseif(e.wp == 9) then
		e.self:Say("Well, here we are! It is just a short jaunt through the pass ahead. Just remember to take the high road. I'm off, then. Good luck!");
		e.self:SetRunning(true);
	elseif(e.wp == 10) then
		e.self:SetRunning(false);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then --guessing on faction level, only tested at scowls
			e.self:Say("Hail, traveler!  Might I escort you through to Highpass? The path ahead is filled with giants and many other hungry beasts. I assure you, you will be safe with me. I must admit, I am quite experienced in the ways of the warrior. Do you [wish an escort] or will you [travel alone]?")
		else
			e.self:Say("No person in Karana would speak with you. You had best leave before my sword finds your skull!")		
		end
	elseif(e.message:findi("escort")) then
		if(e.other:GetFactionValue(e.self) >= -100) then --guessing on faction level, only tested at scowls
			e.self:Say("I shall be honored to escort you to Highpass, but you shall have to wait for a spell. I make trips every few hours. I also would be grateful to any who wish to donate gold coins to the upkeep of my armor. The rains in the plains cause much rusting.");
		else
			e.self:Say("No person in Karana would speak with you. You had best leave before my sword finds your skull!")		
		end
	elseif(e.message:findi("travel alone")) then
		if(e.other:GetFactionValue(e.self) >= -100) then --guessing on faction level, only tested at scowls
			e.self:Say("Then, good luck to you! May your faith protect you. Or at the very least, guide you to a grand afterlife.");
		else
			e.self:Say("No person in Karana would speak with you. You had best leave before my sword finds your skull!")		
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {gold = 5})) then
		e.self:Say("What a grand donation!! You must be a rich noble to be making such a donation. Here, I am but a simple warrior, but I found this lying on the highway to Highpass Hold. The lifeless corpse next to it had no more need of it.");
		e.other:QuestReward(e.self,{itemid = eq.ChooseRandom(2041,2904,2312,2307,8306,10006,13944,13004,2106,2112,7007,5024,6015,5021,7012,1331,17002,13829,8011,15295,15324,15380,15501,15051,10019)}); --mountain lion cape, bear-hide belt, ratskin gloves, snakeskin mask, halfling knife, silver earring, highkeep flask, large lantern, Patchwork cloak, Patchwork boots, rusty dagger, rusty halberd, rusty flail, rusty scimitar, bronze dagger, damask cap, belt pouch, drom's champagne, hunting bow, spell:mircyls animation, spell:shock of blades, spell:glimpse, spell:soothe, bloodstone 
		-- confirmed live, no factions no xp, no faction requirement		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:eastkarana  ID:15048 -- Sir_Morgan