function event_say(e)
	if(e.message:findi("hail")) then
		if(eq.is_the_scars_of_velious_enabled()) then
			e.self:Say("Hello, there! Don't have time to talk. I'm workin', workin', workin'! Careful! Don't slip in the oil!");
		end
	elseif(e.message:findi("what oil")) then
		if(eq.is_the_scars_of_velious_enabled()) then
			if(e.other:GetFactionValue(e.self) >= -60) then
				e.self:Say("Ah the oil! I recently sent a specially crafted golem to explore through a huge portal to another plane. It's instructions were to collect special oil that I suspect existed in the plane. What I think is the golem broke down. This looks like a good task for one like you. Go see what's wrong with the golem. Here is spare gears of mine incase it's broken. Be careful though, if you put it in wrong it could explode or worse!");
				e.other:SummonCursorItem(14319);
			else
				e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
			end
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18169}, 0)) then
		if(eq.is_the_scars_of_velious_enabled()) then
			e.self:Say("Brother! I have one of those. He's great, but he's dead. His name was Gabstik and he was a really powerful wizard. I still have one of his greatest possesions! You look like you could use it. I've added another thing to my shopping list. I require a dry brittle skin that I can mold or a rare oil found in the planes that I can soak the fuse in. Get me one of these things and I'll trade it for my bother's stick.");
			e.other:Faction(e.self,404, 10); --Truespirit
		else
			e.self:Say("Brother! I have one of those. He's great, but he's dead. His name was Gabstik and he was a really powerful wizard. I still have one of his greatest possessions! Hey, I know! You can help me with my greatest firework! I need you to get me a skin to put the powder from my firework in. That's the only thing I can think of to use though I cannot get myself. I need a skin that is dry and brittle, yet can still be shaped. So go fetch me some and I'll scratch your back");
			e.other:Faction(e.self,404, 10); --Truespirit		
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14349}, 0)) then
		if(e.other:GetFactionValue(e.self) >= -60) then
			e.self:Say("Oh wow! You found the oil! Where is the golem? You didn't hurt him did you? I am very fond of him. Anyways, here is your reward a note and staff to give to that guy you were asking me about.");
			e.other:Faction(e.self,404, 10); --Truespirit
			e.other:QuestReward(e.self,{items = {14339,18168}}); --note, Staff of Gabstik
		else
			e.self:Say("I have no need for this item " .. e.other:GetCleanName() .. ". You can have it back.")
			e.other:QuestReward(e.self,0,0,0,0,14349); -- Item: Green Oil
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14332}, 0)) then --Cazic's Skin
		if(e.other:GetFactionValue(e.self) >= -60) then
			e.self:Say("Great! This is? What is this for again? Oh yeah, the casing for my firework. Here, you can have this then, oh no, wait. You can't yet. I forgot I needed another part to my firework, and you are exactly the person to get it for me! I need some mistletoe powder. Now, go find some for me! Go, go, go, go! Shoo! Oh, wait! Hold on to my bag for me, please. You can give it back after you've given me what I want.");
			e.other:Faction(e.self,404, 5); --Truespirit
			e.other:QuestReward(e.self,0,0,0,0,14336); --Kandin's Bag
		else
			e.self:Say("I have no need for this item " .. e.other:GetCleanName() .. ". You can have it back.")
			e.other:QuestReward(e.self,0,0,0,0,14332); -- Item: Cazic's Skin
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14333}, 0)) then --Mistletoe Powder
		if(e.other:GetFactionValue(e.self) >= -55) then
			e.self:Say("Great, this is it! Here, take this, it was my brother's. Now I must be off to work! Oh, wait, wait! I need my bag back!");
			e.other:Faction(e.self,404, 5); --Truespirit
			e.other:QuestReward(e.self,0,0,0,0,14339); --Staff of Gabstik
		else
			e.self:Say("I have no need for this item " .. e.other:GetCleanName() .. ". You can have it back.")
			e.other:QuestReward(e.self,0,0,0,0,14333); -- Item: Mistletoe Powder
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14336}, 0)) then
		if(e.other:GetFactionValue(e.self) >= -50) then
			e.self:Say("Great! Give this to Arantir so he knows you've helped me! Hey! Have you seen my lantern anywhere?");
			e.other:QuestReward(e.self,0,0,0,0,18168); --Note to Arantir
			e.other:Faction(e.self,404, 5); --Truespirit
		else
			e.self:Say("I have no need for this item " .. e.other:GetCleanName() .. ". You can have it back.")
			e.other:QuestReward(e.self,0,0,0,0,14336); -- Item: Kandin's Bag
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
