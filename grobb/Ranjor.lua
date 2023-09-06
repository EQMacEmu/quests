-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ya wanna be a member a Da Bashers, duz ya?  What making ya tink yooz is good nuff ta be one o' us?  Can ya proves ta me why I shouldn't oughtta just eat yer smelly hide?  I gonna tests ya, ya big, ugly peece o' meet.  Ya [willin ta test] or duz I just eats ya now?");
	elseif(e.message:findi("willin ta test")) then
		if(e.other:GetFactionValue(e.self) >= 100) then			
			e.self:Say("Stoopid meat.  I gonna eats ya anyways sumday.  Brings me a froglok meat and two dem li'l froglok tadpole fleshes.  Dey berry good.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 18790})) then -- Tattered Note
		e.self:Say("Arhh.. Ranjor mighty warrior.. Ranjor teach you warrior.. you fight for Ranjor now.");
		e.other:Faction(e.self,235,100,0);  	-- Da Basher
		e.other:Faction(e.self,222,-15,0);  -- Broken Skull Clan
		e.other:QuestReward(e.self,0,0,0,0,13528,20);  -- Mud Covered Tunic
	elseif (e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13409, item2 = 13187, item3 = 13187})) then
		e.self:Say("You is berry slow. Me too hungry. Me shood eats you for being slow. Gib me dat stuff. Here, take dis and git more stuff fer us. You much kllin, come backs sees me. I teeches ya hows ta kill bedder. Now git and kill stuff. We be Da Bashers fer a reesun.");
		e.other:Faction(e.self,235,5,0);  	-- Da Basher
		e.other:Faction(e.self,222,-1,0);  -- Broken Skull Clan		
		e.other:QuestReward(e.self,0,0,0,0,5025,100); -- Rusty Battle Axe
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
