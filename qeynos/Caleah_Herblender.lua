function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, and welcome to my humble little shop. I sell and trade various goods for my fellow wizards of the Order of Three. My assistants, Hanlore and Drawna, specialize in magicians' and enchanters' goods and would be glad to help you, too.");
	elseif(e.message:findi("bat fur") or e.message:findi("rat whiskers") or e.message:findi("beetle eye") or e.message:findi("experiment")) then
		if(e.other:GetFactionValue(e.self) >= 50) then -- requires mid indifferent
			if(e.message:findi("bat fur") or e.message:findi("rat whiskers") or e.message:findi("beetle eye")) then
				e.self:Say("You can probably find some outside the city gates... in the hills and plains.")
			elseif(e.message:findi("experiment")) then
				e.self:Say("I need someone to gather up the three ingredients for a new spell I'm working on. I need some [rat whiskers], a [fire beetle eye], and a patch of [bat fur]. Thanks for helping me, young " .. e.other:GetCleanName() .. ".");
			end      	
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Though the Order of Three appreciates your past efforts and deeds greatly, we do not feel we can trust you with such an important assignment just yet.");
		else
			e.self:Say("The Order of Three has been monitoring your recent activities, and we are appalled by you and your actions! Now, begone!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "All right. Remember, I need all three ingredients to test this spell out. Keep up the good work, " .. e.other:GetCleanName() .. ".";
  
	if(e.other:GetFactionValue(e.self) >= 50 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13071, item2 = 13069, item3 = 10307},1,text)) then -- requires mid indifferent
		e.self:Say("Hmm. Good job, " .. e.other:GetCleanName() .. ", let's give this a try. Flame and fire. Heat and spark. Touch of Ro, light this dark! Ahh. It stills needs a little work, I guess. Thanks for your help, here's a little something for your effort.");
		-- Confirmed Live Faction
		e.other:Faction(e.self,342,5,0);
		e.other:Faction(e.self,262,1,0);
		e.other:Faction(e.self,221,-1,0);
		e.other:Faction(e.self,296,-1,0);
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,math.random(10),0,0,0,0,300);
	end
	local returned = item_lib.return_items(e.self, e.other, e.trade, false)
	if ( returned ) then
		e.self:Say("Though the Order of Three appreciates your past efforts and deeds greatly, we do not feel we can trust you with such an important assignment just yet.");
	end
end

function event_spawn(e)
	eq.set_timer("repeat",350000);
 end

function event_timer(e)
	e.self:Say("Drawna.. Are we all out of bat fur again?");
	eq.signal(1051,1); -- NPC: Drawna_Opimsor
end

function event_signal(e)
	e.self:Say("Hmmm.. Let's see if we can find someone to help replenish our stock of [rat whiskers] and [bat fur]. I need these items for a new little [experiment] I'm working on.");
end

