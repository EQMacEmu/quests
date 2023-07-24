function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 200) then
			e.self:Say("Welcome, young mortal. Word of your deeds has preceded your arrival. Your intentions seem honorable, young one, however my trust is not an easy thing to win these days. Like you, there has been another that came before me with the trust of the dragon kin, and trust them too I did, but alas that proved to be destructive. I note your deeds to this shrine young one, but should you wish my counsel, you must prove your worth beyond doubt. Perhaps a small challenge shall be of interest to you?");
		else
			e.self:Say("I have nothing to speak about to the likes of you.");
		end
	elseif(e.message:findi("prove")) then
		if(e.other:GetFactionValue(e.self) >= 200) then
			e.self:Say("Then as agreed, young mortal, I will grant you one chance to prove your worth in my eyes. The Storm King Tormax sits on a throne carved from the skull of one of our fallen within the city of Kael, which disgraces the mighty children of Veeshan. His life alone is a blight upon the children of Veeshan. Should you be a true patriot to our cause, I seek of you but one task. Should you succeed in this task, not only will your actions offset the balance of this war in our favor, but will surely take a step in driving the vileness of the giants from our noble lands. Bring me, young one, the head of Tormax, and then we shall speak further.");
		else
			e.self:Say("I have nothing to speak about to the likes of you.");
		end
	elseif(e.message:findi("treasure")) then
		if(e.other:GetFactionValue(e.self) >= 200) then
			e.self:Say("This sword is a symbol of our evolution and ancient heritage. Back when our feathered relatives were not so distant, a sword was forged and enchanted with the spirit of an elder griffin. This noble griffin bound his soul to the sword, the essence of his being honing the blade to an edge imperceptible to mortal eyes. Although our races have evolved away from each other, we still hold them in high regard. But if you think you are not worthy to wield this honor, return the sword to me and I have other tokens you may find of more use.");
		else
			e.self:Say("I have nothing to speak about to the likes of you.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30516}, 0)) then
		if(e.other:GetFactionValue(e.self) >= 200) then
			e.self:Emote("watches as you drop the colossal head of King Tormax to the ground before him. You sense intense hatred within Yelinak as he stares down at the bloody remains of a descendent of the one who slew his mate. Obviously the death of Tormax has done little to console the ancient snow dragon. Finally Yelinak speaks, 'I look upon this face, and even though he is dead, the hatred burns on. My grief and anger are unchanged even in the face of ultimate fate. His grandfather's act was so despicable and all-encompassing that it instilled an. immortal loathing. Nevertheless, you have completed the task I set before you and, as such, you deserve my gratitude. Please accept this [treasure].");
			e.other:Faction(e.self,436,50); -- Faction: Yelinak
			e.other:Faction(e.self,430,25); -- Faction: Claws of Veeshan
			e.other:Faction(e.self,429,-25); -- Faction: King Tormax
			e.other:QuestReward(e.self,0,0,0,0,29647,1000);
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29647}, 0)) then
		if(e.other:GetFactionValue(e.self) >= 200) then
			e.self:Say("I lost the scales that made these boots in a battle with Tormaxs minions. The casters of the shrine gathered these fallen scales up and fashioned a very powerful enchantment into these boots.");
			e.other:QuestReward(e.self,0,0,0,0,29645);
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29645}, 0)) then
		if(e.other:GetFactionValue(e.self) >= 200) then
			e.self:Say("This helm was created by our smiths and enchanted by the priests of the shrine to provide protection to our new allies who have found that their heads are much more fragile than those of our kin.");
			e.other:QuestReward(e.self,0,0,0,0,29648);
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29648}, 0)) then
		if(e.other:GetFactionValue(e.self) >= 200) then
			e.self:Say("This sword is a symbol of our evolution and ancient heritage. Back when our feathered relatives were not so distant, a sword was forged and enchanted with the spirit of an elder griffin. This noble griffin bound his soul to the sword, the essence of his being honing the blade to an edge imperceptible to mortal eyes. Although our races have evolved away from each other, we still hold them in high regard. But if you think you are not worthy to wield this honor, return the sword to me and I have other tokens you may find of more use.");
			e.other:QuestReward(e.self,0,0,0,0,29647);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
