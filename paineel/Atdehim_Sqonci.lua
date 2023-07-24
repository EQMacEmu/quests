function event_say(e)
	if(e.other:GetFactionValue(e.self) >= -100) then -- not exact faction, dubious doesn't work and 0 indifferent works
		if(e.message:findi("hail")) then
			e.self:Say("Ah, greetings. I hope you are a student of the way of fear. Within this temple there are many who can teach you to harness your gifts. I am an instructor in the [rituals of fear].");
		elseif(e.message:findi("rituals of fear")) then
			e.self:Say("So you wish to learn, eh? I am working on a ritual to strike fear into the hearts of the other inhabitants of Odus. The reagents I require for this ritual are the doll of a Kerran priestess, the ichor of a giant wooly spider, your initiate symbol of Cazic-Thule, and a giant snake fang with which to carve my glyphs. Fetch me these components. We shall infect this land with fear, and I shall reward you with the station of disciple of this temple.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13716, item2 = 16989, item3 = 1437, item4 = 7005})) then --Kerran Doll, Ichor, Initiate Symbol of Cazic Thule, Giant Snake Fang
		e.self:Say("Excellent work, " .. e.other:GetCleanName() .. ". You are well on your way to proving yourself worthy to serve Cazic Thule.");
		e.other:QuestReward(e.self,0,0,0,0,1438,2000); --Disciple Symbol of Cazic Thule
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:paineel  ID:75019 -- Atdehim_Sqonci
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------