-- Renaldok_Masric.pl
-- Coterie Mask of the Dead

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("Greetings mortal. The aura of death that surrounds you is the only reason you are not already a feast for my minions. Have you come to me as a sacrifice or are you offering your [services] to the Coterie of the Eternal Night?");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("services")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("If you are powerful enough to be of use to me you will journey to the Twilight regions on the south side of Luclin and fill this wineskin with the blood of Akheva. Failure is final death, either at the hands of the Akheva or the hands of the Coterie.");
			e.other:QuestReward(e.self,0,0,0,0,17096); -- Empty Blood Skin
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("sacrifice")) then
		e.self:Say("Your choice has been made. We shall feast on your death scented blood.");
		eq.attack(e.other:GetName());
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10799}, 0)) then -- Skin of Akheva Blood
		e.self:Say("Well done, for a mortal you have served us well");
		e.other:Faction(e.self,1506,20); --Faction: Coterie of Eternal Night
		e.other:Faction(e.self,1503,-2); --Faction: Validus Custodus
		e.other:Faction(e.self,1505,-2); --Faction: Nathyn Illuminous
		e.other:Faction(e.self,1507,2); --Faction: Valadov Zevfeer
		e.other:QuestReward(e.self,0,0,0,0,7778,5000); -- Coterie Mask of the Dead
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
