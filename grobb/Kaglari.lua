
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("SNORT!  HHUUUUCCCSSH..  Peh!  You speak at Kaglari, High Priestess of Dark Ones.  Children of Hate.  Spawn of Innoruuk.  " .. e.other:GetCleanName() .. " . speak or be gone!  <SNORT!>  You [wish majik power]?");
	elseif (e.message:findi("wish majik power")) then
		if(e.other:GetFactionValue(e.self) >= 100) then	
			e.self:Say("GOOD! SNORT!! Innoruuk needs more childrens.  You show majik skill or I give you to Innoruuk.  You bring two tadpole fleshes and two bone chips ..<SNORT>..  from old bones.  I teach you majik.  GO!  <SNORT!!>");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13073, item2 = 13073, item3 = 13187, item4 = 13187})) then -- Majik power
		e.self:Say("SNORT!! Good. Innoruuk get special gift. Not you, dis time. Here. Learning majik wid dis. You more want to help Innoruuk?");
		e.other:Faction(e.self,237,5);  -- +Dark Ones
		e.other:Faction(e.self,308,1);  -- +Shadowknights of Night Keep
		e.other:Faction(e.self,251,-1); -- -Frogloks of Guk
		e.other:QuestReward(e.self,0,0,0,0,15093,100); -- Item: Spell: Burst of Flame
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 18791})) then -- Tattered Note
		e.self:Say("Good.. Kaglari need you help.. Kaglari teach you majik now.");
		e.other:Faction(e.self,237,100);  -- +Dark Ones
		e.other:Faction(e.self,308,25);  -- +Shadowknights of Night Keep
		e.other:Faction(e.self,251,-15); -- -Frogloks of Guk
		e.other:QuestReward(e.self,0,0,0,0,13529,20); -- Muck Stained Tunic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
