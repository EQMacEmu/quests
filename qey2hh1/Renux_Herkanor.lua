-- Grandmaster Assassin's Seal
-- NPC Name: Renux Herkanor

function event_say(e)
	if(e.other:GetFaction(e.self) < 3 and e.other:GetSkill(56) > 250) then
		if(e.message:findi("hail")) then
			e.self:Say("Master Hanns is going to kill me! I let that dark assassin look at his prized poison collection and he lifted it all when I wasn't looking! He even snatched his Grandmaster's Vial! Master Hanns was so furious he grabbed one of his old blades from his collection and jabbed it at the wall so hard it shattered! I really need some help replacing all that was [ruined] or I have a feeling Master Hanns is going to send me on a suicide mission!");
		elseif(e.message:findi("ruined")) then
			e.self:Say("Fantastic! I need to replace all those old poisons, the vial and that old scareling blade. I think the bottles had the following written on them Bane, Burn, Essence, Sloth, Rage, Swiftness, Disorientation, and Dimethyl. Please hurry!");
			e.other:SummonCursorItem(17148); -- Item: Unfilled Box
		end
	else
		e.self:Say("Go away! We don't have time for the likes of you.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFaction(e.self) < 3) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 24072})) then
			e.self:Say("Great! Looks like everything is here! Hopefully Master Hanns won't send me to Steamfront now, I have a really bad feeling about that assignment. Here take this Seal, it was dropped by that dark stranger. It glows with a dark power I just don't understand. Be wary of further sightings of that dark assassin.");
			e.other:Faction(e.self,223,5); -- Circle Of Unseen Hands
			e.other:Faction(e.self,291,-1); -- Merchants of Qeynos
			e.other:Faction(e.self,230,1); -- Corrupt Qeynos Guards
			e.other:Faction(e.self,5004,-1); -- Guards of Qeynos
			e.other:Faction(e.self,273,1); -- Kane Bayle
			e.other:QuestReward(e.self,0,0,0,0,24073,200000);
			eq.depop_with_timer();
		end
		item_lib.return_items(e.self, e.other, e.trade)
	else
		e.self:Say("Go away! We don't have time for the likes of you.");
	end	
end

-- END of FILE zone: ID:12 -- Renux_Herkanor.pl
