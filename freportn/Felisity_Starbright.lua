function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. " - If you are interested in helping the League of Antonican Bards by delivering some mail you should talk to Ton Twostring.");
	elseif(e.message:findi("mail")) then
		e.self:Say("The League of Antonican Bards has a courier system made up of travelers, adventurers and [agents].  We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices.  Are you [interested]?");
	elseif(e.message:findi("agent")) then
		e.self:Say("Silna Songsmith, Travis Two-Tone, Drizda Tunesinger and Dark Deathsinger all report to me.");
	elseif(e.message:findi("silna songsmith")) then
		e.self:Say("Silna Songsmith lives with the small folk in the city of Rivervale.");
	elseif(e.message:findi("travis.* tone")) then
		e.self:Say("Travis Two-Tone scouts the forest of Nektulos, near the dark elf city of Neriak.");
	elseif(e.message:findi("drizda tunesinger")) then
		e.self:Say("Drizda Tunesinger scouts the Feerrott, near the ogre city of Oggok.");
	elseif(e.message:findi("dark deathsinger")) then
		e.self:Say("Dark Deathsinger scouts the Innothule Swamp, near the troll city of Grobb.");
	elseif(e.message:findi("marsinger")) then
		e.self:Say("Postmaster Tralyn Marsinger lives in the city of Qeynos.");
	elseif(e.message:findi("lislia goldtune")) then
		e.self:Say("Postmistress Lislia Goldtune lives in the fortress of High Keep.");
	elseif(e.message:findi("jakum webdancer")) then
		e.self:Say("Postmaster Jakum Webdancer lives in the city of Kelethin.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18158}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18155}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18157}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18159}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18166})) then
		e.self:Say("Mail from the front - thank you very much! Please take this gold for your troubles. If you are interested in more work, just ask Ton Twostring.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,284,5,0); -- league of antonican bards
		e.other:Faction(e.self,281,1,0); -- knights of truth
		e.other:Faction(e.self,262,1,0); -- guards of qeynos
		e.other:Faction(e.self,304,-1,0); -- ring of scale
		e.other:Faction(e.self,285,-1,0); -- mayong mistmoore
		e.other:QuestReward(e.self,0,0,12,0,0,2000); -- confirmed Live rewards (exp and coin)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
