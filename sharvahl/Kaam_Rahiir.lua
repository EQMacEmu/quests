function event_spawn(e)
	eq.set_timer("1",10000);
end

function event_timer(e)
	if(e.timer == "1") then
		e.self:SetAppearance(1);
		eq.stop_timer("1");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("May I help you?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5574, item2 = 5575})) then --Reinforced Khati Sha Claw, Reinforced Khati Sha Claw
		e.self:Emote("turns to you and squints at the claws that you've just given him.");
		e.self:Say("I see that you've been getting some use out of these things. They are crude, but they seem sturdy enough.");
		e.self:Emote("says as he returns the claws. He hands you a small bag and continues.");
		e.self:Say("I hope the combat you've seen has made an impression on you, young friend. Combat is not pleasant, but it is often unavoidable. We are explorers and conflict often breeds in the unknown. Learn from each encounter and you are less likely to be trapped by conflict in the future.");
		e.other:QuestReward(e.self,{items = {5574,5575,17113}}); --Reinforced Khati Sha Claw, Small Burlap Bag
		e.self:Say("In preparation for your journey down the path of Khati Sha, you will need to seek out the wolves of the moor. You will need to learn the behavior and abilities of this enemy. Once you have tracked and met these beasts, I will teach you how to best dispose of them in the future. Place two molars from the mouth of one of their pups in that bag and return to me. That will guarantee that you've come face to face with your foe.");
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6182})) then --Small Bag of Teeth
		e.self:Say("Excellent, the spirits have returned you to me with your tail intact! The foe that you encountered was a young creature. Their elders are much less likely to allow your passage. The packs of wolves that roam the moor have proven to be quite a problem for our scouts. I will assist you in learning a method that will allow you to build and assist others in building a weapon that bites at the very spirit of those beasts. Take these claw mounts and use them in conjunction with the tomes that Qua sells. You'll need stretching dowels to treat the lashings. Jhimis usually keeps them behind the counter of his shop. Get a set from him and read through those tomes. Return to me with your new claws and your apprentice's cloak when you have completed the task.");
		e.other:Faction(e.self,1532,3); -- Faction: Khati Sha
		e.other:QuestReward(e.self,0,0,0,0,6145,10000); --Reinforced Claw Mounts
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5580, item2 = 6185, item3 = 6186})) then --Cloak of the Khati Sha Apprentice, Sonic Wolf Bane Claw, Sonic Wolf Bane Claw
		e.self:Say("These claws are very well crafted! Your work is very impressive. Please take them to Ahom Guzhin. He is an old friend of mine. The sonic wolf claws were the result of some of his original studies in the moor. He has dedicated his life to studying creatures of the moor and can almost always be found there. Be careful when you go looking for him. You've done well here, but don't get careless. Good journeys.");
		e.other:Faction(e.self,1532,5); -- Faction: Khati Sha
		e.other:QuestReward(e.self,{items = {6184,6185,6186},exp = 50000}); --Cloak of the Khati Sha Journeyman, Sonic Wolf Bane Claw, Sonic Wolf Bane Claw
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

