function event_say(e)
	if(e.message:findi("arx key")) then
		e.self:Say("The Arx Key, yes. I have read the compiled reports that have been brought to us and it seems to gain access to Arx Seru you need four shards, one from each Praesertum leader. When the time is ready each leader inserts their shard into the door of Arx Seru at the same time, and they are transported within the building. We need you to retrieve the four shards. When you have done so seek out Elnerick Augustleaf, and tell him that you serve Katta. His powers over the arcane are great and I believe he can form the shards into a single master key. Once you have received the Arx Key, place the seal given to you by Elnerick and your Runed earring in this jewel box and give it to me. I eagerly await your return.");
		e.other:SummonCursorItem(17613); -- 17613  Lcea's Jewel Box (container 2 slots)
	end
end

function event_trade(e)
	local item_lib = require("items");
	
     -- 7000 :  Lcea's Jewel Box
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7000}, 0)) then
		e.self:Say("Amazing! I had no doubt in your loyalty to Katta but I underestimated your ability to actually acomplish getting the Arx Key. Now that you have this key you must know what I ask of you next. Seru must be defeated, if there will ever be peace in Katta and truth spread among the people of  Sanctus Seru. Destroy this vile betrayer, bring me his head, and your Signet Earring. Go now before they have time to retaliate your previous attacks!");
		e.other:Faction(e.self,1561,100); -- concillium universus
		e.other:Faction(e.self,1483,-10); -- seru
		e.other:Faction(e.self,1486,-50); -- heart of seru
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,{itemid = 29860,exp = 10000}); -- 29860  Signet Earring of Veracity
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29860,item2 = 7810})) then
		e.self:Say("This is astounding, I find myself at a loss for words. You have done Katta a great justice, Sanctus Seru will never be the same now that the truth is known. Their leader has fallen.");
		e.other:Faction(e.self,1561,200); -- concillium universus
		e.other:Faction(e.self,1483,-20); -- seru
		e.other:Faction(e.self,1486,-100); -- heart of seru
		e.other:QuestReward(e.self,0,0,0,0,29861,20000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
