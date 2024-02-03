function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetCleanName() .. ". I can only assume my reasons for being summoned is that you wish to take the tests. Would you like to be tested in the body, in defense, or in the element of earth?");
	elseif(e.message:findi("body")) then --ranger test of body
		e.self:Say("Very well. You must scour this plane and bring back to me these components: an auburn tessera, a ysgaril root, and a griffon talon. Make haste, and good luck.");
	elseif(e.message:findi("defense")) then --ranger test of defense
		e.self:Say("Defense it is. You must prove yourself worthy enough for the Spiroc spirits to guard you. Bring back to me a mithril disc, a harpy tongue, and a fine velvet cloak. Good luck to you " .. e.other:GetCleanName() .. ".");
	elseif(e.message:findi("element of earth")) then --ranger test of the element of earth
		e.self:Say("Elemental earth you say? When honed, the elements can be among our best allies. Retrieve a gridelin globe, a dragon hide mantle, and a spiroc earth totem. Only with these items can you master the element of earth.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20934, item2 = 20850, item3 = 20849})) then --ranger test of body using auburn tessera, griffon talon, ysgaril root
		e.self:Say("This necklace will aid you greatly, " .. e.other:GetCleanName() .. ". Wear it with pride.");
		e.other:QuestReward(e.self,0,0,0,0,14567,100000); --griffon talon necklace
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20853, item2 = 20852, item3 = 20851})) then --ranger test of defense using fine velvet cloak, harpy tongue, mithril disc
		e.self:Say("You should find this cloak useful.");
		e.other:QuestReward(e.self,0,0,0,0,27731,100000); --dark cloak of the sky -- Original: Spiroc Healer's Cloak (2715)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20854, item2 = 20948, item3 = 20855})) then --ranger test of the element of earth using dragon-hide mantle, gridelin globe, spiroc earth totem
		e.self:Say("The mantle I give you to wear houses a powerful enchantment. Use it with care.");
		e.other:QuestReward(e.self,0,0,0,0,2714,100000); --earthshaker's mantle
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
