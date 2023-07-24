function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello, me friend! I'm the resident healer o' Halas. Please inform me when ye've a need fer me talents to [bind wounds], [cure disease] or [cure poison]. Might I add, if ye're a young shaman o' Halas, ye can also [assist in gathering fungus].");
	elseif(e.message:findi("assist in gathering fungus")) then
		if(e.other:GetFaction(e.self) < 5) then -- requires amiably
			e.self:Say("As the wooly spiderlings get ready to molt, they'll carry wooly fungus. Oftentimes, one can find wooly fungus growing on their bellies. I use this in me healing practices. I'll reward ye if ye can fill this jar full o' the valuable fungus. Don't forget to combine them before ye return it to me. And have yerself some rations handy, or ye may find yerself snacking on this tasteless food source.");
			e.other:SummonCursorItem(17946); -- Item: Empty Jar
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("Ye're no criminal to the Shamans o' Justice, but ye've yet to prrove yer devotion to justice.");		
		else
			e.self:Say("The scales o' the Shamans o' Justice dinnae tip in yer favor. Ye'd best flee ye still have the chance.");		
		end
	elseif(e.message:findi("cure disease") or e.message:findi("bind wounds") or e.message:findi("cure poison")) then
		if(e.other:GetFaction(e.self) < 6) then -- requires indifferently
			if(e.message:findi("cure disease")) then
				e.self:Say("Two small quantities o' wooly fungus are needed before we can cure yer malady.");
			elseif(e.message:findi("bind wounds")) then 
				e.self:Say("Before I bind yer wounds, ye must pay tribute to the Tribunal in the amount of ten gold coins.");
			elseif(e.message:findi("cure poison")) then
				e.self:Say("I'll be needing mammoth steaks to feed the unfortunate.  Then we'll drain the poison from yer veins.");
			end
		else			
			e.self:Say("The scales o' the Shamans o' Justice dinnae tip in yer favor. Ye'd best flee ye still have the chance.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13966})) then 						-- Jar of Fungus turn in for random spell
		e.self:Say("Aye! Ye've filled the jar. I'll see to it that Holana locks this away. Tis difficult to obtain and we can only spare the talents of our young shamans. Allow me to give ye a reward. Thank ye kindly fer yer service.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,327, 10);	-- Shamen of Justice
		e.other:Faction(e.self,328, 1);	-- Merchants of Halas
		e.other:Faction(e.self,223, -1);	-- Circle Of Unseen Hands
		e.other:Faction(e.self,229,-1);		-- Coalition of Tradefolk
		e.other:Faction(e.self,244,-2);   -- Ebon Mask
		e.other:QuestReward(e.self,0,0,math.random(10),0,eq.ChooseRandom(15203, 15270, 15271, 15275, 15036, 15075, 15224, 15269),3000); -- Spells : Cure Poison, Drowsy, Fleeting Fury, Frost Rift, Gate, Sicken, Endure Fire, Feet Like Cat
	elseif(item_lib.check_turn_in(e.self, e.trade, {gold = 10})) then
		e.self:Say("The scales have been balanced and the Tribunal has spoken. Yer body shall be saved.");
		e.self:CastSpell(17,e.other:GetID()); -- Spell: Light Healing
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13445})) then
		e.self:CastSpell(203,e.other:GetID()); -- Spell: Cure Poison
		e.self:Say("The scales have been balanced and the Tribunal has spoken. Yer body shall be saved.");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13967, item2 = 13967})) then
		e.self:CastSpell(213,e.other:GetID()); -- Spell: Cure Disease
		e.self:Say("The scales have been balanced and the Tribunal has spoken. Yer body shall be saved.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
