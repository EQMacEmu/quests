function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings.. I am Mespha Tevalian, Master Enchantress of the Hall of Sorcery and the Order of Three. Here, we all study the three circles of magic, and lend our services to citizens of Qeynos. Rumors of an underground group calling themselves the Bloodsabers have recently been spreading throughout the city. It is our duty to help local guards protect Qeynos' citizens from this new evil.");
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18720})) then -- Tattered Note
		e.self:Say("Greetings " .. e.other:GetCleanName() .. ". Welcome to the Hall of Sorcery. You have much to learn. Wear this tunic and represent us well. See my apprentice, Unsar Koldhagon, he will get you started and help you with your studies.");
		e.other:Faction(e.self,342,100,0); -- Order of Three
		e.other:Faction(e.self,221,-25,0); -- Bloodsabers
		e.other:Faction(e.self,262,15,0); -- Guards of Qeynos
		e.other:Faction(e.self,296,-15,0); -- Opal Dark Briar
		e.other:QuestReward(e.self,0,0,0,0,13542,20); -- Faded Blue Robe*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
