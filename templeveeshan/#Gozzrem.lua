-- Gozzrem's WToV tests: 1st & 2nd arcane tests, wisdom long and short battles

function event_say(e)
	if(e.other:GetFactionValue(e.self) >= 500) then -- req kindly cov
		if(e.message:findi("hail")) then
			e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". If you seek wisdom or the arcane I have tasks in the halls of testing you may complete to gain what you seek.");
		elseif(e.message:findi("arcane")) then
			e.self:Say("To garner a reward fit for one who walks the arcane path return to me the poison tear and the poison symbol. Along with these return the serrated symbol and the runed symbol. If this task is not hard enough for you, I have a second quest for you.");
		elseif(e.message:findi("second")) then
			e.self:Say("Tears may fall to the ground but not the ones you seek now. The black tear and the ruby tear you must seek. For more power I require the ruby symbol and a white symbol to bind the powers together. Upon the return of these four objects you will receive a wondrous reward.");
		elseif(e.message:findi("wisdom")) then
			e.self:Say("Wisdom can be gleaned from battle and that is what I wish you to do. Battle in the halls of testing may give you a different outlook on life. Which do you seek, the short battle or the long battle?");
		elseif(e.message:findi("long")) then
			e.self:Say("You will spend much time in the halls of testing. Seek out a runed tear and a flame kissed tear, bring them back to me with a symbol black as midnight and a glowing orb of the ancient drakes.");
		elseif(e.message:findi("short")) then
			e.self:Say("For the shortest time in the halls, seek out a Platinum tear held by the cursed one, a platinum symbol, a silver symbol and an emerald symbol as green as the forests. If you are able to return these to me I will reward you with a simple idol of the white dragons.");
		end
 	elseif(e.other:GetFactionValue(e.self) >= 0) then
		e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 31266,item2 = 31255,item3 = 31252,item4 = 31254})) then -- first test of the arcane
		FactionHits(e);
		e.other:QuestReward(e.self,0,0,0,0,31466,20000);
	elseif(e.other:GetFactionValue(e.self) >= 500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 31262,item2 = 31270,item3 = 31259,item4 = 31250})) then -- second test of the arcane
		FactionHits(e);
		e.other:QuestReward(e.self,0,0,0,0,31468,20000);
	elseif(e.other:GetFactionValue(e.self) >= 500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 31267,item2 = 31263,item3 = 31251,item4 = 31260})) then -- test of long battle
		FactionHits(e);
		e.other:QuestReward(e.self,0,0,0,0,31467,20000);
	elseif(e.other:GetFactionValue(e.self) >= 500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 31253,item2 = 31258,item3 = 31257,item4 = 31269})) then -- test of short battle
		FactionHits(e);
		e.other:QuestReward(e.self,0,0,0,0,31465,20000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function FactionHits(e)
	e.self:Say("You have done well, ".. e.other:Race() .. ". You have proven that you are strong, but do you dare enter those halls again?");
	e.other:Faction(e.self,430,75); -- Faction: Claws of Veeshan
	e.other:Faction(e.self,436,18); -- Faction: Yelinak
	e.other:Faction(e.self,448,-37); -- Faction: Kromzek
end
