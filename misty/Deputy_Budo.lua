function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". I am Deputy Budo Bullnose, the squad leader of the Great Wall Patrol. Be very careful in the lands beyond the wall. They are filled with dangerous beasts, as well as [Clan Runnyeye].");
	elseif(e.message:findi("clan Runnyeye")) then
		e.self:Say("Beyond this wall lies Runnyeye, the lair of the goblins of Clan Runnyeye. They have been a nuisance to Rivervale for quite some time. If you wish to join the fight, go to Rivervale and ask Sheriff Roglio about Clan Runnyeye.");
	elseif(e.message:findi("I am reporting for duty")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Stand tall then, Deputy " .. e.other:GetCleanName() .. ". Your orders are to keep the creatures from venturing into the community of Rivervale and to kill many goblins. Check the goblin bodies, if you should find unbroken warrior beads on them, take them to Sheriff Roglio Bruth and should you be lucky enough to find a bizarre grappling device, you are to take it to Marshal Ghobber Truppack immediately! One more thing - should you defeat any orcs in battle, bring me their leather belts and I shall reward you for the great victory. May the power of Underfoot be with you!");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));			
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	local count = item_lib.count_handed_item(e.self, e.trade, {13916});
	if(count > 0) then
		repeat
			e.self:Say("Grand work. Deputy " .. e.other:GetCleanName() .. "! You will become a full-fledged deputy in no time. You should check in with Marshal Ghobber from time to time to see if you have earned your squad ring. Just go up to him and ask. 'Am I one with the Wall?' He will know. but you must first show your bravery in many battles against the goblins.");
			e.other:Faction(e.self,263,5,0); -- Faction: Guardians of the Vale
			e.other:Faction(e.self,286,1,0); -- Faction: Mayor Gubbin
			e.other:Faction(e.self,355,1,0); -- Faction: Storm Reapers
			e.other:Faction(e.self,292,1,0); -- Faction: Merchants of Rivervale
			e.other:Faction(e.self,334,-1,0); -- Faction: Dreadguard Outer
			e.other:QuestReward(e.self,0,0,9,0,13024,100); -- confirmed exp data
			count = count - 1;
		until count == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

