--Planar Armor Exchange
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("tilts his head back, a sneer crossing his features in unmasked disgust toward " .. e.other:GetCleanName() .. ". 'What exactly are you doing here, " .. e.other:GetCleanName() .. "? Don't you know that this is the district of Kartis -- the center of the shaded voice of mortal power in the known universe? Perhaps you stumbled into the darkness by accident -- but then, why would not your deity of pure light, justice, valor, and honor deter you from this place? Perhaps they have abandoned you, or perhaps you have been subject to the true face value of their illusion.'");
		e.self:Emote("ponders a moment, then continues. 'Yes, " .. e.other:GetCleanName() .. ", your god does not exist -- not as you think of them, for none of them care of you either way. Serve them with your life and go to the same place that all mortals go when they perish, despite their dogmatic affiliations. Indeed, I stand here on my own accord -- my faith is in myself and in my power and thus is how I fuel the shadow.  Perhaps this is a life more suited for you -- for it is a shame to see all that conviction and head-strong will go to waste, now isn't it?'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local count = item_lib.count_handed_item(e.self, e.trade, {1246, 1247, 1248, 1249, 1250, 1251, 1252}); --Insidious Armor, the comments on Alla's about this not being taken are in error, I believe.  It's Fine Insidious that's not taken.
	if(count > 0) then
		repeat
			e.self:Say("Thank you, " .. e.other:GetCleanName() .. "."); --Text made up
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),300000); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
			count = count - 1;
		until count == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
