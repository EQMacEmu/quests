function event_say(e)
	if(e.message:findi("hail")) then --Part of Shaman Epic 1.0
		e.self:Say("Oh thank Marr you are here, " .. e.other:GetCleanName() .. ". I was beginning to think I would be abandoned in my time of need. I have a [task] for you to complete in the name of my patron Mithaniel Marr.");
	elseif(e.message:findi("task")) then --Part of Shaman Epic 1.0
		e.self:Emote("displays his shield that must once have been shining and regal but is now scoured in cuts, dents, and chipped paint. He says, 'This shield is known as Marr's Promise. It is a sacred relic that was actually used by one of Mithaniel's angels on the Plane of Valor. Its value to our church is immeasurable and I have been charged with the protection of it. However, a patriarch of the false god, Bertoxxulous, is after my shield and me. He must be stopped! Please, destroy him and bring me proof of his death.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "That's one of the fiend's daggers. Quickly, where is the other one?";	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1676,item2 = 1677},1,text)) then --Part of Shaman Epic 1.0
		e.self:Say("Ahh, thank Mithaniel you have put Glaron and his terrible reign to an end! You have done the world a great service by carrying out my instructions. Take this gem and give it to the one who sent you. He will reward you as befits such an accomplished mercenary such as yourself. Oh, and Marr be with you!");
		e.other:QuestReward(e.self,0,0,0,0,1670);
		eq.depop_with_timer();
	end
end

--Submitted by: Jim Mills (Gilmore Girls`Is`Awesome`XOXO)
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------