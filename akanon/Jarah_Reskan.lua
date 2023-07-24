-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, child. Welcome to Gemchopper Hall. I trust that you are a [warrior], or perhaps you are lost..?");
	elseif(e.message:findi("lost")) then
		e.self:Say("One can easily get lost in Ak'Anon. You must get your vision checked. If you are truly lost, I would advise speaking with a mechanical guide. There should be one close by on the main walkway.");
	elseif(e.message:findi("warrior")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- Needs amiably or better
			e.self:Say("That is good news! We gnomes are not known for our love of battle so it is always good to bring new blood into our ranks. We shall prove our worth as warriors to all other races. For now. there is much to do in Ak'Anon. There are [rogue clockworks] and the [cargo clockwork].");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("You must show a greater allegiance to the Gemchoppers before we can speak with you.  Search the hills for rogue clockworks.  Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
		else
			e.self:Say("You are lucky I do not cut you in half right where you stand. Your actions so far have proven you an enemy to the Gemchoppers. Leave while you still can!");
		end
	elseif(e.message:findi("rogue clockworks")) then
		e.self:Say("The clockworks are the responsibility of Manik Compolten. Speak with him - I am sure he is here somewhere.");
	elseif(e.message:findi("cargo clockwork")) then
		e.self:Say("The cargo clockwork is located near the entrance to Ak'Anon in the Steamfont Mountains. It runs a delivery to the windmills every five days at eight in the morning. There have been attacks by a group of highwaymen. They are quite a formidable group. I have offered a reward for their heads. Be very careful if you plan on escorting the cargo clockwork. This trio of bandits is very strong.");
	elseif (e.message:findi("blackbox")) then
		e.self:Say("If you have a clockwork blackbox which is still intact, take it to [Manik Compolten].  All clockwork matters go through him.");
	elseif (e.message:findi("manik compolten")) then
		if(e.other:GetFactionValue(e.self) >= 0) then -- Needs indifferent
			e.self:Say("Manik is a trainer within this guild. The clockworks are his responsibility. Speak with him - I am sure he is here somewhere.");
		else
			e.self:Say("You are lucky I do not cut you in half right where you stand. Your actions so far have proven you an enemy to the Gemchoppers. Leave while you still can!");
		end
	elseif (e.message:findi("meldrath")) then
		e.self:Say("Meldrath is the mad gnome.  He used to be a member of the Eldritch Collective.  Some say he lost his mind while he was working on a formula he obtained from other worlds.  He used to lead the cult called the [Asylum of the Mad].");
	elseif (e.message:findi("asylum")) then
		e.self:Say("The Asylum of the Mad was formed by the mad gnome, Meldrath. Under his direction, they were trying to build some giant mechanical titan.  We recently sent all of our clockworks into the Steamfont Mountains to destroy their evil cult.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1270,item2 = 1319,item3 = 1323})) then
		e.self:Say("I heard our shipment made it back safely. These heads will send a message to any other thief that plans on robbing our cargo shipments. Thank you " .. e.other:GetCleanName() .. ", take this coin as your reward. I’m sorry to say we’re currently out of masks.");
		e.other:Faction(e.self,255,2); -- gem chopper
		e.other:Faction(e.self,288,1); -- merchants of akanon
		e.other:Faction(e.self,333,1); -- king akanon
		e.other:Faction(e.self,238,-1); -- dark reflection
		e.other:Faction(e.self,1604,-1); -- clan grikbar
		e.other:QuestReward(e.self,math.random(9),math.random(9),math.random(5),0,0,1500);
	end	
	item_lib.return_items(e.self, e.other, e.trade)
end
