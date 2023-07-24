--Quest for North Kaladim - Trantor Everhot: Tumpy Tonics

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yes, yes!! I am a very busy man. I've got blueprints to work on, [dwarven wire] to perfect and formulae to calculate. In between those tasks, I have to find time to head down to Irontoe's and down a few Tumpy Tonics.");
	elseif(e.message:findi("dwarven wire")) then
		e.self:Say("Oh!! Interested in my dwarven wire, are you? Many are. I have no problem letting you use a spool, but I have to warn you that I have not perfected the strength of it yet. I will make you a trade. A couple of [Tumpy Tonics] for a spool.");
	elseif(e.message:findi("tumpy tonics")) then
		e.self:Say("Aaah!! I love Tumpy Tonics. They were created by Tumpy Irontoe. He was once a member of the famed Irontoe Brigade. Since they disbanded and left for parts unknown he decided to stay in Kaladim and open Irontoe's, the finest well in Faydwer.");
	elseif(e.message:findi("irontoe")) then
		e.self:Say("If you're asking about the Brigade, who knows where they are?! If you're looking for Irontoe Tavern, it's here in Kaladim, near the arena.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Hey! Only one?!";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12114, item2 = 12114},1,text)) then --Tumpy Tonic (Only 2)
		e.self:Say("Great! I did not have the time to get down to Irontoe's today. Here. Like I said. A spool of dwarven wire. Now go away. I ain't sharing these tonics.");
		e.other:Faction(e.self,312,1); --Storm Guard
		e.other:Faction(e.self,274,1); --Kazon Stormhammer
		e.other:Faction(e.self,293,1); --Miners Guild 249
		e.other:Faction(e.self,290,1); --Merchants of Kaladim
		e.other:Faction(e.self,232,-1); --Craknek Warriors
		e.other:QuestReward(e.self,0,0,0,0,12111,1000); --Dwarven Wire
		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
