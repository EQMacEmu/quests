function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi there, who are you?  What are you doing here? Oh I'm one of Vornol's four apprentices.  I specialize in the element of earth."); 
	elseif(e.message:findi("armor")) then
		e.self:Say("Oh you've been to see Gazoon on his island. Yep he gave me some of his fancy finger waggler armor, are ya a wizard?");
	elseif(e.message:findi("wizard")) then
		e.self:Say("Wonderful, then you'll probably be wanting the mask, cloak, gloves, choker, belt and staff I have");
	elseif(e.message:findi("mask")) then
		e.self:Say("For the mask you'll have to get me a meteor jewel, a mark of potential, and an iron tipped wand.");
  	elseif(e.message:findi("cloak")) then
		e.self:Say("For the cloak you'll have to get me an astral jewel, a mark of temper, a vial of firewater, and some iced nectar.");
  	elseif(e.message:findi("gloves")) then
		e.self:Say("For the gloves you'll have to get me a sun jewel, a mark of might, and a book of solutions.");
  	elseif(e.message:findi("choker")) then
		e.self:Say("For the choker you'll have to get me a moon jewel, a mark of destruction, and a stick of mastery.");
  	elseif(e.message:findi("belt")) then
		e.self:Say("For the belt you'll have to get me a star jewel, a mark of thaumaturgy, a loop of energy, and a small magnifying lens.");
  	elseif(e.message:findi("staff")) then
		e.self:Say("For the staff you'll have to get me a cloud jewel, a mark of detonation, opaque glasses, and a pyro wand.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4736,item2 = 4735,item3 = 4738,item4 = 4490},1,text)) then -- belt
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3721,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4734,item2 = 4489,item3 = 4737},1,text)) then -- choker
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3720,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 4731,item3 = 4729,item4 = 4730},1,text)) then -- cloak
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3718,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4733,item2 = 4732,item3 = 4488},1,text)) then -- gloves
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3719,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 4739,item3 = 4740,item4 = 5973},1,text)) then -- staff
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3722,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4728,item2 = 4727,item3 = 4493},1,text)) then -- mask
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3717,25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function FactionReward(e)
	e.self:Say("" .. e.other:GetCleanName() .. " take this and use it with pride.")
	e.other:Faction(e.self,1547,5); -- Vornol Transon
end
