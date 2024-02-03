function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("stares off into the distance in meditation. Her eyes are a light blue, much like the tropical waters of the ocean between Odus and the mainland. She ignores your greeting.");
	elseif(e.message:findi("tiam sent me") or e.message:findi("instrument") or e.message:findi("other item")) then
		if(e.other:GetFaction(e.self) < 5) then -- requires amiably		
			if(e.message:findi("tiam sent me")) then
				e.self:Say("Seems you've slain quite a few kobolds, then. This is good. You will need to kill many more to fulfill your quest. While the kobolds are fairly primitive, they are an ancient race and have learned to wield the powers of the spirits. This ability is the only thing that has kept us from eradicating them completely. We need you to find instruments of their craft.");
			elseif(e.message:findi("instrument")) then
				e.self:Say("There are two items we seek. The shamans carry medicine pouches in which they hold the materials of their craft. Only the more adept shamans are allowed to carry the pouches; seek them out. The other item we seek is of greater importance.");
			elseif(e.message:findi("other item")) then
				e.self:Say("The other is a magical bowl from which a highly skilled shaman may divine the future or diagnose illness. Only the wisest of the kobold shamans have the intelligence to use the bowls, or perhaps an outcast with powers that the other, larger kobolds fear. Bring me a kobold medicine pouch and the diviner's bowl and you shall be rewarded with the armor of our trusted knights and priests.");
			end
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.")
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I'll need both the kobold medicine pouch and the diviner's bowl before I can reward you, " .. e.other:GetCleanName() .. ". Good luck.";

	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 17056,item2 = 1766},1,text)) then -- requires amiably
		e.self:Say("Well done, " .. e.other:GetCleanName() .. ". I had a feeling you would return victorious. Here is your reward, the Leggings of Midnight Sea. Wear them with pride for the Ocean Lord. If you are interested in aiding us further, you may want to ask Gans about his brother.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,242,25,0); -- Faction: Deepwater Knights
 		e.other:Faction(e.self,266,3,0); -- Faction: High Council of Erudin
 		e.other:Faction(e.self,265,-3,0); -- Faction: Heretics
		e.other:QuestReward(e.self,0,0,0,0,1762,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
