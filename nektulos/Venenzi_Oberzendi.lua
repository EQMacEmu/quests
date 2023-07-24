-- Necromancer Epic NPC -- Venenzi_Oberzendi

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What is it you want! Can't you see I am gathering reagents for my [master]? If I don't get them for him quickly he might punish me.");
	elseif(e.message:findi("master")) then
		e.self:Say("You do not know of my teacher? The great Kazen Fecae! I am one of his illustrious apprentices! If you fancy yourself a necromancer, travel to Lake Rathetear and tell Kazen you wish to study the dark arts.");
	elseif(e.message:findi("reagents")) then
		e.self:Say("My master is working on some great project. He's always busy studying an old text he found and murmuring something about following in the footsteps of Miragul.");
	elseif(e.message:findi("task")) then
		e.self:Emote("looks down at her robes and back at you. 'There is an certain dark elf magician who has decided to wear the same fashion as I have on several occasions. I do not wish to attend another social gathering in Neriak and look exactly the same as another woman. Slay her and bring me her robe, and I will give you my hard earned reagents.'");
	elseif(e.message:findi("dark art")) then
		e.self:Say("You are truly a fool.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20642})) then
		e.self:Say("I see you serve my master as well now. I assume you are here to take the reagents from me which I have gathered for him? I don't know if I like the idea of you gaining the credit for my hard work here. I might consider giving you these reagents, if only you do a small [task] for me.");
		e.other:QuestReward(e.self,0,0,0,0,20643,500);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1320})) then -- flowing black robe turn in
		e.self:Say("Thank you, " .. e.other:GetCleanName() .. ". I did not think you would track down Najena and slay her. I think that I am going to return to my old life in Neriak. I am sick of the way Kazen has been treating me. He never seems to teach me anything worthwhile. Don't forget to give his lapdog that symbol with the reagents. I'm sure he will give you a new one.");
		e.other:QuestReward(e.self,0,0,0,0,20649,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE  Quest by: Solid11  Zone:nektulos  ID:25099 -- Venenzi_Oberzendi