function event_say(e)
	local fac = e.other:GetFaction(e.self);
	
	if(e.message:findi("hail")) then
		e.self:Say("Hail!  Welcome to the Hall of Truth.  We, the Knights of Truth, are all the hope this city has of loosening the grip of Lucan D'lere and his militia.  I seek a young knight to [serve the will of the Truthbringer].");
	elseif(e.message:findi("what.* truthbringer") or e.message:findi("who.* truthbringer")) then
		e.self:Say("Shame on you.  To set foot into the Hall of Truth and not know for whom it was built.  Still, it is never too late to see the light.  Mithaniel Marr is our deity.  He is the Truthbringer.  By living our lives in valor and crushing all those who suppress His beliefs. We serve Him.");
	elseif(e.message:findi("who.* lucan")) then
		e.self:Say("He is the self-proclaimed ruler of Freeport.  He began this false rule by banding together every vagabond and brawler he could find into a militia of sorts.  By protecting the city from orc raids and the frequent scuffles between travelers, he gained the city's trust and wrested control of it from the former ruler.  All this took place during the Hall's Crusade of Tears.  We returned to find our remaining forces murdered.  The militia claimed the orcs infiltrated the city and killed our knights.  How convenient that they killed no militia!  Join us in crushing the defiler!");
	elseif(e.message:findi("serve.* truthbringer")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Stand tall then, knight! We have need of your services. We have sent a man to infiltrate the militia. We fear he may soon be found out. Take him this note of warning. Say the words, 'Truth is good,' and you shall find him. Be careful, young knight. The militia does not take prisoners.");
			e.other:SummonCursorItem(18817); -- A Sealed Letter (To Alayle)
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do.");
		else
			e.self:Say("Leave my presence at once.  Your ways of life are not acceptable to one who follows the Truthbringer.");
		end
	elseif(e.message:findi("zimel.* blades")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Why would Lucan visit a condemned building? He must be searching for something. When I last visited the local forge, I heard rumors of Lucan searching for a sword named Soulfire. If this is true, you must find it first! No more power should go his way. Seek this sword out!");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do.");
		else
			e.self:Say("Leave my presence at once.  Your ways of life are not acceptable to one who follows the Truthbringer.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18818})) then -- A Tattered Flier
		e.self:Say("Zimel's Blades?! Hmmmmm. It doesn't ring a bell and the remainder of the writing is too hard to make out. It kind of looks like a list of prices. You know, down at the Office of the People they might be able to tell us if this place exists. Go speak with Rashinda. She knows all about Freeport. If [Zimel's Blades] existed, you must report back to me what happened to it.");
		e.other:Faction(e.self,281,1,0); -- Faction: Knights of Truth
		e.other:Faction(e.self,271,-1,0); -- Faction: Dismal Rage
		e.other:Faction(e.self,330,-1,0); -- Faction: The Freeport Militia
		e.other:Faction(e.self,362,1,0); -- Faction: Priests of Marr
		e.other:Faction(e.self,311,1,0); -- Faction: Steel Warriors
		e.other:QuestReward(e.self,0,0,0,0,0,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
