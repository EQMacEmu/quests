function event_spawn(e)
	eq.set_timer("ww",3600000);
end

function event_timer(e)
	eq.unique_spawn(47353,0,0,-1553,1199,-24.2,174); -- NPC: Giant Werewolf -- Halloween Event
	eq.zone_emote(15,"a loud roar is heard in the distance, everything goes eerily silent...");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Beware, traveller!! There has been increased sightings of lycanthropes in this area. This time of year, the sky glows flame-orange and the [beasts] become more active.");
	elseif(e.message:findi("beast")) then
		e.self:Say("They are known to attack almost anything they see, I've even heard [reports] of a single werewolf wiping out an entire bandit camp!");
	elseif(e.message:findi("report")) then
		e.self:Say("I am a scout sent by the renowned werewolf hunting clan known as The Fangbreakers. We're testing a new [poison] that contains strong acids that severely weakens and kills werewolves.");
	elseif(e.message:findi("poison")) then
		e.self:Say("I tracked down a fearsome one on my way here and shot it with a poison-tipped arrow. Because of the size of the beast, I'm afraid it wasn't enough to kill it. It [escaped].");
	elseif(e.message:findi("escape")) then
		e.self:Say("If you see it lumbering around, please approach with caution! If it has already died, return to me with a blood sample so that we may analyze it to improve our concoction. I will also use the blood to imbue one of our staves that you can keep as a reward.");
	end
end

function event_trade(e)
	local item_lib =require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2646})) then -- Arterial Blood
		e.self:Emote("holds up a staff and applies the blood to the top of the weapon, turning it dark red. 'Thank you! I hope it wasn't too much trouble to finish off. This weapon should prove most effective against other lycanthropes and magical creatures that you may run across. Good luck!");
		e.other:QuestReward(e.self,0,0,0,0,6048,0); -- Item: Darkwood Staff
	end
	item_lib.return_items(e.self, e.other, e.trade)
end