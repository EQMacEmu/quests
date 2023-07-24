function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sighs heavily and after a long while says, 'Leave us, " .. e.other:Race() .. ". Leave us to our eternal damnation.");
	elseif(e.message:findi("curse")) then
		e.self:Emote("twists his face into a frown and says, 'You read what's written, " .. e.other:Race() .. ". It's clear enough so we won't bother to explain the details. We can only stand our guard and hope for [redemption].");
	elseif(e.message:findi("redemption")) then
		e.self:Emote("It's very simple, " .. e.other:GetCleanName() .. "! We are fallen! We seek redemption! We guard our 'brothers' here among the Howling Stones until we are relieved. Whether that will ever happen, we do not know. We can only hope that by providing the great warriors of the legion with our [ancient armor], we will earn salvation.");
	elseif(e.message:findi("armor")) then
		e.self:Say("You wish the armor of our ancestors? The armor donned by the Guard whose duty was to protect the Chosen? A warrior relies not on strength alone, but many virtues. If a warrior learns to balance each virtue, then he may be fit to guard the Chosen. Each piece of armor reflects a [virtue], and each virtue must be learned before the armor is given.");
	elseif(e.message:findi("virtue")) then
		e.self:Say("The armor I keep are the symbols of focus, sacrifice, and perseverence. The [helm], [pauldrons], [vambraces], and [breastplate]. You must bring me proof that you know these virtues before attaining the armor I keep. I also will need a piece of Banded armor of the type you desire. My brother keeps the other pieces.");
	elseif(e.message:findi("breastplate")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The monk is the master of focus, the shaman of sacrifice and the shadowknight of righteousness. Lastly, our brothers of the dark know confidence. It is then our duty to know perseverance more than any other. When others fall from spear and sword, we must stand. When others are washed away by fire and ice, we must stand. When others are frustrated and confused, we must continue on. There is a warrior in the swamp near the city. He is an exile, like my brother and I. He knows more about than I.");
			e.other:SummonCursorItem(14789); -- Item: Illegible Note: Breastplate
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("helm")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("You must first learn focus before being awarded the legionnaire scale helm. The Swifttails are the masters of focus and as such you will learn from the Grand Master of the Court. It has been so long, I do not know who is Grand Master now. Whoever it is, give him this note and follow his instruction. Once you have learned, return to us and the helm will be yours.");
			e.other:SummonCursorItem(14788); -- Item: Illegible Note: Helm
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("vambraces")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Our arms carry more than the weapons of war and the hands that make use of them. We sacrifice the strength in our arms to carry our duties and obligations. Unless we can sacrifice our own bodies and abilities to carry these ideals, we will never be fit to protect the Chosen. Take this note to the master of the mystics in Cabilis, he will teach you a lesson in sacrifice.");
			e.other:SummonCursorItem(14790); -- Item: Illegible Note: Vambraces
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("pauldrons")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Upon our shoulders we carry the virtue of sacrifice. Our bodies are ruined in the name of our Lord. Pain and suffering please him and our ancestors. Without knowing sacrifice, a warrior can never protect his charge from harm as he sees himself as greater than his duty. The mystics embody sacrifice. Find their highest authority and give him this note. He will recognize it."); 
			e.other:SummonCursorItem(14795); -- Item: Illegible Note: Pauldron
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14783, item2 = 3053})) then
		e.self:Say("Well done");
		e.other:QuestReward(e.self,0,0,0,0,4976,1000);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14786, item2 = 3060})) then
		e.self:Say("Well done");
		e.other:QuestReward(e.self,0,0,0,0,4979,1000);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14816, item2 = 3056})) then
		e.self:Say("Well done");
		e.other:QuestReward(e.self,0,0,0,0,4977,1000);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14787, item2 = 3057})) then
		e.self:Say("Well done");
		e.other:QuestReward(e.self,0,0,0,0,4978,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
