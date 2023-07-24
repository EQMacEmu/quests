function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Yes, yes!!  What do I have here?!!  Another [new recruit]?  If so, then speak up!  If not, then leave and do not waste my time nor risk your life.  I also seek a [legion soldier] if you be one.");
	elseif(e.message:findi("new recruit")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Yes.  You have the look of the Partisan.  I trust you have begun your blacksmith training.  If not, then do so.  Also, you should read all the books available to you in Fortress Talishan.  We are not dimwitted broodlings here.  You shall need the knowledge soon. That, or a coffin.  Ha!!  Here is your task, are you [ready for your task]?");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("No Iksar resident will have anything to do with you!");
		else
			e.self:Say("Hiss!  Fool!  Fear the Legion of Cabilis for you are no ally to us.  Leave while you can.");
		end
	elseif(e.message:findi("soldier")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Good news to my ears!!  I seek to prove to the War Baron that the infamous forsaken band of thieves who call themselves Marrtail's Marauders are operating within earshot of our city.  You must bring me proof that you encountered no fewer than four of these thieves.  Do so and I shall offer you an armor item unavailable to most.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("No Iksar resident will have anything to do with you!");
		else
			e.self:Say("Hiss!  Fool!  Fear the Legion of Cabilis for you are no ally to us.  Leave while you can.");
		end
	elseif(e.message:findi("ready")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Yes. yes!!  It does not matter.  You must be ready.  I will hand you the Partisan pack.  Into it you shall combine one giant blood sac of the giant leech;  scout beads from a goblin scout; one sabertooth kitten canine and finally, three bone shards from decaying skeletons.  Hopefully, you will survive your attempt to obtain these items.  Return the full Partisan pack and you shall be rewarded with a curscale shield.");
			e.other:SummonCursorItem(17997); -- Item: Partisan Pack
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("No Iksar resident will have anything to do with you!");
		else
			e.self:Say("Hiss!  Fool!  Fear the Legion of Cabilis for you are no ally to us.  Leave while you can.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12915, item2 = 12915, item3 = 12915, item4 = 12915})) then
		e.self:Emote("hands you a shimmering black piece of armor which smells quite horrid. You find it hard to keep it from slithering out of your hand. 'Here is the armor the tailors have been working on for the legion. You may test it for us. Keep up your fine work and I may have other pieces available for you to test.'");
		e.other:Faction(e.self, 441,5); -- Faction: Legion of Cabilis
		e.other:Faction(e.self, 440,1); -- Faction: Cabilis Residents
		e.other:Faction(e.self, 445,1); -- Faction: Scaled Mystics
		e.other:Faction(e.self, 442,1); -- Faction: Crusaders of Greenmist
		e.other:Faction(e.self, 444,1); -- Faction: Swift Tails
		e.other:QuestReward(e.self,0,math.random(15),0,0,eq.ChooseRandom(12917,12918,12919,12920,12921),1000); -- Item(s): Leech Husk Tunic (12917), Leech Husk Leggings (12918), Leech Husk Gloves (12919), Leech Husk Wrist Bands (12920), Leech Husk Boots (12921)
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12673})) then
		e.self:Say("Fantastic work, Partisan " .. e.other:GetCleanName() .. ". Here is your reward. You may continue to perform this task as the baron has found it aids in our defense. I shall always pay for a good day's work. Just let me know if you are still [ready for the task]. As for the curskin shield, you may only have one. Perhaps soon you will prove yourself a formidable fighter and you can earn a militia pike from Drill Master Vygan.");
		e.other:Faction(e.self, 441,5); -- Faction: Legion of Cabilis
		e.other:Faction(e.self, 440,1); -- Faction: Cabilis Residents
		e.other:Faction(e.self, 445,1); -- Faction: Scaled Mystics
		e.other:Faction(e.self, 442,1); -- Faction: Crusaders of Greenmist
		e.other:Faction(e.self, 444,1); -- Faction: Swift Tails
		e.other:QuestReward(e.self,0,math.random(15),0,0,12674,250); -- Item: Curscale Buckler
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
