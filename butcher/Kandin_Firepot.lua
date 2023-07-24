function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, there! Don't have time to talk. I'm workin', workin', workin'! Careful! Don't slip in the oil!");
	elseif(e.message:findi("what oil")) then
		if(e.other:GetFactionValue(e.self) >= -60) then
			e.self:Say("Ah the oil! I recently sent a specially crafted golem to explore through a huge portal to another plane. It's instructions were to collect special oil that I suspect existed in the plane. What I think is the golem broke down. This looks like a good task for one like you. Go see what's wrong with the golem. Here is spare gears of mine incase it's broken. Be careful though, if you put it in wrong it could explode or worse!");
			e.other:SummonCursorItem(14319);
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18169}, 0)) then
		e.self:Say("Brother! I have one of those. He's great, but he's dead. His name was Gabstik and he was a really powerful wizard. I still have one of his greatest possesions! You look like you could use it. I've added another thing to my shopping list. I require a dry brittle skin that I can mold or a rare oil found in the planes that I can soak the fuse in. Get me one of these things and I'll trade it for my bother's stick.");
		e.other:Faction(e.self,404, 10); --Truespirit
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14349}, 0)) then
		if(e.other:GetFactionValue(e.self) >= -60) then
			e.self:Say("Oh wow! You found the oil! Where is the golem? You didn't hurt him did you? I am very fond of him. Anyways, here is your reward a note and staff to give to that guy you were asking me about.");
			e.other:Faction(e.self,404, 10); --Truespirit
			e.other:QuestReward(e.self,{items = {14339,18168}}); --note, Staff of Gabstik
		else
			e.self:Say("I have no need for this item " .. e.other:GetCleanName() .. ". You can have it back.")
			e.other:QuestReward(e.self,0,0,0,0,14349); -- Item: Green Oil
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
