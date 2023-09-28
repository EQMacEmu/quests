function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("May the power of Underfoot be with you. Welcome. I am here to serve the will of the king as should you. If you [need healing], then speak. Or perhaps you are here to [return skunk glands]?");
	elseif(e.message:findi("healing")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Before the power of Underfoot can attempt to bind your wounds you must pay tribute. Three gold coins!!");
		else
			e.self:Say("How dare you approach a member of the Clerics of Underfoot?!  Dogs such as you lie in the same bed as aviaks and ogres!")
		end
	elseif(e.message:findi("glands")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("I have made an offer to all clerics of this cathedral. I shall reward one cleric scroll from our scribes for the return of four skunk scent glands. This offer is best left to our clerics.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Clerics of Underfoot have yet to see your faith directed towards our wills. Perhaps you should assist Master Gunlok Jure in the crusade against the undead.");
		else
			e.self:Say("How dare you approach a member of the Clerics of Underfoot?!  Dogs such as you lie in the same bed as aviaks and ogres!")
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "There shall be no scroll until I see four skunk scent glands.";
	
	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {gold = 3})) then
		e.self:Say("Be healed!");
		e.self:CastSpell(17,e.other:GetID(),0,1);	--Light Healing
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 14030, item2 = 14030, item3 = 14030, item4 = 14030},1,text)) then --Skunk Scent Gland
		e.self:Say("I thank you for your good deed. I trust it was not a problem. Take this scroll. A cleric of this cathedral will find it useful. May the power of Underfoot be with you.");
		e.other:Faction(e.self,227,5,0); 			--Clerics of Underfoot
		e.other:Faction(e.self,274,5,0); 		--Kazon Stormhammer
		e.other:Faction(e.self,293,3,0); 		--Miners Guild 249
		e.other:QuestReward(e.self,0,math.random(0,10),0,0,eq.ChooseRandom(15203,15229,15560,15036,15216,15215),5000); --Random Spell: Cure Poison, Fear, Furor, Gate, Stun, Reckless Strength -- Verified exp
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
