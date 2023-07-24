function event_say(e)
	if((e.message:findi("Hail")) and (e.self:GetX()==924) and (e.self:GetY()==958)) then
		e.self:Say("Shhhh....keep your voice down lest you wake Alaria. We can [speak elsewhere] if you wish.");
	elseif((e.message:findi("speak elsewhere")) and (e.self:GetX()==924) and (e.self:GetY()==958)) then
		e.self:Say("Follow me and we shall discuss how you may assist me with my [current research].");
		eq.start(16);
	elseif((e.message:findi("current research")) and (e.self:GetX()==820) and (e.self:GetY()==930)) then
		e.self:Say("Recently patrols have been sent to the Stonebrunt Mountains to investigate rumors of an alliance between the Kejekans and Erudin. There is much spiritual activity in that region of Odus and the patrols have reported encountering massive beasts called Titans. These titans exhibit abilities that lead me to believe they are powerful animal spirits that have somehow taken on a physical form in order to enter and manipulate the realm of the living. I require [samples] of the Titans physiology in order to further my research.");
	elseif((e.message:findi("samples")) and (e.self:GetX()==820) and (e.self:GetY()==930)) then
		e.self:Say("There have been sightings of Titans in many forms. The samples I require are the fangs of the leopard, sabretooth, and gorilla titans, and the rattle of the snake titan.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I require all four titan samples in order to pursue the research I desire.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6957, item2 = 6943, item3 = 6959, item4 = 6948},1,text)) then
		e.self:Say("Excellent!! These shall provide valuable information to my research on the spirit realm.");
		e.other:QuestReward(e.self,0,0,0,0,2568,250);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------