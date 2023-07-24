function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. " .. e.other:GetCleanName() .. "! I am the master of the paladins among the Peacekeepers. Have you joined the harmony of the Peacekeepers or are you merely a visitor?");
	elseif(e.message:findi("joined")) then
		e.self:Say("Then go and speak with the other Peacekeepers. Do your part to promote the words of Quellious.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18726})) then -- Tattered Note
		e.self:Say("Welcome to the Temple of Divine Light. I am Master Bulrious. Here. we study and spread the will of Quellious. Here is your guild tunic. Go find Jras Solsier. he will get you started with your first lesson.");
		e.other:Faction(e.self,298,100,0); -- Peace Keepers
		e.other:Faction(e.self,266,25,0); -- High Council of Erudin
		e.other:Faction(e.self,265,-25,0); -- Heretics
		e.other:QuestReward(e.self,0,0,0,0,13546,20); -- Faded Silver Tunic*
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98062 -- Depnar_Bulrious
