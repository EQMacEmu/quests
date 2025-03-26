function event_say(e)
	if(eq.is_the_ruins_of_kunark_enabled()) then
		if(e.message:findi("hail")) then
			e.self:Say("Um, you. Hi.. You Shaman of War now, right? You gotta learns war and war spells. We fights all and makes the Warlord likes us. You [gonna help] or me gonna feed you fat stoopid boddie to doggies.");
		elseif(e.message:findi("help")) then
			if(e.other:GetFactionValue(e.self) >= 50) then 
				e.self:Say("Good. Warlord need many boddie.. I means Shamans of War.. to kill and gets killed.. no, ummm.. kill and smoosh for Him and makes Him happy. You goes show me you can smoosh tings good. Gets me four froglok tadpole fleshies for me to munchings on and me be happy.. um, He, the Warlord be so berry happy. Helping our tuff friends de Greenbloods but be watching for dem scummy Crakneks, dumb ogres dey is. No good, no our friends. Go now. Me.. er.. he waiting and hungry.");
			elseif(e.other:GetFactionValue(e.self) >= 0) then	
				e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
			else
				e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
			end
		elseif(e.message:findi("bedder shaman")) then
			if(e.other:GetFactionValue(e.self) >= 50) then 
				e.self:Say("Yoo want to be bedda shaman? Them lizards in de Feerrott tink de bedda den us and bodder us wit der majiks like fleas on a dog. Kill dem and bring me, um, one of dem bags dey wear around dem necks and, um, three of dem dolls dey hold.");
			elseif(e.other:GetFactionValue(e.self) >= 0) then	
				e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
			else
				e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
			end
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Um, you. Hi.. You Shaman of War now, right? You gotta learns war and war spells. We fights all and makes the Warlord likes us."); --made up text
		end
	end
end
function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 50 and eq.is_the_ruins_of_kunark_enabled() and item_lib.check_turn_in(e.self, e.trade, {item1 = 13187, item2 = 13187, item3 = 13187, item4 = 13187})) then
		e.self:Say("Oh, me.. um.. Warlord BERRY happy. Berry like dese. Gimme. Uh, why is you still here? Take dis and gets more kills. You learning good, come sees me. I teaches you bout stuff. Make you [bedder shaman]. Go. He and me watching.");
		e.other:Faction(e.self,394, 5); -- Faction: Shamen of War
		e.other:QuestReward(e.self,0,0,0,0,15093,500);
	elseif(e.other:GetFactionValue(e.self) >= 50 and eq.is_the_ruins_of_kunark_enabled() and item_lib.check_turn_in(e.self, e.trade, {item1 = 14199, item2 = 13367, item3 = 13367, item4 = 13367})) then
		e.self:Say("Dis good stuff! Me and Warlord happy! Wear dis symbol and he make yoo strong with majik!");
		e.other:Faction(e.self,394, 5); -- Faction: Shamen of War
		e.other:QuestReward(e.self,0,0,0,0,1444,500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18788})) then --Tattered Note
		e.self:Say("Take, take.. You now Shaman of War.. Zulort make you majik, too.");
		e.other:Faction(e.self,394,100);	-- Shaman of War
		e.other:QuestReward(e.self,0,0,0,0,13526,20);	--Dirty Patched Fur Tunic*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quests by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
