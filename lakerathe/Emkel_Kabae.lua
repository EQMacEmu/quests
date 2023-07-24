-- Necromancer Epic NPC -- Emkel_Kabae

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am Emkel Kabae, first apprentice to Kazen. If you have a symbol, tell me its name.");
	elseif(e.message:findi("symbol of the serpent")) then
		e.self:Say("There are more reagents to be gathered. The time draws near for our master's ascension. Travel to the lands of Kunark and seek out Ssessthrass. He is a very wise Iksar herbalist helping me in my endeavor to please Master Kazen. Be careful not to insult his speech, or you may end up dead before you serve your purpose to the master. Be sure to show him the symbol as proof or he may consider you dinner.");
	elseif(e.message:findi("symbol of testing")) then
		e.self:Say("You must ask the master about the symbol of testing. Do not hand the symbol to him for he may interpret that as a breach of conduct.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20643, item2 = 20649})) then -- Give the Rolling Stone Moss and the Twisted Symbol of the Apprentice to Emkel Kabae in Lake Rathetear
		e.self:Say("Very good, " .. e.other:GetCleanName() .. ", you have done as the master asked yet again, take this as a reward.' Emkel reaches into his robes and pulls out a small symbol. He holds it out and the tiny symbol floats to your hand.");
		e.other:QuestReward(e.self,0,0,0,0,20644,500); -- Item: Symbol of the Serpent
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20650})) then -- Give the Refined Mainsi Herb to Emkel for the Symbol of Testing
		e.self:Say("You are truly worthy of studying with our master. Bear this new symbol and contemplate what you wish from life before you let go of it. Ask the master about the symbol of testing and he will explain all. I too was tested by him.' Emkel pulls up his sleeve to show a grievous scar from his wrist to his shoulder.");
		e.other:QuestReward(e.self,0,0,0,0,20647,1000); -- Item: Symbol of Testing
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
