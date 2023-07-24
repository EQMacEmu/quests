function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ".");
	elseif(e.message:findi("rykas")) then
		e.self:Say("I have not heard of anyone speaking that name out loud in years. Rykas once shared a tale with me, though I have lived with fear in my mind ever since. He told me afterwards that I did not have the balance I thought I had. Have you come for the Words of Magi'kot?");
	elseif(e.message:findi("words")) then
		e.self:Say("The Words of Magi'kot can only be shared with those elementalists whose minds are of balance. The Words were separated into three pieces by a high council of Magi who feared that the story would bring an end to elementalists throughout Norrath. If you feel you wish to read from the sacred Power of the Orb then an elementalist of such power should easily accomplish this task.");
	elseif(e.message:findi("what task")) then
		e.self:Say("Bring me the torn pages of Magi'kot. The first section can be found in the depths of a tainted forest, warded by an angry lupine. It is also rumored that one section is found in the haunted estate of a murderer, on a many armed creature. The last may be found in the belly of an amphibian who thirsts for blood.");
	end
end



function event_trade(e)
	local item_lib = require("items");
	local text = "Have you forgotten something, " .. e.other:GetCleanName() .. "?";	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28035})) then
		e.self:Say("What is this? I cannot believe you found it! Where did you get this?");
		e.other:QuestReward(e.self,0,0,0,0,0,50);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 28000,item2 = 28001,item3 = 28002},1,text)) then
		e.self:Say("Rykas may have been right about you, " .. e.other:GetCleanName() .. ". Now, go find Walnan. Walnan was apprenticed to a very powerful Mage. After her apprenticeship was complete, she wished to begin teaching other beings of Norrath. Even those who knew nothing of the art! I do not believe she was successful, though. Seek her out to further your tale. Good luck in your journeys, " .. e.other:GetCleanName() .. "!");
		e.other:QuestReward(e.self,0,0,0,0,28003);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone: commons ID:21043 -- Jahsohn_Aksot

