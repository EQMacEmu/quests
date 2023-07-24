-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". I invite you to serve the mighty state of Ak'Anon by becoming a Gemchopper. We gnomes are not known for our warrior skills, but those few who endure and survive to become elite amongst our warriors soon find that the technology of the gnomes has found its way into our halls. You must be a [new recruit] or [an outsider], perhaps?");
	elseif(e.message:findi("new recruit")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Well, good to make your acquaintance, " .. e.other:GetCleanName() .. ". Maybe someday you shall be a great Watchman. Until then, I have a task for you. Will you [serve the Crown] or has a yellow streak appeared upon your back?");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("You must show a greater allegiance to the Gemchoppers before we can speak with you. Search the hills for rogue clockworks. Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
		else
			e.self:Say("You are lucky I do not cut you in half right where you stand. Your actions so far have proven you an enemy to the Gemchoppers. Leave while you still can!");
		end
	elseif(e.message:findi("an outsider")) then
		e.self:Say("I should have guessed as much. You look the part.");
	elseif(e.message:findi("serve the crown")) then
		if(e.other:GetLevel() <=5 ) then
			e.self:Say("You are too inexperienced. Leave that business to someone more worldly.");
		else
			e.self:Say("Go to the Lesser Faydarks. There you will seek out a fairy city. It seems the little pests have stolen one of our fabulous clockworks. Destroy the clockwork and bring me proof. Be very careful. The fairy folk may be small, but they pack a punch.");
		end
	elseif (e.message:findi("meldrath")) then
		e.self:Say("Meldrath is the mad gnome.  He used to be a member of the Eldritch Collective.  Some say he lost his mind while he was working on a formula he obtained from other worlds.  He used to lead the cult called the [Asylum of the Mad].");
	elseif (e.message:findi("asylum")) then
		e.self:Say("The Asylum of the Mad was formed by the mad gnome, Meldrath. Under his direction, they were trying to build some giant mechanical titan.  We recently sent all of our clockworks into the Steamfont Mountains to destroy their evil cult.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18770})) then -- Recruitment Summons
		e.self:Say("I, Baxok, guildmaster, welcome you to Gemchopper Hall, young warrior! You are expected to serve his majesty, King Ak'Anon, with pride. You have much to learn. You may report to any of the trainers for further guidance. Go forth and serve!");
		e.other:Faction(e.self,255,100,0); -- +Gem Cutters
		e.other:Faction(e.self,288,25,0); -- +Merchants of Ak'anon
		e.other:Faction(e.self,333,25,0); -- +King Akanon
		e.other:Faction(e.self,238,-25,0); -- -Dark Reflection
		e.other:Faction(e.self,1604,-5,0); -- -Clan Grikbar
		e.other:QuestReward(e.self,0,0,0,0,13520,20); -- Torn and Ripped Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13344})) then -- verified can turn in at dubious.
		e.self:Say("I can hardly believe you destroyed the clockwork. The last ten men I sent became fairy fodder. Thank you. Here is a token of my appreciation. Serve Ak'Anon well and we shall treat you well.");
		-- verifed live faction
		e.other:Faction(e.self,255,20,0); -- +Gem Cutters
		e.other:Faction(e.self,288,5,0); -- +Merchants of Ak'anon
		e.other:Faction(e.self,333,5,0); -- +King Akanon
		e.other:Faction(e.self,238,-5,0); -- -Dark Reflection
		e.other:Faction(e.self,1604,-1,0); -- -Clan Grikbar
		e.other:QuestReward(e.self,math.random(0,5),math.random(0,5),0,0,eq.ChooseRandom(9002,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1010,1011),5000); -- cloth armor or round shield
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
