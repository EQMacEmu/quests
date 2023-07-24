function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetCleanName() .. ", it is good to see you. If you have come for the first stage of Khati Sha training please show me your acrylia slate.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2877})) then --Acrylia Slate of Shar Vahl
		e.self:Say("I have much for you to do " .. e.other:GetCleanName() .. ". There is great need for capable Khati Sha in this new land. It is important that you progress speedily. We need to outfit you with the equipment that defines our chosen path. Well start with your battleclaws... But be aware of the fact that it will take you some time before can use both sets in combat. Just keep them both with you while you learn.");
		e.self:Say("Take this stitching pack and combine two shade silks from the xakra worms. Combine two of the resulting threads to make a bandage. Take this pattern and sew together three of the bandages. With considerable practice this will produce the handwraps that will be a foundation for your first sacred weapon. When you have created them return to me the scrap material.");
		e.other:QuestReward(e.self,{items = {17237,2877,3663}}); --Khati Sha Handwrap Pattern, Stitching Pack, Acrylia Slate of Shar Vahl
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3665})) then --Shade Silk Scraps
		e.self:Say("Ahh, you have done well young one. Now it is time for you to create claws of your own, and those handwraps are the base. You will need a few things to complete them, however. Combine those handwraps in your stitching pack along with two sharp claws from the young rockhoppers in the pit around our city, as well as some forged fasteners.");
		e.self:Say("Im afraid I am unsure where you can find the fasteners, though you might ask Kagazz about them. You can find him over near the forges. Return and hand me both claws, and your cloak as proof of your deeds.");
		e.self:Say("Oh, and dont worry about destroying your handwraps. They are well made and though you may not be successful in making your claws, they will last. Now you best move along and get started, as we still have much to do!");
		e.other:QuestReward(e.self,0,0,0,0,0,300);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3668, item2 = 3669, item3 = 2878})) then --Primary Silk Khati Sha Recruit Claw, Secondary Silk Khati Sha Recruit Claw, Initiate's Cloak of Shar Vahl
		e.self:Say("Well, you're off to a slow start, but it is a start. You will do well to accomplish your tasks in a more timely fashion. You have chosen a path full of trials, . I say again, time is of the essence. Take my seal to Mahron Sood and prepare yourself for the upcoming challenges.");
		e.other:QuestReward(e.self,{items = {3673,3674,3670,3675},exp = 500}); --Seal of Animist Poren, Primary Khati Sha Recruit Claw, Secondary Khati Sha Recruit Claw , Cloak of the Khati Sha Recruit
		e.self:Shout("Friends, I have news to share! It has taken longer than it should, but at last has completed our initiatory tasks and will now be given the priveleges reserved for the Khati Sha recruits!. Soon we hope to have this citizen ready to aid in the exploring of this new land. Please give support in whatever ways you can and trouble this recruit as little as possible, for seems to be easily distracted.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
