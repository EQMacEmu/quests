-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Me says hi to you.  What you want from me?  Oh!!  Me shaman trainer.  You must be shaman.  Are you [shaman Darkone]?");
	elseif(e.message:findi("i.* shaman darkone")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
			e.self:Say("You choose rite if you bes a shaman.  Wes da best.  You remember ta not get in Kaglari way.  He get mad berry easy.  He gets berry mad at Urako if he finds out me make [big mistake].");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Darkones no hates you, buts you not helps us enuff.");
		else
			e.self:Say("You die! Me Darkone!  We no frend to you.  You run now!");
		end
	elseif(e.message:findi("big mistake")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
			e.self:Say("Kaglari makes Urako cleans his kwarters.  He says nots to open closet.  Me make mistake and opens his closet and out comes da skeletons.  Dey runs out into Grobb.  Me needs ta gets dem back before Kaglari finds out.  Me needs sumwun to [collect Kaglari skeletons].");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Darkones no hates you, buts you not helps us enuff.");
		else
			e.self:Say("You die! Me Darkone!  We no frend to you.  You run now!");
		end
	elseif(e.message:findi("i.* collect kaglari skeleton")) then
		if(e.other:GetFactionValue(e.self) >= 200) then -- requires mid amiably	
			e.self:Say("Tank you!!  Dere is fours of dem.  You can finds dem here in Grobb.  I no tink dey will want to come homes to Kaglari's closet.  You ask dem to [come back to the closet] and see whut dey say.  If you gets dem back me promise to gives you a [Kaglari mana doll].");
			eq.unique_spawn(52056,0,0,-265,156,8,258); -- NPC: a_skeleton
		elseif(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("Darkones no hates you, buts you not helps us enuff.");
		else
			e.self:Say("You die! Me Darkone!  We no frend to you.  You run now!");
		end
	elseif(e.message:findi("kaglari mana doll")) then
		e.self:Say("Kaglari catch many humans.  He pull spirit from dem and force into dolls.  Now deir spirit give shaman extra mana.  Dey good power source.  Now humans good for someting.  Da mana dolls only for shaman power.");
	end
end

function event_trade(e)
	local item_lib =require("items");
	local text = "Dis no good. We need the butcher, baker, minstrel and captain.";
	
	if(e.other:GetFactionValue(e.self) >= 200 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12213, item2 = 12214, item3 = 12215, item4 = 12216},1,text)) then --The Baker, The Butcher, The Captain, The Minstrel
		e.self:Say("Tank you. You saved me neck. Kaglari not learn me mistake now. Me give you a [Kaglari mana doll].");
		e.other:Faction(e.self,237, 10); -- Dark Ones
		e.other:Faction(e.self,308, 2); -- Shadowknights of Night Keep
		e.other:Faction(e.self,251, -1); -- Frogloks of Guk
		e.other:QuestReward(e.self,0,0,0,0,12212,5000); --Kaglari Mana Doll
	end
	item_lib.return_items(e.self, e.other, e.trade)
end