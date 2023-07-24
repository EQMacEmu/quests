-- Saurek Scales
local count = 0;
function event_spawn(e)
	eq.set_timer("tarief",180000);
end

function event_timer(e)
	count = count + 1;
	if(count == 1) then
		e.self:Say("It is important for us to hunt well and provide food to our brethren. Use stealth to surprise your opponent and attack them from behind. This is a vital tactic for the Taruun.");
	end
	if(count == 2) then
		e.self:Say("Taking a spit with you into battle allows you to cook the meat you find in the field. This will help sustain your companions as well as yourself.");
	end
	if(count == 3) then
		e.self:Say("Remember to try to maneuver behind your opponent, attack with wisdom and cunning.");
	end
	if(count == 4) then
		e.self:Say("We must clear out the hoppers that attack us. These beasts can become very dangerous if they are left to breed. We have already lost many of our brethren to the larger ones.");
	end
	if(count == 5) then
		e.self:Say("It is important for us to stay light and nimble on our feet. Do not overburden yourself with equipment you have no need for.");
	end
	if(count == 6) then
		e.self:Say("Avoid heavier armor, let the Khala Dun take the brunt of the blows while you maneuver behind the enemy. If they focus their attacks on you, it is wise to retreat until your companions are able to distract them from you.");
	end
	if(count == 7) then
		e.self:Say("Remember your honor. Do not lay claim to a kill that does not belong to you. Both victory and spoils belong to the one who has initiated the battle.");
	end
	if(count == 8) then
		e.self:Say("Pay close attention to your surroundings. When you are in danger, it is best to know the quickest way back to safety.");
		count = 0;
		eq.set_timer("tarief",180000);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met, have you [come to aid] us in hunting the hoppers of the thicket?");
	elseif(e.message:findi("come to aid")) then
		e.self:Say("If you are preparing to hunt, then there are a few things you should know. Some of the hoppers have unique abilities. Knowledge of these abilities can mean the difference between life and death. I will tell you a little bit about them if you [wish to listen].");
	elseif(e.message:findi("wish to listen")) then
		e.self:Say("A wise choice, it is good to learn all that you can of the prey before initiating the hunt. Such a tactic is vital when you set out for larger game. Learn of your prey's strengths and weaknesses and you shall have the upper hand. Saureks may all seem similar to one another at first glance, but this is not the case. Such a mistake has left many Taruun dead. I have learned that the darkclaw saureks have venom dripping from their claws. There are a few other [unique qualities] to the saureks as well.");
	elseif(e.message:findi("unique qualities")) then
		e.self:Say("Each of the saureks have their own unique set of scales. I am able to tell which saurek my trainees have managed to hunt successfully by the scale they return to me. Feel free to join in our lesson or the hunt. I hope that you will benefit from my advice. Hunt well, " .. e.other:GetCleanName() .. ".");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30861, item2 = 30861, item3 = 30861, item4 = 30861})) then --Saurek Hopper Scales
		e.self:Say("What have we here? Aha! Look here everyone. " .. e.other:GetCleanName() .. " has returned victorious! Well done. You are entitled to the reward for slaying the Saurek Hoppers. I hope all my trainees turn out as skilled as you. Perhaps you should consider hunting more difficult prey from now on.' Captain Tarief hands " .. e.other:GetCleanName() .. " a pair of masterfully tailored hunting boots.");
		e.other:Faction(e.self,1513,1); --Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,30870,2500); --Hunting Leather Boots
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30862, item2 = 30862, item3 = 30862, item4 = 30862})) then --Saurek Darkclaw Scales
		e.self:Say("So the hunter returns victorious. Well done! You have earned yourself a hunting bracer to protect you from the claws of the hoppers. I am sure many of your companions will revel in the feast you are able to provide them with the meat you have collected.");
		e.other:Faction(e.self,1513,1); --Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,30867,2500); --Hunting Leather Bracer
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30863, item2 = 30863, item3 = 30863, item4 = 30863})) then --Saurek Shredder Scales
		e.self:Emote("blinks in astonishment. 'Perhaps the true shredder was you this time around " .. e.other:GetCleanName() .. "' He chuckles, 'Well done, you have earned the reward.' Tarief hands " .. e.other:GetCleanName() .. " a pair of masterfully tailored hunting sleeves. 'Be sure to have your battle wounds tended to. I am sure you have many scars to show from hunting those shredders.");
		e.other:Faction(e.self,1513,1); --Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,30866,2500); --Hunting Leather Sleeves
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
