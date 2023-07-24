function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ho there, who are you? Are you [reporting for duty] or just annoying me?");
	elseif(e.other:GetFaction(e.self) < 5 and e.message:findi("reporting for duty")) then
		e.self:Say("Outstanding, now tuck in that tunic. We are trying out some new Shadowscream armor from Barkhem, the smith in Shar Vahl, and some of his students. They will cut us a nice deal if we deliver some of the supplies, so go fill this up with shrieking substances for me. What are you staring at? Go!! And suck in that gut!");
		e.other:SummonCursorItem(17497); -- Sonic Receptacle
	elseif(e.message:findi("annoying")) then
		e.self:Say("Well isn't that clever, " .. e.other:GetCleanName() .. "?  I'll see that my superiors hear about your attitude.");
		e.other:Faction(e.self,1503,-1);  -- Validus Custodus
	elseif(e.message:findi("shrieking")) then
		e.self:Say("You can get them from sonic wolves.  Why are you still here?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29842}, 0)) then -- Full Sonic Receptacle
		e.self:Say("Well done, " .. e.other:GetCleanName() .. ", this should really help keep our costs down. Here, take these, and keep up the good work. Dismissed!");
		-- live faction verified
		e.other:Faction(e.self,1503,4);  -- +Validus Custodus
		e.other:Faction(e.self,1502,1);  -- +Katta Castellum Citizens
		e.other:Faction(e.self,1504,1);  -- +Magus Conlegium
		e.other:Faction(e.self,1505,-1); -- -Nathyn Illuminnious
		e.other:Faction(e.self,1506,-1); -- -Coterie of the Eternal Night
		e.other:Faction(e.self,1483,-1); -- -Seru
		e.other:Faction(e.self,1484,-2); -- -Hand of Seru
		e.other:Faction(e.self,1485,-1);  -- -Eye of Seru
		e.other:Faction(e.self,1541,-1); -- -Hand Legionnaries
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10664, 10668, 10663, 10665),50000); -- Combine Throwing Spear, Validus Custodus Flight Arrow, Combine Throwing Knife, Combine Shuriken
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
