
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. May I help you?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5571})) then
		e.self:Say("Where did you get this?! I have been looking for just this kind of map for a very long time! Hmmm, I know, how about I show you how to improve those claws of yours!");
		e.self:Say("In order to improve them, I need you to take this Stitching Pack, unless you already have one, and this stone and make two leather straps. Once you have them, give me them along with your claws and I will work my magic!");
		e.self:Say("Use only the very best rockhopper hide you can find along with that stone, and you will have those strips in no time!");
		e.other:QuestReward(e.self,{items = {17237,5572}}); -- Item: Stitching Pack
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5581, item2 = 5581, item3 = 3673, item4 = 3674})) then
		e.self:Emote("'s hands move deftly as she wraps the think leather straps around the claws that you gave her. She ends her task by tightening the straps with a few small metal clasps. 'Her youth, see i fthese fit.' She says as she hands you the claws. She pulls a folded note from her waistband and hands it to you while saying, 'Take this note to Rittuh Purrik in the moor. She needs assistance with a few matters. Return a little later and I will teach you more.'");
		e.other:Faction(e.self,1532,1); -- Faction: Khati Sha
		e.other:QuestReward(e.self,{items = {5574,5575,5573},exp = 2500}); -- Item: Reinforced Khati Sha Claw
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5577})) then
		e.self:Say("You have done very well, youth. I hope that you are beginning to understand what it means to walk the path of Khati Sha. Public service is very important. Our namesake is the fundamental figure in the foundation of this society. Our walls are made of the ore that he discovered. His exploration of the lands that surround our home made it possible for us to live here in peace. This leads us to our next lesson. I would like you to seek out the caverns beyond the thicket. A breed of shelled creatures roam the tunnels of those caverns. Occasionally, a strong glow will manifest itself in one of these creatures. Find such a creature and bring me the source of its glow. Wrap the light source in your Khati Sha recruit's cloak and place them both in this box.");
		e.other:Faction(e.self,1532,1); -- Faction: Khati Sha
		e.other:QuestReward(e.self,0,0,0,0,17610,1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5579})) then
		e.self:Emote("opens the box and removes your old cloak. She unwraps the orb and looks at it for a moment.");
		e.self:Say("You have done well, youth.' She says as she picks up what appears to be a new cloak. She hands you the cloak and smiles. 'Your life as a member of our sect may not always be pleasant, but take comfort in the fact that you are performing a great service to your people. Walk the path of the Khati Sha with pride and one day may you see his face as I have. Now, seek out Kaam Rahiir in the libraries. Show him your claws and he will be able to assist you in imbuing them magically. Take care.");
		e.self:Shout("Citizens of Shar Vahl, take this time to welcome " .. e.other:GetCleanName() .. " to the level of Khati Sha Apprentice. We are all in the debt of each and every citizen that works a hard as " .. e.other:GetCleanName() .. " to improve our city.");
		e.other:Faction(e.self,1532,5); -- Faction: Khati Sha
		e.other:QuestReward(e.self,0,0,0,0,5580,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
