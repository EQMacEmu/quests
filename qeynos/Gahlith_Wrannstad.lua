function event_trade(e)

	local item_lib =require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18718})) then -- Tattered Note
		e.self:Say("Greetings, I am Gahlith, Master of the Wizard's Order of the Hall of Sorcery. Here, we have devoted our lives and souls to the study of the arcane. My apprentice Kazlo Naedra shall tutor you and teach you the fundamentals of sorcery.");
		e.other:Faction(e.self,342,100,0); -- Order of Three
		e.other:Faction(e.self,221,-25,0); -- Bloodsabers
		e.other:Faction(e.self,262,15,0); -- Guards of Qeynos
		e.other:Faction(e.self,296,-15,0); -- Opal Dark Briar
		e.other:QuestReward(e.self,0,0,0,0,13508,20); -- Blue Training Robe*
	end
	item_lib.return_items(e.self, e.other, e.trade)
	
end
