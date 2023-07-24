function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail") and (fac <= 5)) then
		e.self:Say("Hi, kid! You seem to be a stranger in these parts. Heed my words, this city is dangerous to new blood!");
		eq.signal(10135,10); -- NPC: Bronto_Thudfoot
	elseif(e.message:findi("hail") and (fac > 5)) then
		e.self:Say("Run while ye still can!!  The Wolves o' the North will not tolerate yer presence!");
	elseif(e.message:findi("toala sent me")) then
		e.self:Say("She does not even have the courtesy to come herself. Some old friend!! Listen, some rogue in this city broke into the [Beast] and stole a pouch containing a voucher ticket for a part I need to repair the Beast. I can't get the part back without the ticket. I did not see the rogue. I did not sleep on the Beast that night. Bronto was there. Ask him if he saw the rogue.");
	elseif(e.message:findi("beast")) then
		e.self:Say("You're joking, right? You have never heard of the Blue Beast?!! She is the fastest ship in Norrath. She made the [Kunark run] in under three weeks. She was designed by [Bronto].");
	elseif(e.message:findi("kunark run")) then
		e.self:Say("The Kunark run is the most dangerous run between Freeport and [Firiona Vie], in Kunark. If the seas don't rip your hull to splinters and the pirates and sea wyrms don't kill you, you can make a quick run back and forth, avoiding any unwanted inspections.");
	elseif(e.message:findi("Firiona Vie")) then
		e.self:Say("Firiona Vie is an elven outpost on the continent of Kunark. Every so often I run supplies to and from there. Do not even think about asking me to take you there. It will be months before I can make improvements on the Blue Beast to make it impervious to aerial attacks.");
	elseif(e.message:findi("journal strongbox")) then
		e.self:Say("You must be from the Academy of Arcane Science.  Well, kid, bad news.  I was docked at the isle in the Ocean of Tears when I was boarded by the Freeport Militia.  To say the least, I panicked and dropped all my cargo.  It is still there.  Mostly illegal alcohol, but the strongbox is still out there, too.  Directly out from the dock.");
		eq.set_global("strongbox","1",7,"H1");
	elseif(e.message:findi("Bronto")) then
		e.self:Say("My trusted friend. Together we travel the world aboard the [Beast]. He is quite skilled at boat making and other mechanical skills. He has a heart and brain far superior to any ogre I have ever met, as well as most other races.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13818})) then -- Boat Beakon can be turned in at dubious
		e.self:Say("Oh!! You must work for that Erudite named Palatos. I guess he won't have to spend anymore money drinking in Freeport. Here. Here is the portrait I kept until he could get me a new boat beacon.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,320,5,0); -- Faction: Wolves of the North
		e.other:Faction(e.self,327,1,0); -- Faction: Shamen of Justice
		e.other:Faction(e.self,265,1,0); -- Faction: Heretics
		e.other:Faction(e.self,267,1,0); -- Faction: High Guard of Erudin
		e.other:QuestReward(e.self,0,0,0,0,12146,20000); -- A'kanon's Portrait
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13814})) then -- L.S. Pouch can be turned in at dubious
		e.self:Say("You found my pouch! Thanks kid. Let me buy you A drink and this is for the good work. Hmmmm. It looks as though they took my voucher. Darn it! Hey... It looks like they were using my bag to hold items they were stealing. Here you go. You can have it. It looks like junk.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,320,5,0); -- Faction: Wolves of the North
		e.other:Faction(e.self,327,1,0); -- Faction: Shamen of Justice
		e.other:Faction(e.self,328,1,0); -- Faction: Merchants of Halas
		e.other:Faction(e.self,311,1,0); -- Faction: Steel Warriors
		e.other:QuestReward(e.self,0,math.random(10),0,0,eq.ChooseRandom(13922,13923),200); -- Snapped Pole or Moggok's Right Eye
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
