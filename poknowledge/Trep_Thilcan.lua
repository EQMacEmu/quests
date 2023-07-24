-- poknowledge\Trep_Thilcan.lua NPCID 202057 

function event_say(e)
	if(e.other:GetLevel() < 35) then
		e.self:Say(eq.ChooseRandom("Someone with your skills is more suited to beetle slaying.  Run along, now.","This matter is far too advanced for you to handle.  Come back after you've killed a few more large rats.","It's much safer for you to spend time fishing than on a dangerous issue like this.","I think I saw a gnoll pup you could probably defeat, a few miles back."));
	elseif(e.message:findi("hail")) then
		e.self:Say("Hi! You wouldn't be able to do a favor for a poor gnome would you?");
	elseif(e.message:findi("will do you a favor")) then
		e.self:Say("Well I am trying to setup a shop here, it is such a choice location! I am afraid if I leave though that nasty Halfling over there may steal my spot! She has been watching me keenly all day. I know she is just waiting for me to walk away. If you would go purchase some supplies for me from various locations around the world I would be able to reward you for your time spent. If you are ready to begin?'");
	elseif(e.message:findi("ready to begin")) then
		e.self:Say("Great! Here is a special crate.  It needs to be filled with a purification tablet from Freeport, a keg of beer from Qeynos, a ball of twine from Shadeweaver, a bundle of weapons from Firiona, an armor assortment from Thurgadin, and a case of meat from the Bazaar.  That should give me quite a stock of items to sell to travelers out here.");
		e.other:SummonCursorItem(17177); -- Item: Empty Supplies Crate
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 15978}, 0)) then
		e.self:Say("Fantastic! You got me everything I need to set up shop.  Here is some money for your troubles.  I hoped you learned something as well. I am sorry I have nothing more to give you except this advice, if you combine a clockwork carapace, a metal rod, gnomish bolts, firewater and grease in a toolbox you should get something nice!");
		e.other:QuestReward(e.self,0,0,0,60,0,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
