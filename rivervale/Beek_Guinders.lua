function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("waves enthusiastically and says, Hay, ho, there, young " .. e.other:Race() .. "!  I'd love to yak it up with you but I'm a bit busy at the moment, trying to find some [help].");
	elseif(e.message:findi("help")) then
		e.self:Say("Well, we're experimenting with some tanning methods but we're running low on supplies. We need to find someone to go out and [gather some things]. Seems no one wants to do an honest day's work any more. I'd do it myself but, errrr, my, uhhh, foot hair has been hurting lately... yes, that's it.");
	elseif(e.message:findi("heal")) then
		e.self:Say("Hey! That is not my responsibility! Go speak with Hendi Mrubble. She is the one who got stuck with that duty.");
	elseif(e.message:findi("gather some thing")) then -- can be done at dubiously
		e.self:Say("Ahhh, excellent! Okay, first, we'll need a couple of wolf pelts. They don't have to be perfect, completely ruined would work just fine, hehe. I'll also need a black wolf skin and a handful of berries. The berries you should be able to find out in the Thicket. I hear they grow in a small canyon near the lone tower. Hurry, hurry!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Whoooops! I'll need the two ruined wolf pelts along with the berries and black wolf skin before I can reward you, " .. e.other:GetCleanName() .. ". Don't dawdle now.";

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18731})) then -- Tattered Note
		e.self:Say("Aye. Welcome. my fur-footed friend. My name is Beek Guinders. and I am guildmaster here at the Chapel of Mischief. Here is our guild tunic. Wear it with pride, as it will set you apart from the crowd.");
		e.other:Faction(e.self,300,100,0); -- Priest of Mischief
		e.other:Faction(e.self,286,15,0); -- Mayor Gubbin
		e.other:Faction(e.self,263,15,0); -- Guardian of the Vale
		e.other:QuestReward(e.self,0,0,0,0,13538,20); -- Faded Gold Felt Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13045,item2 = 13782,item3 = 13782,item4 = 13758},1,text)) then -- can be done at dubiously
		e.self:Say("Hey, great! You found the materials! We'll get to work right away. If you find any more, please come by again. Here's a little something for your troubles, friend.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,300,3,0); -- Priest of Mischief
		e.other:Faction(e.self,286,1,0); -- Mayor Gubbin
		e.other:Faction(e.self,263,1,0); -- Guardian of the Vale
		e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(5),0,eq.ChooseRandom(15014,15201,15207,15208,16303),5000); -- Item(s): Spell: Strike (15014), Spell: Flash of Light (15201), Spell: Divine Aura (15207), Spell: Lull (15208), Spell: Gate (16303)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:rivervale  ID:19111 -- Beek_Guinders
