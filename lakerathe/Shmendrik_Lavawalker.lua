-- EPIC CLERIC

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, good " .. e.other:GetCleanName() .. "!! Be wary near the waters of Lake Rathe! The Riptide goblin king, Lord Bergurgle, has been commanding his minions to murder and rob all who come near it! I am here seeking his death but I am afraid I am no match for all of his subjects. I shall reward you greatly for the death of Lord Bergurgle. I simply ask that you bring me his crown as proof.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28044})) then -- 28044 :  Lord Bergurgle's Crown
		e.self:Emote("shoves the crown into a scorch marked leather satchel and cackles uncontrollably as madness twists his features and flames dance in his eyes. 'You, " .. e.other:GetCleanName() .. ", have reduced the Riptides into chaos! Without a king to keep them in control they will ravage the settlements surrounding this lake! After the slaughter I shall return and easily burn the remainder of the villages and fishing shanties to the ground! None shall escape the fires of the Tyrant!!'");
		e.other:QuestReward(e.self,0,0,0,0,28045); -- Oil of Fennin Ro
		eq.unique_spawn(51138,32,0,160,3630.3,51,192.4); -- NPC: #Natasha_Whitewater
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("I'll slay you like I slaughtered your fellow missionaries! The Triumvirate can not decide the fate of a follower of the Tyrant!!");
		eq.signal(51138,1,2000); -- NPC: #Natasha_Whitewater
	elseif(e.signal == 2) then
		eq.signal(51138,2,2000); -- NPC: #Natasha_Whitewater
	end
end

function event_death_complete(e)
	eq.spawn2(51145,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end

-- Zone:lakerathe  NPC:51012 -- Shmendrik_Lavawalker
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
