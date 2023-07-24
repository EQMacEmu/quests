-- Bloody Shak Dratha Hearts
local count = 0;
function event_spawn(e)
	eq.set_timer("koldar",150000);
end

function event_timer(e)
	count = count + 1;
	if(count == 1) then
		e.self:Say("There are many things you can do for Shar Vahl. Do not sit on your arse expecting our city to progress without your aid. It is your duty and your honor to defend our king.");
	end
	if(count == 2) then
		e.self:Say("We cannot afford to let those vile creatures take our city.");
	end
	if(count == 3) then
		e.self:Say("I want every one of you to bring at least four of their bloody hearts to me every day.");
	end
	if(count == 4) then
		e.self:Say("We have a responsibility to protect this city. We cannot afford to wait for them to understand that we are not their enemy.");
	end
	if(count == 5) then
		e.self:Say("If you see someone in battle, you must ask them before assisting. Do not dishonor them by taking their right to die in a fair and honorable battle.");
	end
	if(count == 6) then
		e.self:Say("You there! Is that rust I see on your spear? You must find a blacksmith to repair it immediately.");
	end
	if(count == 7) then
		e.self:Say("Remember to protect your hunting groups. It is our duty as Khala Dun to do so. Anger your enemy, use taunting tactics to keep them distracted.");
	end
	if(count == 8) then
		e.self:Say("If you are wounded, seek out a Dar Khura. It is better to allow them to aid you than to wait for your wounds to heal. There is no shame in seeking assistance in this, for we must be sure to return to the battle as quickly as possible. Remember, we have a city to defend.");
	end
	if(count == 9) then
		e.self:Say("Watch your spear there! Your weapons are not toys. Be careful where you point them.");
		count = 0;
		eq.set_timer("koldar",150000);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Stand back hunter! Not all of my men are properly trained in the use of their spears. You may find yourself losing an eye if you get too close. Now then, I assume you have [come to help.] Is that correct?");
	elseif(e.message:findi("come to help")) then
		e.self:Say("Then why are you standing around! Can't you see the invading forces of the Shak Dratha approach our town? Destroy them and bring me four of their bloody hearts as proof of your deed. Snap to it!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30616, item2 = 30616, item3 = 30616, item4 = 30616})) then
		e.self:Say("Blasted! Took you long enough. Look! They've already brought in more troops. We have a city to protect here. Now patch yourself up and get back to it.' Koldar hands " .. e.other:GetCleanName() .. " a handful of bandages.");
		e.other:QuestReward(e.self,{items = {13009,13009,13009,13009,13009,13009},exp = 2000}); -- Item: Bandages
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
