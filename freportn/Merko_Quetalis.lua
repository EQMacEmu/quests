function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, good citizen!  You have entered the Hall of Truth.  What is it you seek?  Many citizens come to request aid in dealing with the local rogues or the oppression of our sworn enemies, the Freeport Militia.  A few valiant ones have been [summoned to the Hall of Truth].");
	elseif(e.message:findi("summoned.* hall.* truth")) then
		if(e.other:GetFactionValue(e.self) >= 100) then	
			e.self:Say("You have been summoned? You do not have the look of nobility. You must be a [squire]. There are many squires who have been summoned to our Hall. Not all pass the [Test of Truth]."); 
		elseif(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do.");
		else
			e.self:Say("Leave my presence at once. Your ways of life are not acceptable to one who follows the Truthbringer.");
		end
	elseif(e.message:findi("squire")) then
		if(e.other:GetFactionValue(e.self) >= 100) then	
			e.self:Say("Then I welcome you, Squire. Being a squire is the first step to becoming a true knight of the Hall of Truth. Remember always to protect and serve the meek. I have a [small task] which suits a squire perfectly.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do.");
		else
			e.self:Say("Leave my presence at once. Your ways of life are not acceptable to one who follows the Truthbringer.");
		end
	elseif(e.message:findi("small task")) then
		if(e.other:GetFactionValue(e.self) >= 100) then	
			e.self:Say("Venture to the Commonlands and seek out our noble friend Altunic Jartin. He lives and works out of his home. Hand him this note.");
			e.other:SummonCursorItem(18896); -- Give player "A Note (Note To Altunic)".
		elseif(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do.");
		else
			e.self:Say("Leave my presence at once. Your ways of life are not acceptable to one who follows the Truthbringer.");
		end
	elseif(e.message:findi("token of generosity")) then
		if(e.other:GetFactionValue(e.self) >= 100) then	
			e.self:Say("Go to the deserts of North Ro. Seek out the desert tarantulas. Stand and face this dreaded creature. If you are lucky, you will find a venom sac. This is what I require. When you return, hand it to me.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do.");
		else
			e.self:Say("Leave my presence at once. Your ways of life are not acceptable to one who follows the Truthbringer.");
		end
	elseif(e.message:findi("test of truth")) then
		if(e.other:GetFactionValue(e.self) >= 100) then	
			e.self:Say("Only when a squire is ready, may he tempt his fate. All he need do is hand the tokens of bravery and generosity to me. If the squire survives his ordeal, then he or she shall enter the order of the Knights of Truth. The squire will be given the Testimony of Truth and become a respected knight.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do.");
		else
			e.self:Say("Leave my presence at once. Your ways of life are not acceptable to one who follows the Truthbringer.");
		end
	elseif(e.message:findi("willia")) then
		e.self:Say("She is my niece. Lucan ordered her to kill my wife.. She did. She now belongs to the Freeport Militia. As part of the militia, she must die!! Let no militia member stand in the way of nobility.");
	elseif(e.message:findi("heal")) then
		e.self:Say("If you require the binding of wounds you should speak with Palious Jartan in the temple. He will be glad to help you.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 14018})) then -- A spider venom sac
		e.self:Say("You have earned the token of bravery. Now you must ask yourself if you are ready to face true fear. You will have but one chance. If you feel you are powerful enough to easily slay that desert tarantula, then hand me both tokens earned and you shall face the Test of Truth.");
		e.other:Faction(e.self,281,10); -- Knights of Truth
		e.other:Faction(e.self,271,-1); -- Dismal Rage
		e.other:Faction(e.self,330,-1); -- Freeport Militia
		e.other:Faction(e.self,362,2); -- Priest of Marr
		e.other:Faction(e.self,311,1); -- Steel Warriors
		e.other:QuestReward(e.self,0,0,0,0,12144,100); -- Token of Bravery
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12144, item2 = 13865})) then -- Token of Bravery  / Token of Generosity
		e.self:Say("Go to the open sewer across the way. Inside you shall find your opponent. Victory shall bring your final token. Return it to me. Remember our ways and remember our foes. Send them to their judgement in the afterlife. Be swift with your thoughts. May Marr be with you.");
		eq.unique_spawn(8110,0,0,-257,132,-17,120); -- spawns Guard Willia
		e.other:Faction(e.self,281,10); -- Knights of Truth
		e.other:Faction(e.self,271,-1); -- Dismal Rage
		e.other:Faction(e.self,330,-1); -- Freeport Militia
		e.other:Faction(e.self,362,2); -- Priest of Marr
		e.other:Faction(e.self,311,1); -- Steel Warriors
		e.other:QuestReward(e.self,0,0,0,0,0,100);
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13866})) then -- Token of Truth
		e.self:Say("You have performed well. You have shown your allegiance to truth and cast aside the Freeport Militia. The militia will surely despise you from now on. This is how they treat the Knights of Truth. Beware. The followers of Marr stand alone in this city.");
		e.other:Faction(e.self,281,100); -- Knights of Truth
		e.other:Faction(e.self,271,-15); -- Dismal Rage
		e.other:Faction(e.self,330,-15); -- Freeport Militia
		e.other:Faction(e.self,362,20); -- Priest of Marr
		e.other:Faction(e.self,311,10); -- Steel Warriors
		e.other:QuestReward(e.self,0,0,math.random(10),0,18828,100); -- Testimony
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
