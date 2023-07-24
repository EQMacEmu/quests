--Willamina's Needles
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("What?  Oh, sorry.  You appear to be harmless enough.  Never can be too careful these days, you know.  Say. as long as you're here, would you care to have a look at my stock of supplies and see if there's anything you might need?  I worked really hard to scrounge this together, won't you just like to have a look?");
	end
	if(e.message:findi("standard")) then
		e.self:Emote("turns white with fear. 'Ah, so he sent you to rough me up, did he? Fine, but you should know you couldn't hurt me any worse than Agrakath Theric would! I'm in a bit of trouble you see, I owe Agrakath some money I haven't got. So I stole the standard to pay him off. If you could please find him and have him somehow erase my debt, I would gladly give the standard back.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28084})) then--Note to Caden
		e.self:Emote("eyes go wide with relief. 'Oh thank you thank you! Here, take the standard. And do apologize to Boiron for me. It shall never happen again. Again, thank you!'");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,28085,100);--Boiron's Standard
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
