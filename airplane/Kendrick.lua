function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Great, let us waste no more time! Do you wish to begin your test of Thievery, Silence, or Trickery?");
	elseif(e.message:findi("thievery")) then 	--rogue test of thievery
		e.self:Say("Thievery is absolute. Travel beyond and bring forth an Ivory Tessera, a gem of invigoration, and an inlaid choker to complete the test of thievery and earn the wispy choker of vigor!");
	elseif(e.message:findi("silence")) then 	--rogue test of silence
		e.self:Say("Silence makes us deadly. Proceed upward and bring to me a spiroc sky totem, a pearlescent globe, and a black griffon feather. Griffon Wing Spauldors shall be yours if you complete this.");
	elseif(e.message:findi("trickery")) then 	--rogue test of trickery
		e.self:Say("Trickery, ahh how Fizzlethorpe blesses us! Adventure and return a mottled spiroc feather, a cracked leather belt, and a sphinxian circlet to complete the test of trickery and earn Renards Belt of Quickness.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20928, item2 = 20984, item3 = 20985})) then 	--rogue test of thievery using ivory tessera, gem of invigoration, inlaid choker
		e.self:Say("Very good, " .. e.other:GetCleanName() .. "!  Take this choker as evidence of your abilities.");
		e.other:QuestReward(e.self,0,0,0,0,14552,100000); 	--wispy choker of vigor
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20989, item2 = 20942, item3 = 20988})) then --rogue test of silence using spiroc sky totem, pearlescent globe, black griffon feather
		e.self:Say("These spauldors made from griffon wings will aid you in your ascent to greatness, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,2703,100000); 	--griffon wing spauldors
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20956, item2 = 20992, item3 = 20993})) then --rogue test of trickery using mottled spiroc feather, cracked leather belt, sphinxian circlet
		e.self:Say("If one is slow, he dies a quick death. With this belt, you can avoid all that with nary a breath.");
		e.other:QuestReward(e.self,0,0,0,0,11676,100000); 	--renard's belt of quickness
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
