function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("How is life treating you, bud? What are you doing around the mines? Either you are a [member of 628] or you are lost. If you are lost, I can't help you. I ain't no guide.");
		else
			e.self:Say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		end
	elseif(e.message:findi("628")) then
		if(e.other:GetFactionValue(e.self) >= 200) then -- Requires mid amiable
			e.self:Say("It's my duty to assign [guild tasks] to all new members of Mining Guild 628.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Don't take this personally, but I can't quite trust you with such matters. Maybe a few less Butcherblock bandits would prove your worth.");
		else
			e.self:Say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		end
	elseif(e.message:findi("tasks")) then
		if(e.other:GetFactionValue(e.self) >= 200) then -- Requires mid amiable
			e.self:Say("I see you are interested in helping out. Good! For starters, go into the surrounding territory of Kaladim and destroy all the goblins. We hear they sometimes carry necklaces of ornate design. 628 wants these Runnyeye warbeads. You bring me no fewer than four and I will pay you and maybe, just maybe, I may have an extra piercing weapon lying around which has your name on it.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Don't take this personally, but I can't quite trust you with such matters. Maybe a few less Butcherblock bandits would prove your worth.");
		else
			e.self:Say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		end
	elseif(e.message:findi("pick")) then
		if(e.other:GetFactionValue(e.self) >= 200) then -- Requires mid amiable
			e.self:Say("So you want to earn a parrying pick? Consider it an honor that I am even speaking of this with you. The guild had these picks made just for us. It is a magic item used to fend off attacks. Before you can have one, you will have to do me a [great favor].");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Don't take this personally, but I can't quite trust you with such matters. Maybe a few less Butcherblock bandits would prove your worth.");
		else
			e.self:Say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		end
	elseif(e.message:findi("great favor")) then
		if(e.other:GetFactionValue(e.self) >= 200) then -- Requires mid amiable
			e.self:Say("Mater has asked me to exterminate the dwarven family of Dunfire. They were once members of our guild. They left and now use their talents to aid the Butcherblock bandits. We will not allow them to speak of the skills we taught them. Go and rip out their tongues. Return the tongues of Crytil, Rondo, Keldyn, and Barma Dunfire and the parrying pick is yours.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Don't take this personally, but I can't quite trust you with such matters. Maybe a few less Butcherblock bandits would prove your worth.");
		else
			e.self:Say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Didn't I explain to you that I will only reward you upon the return of FOUR Runnyeye warbeads?";
	local text1 = "I called for the Tongues of Crytil, Rondo, Keldyn and Barma!";
	
	if(e.other:GetFactionValue(e.self) >= 200 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13931, item2 = 13931, item3 = 13931, item4 = 13931},1,text)) then -- RunnyEye Warbeads
		e.self:Say("Good work. We shall add these to the stash. Here is your reward, as promised. Be happy with it and continue your work. Maybe soon you shall be able to [earn a parrying pick].");
		-- verified live faction
		e.other:Faction(e.self,322, 10); -- Miners Guild 628
		e.other:Faction(e.self,223, -1); -- Circle Of Unseen Hands
		e.other:Faction(e.self,379, -1); -- Butcherblock Bandits
		e.other:Faction(e.self,241, 1);  -- Deeppockets
		e.other:Faction(e.self,244, -1); -- Ebon Mask
		e.other:QuestReward(e.self,math.random(0,5),math.random(0,5),0,0,eq.ChooseRandom(7007,7008,7009,7010),5000); -- Item(s): Rusty Dagger (7007), Rusty Rapier (7008), Rusty Spear (7009), Rusty Shortened Spear (7010)
	elseif(e.other:GetFactionValue(e.self) >= 200 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12170, item2 = 12172, item3 = 12174, item4 = 12178},1,text1)) then -- Dunfire Tongues
		e.self:Say("Excellent work!! You are quite an asset to this mining guild. Please accept this Parrying Pick 628 for your great service. If you truly wish to serve our guild. Go and speak with Mater. Tell him you are [ready to earn Mining Pick 628].");
		e.other:Faction(e.self,322, 10); -- Miners Guild 628
		e.other:Faction(e.self,223, -1); -- Circle Of Unseen Hands
		e.other:Faction(e.self,379, -1); -- Butcherblock Bandits
		e.other:Faction(e.self,241, 1);  -- Deeppockets
		e.other:Faction(e.self,244, -1); -- Ebon Mask
		e.other:QuestReward(e.self,0,0,0,0,12166,5000); -- Parrying Pick 628
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
