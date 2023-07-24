function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Rodcet Nife welcomes you into our noble camp.  I am the keeper of the [Vambraces of Ro].");
	elseif(e.message:findi("vambraces of ro")) then
		if(e.other:GetFactionValue(e.self) >= 50) then
			e.self:Say("The mold will be offered to you when you have performed a task for the Temple of Life.  The oceans near our home are host to a plague..  the plague sharks!!  They have been infected with a deadly malady which has been turning up in the Qeynos Hills.  Kill the sharks and bring me two of their rotten shark portions as proof.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("In the name of Rodcet Nife, I must ask you to venture to Qeynos and find the Temple of Life.  There you shall serve until High Priestess Jhanda responds when you ask her, am [I an honored member]?");
		else
			e.self:Say("Foolish person!! The word is out amongst the followers of the Prime Healer not to trust you.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I said two portions of rotten shark meat.";	

	if(e.other:GetFactionValue(e.self) >= 50 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12310, item2 = 12310},1,text)) then
		e.self:Say("You now own a mold for the Vambraces of Ro.  Go and ask Thomas of [Lord Searfire] for the final component.");
		e.other:Faction(e.self,341,20); -- Priests of Life
		e.other:Faction(e.self,280,6); --Knights of Thunder
		e.other:Faction(e.self,262,10); -- Guards of Qeynos
		e.other:Faction(e.self,221,-5); -- Bloodsabers
		e.other:Faction(e.self,219,3); -- Antonius Bayle
		e.other:QuestReward(e.self,0,0,0,0,12300,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
	
--END of FILE Zone:rathemtn  ID:50114 -- Marianna
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
