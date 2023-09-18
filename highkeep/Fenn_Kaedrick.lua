function event_spawn(e)
	eq.set_timer("depop", 1800000); --Despawn after 30 minutes
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(e.message:findi("hail")) then
		e.self:Say("What brings you to the top of the castle? Me? I am just the Highkeep exterminator. We have had a nasty time with rats.");
	elseif(e.message:findi("scout") or e.message:findi("laren")) then
		e.self:Say("I have no idea what you are speaking of!  Maybe you could show me some sort of token of appreciation for wasting my time with such questions.");
	elseif(e.message:findi("xentil"))then 
		if(e.other:GetFactionValue(e.self) >= 200) then -- requires high amiably faction	
			e.self:Say("Xentil Herkanon is related to one of the bigwigs of the Circle of Unseen Hands, the rogue guild in Qeynos. Killing him would greatly decrease your popularity with them, but who do they like, anyway? He travels with two bodyguards, Lartin and Grex, very tough customers. It's best to avoid them. Goodbye and good luck.");
			eq.stop_timer("depop");
			eq.depop();		
		else
			e.self:Say("The Scouts of Tunare have no quarrel with you, but perhaps a few less Crushbone Orcs would prove your worth. Then we shall speak.")
		end	
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFactionValue(e.self) >= 200 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12185})) then 		--Useless Coin requires amiably faction
		e.self:Say("So you are the one Laren sent. I myself was trained by Laren. Imagine that, a human trained by elven rogues. I share the concerns of the scouts. You were sent to assassinate [Xentil Herkanon]. He betrayed the scouts and Kelethin. He is somewhere in this keep. Return his head to Laren in Kelethin.");				
		e.other:QuestReward(e.self,0,0,0,0,0,2000);
		eq.unique_spawn(6185, 0, 0, -258, -102, 4, 16);			--Xentil Herkanon
		eq.unique_spawn(6186, 0, 0, -259, -78, 4, 0); 			--Lartin
		eq.unique_spawn(6187, 0, 0, -240, -78, 4, 0); 			--Grex					
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end
