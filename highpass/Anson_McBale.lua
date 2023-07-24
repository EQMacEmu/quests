function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Beat it, " .. e.other:GetCleanName() .. ",  unless you have something for me.");			
		else
			e.self:Say("Go away! We don't have time for the likes of you.");
		end
	elseif(e.message:findi("see stanos")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("This better be important.");
			eq.unique_spawn(5088,0,0,336,10,45,225); -- NPC: Stanos_Herkanor			
		else
			e.self:Say("Go away! We don't have time for the likes of you.");
		end
	elseif(e.message:findi("stanos")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Are you deaf, bladebait?  Unless you have something for me, you need to leave now, while I am still feeling mellow.  Don't much appreciate folks coming into my little kingdom here and snooping around.");			
		else
			e.self:Say("Go away! We don't have time for the likes of you.");
		end
	elseif(e.message:findi("you")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Just who in the flip do you THINK I am?  Oh, you want my biography?  "..e.other:GetName()..", you are standing on my last nerve.  Old men delight in telling tales about themselves.  Me, I'm busy living those tales at the moment.  If I am still here in thirty years, ask me then.");
		else
			e.self:Say("Go away! We don't have time for the likes of you.");
		end
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("The boss might need some help!");
		local stanos = eq.get_entity_list():GetMobByNpcTypeID(5088); -- Stanos_Herkanor
		if ( stanos.valid ) then
			e.self:MoveTo(stanos:GetX(), stanos:GetY(), stanos:GetZ(), -1, false);
		end

	elseif(e.signal == 2) then
		e.self:Say("Vilnius has always had a good eye for talent.  I think we can trust this one.");
		eq.signal(5088,1); -- NPC: Stanos_Herkanor
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 28014})) then
		e.self:Say("Ah, we have been expecting this. Let me get Stanos, he will want to inspect it first, but here are your coins.");
		e.other:Faction(e.self,332,50,0); -- Faction: Highpass Guards
		e.other:Faction(e.self,329,7,0); -- Faction: Carson McCabe
		e.other:Faction(e.self,331,7,0); -- Faction: Merchants of Highpass
		e.other:Faction(e.self,230,2,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(e.self,330,2,0); -- Faction: The Freeport Militia
		e.other:QuestReward(e.self,0,0,100,25,0,10000);
		eq.unique_spawn(5088,0,0,336,10,45,225); -- NPC: Stanos_Herkanor
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
