---- Changes by Kagehi.
---- Shar_Vahl_Cit tracks the steps you take to gain your initiate cloak.
---- Since we don't want to hand people things that they can't normally get, or
---- stuff they haven't earned, we need to track which stage in the quest they
---- are at. 1 = Citizen Application. 2 = Cert. of Taxability, 3 = Stamped Cert.,
---- 4 = Note to King Raja, 5 Note 'from' the king, 6 = Notarized Application
---- and 7 = Initiate's Cloak.
function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(e.message:findi("Hail")) then
		e.self:Say("Well met. Friend.  May I be of assistance?");
	elseif(e.message:findi("certificate") and tonumber(qglobals.Shar_Vahl_Cit)  == 3) then -- Fixme for lost stamped certificate.
		e.self:Say("I suppose I can issue another one. Just give me a second.");
		e.other:SummonCursorItem(2875); -- Item: Stamped Certificate of Taxability
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Certificate of Taxability OR Application for Citizenship
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2874})) then
		e.self:Emote("places his seal on the certificate before returning it to you.");
		e.self:Say("Ahh, a new taxpayer, wonderful! You must always remember that it is a distinct privilege to contribute to the upkeep of our noble society and not merely a duty or a burden. I look forward to collecting your honorable taxes in the future. May the spirits prosper you, " .. e.other:GetCleanName() .. ".");
		eq.set_global("Shar_Vahl_Cit","3",5,"F");
		-- Confirmed Live no-experience
		e.other:QuestReward(e.self,0,0,0,0,2875); -- Stamped Certificate of Taxability
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
