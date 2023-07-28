--Quest Name: McMerrin's Feast - "Evil" Races, or any with VS faction
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("gestures as if casting a powerful spell...'Come forward, adventurer! Come and [see the dancing skeleton]. I shall cast a powerfull spell and bring forth this operatic, clattering jumble of bones and he shall do a fine dance for you. From the nether regions and planes beyond, I call forth this bardic, magical, rhyming, tap-dancing hunk of undead!! I am Oowomp the Great!!'");
		e.self:DoAnim(43);
	elseif(e.message:findi("see the dancing skeleton")) then
		e.self:Say("Oh!!  You wish to see the great Oowomp perform his magic!! I have studied with the grand mages and wise [McMerin clan] of Norrath. as my speech implies. I can call forth the skeleton with but a twinkling of my power and five of your gold.");
		e.self:DoAnim(49);
	elseif(e.message:findi("McMerin clan")) then
		e.self:Say("Clan McMerin were wise shamans from the North. They allowed me to study with them. I learned many spells while I communed with them.  From them, I sto.., I mean, I learned the secret of McMerin's Feast. If you want to know the secret, you could [help gather components] for future rituals.");
		e.self:DoAnim(48);
	elseif(e.message:findi("gather components")) then
		e.self:Say("Actually... Not so much help as do - ALL - of the gathering. In the lands of Kunark are clay of Ghiosk, crushed dread diamond and powder of Yun. A rare find would be the bones of one who touched the Bath of Obulus. Find and return these to me and the shaman secret of McMerin's Feast is yours.");
		e.self:DoAnim(65);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {gold = 5})) then
		e.self:Emote("flings the coins into the air and they all fall neatly into his oversized coin pouch. <Tink, tink, tink, tink, TINK!!> 'Gaze upon my awsome powers of the arcane!! You, a simple " .. e.other:Race() .. ", shall see my power. Allakabam!!'");
		eq.unique_spawn(96088,0,0,3122.8,5725.2,7.9,13.0); -- NPC: a_dancing_skeleton
		eq.set_timer("dance",3000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12942, item2 = 12945, item3 = 12944, item4 = 12943})) then
		e.self:Emote("begins to jump for joy. The ground trembles. 'Grand! Here is the secret of McMerin's Feast. Scribe it and you shall learn more of its power.");
		e.other:QuestReward(e.self,0,0,0,0,12941,45000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer == "dance") then
		eq.signal(96088,5,0); -- NPC: a_dancing_skeleton
		eq.stop_timer("dance");
	end
end
