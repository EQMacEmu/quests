-- ###########################################
-- ## DEVELOPER: KOVOU
-- ## CONVERTED TO LUA BY: robregen
-- ## *** NPC INFORMATION ***
-- ##
-- ## NAME: Einhorst McMannus
-- ## ID: 12091
-- ## ZONE: qey2hh1
-- ##
-- ############################################

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() ..". Welcome to the fishing village of Clan McMannus. We sell what we can here.  Have a look around but, please do not buy too much. We must save most of our stock for delivery to [our home].");
	elseif(e.message:findi("home")) then
		e.self:Say("We come from the frozen walls of [Halas]. We were sent here by the council of elders to set up this village. We support Halas by shipping what we catch and sending them items which cannot be found in Everfrost Peaks. We presently have a shipment of [lion meat] for [delivery] to Halas.")
	elseif(e.message:findi("halas")) then		
		e.self:Say("Halas is the mighty city of the barbarians of the North. It lies among the Everfrost Peaks.")
	elseif(e.message:findi("searching for the fugitive")) then
		e.self:Say("I see they have sent someone to hunt the scoundrel down. I am afraid I haven't seen the barbarian thief in quite some time. You can search and search for him here in the western plains, but I doubt you shall find him. Good luck.");
	elseif(e.message:findi("delivery")) then -- can be done even at dubious
		e.self:Say("Oh, yes, the lion meat shipment. Aye, it's here somewhere. Just a moment. Ah! Here you go. Apologize for the delay in this.")
		e.other:SummonCursorItem(13961); -- Lion Meat Shipment	
	elseif(e.message:findi("lion meat")) then
		e.self:Say("That would be splendid! Go to Misla and tell her you will deliver the lion meat to Halas. She will instruct you. Thank you, my friend.");
	elseif(e.message:findi("frostbite")) then
		e.self:Say("Frostbite is our trusty wolf. We found him as a pup.")
	elseif(e.message:findi("wolves of the north")) then		
		e.self:Say("The Wolves of the North are the barbarian warriors of Halas. All of us in Clan McMannus are members. Mess with us and you mess with the Wolves of the North.");
	elseif(e.message:findi("helsa")) then
			e.self:Say("My wife? She is dead. Crushed by the hands of a foul cyclops. I wish I could find that cyclops. I would pay greatly for his eye. I have slain every giant I could find, but I have not met him. I could still remember that cry of his...  BROOON!")
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18831})) then
		e.self:Say("Yes. We almost forgot of the shipment of Karana clovers. Here you are, my friend. Back to the north with you. I am sure the Shamans of Justice will need this.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,320,1,0); -- Wolves of the North
		e.other:Faction(e.self,327,1,0); -- Shamen of Justice
		e.other:Faction(e.self,328,1,0); -- Merchants of Halas
		e.other:Faction(e.self,311,1,0); -- Steel Warriors
		e.other:QuestReward(e.self,math.random(9),math.random(9),0,0,13962,1600); -- Karana Clover Shipment
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
