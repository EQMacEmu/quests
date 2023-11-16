--Quest: Leatherfoot Raiders

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Stand at attention!! You don't look fit enough to toe-wrestle my grandma!! You cannot be in my squad!! Are you [petitioning] or are you a [visitor]?");
	elseif(e.message:findi("visitor")) then
		e.self:Say("Well, why didn't you say so?! Forgive me for hollering. Allow me to introduce myself. I am Marshal Anrey Leadladle, commander of the [Leatherfoot Raiders].");
	elseif(e.message:findi("leatherfoot raider")) then
		e.self:Say("You must be a visitor. The Leatherfoot Raiders are the elite force of the Guardians of the Vale. I command them. It is good to meet an outsider.");		
	elseif(e.message:findi("petitioning")) then
		if(e.other:GetFactionValue(e.self) >= 200) then -- requires amiably	(200)	
			e.self:Say("So you want to be a [Leatherfoot Raider]? What kind of joke is this? Look at you! You're a mess! Where are you [from]?");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You are in good standing with the Guardians of the Vale. Continue with your good work and then we may speak.")
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("from rivervale")) then	
		if(e.other:GetFactionValue(e.self) >= 200) then -- requires amiably	(200)	
			e.self:Say("So you're from Rivervale?!! You must be some kind of freak. No halfling from Rivervale would look, smell and act anything like you. Well, freak, if you think you're stout enough to be a Leatherfoot Raider, you prove it!! You travel the lands and return to me a polar bear skin, a grizzly bear skin, a shark skin and an alligator skin. Then maybe, just maybe, I will let you wear the cap of a Leatherfoot Raider.");		
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You are in good standing with the Guardians of the Vale. Continue with your good work and then we may speak.")
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("from qeynos") or e.message:findi("from freeport") or e.message:findi("from akanon") or e.message:findi("from kaladim") or e.message:findi("from felwithe") or e.message:findi("from halas") or e.message:findi("from erudin")) then	
		e.self:Say("What!  The only things from there are gnolls and trolls!  Which one are you?!  You kind of look like a troll, but you smell like a gnoll!  Get out of my sight or you will be cleaning the latrine with a toothbrush!")
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 200 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13761,item2 = 13756,item3 = 13075,item4 = 13749})) then -- requires amiably, Polar Bear Skin, Thick Grizzly Bear Skin, Shark Skin, Alligator Skin
		e.self:Say("So I see the young troll has become a young warrior.  You have stepped up to the challenge of the Leatherfoot Raiders, you may wear the petitioner's skullcap, but to receive the true cap of the raiders, bring me the dirk of a fallen Neriak dragoon and the cap I have given you.  Only then can I be sure that you can truly be one of the few and bold, the Leatherfoot Raiders.");
		-- verified live faction
		e.other:Faction(e.self,263,25); -- Faction: Guardians of the Vale
		e.other:Faction(e.self,286,3); -- Faction: Mayor Gubbin
		e.other:Faction(e.self,355,2); -- Faction: Storm Reapers
		e.other:Faction(e.self,292,2); -- Faction: Merchants of Rivervale
		e.other:Faction(e.self,334,-3); -- Faction: Dreadguard Outer
		e.other:QuestReward(e.self,0,0,math.random(10),1,13941,1000); -- Leatherfoot Skullcap
	elseif(e.other:GetFactionValue(e.self) >= 200 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13941,item2 = 13942})) then -- Leatherfoot Skullcap, Dragoon Dirk
		e.self:Say("Congratulations, my young deputy! Welcome to the brotherhood of the Leatherfoot Raiders. You have earned your skullcap. Wear it with pride. You are now one of the elite. Remember our motto, 'Those who risk, prevail'.");
		-- verified live faction
		e.other:Faction(e.self,263,50); -- Faction: Guardians of the Vale
		e.other:Faction(e.self,286,7); -- Faction: Mayor Gubbin
		e.other:Faction(e.self,355,5); -- Faction: Storm Reapers
		e.other:Faction(e.self,292,5); -- Faction: Merchants of Rivervale
		e.other:Faction(e.self,334,-7); -- Faction: Dreadguard Outer
		e.other:QuestReward(e.self,0,0,0,1,12259,5000); -- Leatherfoot Raider Skullcap
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:rivervale  ID:19059 -- Marshal_Anrey
