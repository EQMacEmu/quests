-- Bregun Dorey is spawned in Netherbian when you give a dawnshroud cinder to legionnaire Dalini
function event_spawn(e)
	eq.set_timer("depop",1800000);
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Trog trog trog trog?");
	elseif(e.message:findi("trog")) then
		e.self:Say("Ha! What are you talking about?! Strange thing you are. Wait a minute, come closer. Are you [from Norrath]?");
	elseif(e.message:findi("from norrath")) then
		e.self:Say("I thought so, your armor looks to be made from things found not here. Have you heard of [Rivervale]?");
	elseif(e.message:findi("bixies around rivervale")) then
		e.self:Say("There are Bixies! THERE ARE BIXIES! This is great. You should hunt some Bixies, and get some Bixie parts. Then you can make me some Bixie Crunchies! Ooooh, Crunchies. I want to try the Crunchies. I think you should bring me four Crunchies!");
	elseif(e.message:findi("rivervale")) then
		e.self:Say("[Good].");
	elseif(e.message:findi("good")) then
		e.self:Say("Yeah good! Trog trog trog trog! Hahaha! These Troglodytes don't know of Rivervale. They just run around the cave all day doing Troglodyte things. Hahaha! Trog trog trog. So what was I speaking of.. Oh Bixies! So, are there [bixies around Rivervale]?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13464,item2 = 13464,item3 = 13464,item4 = 13464}, 0)) then -- 4 bixie crunchies
		e.self:Say("Ah hum!");
		e.self:RemoveItem(29852);
		e.other:QuestReward(e.self,{itemid = 29852}); -- bixie charm
		e.self:Say("Give this charm to Torsten as a present from his old friend.");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29853}, 0)) then -- sealed note to bregun
		e.self:Say("Hahaha! Silly Torsten. Always snooping over my shoulder. Well I have nothing to lose... Take this to him, it's directions on how to find the Journal I kept. I hid it where no one would look! Haha! Trog trog trog!");
		e.other:QuestReward(e.self,{itemid = 29854}); -- bregun's directions
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
