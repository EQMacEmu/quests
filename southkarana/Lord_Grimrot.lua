function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -300) then
			e.self:Say("Welcome to my field of decay. Won't you be so kind as to attack me? I have need of more bodies to join my diseased legion. Try it, maybe you shall win and gain my trusty [Pestilence].");
		else
			e.self:Say("I believe your bones shall join those of my undead and diseased army.");		
		end
	elseif(e.message:findi("pestilence")) then
		if(e.other:GetFactionValue(e.self) >= -300) then
			e.self:Say("My beloved scythe. Upon my death, my soul shall live within her.  Such is the pact.");
		else
			e.self:Say("I believe your bones shall join those of my undead and diseased army.");		
		end
	elseif(e.message:findi("Arlena")) then
		if(e.other:GetFactionValue(e.self) >= -300) then
			e.self:Say("My beloved Arlena is my most perfect creation. A bit of flesh here, a bit of bone there and I created her. She left my arms while I was away. Find her and stop her. Return her bones to me so that I may restore her. She has no doubt returned to where I first met.. most.. of her, [Mistmoore Castle]!!");
		else
			e.self:Say("I believe your bones shall join those of my undead and diseased army.");		
		end
	elseif(e.message:findi("Mistmoore Castle")) then
		if(e.other:GetFactionValue(e.self) >= -300) then
			e.self:Say("It stands on the continent of Faydwer. That is all you need to know.");
		else
			e.self:Say("I believe your bones shall join those of my undead and diseased army.");		
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12137}, 0)) then
		e.self:Say("The head for my commander. Let us see. I have a body ready for it. There. Hahahaha!! As for your fine work, take this. Also, I believe you can help me find my beloved [Arlena].");
		e.other:Faction(e.self,221,15); -- Faction: Bloodsabers
		e.other:Faction(e.self,262,-2); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,296,1); -- Faction: Opal Dark Briar
		e.other:Faction(e.self,341,-3); -- Faction: Priests of Life
		e.other:Faction(e.self,230,1); -- Faction: Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,0,0);
		e.other:QuestReward(e.self,{gold = math.random(1,10), itemid = eq.ChooseRandom(2137,2138,2139,2140,2141,2142,2143,2144,2145,2146,2147,2148), exp = 1000})
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

