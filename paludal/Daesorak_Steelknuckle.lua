-- Mining Operation

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Lo there stranger what ya doin in ere? You know how dangerous it can be down ere! I be lucky I got some of da finest miners werkin for me. I sure do hope we get those supplies soon.");
	elseif(e.message:findi("supplies")) then
		e.self:Say("Well da usual supplies dat ya need to keep a mining operation like this one goin smoothly. Mostly newer tools since ours be all rusted an worn from our hard work. If ye are interested in helpin us out ye could go talk to Coglirax in da Shadowhaven. We call em Ol Coggo, Im sure he would be able to give ye some goods to deliver ere.");
	elseif(e.message:findi("retrieve the mining pick")) then
		e.self:Say("Excellent, " .. e.other:GetCleanName() .. ". Please go see Terasol in Katta to retrieve my mining supplies. Bring him this note to show that you were sent by me. And dunt stray off track with these supplies, we needs em bad!");
		e.other:SummonCursorItem(4754); -- Item: A Jarbled Note
	elseif(e.message:findi("return a letter")) then
		e.self:Say("I thank you, " .. e.other:GetCleanName() .. ". Without your help I doubt we would have been able to finish this project on time! Please take this to my wife Aliane back home. You can surely count on me telling the Patriarch of how much help you have been when I return home. I wish you good journeys as for me its back to work I go!");
		e.other:SummonCursorItem(4756); -- Item: Letter to Aliane
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4747}, 0)) then
		e.self:Say("Ah these must be from ol Coggo! Ye see I had sent out a few men to gather some new picks an such for the mining operation ere but they haven't returned yet. I'm really in need of some picks that are being held in Katta by a friend of mine. Will you [retrieve the mining picks] for me?");
		e.other:Faction(e.self,1512,5); -- house of stout
		e.other:Faction(e.self,1508,1); -- traders of the haven
		e.other:QuestReward(e.self,0,0,0,0,0,5000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4755}, 0)) then
		e.self:Say("Ye did it, " .. e.other:GetCleanName() .. "! Ye hear dat, boys? Dis outlander ere jess delivered us our new minin picks! You have no idea how much these supplies will aid our operation! As a final task would you be able to [return a letter] to me wife back home?");
		e.other:Faction(e.self,1512,5); -- house of stout
		e.other:Faction(e.self,1508,1); -- traders of the haven
		e.other:QuestReward(e.self,0,0,0,0,0,5000);
		yippee(e);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function yippee(e)
	eq.get_entity_list():GetMobByNpcTypeID(156064):Say("Hurray!");
	eq.get_entity_list():GetMobByNpcTypeID(156061):Say("Hurray!");
	eq.get_entity_list():GetMobByNpcTypeID(156065):Say("Hurray!");
	eq.get_entity_list():GetMobByNpcTypeID(156066):Say("Hurray!");
	eq.get_entity_list():GetMobByNpcTypeID(156064):CastToMob():DoAnim(8);
	eq.get_entity_list():GetMobByNpcTypeID(156061):CastToMob():DoAnim(8);
	eq.get_entity_list():GetMobByNpcTypeID(156065):CastToMob():DoAnim(8);
	eq.get_entity_list():GetMobByNpcTypeID(156066):CastToMob():DoAnim(8);
end
