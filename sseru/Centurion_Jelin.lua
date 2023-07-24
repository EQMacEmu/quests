function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my home, my apologies for being untidy. I have been preoccupied with the thought of my brother lately. I love Seru and I love this town do not get me wrong, but it still makes me sad to see someone cast out. He was forced to submit to the Question when he was found to be supplying [Recuso] with food, water, and medical supplies. Because of the power of the question, they soon found this out, and now he has to live amongst the very people he was helping.");
	elseif(e.message:findi("Recuso")) then
		e.self:Say("The Recuso are the refused. They are cast out of Sanctus Seru because of their crimes against the city, their incompetence, or for any other number of political reasons. Because you are questioned by a Praesertum other than the one that you are in, it is kept unbiased. My brother committed crimes against the city by assisting the Recuso. The refused are sent to Marus Seru as punishment and [interfering] with that punishment is interfering with Seru's way."); 
	elseif(e.message:findi("interfering")) then
		e.self:Say("I would never be able to aid him, let alone think of it without failing the question. I just wish I knew how he was doing. I could not check on him, and could not ask you to check on him either, or you would defy Seru. That is something that I could not ask of anyone. The Question is a horrible ordeal. You will either die from being cast to Marus Seru or from the draining power of the Question itself.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6269}, 0)) then
		e.self:Emote("looks at you puzzled and takes the letter and reads it. 'Oh I am so glad that he is alive! I am happy that you took the time to ease my worries about him. I shall let the people of this town know that you come with good intentions. For now I will rest for I have not slept in days.");
		e.other:Faction(e.self,1499,10); -- Citizens of Seru
		e.other:Faction(e.self,1484,1); -- Hand of Seru
		e.other:Faction(e.self,1486,1); -- Heart of Seru
		e.other:Faction(e.self,1485,1); -- Eye of Seru
		e.other:Faction(e.self,1487,1); -- Shoulders of Seru
		e.other:Faction(e.self,1502,-5); -- Katta Castellum Citizens
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
