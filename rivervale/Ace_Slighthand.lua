--BeginFile: rivervale\Ace_Slighthand.pl
--Quest file for Rivervale - Ace Slighthand: Kevlin Diggs' Debt & Extraordinary Rodents

function event_say(e)
	local level = e.other:GetLevel();

	if(e.message:findi("Hail")) then
			e.self:Say("Hey, hey, hey! Welcome to the Fool's Gold. Don't bet more than you can afford to lose, pal! You don't want to end up like ol' [Kevlin]. If you're looking for something to do after you have a drink, you may be interested in a [task].");
	elseif(e.message:findi("kevlin")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
			e.self:Say("Kevlin Diggs. His family sells armor here in Rivervale. He has a nice shop right across from us here. But he owes us Deeppockets some [gold] that we need to collect. We can't rough him up because he is a friend of Mayor Gubbin. We need someone to steal it.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end	
	elseif(e.message:findi("gold")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
			e.self:Say("He keeps his money in a sack on his bed. But he has a mean pet wolf, named Mangler, who mangled the last cutpurse we sent after it. If you were to wait until he leaves his shop, then sneak past Mangler and bring me the money he owes us, I will make it worth your time.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end	
	end
end

function event_trade(e)
local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13182})) then --Kevlin's Debt
		e.self:Say("Heh heh! You got a career ahead of ya kid! Good work. Here is your cut.");
		e.other:QuestReward(e.self,math.random(0,10),math.random(0,5),0,0,0,30);
	else
		item_lib.return_items(e.self, e.other, e.trade);
	end
end

--END of FILE Zone:rivervale  ID:19093 -- Ace_Slighthand