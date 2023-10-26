function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, disciple " .. e.other:GetCleanName() .. ". Feel free to inspect my wares. I am here to serve all necromancers of the Dead. I can also enchant a [ring of the Dead] if you have one.");
	elseif(e.message:findi("ring of the dead")) then
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("The ring of the Dead is the mark of loyal members of the his house. One can use it to bind his soul to any point, but only once and then the enchantment is gone. It is my duty to enchant the ring of the Dead once it is drained of all power, but only for a loyal member. I believe you to be loyal. I require the drained ring and ten gold coins.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you learn to serve the Dead, then I will find the time to speak of such things.")
		else
			e.self:Say("You dare to speak to me?"); -- Made up text, need appre dialogue
		end
	end
end

function event_trade(e)
	local item_lib =require("items");
	local text = "Come now.. I said I require the ring of the Dead and 10 gold pieces.";
	
	if(e.other:GetFactionValue(e.self) >= 500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13394, gold = 10},1,text)) then -- Ring of the Dead
		e.self:Say("Here you are, disciple. I have enchanted your ring once more.");
		e.other:QuestReward(e.self,0,0,0,0,13394,0); -- Item: Ring of the Dead (Recharged)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakc  ID:42063 -- Xantis_Ixtax
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
