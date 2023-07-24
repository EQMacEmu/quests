--------------------------
--Quest Name:Bug Collection
--NPCs Involved:Blixkin Entopop
--Items Involved:Bug Collection Box, Complete Bug Collection, Fire Beetle Eye
--Giant Fire Beetle Leg, Giant Scarab Egg Sack, Giant Wasp Wing,
--Spiderling Eye, Spiderling Silk
----------------------------------

function event_waypoint_arrive(e)
	if((e.wp == 2) or (e.wp == 9) or (e.wp == 14) or (e.wp == 21) or (e.wp == 24)) then
		e.self:Say("Ember?!  Ember?!  Where are you, girl?!");
		eq.signal(33065);
	end
end

function event_signal(e)
	e.self:Say("There you are!  Stay close to me, girl.");
end

function event_combat(e)
	e.self:Say("What do you think you are doing?!?");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "! My name is Blixkin Entopop. Have you seen the wonderful assortment of [spiders] and [beetles] that inhabit the thicket? I have quite an extensive [bug collection]. Be careful, though. I have seen many brave halflings fall beneath a [swarm] of clicking and hissing bugs.");
	elseif(e.message:findi("spiders")) then
		e.self:Say("There are many species of bugs out here. The most common are the fire beetles. If you are hunting them, make sure their queen is not around or you will be in deep trouble. Their eyes are a popular item for adventurers because they give off light as if they were on fire. I even had one warrior try to kill [Ember] for her eyes!!");
	elseif(e.message:findi("ember")) then
		e.self:Say("I raised Ember from an egg. She is my faithful pet and quite smart for a beetle. There are plenty of other bugs to squish, out in the thicket, so you had best leave her alone or I will have to SQUISH you!");
	elseif(e.message:findi("swarms")) then
		e.self:Say("Bugs tend to swarm and defend others of their species when they are attacked. So keep your eyes peeled if you intend to squish any of them.. And you'd better not even THINK of squishing [Ember] or you will be sorry!");
	elseif(e.message:findi("beetles")) then
		e.self:Say("There are many species of bugs out here. The most common are the fire beetles. If you are hunting them, make sure their queen is not around or you will be in deep trouble. Their eyes are a popular item for adventurers because they give off light as if they were on fire. I even had one warrior try to kill [Ember] for her eyes!!");
	elseif(e.message:findi("collection")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Here you go. Just follow the instructions on the [list] so you know what to collect and how to prepare the collection for me.");
			e.other:SummonCursorItem(17922); -- Item: Bug Collection Box
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("list")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("What did you do, lose the list? Here is another one. Hold onto it because I will want it back when you are done.");
			e.other:SummonCursorItem(18011); -- Item: Want List
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Oh you have a complete collection for me?! Good! Good! Well done. But remember that I need the complete bug collection and you must return my want list before I can pay you.";
	
	if(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13268, item2 = 18011},1,text)) then
		e.self:Say("Excellent! Good work! I knew you were the one for this job! Thank you so much! My collection just gets better and better each day. Here is your reward as I promised.");
		e.other:Faction(e.self,292, 5); -- Faction: Merchants of Rivervale
		e.other:Faction(e.self,241, 1); -- Faction: DeepPockets
		e.other:Faction(e.self,263, 1); -- Faction: Guardians of the Vale
		e.other:Faction(e.self,286, 1); -- Faction: Mayor Gubbin
		e.other:Faction(e.self,336, -1); -- Faction: Coalition of Tradefolk Underground
		e.other:QuestReward(e.self,0,math.random(10),math.random(5),0,eq.ChooseRandom(14010,13281,13280,14015,16875),65); -- Item(s): Potion of Poison Warding (14010), Silver Bracelet (13281), Bracelet of Beetlekind (13280), Spider Venom (14015), Stalking Probe (16875)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
