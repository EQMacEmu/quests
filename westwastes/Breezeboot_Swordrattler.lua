function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Arr!  Well, blow me down and hoist me mizzenmast!  Swab the fo'c'sle and kick the bosun!  Arrgh,  to the four winds with this!  I am cold, wet, hungry, shipwrecked, and bloody tired of playing at being a pirate.  Breezeboot is not really my name, but it will do for now.  I do not know how you got here, but you give me hope of escaping this frozen hell.  We have been shipwrecked here for weeks now, though that is a long story.");
	elseif(e.message:findi("story")) then
		e.self:Say("We were trying to make a good coastal map of Velious, you understand, and to do that, we needed to circumnavigate the continent. Figured we might find some treasure too. It was not an easy trip, but the boys I brought along are pretty godo sailors, and they all know their business. Unlike that group of pretend pirates back at the Iceclad landing. We were doing fine until a storm blew up, and ran us right into these rocks. Our port screw, or was that starboard, anyway, the one on the left broke on the bottom, and we started shipping water, flooding the boiler. There is now ay we can repair the damage. So here we are - stuck!");
	elseif(e.message:findi("stuck")) then
		e.self:Say("We are stuck because the coast is crawling with dragons and other beasties with sharp pointy parts that seem to like the taste of gnome. We have lost twelve men to dragons and wolves so far. I don't think we can make it to safety overland. Our best bet is to make a raft and try to sail back to the Iceclad landing, but we do not have enough supplies for that.");
	elseif(e.message:findi("what.* supplies")) then
		e.self:Say("Maybe you can help us with that. You made it here in one piece, maybe you can go find us supplies and make it back again.");
	elseif(e.message:findi("help")) then
		e.self:Say("Well, we will need lumber - a good bit of it. I saw some likely wrecks when we sailed up the Cobalt Scar, you might want to look there. We also need rope, a lot of it, to lash the logs together, at least one hundred feet. Finally, we need something we can use as a sail - I do not like the idea of trying to paddle all the way back. I am not sure what you can find for that, but it needs to be strong, light, and not pass much air. Gather all that up, and come see me. I think I might have a bit of plunder and booty I can part with, in payment.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 27262, item2 = 27263, item3 = 27264})) then -- Seaworthy Planking, 100' waterproof rope, Huge Drake Wing
		e.self:Say("Well blow me down! You did it! Now we can get off this miserable coast. It is back to Ak'Anon for this seadog, and I won't even look at a glass of water after this, let alone sail on it! Here's your reward, you might find this useful. Too dang heavy for me to lug around anymore, anyhow. Just be careful where you point 'er!");
		e.other:Faction(e.self,447,25); -- Faction: Pirates of Iceclad
		e.other:QuestReward(e.self,0,0,0,0,27310,10000);	-- Breezeboot's Frigid Gnasher
	end
	item_lib.return_items(e.self, e.other, e.trade)
end