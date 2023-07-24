function event_spawn(e)
	eq.set_timer("depop",3600000);
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29684}, 0)) then -- Broken Disk
		e.self:Say("Ahhh the artifact, I will return this to Commander Leuz.  Please take this updated report to him ahead of me so he knows what to expect on my arrival.  Please accept this robe as a reward, I'm not very skilled at judging size so if you have a problem with wearing it please give it back and I will see what else I have for you.");
		e.other:Faction(e.self,430,25); -- Faction: Claws of Veeshan
		e.other:Faction(e.self,436,6); -- Faction: Yelinak
		e.other:Faction(e.self,448,-12); -- Faction: Kromzek
		e.other:QuestReward(e.self,{items = {29688,29685},exp = 10000}); -- Scout Report, Robe of Benevolence
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29685}, 0)) then -- Robe of Benevolence
		e.self:Say("Didn't like the robe, eh?  How about this then.  They packed it in my scout kit, and it is of no use to me, though it looks very nice.");
		e.other:QuestReward(e.self,0,0,0,0,29686); -- Bracer of Benevolence
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29686}, 0)) then -- Bracer of Benevolence
		e.self:Say("Hmm, not the martial type, I take it.  Perhaps this will better suit your needs.");
		e.other:QuestReward(e.self,0,0,0,0,29687); -- Talisman of Benevolence
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29687}, 0)) then -- Talisman of Benevolence
		e.self:Say("Right back where we started!  While this is an interesting game of dress-up, I have to resume my duties.  So, make up your mind!");
		e.other:QuestReward(e.self,0,0,0,0,29685); -- Robe of Benevolence
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.depop();
end
