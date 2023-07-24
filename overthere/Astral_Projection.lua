-- Monk Epic 1.0
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("ignores you.");	
	elseif(e.message:findi("yes")) then
		e.self:Say("I assume you have read about us and spoken with the old man, Kaiaren. Since that time, I have grown in power and influence to a point unseen by any mortal. Unfortunately, I will have to demonstrate a small amount of my skill when I destroy you. This is bad. I must decide whether you are worthy to see the techniques I wield, even though you will die shortly thereafter. Tell me, " .. e.other:GetCleanName() .. ", who are you?");
	elseif(e.message:findi("i am the one")) then
		e.self:Emote("chuckles.");
		e.self:Say("Thats quite a boast, " .. e.other:GetCleanName() .. ". All beings strive for nothingness at the most basic level of sentience. However, almost none ever achieve this. Not even I have discarded my ego yet and you stand here and tell me you have? Perhaps you will be a worthy opponent. I shall be waiting in the great lake near here. Take that token as proof of things to come for you. If you still wish to throw your life away so needlessly, return it to my image there. I await your decision.");
		eq.depop_with_timer();
	end
end

function event_trade(e)	
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1686})) then --Trunt's Head
		e.self:Emote("looks up and down.");
		e.self:Say("Hmmm, I was hoping for something more impressive. This is just a small token of the last person who tried to interfere with my plans. He failed as shall you. But tell me truly, are you the one who has so rudely removed my students?");
		e.other:QuestReward(e.self,0,0,0,0,1687); --Eye of Kaiaren
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
