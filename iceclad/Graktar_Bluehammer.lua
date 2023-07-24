function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 25102}, 0)) then -- large note
		e.self:Say("So, Vkjor has sent you to assist me? He must want me back fighting in the arena as soon as possible if he'd send a mercenary out here to help me. My brother Felkak went missing no less than a fortnight ago. He told me he was traveling to the great Eastern Wastes to hunt, however, I have found no sign of him. My younger brother often lied about where he was going in order to be 'free'. Take my ring and search the lands for one that looks exactly like it. If my brother is alive, show him this ring and he will give you his, to prove to me that he is alive. If he is dead... Bring me his ring as proof that he is. I have heard that he may be near the Tower of Frozen Shadows but many times have I warned him not to enter that dread place. You may wish to begin your search in that area.");
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25193}, 0)) then -- signet ring
		e.self:Emote("swipes the ring from your outstretched hand. 'Yes, this is Felkak's ring, a twin of my own. He would never part with this willingly so this is truly a sign of his passing. I thank you for delivering this news to me. Though it saddens me deeply, at least I will know now what has become of him. One day I may return to the arena but for now I must wander these lands to cool the fury of my heart. Please take what little coins I have as thanks in return.'");
		e.other:Faction(e.self,419,1); -- Faction: Kromrif
		e.other:Faction(e.self,448,1); -- Faction: Kromzek
		e.other:Faction(e.self,406,-1); -- Faction: Coldain
		e.other:Faction(e.self,430,-1); -- Faction: Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,5,0,15000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
