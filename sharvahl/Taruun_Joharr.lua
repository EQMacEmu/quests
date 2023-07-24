--Rogue --3
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3466})) then
		e.self:Emote("takes the buckler and spins it in his hand for a moment. Eventually he says");
		e.self:Say("I suppose assumin' you were sent here by Harbin isn't too far from the reality of things. I'll try to think of a few things for you to do, but in the meantime, take these daggers and practice until you can use both of them. You need to get out of the habit of toting this shield around. If your enemy is gettin' close enough to hit you on it, you ain't doin' your job right anyway. I'll do what I can to train you from here, but I'm going to need to eat first. It's been a while since my last meal. Take this meal voucher to Cook Yalkiin. Once they fill the order bring it back and we'll start your lesson. Now scoot.");
		e.other:QuestReward(e.self,{items = {5559,5560,5561,}}); -- Item: Black Handled Dagger
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5563})) then
		e.self:Emote("takes the bag and takes a huge bite of the sandwich.");
		e.self:Say("This sandwich is almost worth the wait.");
		e.self:Emote("rubs the crumbs from his mouth");
		e.self:Say("hope that you've been practicin' with those daggers. Elder Ternq came by while you were away. He stated that I, well... you... need to go scout the caves around the thicket. Gather the skulls of any Shak Dratha that you may... um... run into while you scout. Once you've filled this backpack, return it to me and I'll fill out a report for Ternq.");
		e.other:Faction(e.self,1530,10); -- Faction: Taruun
		e.other:QuestReward(e.self,0,0,0,0,17607,1250);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5568})) then
		e.self:Say("Very good, " .. e.other:GetCleanName() .. "! Elder Ternq will be very pleased with the results of your patrol. Take this regional status report to him and see if he has anything else for you to do. Your skill as a hunter is really starting to show. You can keep the daggers that I gave you. Make good use of them. I'm sure that you're going to be too busy to come back this way for a bit. Take care.");
		e.other:Faction(e.self,1530,10); -- Faction: Taruun
		e.other:QuestReward(e.self,0,0,0,0,5564,1500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
