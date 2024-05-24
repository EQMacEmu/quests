-- Converted to .lua by Speedz

function event_say(e)
	if(eq.is_the_ruins_of_kunark_enabled()) then
		if(e.message:findi("hail")) then
			if(e.other:GetFactionValue(e.self) >= 100) then -- Needs amiably or better, the other phrases work at indifferent
				e.self:Say("Be wary, " .. e.other:GetCleanName() .. ", there are unseen powers within these mines that can destroy the strongest warriors or the wisest seers. Do you find the rust that corrodes the mechanisms around you and the decaying forms that wander [these tunnels pleasing]?");
			elseif(e.other:GetFaction(e.self) == 5) then
				e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
			else
				e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
			end
		elseif(e.message:findi("pleasing")) then
			if(e.other:GetFactionValue(e.self) >= 0) then -- Needs indifferent
				e.self:Say("Then perhaps you share the vision of we who have made these mines our home. We are the Dark Reflection and our perceptions have been refined to allow us to see the poisons and disease coursing through every creature's veins and the decay afflicting all forms of matter in Norrath. I can teach you to harness the powers of our divine benefactor if you are [willing to learn] through service to the Dark Reflection.");
			else
				e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
			end
		elseif(e.message:findi("willing.* learn")) then
			if(e.other:GetFactionValue(e.self) >= 0) then -- Needs indifferent
				e.self:Say("Then your first lesson shall be the fulfillment of spreading infection and disease. Some of the best carriers of infectious diseases are rodents. Take this vial containing a slow and painful infection and give it to one of the pregnant giant rodents that can be found outside in the Steamfont Mountains. This way you can spread the disease to not only those creatures which cross the mother's path but also to those who cross the paths of her future offspring. Bring me the empty vial when the task has been completed.");
				e.other:SummonCursorItem(10262); 	-- vial of infectious disease
			else
				e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
			end
		elseif(e.message:findi("components")) then
			if(e.other:GetFactionValue(e.self) >= 0) then -- Needs indifferent
				e.self:Say("The recipe we use to make the plague rat disease is fairly simple. We could easily extract the fluids from the infected rat livers but that would be counterproductive to our cause since it would require the deaths of our rodent carriers. Instead, I need you to collect two parts diseased bone marrow, one sprig of wormwood and one part gnomish spirits to be used as a medium. When you have combined all the components in the container I have provided, return it to me so that we may continue to spread the disease!");
			else
				e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
			end
		end
	else
		if(e.other:GetFactionValue(e.self) >= 100) then -- Needs amiably or better, the other phrases work at indifferent
			e.self:Say("Be wary, " .. e.other:GetCleanName() .. ", there are unseen powers within these mines that can destroy the strongest warriors or the wisest seers."); -- made up dialogue
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18769})) then  -- Stained Note
		e.self:Say("Join us in fulfilling teh will of Bertoxxulous. You can train with us here, in the shadows of the Abbey. Wear this tunic to help conceal your true identity.");
		e.other:Faction(e.self,238,100,0); 	-- Dark reflection
		e.other:Faction(e.self,245,-10,0); 	-- eldritch collective
		e.other:Faction(e.self,255,-10,0); -- gem choppers
		e.other:Faction(e.self,240,-10,0); 	-- Deepmuses
		e.other:QuestReward(e.self,0,0,0,0,13518,20);	-- Tin Patched Tunic*
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10263})) then -- empty infectious vial
		e.self:Say("I hope you enjoyed the thrill of your first lesson and the awakening of your vision. Now you must prove your utility to our society. Take this airtight container and gather the [components] for another dose of the plague rat disease.");
		e.other:Faction(e.self,238,50); 	-- dark reflection
		e.other:Faction(e.self,245,-5); 	-- eldritch collective
		e.other:Faction(e.self,255,-5); 	-- gem choppers
		e.other:Faction(e.self,240,-5); 	-- king ak'anon
		e.other:QuestReward(e.self,0,0,0,0,17357,150); 	-- airtight metal box
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10266})) then
		e.self:Say("It appears that you truly seek to expand your vision into the Dark Reflection, " .. e.other:GetCleanName() .. ". I grant you the Initiate Symbol of Bertoxxulous!");
		e.other:Faction(e.self,238,25); 	-- Dark reflection
		e.other:Faction(e.self,245,-2); 	-- eldritch collective
		e.other:Faction(e.self,255,-2); 	-- gem choppers
		e.other:Faction(e.self,240,-2); 	-- king ak'anon
		e.other:QuestReward(e.self,0,0,0,0,1390,200); 	-- Initiate symbol of Bertoxxulous
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
