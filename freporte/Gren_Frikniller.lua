function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("Aya, howdy there, " .. e.other:GetCleanName() .. ".  The name's Gren Frikniller.  'Niller the Killer' The only person who can give me a run for my money is my [sister].");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("sister") or e.message:findi("falia")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("Ah, my sister Falia has traveled here all the way from Rivervale. I hear that she's been staying up in North Freeport, but I haven't had a chance to find her yet. If you get some spare time, could you take this letter to her for me? Thanks, " .. e.other:GetCleanName() .. ", you're really not so bad after all.");
			e.other:SummonCursorItem(18925); -- Letter to Falia
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("rivervale")) then
		e.self:Say("Rivervale?  Well, it's far from here, thank Fizzlethorpe.  They got more wanted posters with my face on 'em than they got trees there.  I mean, 'tweren't my fault either.  Just a friendly game of cards, and this little weasel catches me with an extra ace up my sleeve.  Can you believe this kid calls ol' Grenny here a cheater, right in front of the whole bar?!!  So, you know, I gave him a quick cut, ear to ear, with me dagger...  just to shut him up, you know.  Suddenly, I'm a murderer?  For simply defending myself?! Go figure!");
	elseif(e.message:findi("elisi")) then
		e.self:Say("Elisi runs the show around here.  She's usually a pretty busy lady.  Dang smart, too.  And it's my sworn duty to protect her at any cost, even with my very own life.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13159})) then
		e.self:Say("What's this? Oh, ol' Grandpa Frikniller's lucky necklace, huh? I'll bet this broken piece of junk won't even get me a sip of ale up at the bar. And lucky? How lucky could this thing be? Poor gramps was lonely and copperless his whole life. Bah!! Oh, well. Here's some coin for your efforts, thanks, " .. e.other:GetCleanName() .. ".");
		-- HK Confirmed Live Factions
		e.other:Faction(e.self,336,10,0); -- Coalition of Tradefolk Underground
		e.other:Faction(e.self,229,10,0); -- Coalition of Trade Folk
		e.other:Faction(e.self,329,1,0); -- Carson McCabe
		e.other:Faction(e.self,230,1,0); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,330,1,0); -- Freeport Militia
		e.other:QuestReward(e.self,math.random(10),math.random(5),0,0,0,200);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	e.self:Say("Yea.. Bite that tongue of yours, there shorty, or I might just have to cut it off to shut you up for good.");
end


