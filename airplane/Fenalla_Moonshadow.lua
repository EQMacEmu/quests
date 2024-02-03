function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("We are children of the trees, friends and protectors of nature. We are brothers and sisters to the wolves and bears. The call of the Great Pine has filled your heart and led you here to be tested.");
	elseif(e.message:findi("test")) then
		e.self:Say("Children of the trees, friend and protector of nature. We the brothers and sisters to the wolves and bears. The call of the Great Pine has filled your heart and have found your way here to be tested. Do you wish to be tested in Nature, the art of the Bee, or the way of the Eagle?");
	elseif(e.message:findi("nature")) then 	--druid test of nature
		e.self:Say("The test of Nature will show your devotion to and understanding of Mother Nature. Bring me an Efreeti Scimitar, a Lush Nectar, a Fire Sky Ruby, and a Storm Sky Opal to show your devotion. You will then recieve your reward.");
	elseif(e.message:findi("bee")) then 	--druid test of the bee
		e.self:Say("The bee is a busy little creature and you too must show industriousness like it. Bring me an Efreeti Statuette, a Wilder's Girdle, and a Piece of Divine Honeycomb to prove your understanding of the bee's art of work.");
	elseif(e.message:findi("eagle")) then 	--druid test of the eagle
		e.self:Say("To soar like the eagle is your goal. To do so, you must bring me an Acidic Venom, an Ethereal Ruby, a Spiroc Elder's Totem, and a White-tipped Spiroc Feather. Perhaps then you will know what it means to soar upon the wind.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20739, item2 = 20738, item3 = 20965, item4 = 20740})) then 		--druid test of nature using efreeti scimitar, fire sky ruby, lush nectar, storm sky opal
		e.self:Say("I am honored to know one such as you, " .. e.other:GetCleanName() .. ". I beg you to wield Espri with as much grace you have shown during the travails to obtain it.");
		e.other:QuestReward(e.self,0,0,0,0,11683,100000); 	--espri
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20735, item2 = 20951, item3 = 20734})) then 	--druid test of the bee using divine honeycomb, efreeti statuette, wilder's girdle
		e.self:Say("This belt suits your nature, " .. e.other:GetCleanName() .. ".  Take it.");
		e.other:QuestReward(e.self,0,0,0,0,11684,100000); 	--honeycomb belt
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20736, item2 = 20737, item3 = 20867, item4 = 20958})) then 	--druid test of the eagle using acidic venom, ethereal ruby, spiroc elder's totem, white-tipped spiroc feather
		e.self:Say("The totem of the spirocs will aid you in your search for oneness with nature.  Take it and use it well.");
		e.other:QuestReward(e.self,0,0,0,0,14555,100000);	--spiroc banisher focus -- Original: Cloak of the Leaves (missing)
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