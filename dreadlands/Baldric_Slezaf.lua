--NPC ID: 86097
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". Don't you think this would be a wonderful place to perform a symphony?");
	elseif(e.message:findi("symphony")) then
		e.self:Say("It has been my dream for years to perform a symphony that would be remembered for ages to come. I have run into a few minor snags, however.");
	elseif(e.message:findi("snags")) then
		e.self:Say("Several years ago I bought sheets of the most beautiful sounding music from a traveling merchant. He did not know the author of the work as it was simply signed 'the Maestro'. The melody I played from them was wondrous and invoked feelings in me I have never felt before. However, as I reached the middle of the music, I discovered it was missing two pages!");
	elseif(e.message:findi("pages")) then
		e.self:Say("The pages that were missing were pages 24 and 25. I have been searching the world for a spot to hold my symphony and I have finally found it. Without the music and a new lute crafted by the famous instrument maker Forpar Fizfla, I do not think I can pull it off.");
	elseif(e.message:findi("lute") or e.message:findi("forpar")) then
		e.self:Say("Forpar Fizfla is an eccentric instrument maker from Ak'Anon. He makes enchanted instruments that enhance the sound of the music. If I am to perform the concert of all concerts, I must have one of his instruments. I went to Ak'Anon, seeking to purchase an instrument from him but he wouldn't even speak to me.");
	elseif(e.message:findi("music")) then
		e.self:Say("It makes me sad to know that the pages of this music may be spread across the world or destroyed. If you find and bring me the two missing sheets as well as a new lute, I would be happy to repay you in some way.");
	elseif(e.message:findi("repay")) then
		e.self:Emote("pulls a fantastic looking sword from its scabbard and says, 'I might be willing to part with this wonderful sword if I were able to perform this symphony. You would also gain recognition at the opening of the symphony.' Baldric sheathes his sword and begins to hum a haunting melody.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20376, item2 = 20383, item3 = 20377, item4 = 20538})) then
		e.self:Emote("looks shocked as you hand him the pages and the mystical lute. 'I will put on a symphony the likes of which the gods have never seen. Thank you so much, " .. e.other:GetCleanName() .. ". Please take this sword as a token of my gratitude.");
		e.other:QuestReward(e.self,0,0,0,0,20542,350000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
