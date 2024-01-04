-- 15044 - Althele at #loc -1592, -3657, -17 - to start corruptor/reaver spawns for fleshbound tome

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, friend. Beautiful is what I would call such a day normally but lately? I sense that something is [out of balance].");
	elseif(e.message:findi("balance")) then
		e.self:Say("I sense something foreboding, young one, but you should think nothing of it. The sons and daughters of nature will be able to deal with this problem.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20448})) then
		e.self:Emote("looks at the coin and nods gravely at you as she slips it into a fold of her clothing. 'I see. The story of this coin speaks much to me as do the words you have given me. Telin sent word that you would arrive. The tidings you bring are ill indeed. Here, take this amulet and find Sionae. She is nearby. We will speak more on this matter when all are present.'");
		e.other:QuestReward(e.self,{itemid = 20450}); -- Braided Grass Amulet
		eq.unique_spawn(15178,0,0,-1595,-2595,4,127); -- NPC: Sionae
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20452})) then
		e.self:Emote("hands the book to Tholris who reads through it with lines of concern etched on his face, then whispers into her ear. 'Dire news, indeed. This cannot be allowed. I must keep this book but you, " .. e.other:GetCleanName() .. ", must not allow Innoruuk to seed the land with his hatred and filth. You have only just begun your quest. The path you are guided upon will be difficult, if not impossible, but someone must finish it. Please, take this, read of it, follow its instructions. Tunare bless your path and Karana watch over you.");
		e.other:QuestReward(e.self,0,0,0,0,18959,100000); 		-- Earth Stained Note
		eq.depop(15178);
		eq.depop(15167);
		eq.depop(15170);
		eq.depop_with_timer(15043);
		eq.depop_with_timer(15042);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Great mother of life and father of sky, growth and spirit, Tunare and Karana. Innoruuk once again schemes and we have failed in our duties to protect our land. We give your powers in sacrifice fo ryour help. Heed our call and send us your wisdom.");
	end
end
