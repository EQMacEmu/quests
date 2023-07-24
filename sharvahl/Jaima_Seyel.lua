function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello Citizen. I am in need of an apprentice.  If you feel that you are capable of assisting me, please show me your Dar Khura Apprentice Cloak and I'll explain the task to you.");
	elseif(e.message:findi("challenge")) then
		e.self:Say("You will need to walk into the darkness of the Hollowshade Moor to face this enemy. Unlike the wolves that we have always been able to commune with, the wolves of the moor are oblivious to our attempts at communication. We have studied them for some time and our determination is that they are too corrupt for us to deal with. Their aggressive behavior and sheer numbers have forced us to research ways to kill them as quickly as possible. Fill that bag with the paws from one of those wolves. Once that task is complete, please return to me with the evidence of your encounter.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5544})) then
		e.self:Emote("smiles and says 'Very good. I am glad to have you here. I hope your studies have proven to be worthwhile thus far. Our sect is challenging, but we are vital to the survival of our people. Our research and ability to commune with the spirit world has allowed our people to overcome the challenges of the wilderness here. Here, take this bag. It is time for you to face your first real challenge.'");
		e.other:QuestReward(e.self,{items = {17116,5544}}); -- Item: Brown Leather Bag
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 6264})) then
		e.self:Say("I see that you've met those beasts and made it back in one piece. I'm not sure if you noticed their ability to move and communicate as a pack, but it is both amazing and horrific to witness in action. They have proven to be enough of a problem to warrant special research. We have been able to build a weapon type that produces severe wounds on the wolves.");
		e.self:Say("The constant threat of attack by the wolves has made it the responsibility of each citizen to carry one of those weapons. This strainer will be necessary in the construction of such a weapon. Take this note and seek out Amal Iuziq. He is a researcher that resides in the Library of Spiritual and Natural Studies. Give him this note and he will guide you further.")
		e.other:QuestReward(e.self,{items = {6265,6140}}); -- Item: Note to Amat
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
