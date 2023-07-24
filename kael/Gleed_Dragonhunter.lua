-- Gleed's Bow

function event_say(e)
	if(e.other:GetFaction(e.self) < 6) then
		if(e.message:findi("hail")) then
			e.self:Emote("sighs as he looks down at you. 'I grow tired of this city. I so long for the tundra and lands of the wild.'");
		elseif(e.message:findi("tundra") or e.message:findi("wild")) then
			e.self:Say("I enjoy training these animals, don't get me wrong, but the open wastes, where the great animals and dragons roam free are what I crave. Before I came to serve King Tormax, I wandered those wastes, hunting young dragons and elder wurms. The whistle of an arrow from my bow was like sweet music - each slash of my sword a sweet song.");
		elseif(e.message:findi("young dragon")) then
			e.self:Say("Yes, I hunted true dragons. The younger ones, at least. With my bow I could shoot them from such a distance they would never see what was coming.");
		elseif(e.message:findi("bow")) then
			e.self:Emote("unslings an intricately carved bow from his back and shows it to you. 'I crafted this bow myself. It was to be a great slayer of wurms and dragons and it was, for a time. Now it goes to waste in the city, far from the beasts I long to slay. Far from the hunt and the excitement.'");
		elseif(e.message:findi("waste")) then
			e.self:Say("It is such a shame, this bow deserves to be used. If only there were someone who would use it to hunt the beasts - someone to slay them and skin them like they should be.");
		elseif(e.message:findi("beast")) then
			e.self:Say("You will, little one? One such as yourself is a hunter? I did not know your kind had any skill in such things. In fact, I do not believe your kind could hunt a wurm, not without my wonderful bow. I will not simply hand it to a foolish " .. e.other:Race() .. ". Hunt down some big game before you bother talking to me again. Perhaps if you bring me the tail of the elusive Vluudeen.");
		end
	elseif(e.other:GetFaction(e.self) < 7) then
		e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself."));
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) < 6 and item_lib.check_turn_in(e.self, e.trade, {item1 = 25137}, 0)) then
		e.self:Say("My, you do have a hunters spirit! If you could track down Vluudeen and slay him without the aid of my bow, you must be worthy. Take the bow, huntsman. Use it to slay others of Vluudeen's kind.");
		e.other:Faction(e.self,419,35); -- Faction: Kromrif
		e.other:Faction(e.self,448,8); -- Faction: Kromzek
		e.other:Faction(e.self,406,-17); -- Faction: Coldain
		e.other:Faction(e.self,430,-3); -- Faction: Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,25033,35000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
