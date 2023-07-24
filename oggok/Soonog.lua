function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You [Greenblood]?");
	elseif(e.message:findi("greenblood")) then
		if(e.other:GetFactionValue(e.self) >= 50) then
			e.self:Say("Good, you mine.  We tuffest, bestest, scariest warriors in da Norrath.  Not like dem wimpy Craknek hoomie wannabees.  You Greenblood, you my toy.  You lives or dies at my will.  Go, brings me many lizard meats cause I Greenblood leader and I berry hungry lots.  So hungry dat I eats four lizards.  Go bring meat or I eats you.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18789})) then
		e.self:Say("Soonog own you now.. fight for Soonog.. Soonog make you strong.. Soonog army rule all!!");
		e.other:Faction(e.self,261,100);  	-- Green Blood Knight
		e.other:Faction(e.self,228,50);   	-- Clurg
		e.other:Faction(e.self,312,-15); 	-- Storm Guard
		e.other:Faction(e.self,308,-15); 	-- Shadowknight of Night Keep
		e.other:QuestReward(e.self,0,0,0,0,13527,20);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13410, item2 = 13410, item3 = 13410, item4 = 13410})) then
		e.self:Say("Small meats but is good nuff.  You take dis and go kill eberyting.  Make all scared of da Greenblood knights.  You get ready for next inb.. ins.. invat.. you get ready for next war.  You learning stuff, you come bak here and me teach you more Greenblood stuf so we be more tuffest.");
		e.other:Faction(e.self,261,5);  	-- Green Blood Knight
		e.other:Faction(e.self,228,2);   	-- Clurg
		e.other:Faction(e.self,312,-1); 	-- Storm Guard
		e.other:Faction(e.self,308,-1); 	-- Shadowknight of Night Keep
		e.other:QuestReward(e.self,0,0,0,0,5023,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
