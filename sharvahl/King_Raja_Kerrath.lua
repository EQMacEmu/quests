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
		e.self:Say("Greetings citizen... you are very brave to approach me in this manner.  That sort of bravery warrants my respect.  How may I help you?");
	elseif(e.message:findi("note") and tonumber(qglobals.Shar_Vahl_Cit) == 5) then ----Non-canon fixme if you lose note.
		e.self:Say("I guess I can write you a new note. Try not to lose it this time.");
		e.other:SummonCursorItem(18304); -- Item: Note from King Raja
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18299})) then
		e.self:Say("Your humility and willingness to serve shall not be wasted. There is much to be done, " .. e.other:GetCleanName() .. ", and our people thank you in advance for your selfless service.");
		eq.set_global("Shar_Vahl_Cit","5",5,"F");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,18304,300);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
