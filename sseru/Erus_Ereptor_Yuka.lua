function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("So you think you think you can help the Eye? I doubt it. You see we have plenty of men rooted in all the jobs that need to be done. So any service you have to offer would be of little use to us. I know every move that the Loyalists make. So please move along maybe someone has some other menial task for you. If you don't mind I need to get back to these [diagrams].");
	elseif(e.message:findi("diagram")) then
		e.self:Say("Diagrams of the Loyalist City. They are nearly completed except for a few areas. We have our best operatives trying to map those areas. they always remain hidden, but due to the vampyres living in the city they are always detected. They have a sense for blood, they can smell it in the air. So far our operatives have been luck by [escaping] over the wall of Katta.");
	elseif(e.message:findi("escaping")) then
		e.self:Say("Yes but there is a rogue that is still unaccounted for. He had an escape route that was planned through the Twilight Sea. He was to swim to safety in the Twilight Sea. I am sure he is fine but if you want something to do so badly, take this letter to Elisah Astari and tell him you are taking over in his search for Tergus Raslin.");
		e.other:SummonCursorItem(29868);
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29869}, 0)) then -- Shattered Praetor Blade
		e.self:Say("He was caught? I cannot believe one of my own men would fail me. If he was caught he deserved whatever they gave to him. Still though tainting him with vampyrism is something that could have seriously affected this town. He could have done much damage before his time for the question arose. You have done a great justice to Seru by purging us of the evil.");
		e.other:Faction(e.self,1485,10); -- Eye of Seru
		e.other:Faction(e.self,1484,-1); -- Hand of Seru
		e.other:Faction(e.self,1486,-1); -- Heart of Seru
		e.other:Faction(e.self,1483,1); -- Seru
		e.other:Faction(e.self,1542,-1); -- Haven Smugglers
		e.other:Faction(e.self,1503,-1); -- Validus Custodus
		e.other:Faction(e.self,1504,-2); -- Magus Conlegium
		e.other:QuestReward(e.self,0,0,0,0,29870,25000); -- Praetor's Blade of Debility
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
