function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("How are you? Welcome to the Academy of Arcane Science. Please feel free to roam. May knowledge be your goal. Be you a [fellow scientist] or visitor, I am sure you will find whatever you seek.");
	elseif(e.message:findi("fellow scientist")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("That is good. I hope you can handle the knowledge of arcane science. Some have gone mad conducting research. Such a person is [Lydl Mastat].");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The word of mouth in the Academy of Arcane Science is that you are no foe, but you have yet to prove your worth to us. Perform more tasks for the great Tara Neklene.");
		else
			e.self:Say("You had best leave my sight. I am a faithful member of the Academy of Arcane Science and you are no ally of ours.");
		end
	elseif(e.message:findi("lydl mastat")) then
		e.self:Say("Lydl Mastat is nothing more than a young apprentice of mine. He went mad working on a formula for deep water breathing. He now roams the outskirts of Freeport boasting of power he does not have. Someone should [teach Lydl a lesson].");
	elseif(e.message:findi("teach lydl a lesson")) then
		e.self:Say("Then go. He appears near the gates of Freeport from time to time. He is not powerful, but he has a secret. Nothing save magic can harm him. This was the result of an experimental potion he drank. Slay him and return his locked spellbook to me.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13863})) then -- A Locked Book
		e.self:Say("You have done the world of magic a great justice, " .. e.other:GetCleanName() .. ".");
		e.other:Faction(e.self,220,10,0); -- Arcane Scientists
		e.other:Faction(e.self,281,2,0); -- Knights of Truth
		e.other:Faction(e.self,296,-1,0); -- Opal Dark Briar
		e.other:Faction(e.self,330,-1,0); -- Freeport Militia
		e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(5),0,0,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Hemia_Skemner
