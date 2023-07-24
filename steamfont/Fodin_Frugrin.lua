------------------------------------------------------------------------------------------------------------------
-- Fodin Frugrin (ID:56177)
-- Zone:   Steamfont (steamfont)
-- Quest:  Telescope Lenses
-- Quest:  Air Tight Box
-- Author: a_sewer_rat
------------------------------------------------------------------------------------------------------------------

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello " .. e.other:GetCleanName() .. ". Have you ever peered beyond our little world? Somewhere out there in the vast darkness is a world filled with great technology and adventure. Our people should concentrate on reaching these distant worlds beyond the sparkling skies.");
	elseif(e.message:findi("who")) then
		e.self:Say("I am Fodin Frugin, observer for the Library of Mechanimagica.");
	elseif(e.message:findi("larkon sent me")) then
		if(e.other:GetFaction(e.self) <= 4) then
			e.self:Say("So they found another young member to attend to their putrid hunt, eh? Take this box. You will notice that your box has ten slots and does not smell very good. That is because each slot must be filled with the diseased livers of infected rats. Hop to it, then! Go get some diseased livers. And if you should get bitten and find yourself diseased or poisoned, be sure to visit the Abbey of Deep Musing. They have healers who can cure disease. Do not forget to return the box to Larkon");
			e.other:SummonCursorItem(17923); --air tight box (container)
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("There is much more you must do for the Library of Mechanimagica before such things can be revealed to you.  Perhaps fetching minotaur horns and returning them to Professor Theardor will earn you membership to the Library of Mechanimagica.");
		else
			e.self:Say("You dare to speak to a member of the Eldritch Collective! You had best leave before you find your soul displaced from your body.");
		end	
	elseif(e.message:findi("lens")) then
		if(e.other:GetFaction(e.self) <= 4) then
			e.self:Say("Spare Telescopic Lens?? I am sorry but I don't have any spares right now.. Oh wait!! I do. Here you are my friend. Careful with that. They are very rare.");
			e.other:SummonCursorItem(13277); --telescope lens [fodin's lens]
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("There is much more you must do for the Library of Mechanimagica before such things can be revealed to you.  Perhaps fetching minotaur horns and returning them to Professor Theardor will earn you membership to the Library of Mechanimagica.");
		else
			e.self:Say("You dare to speak to a member of the Eldritch Collective! You had best leave before you find your soul displaced from your body.");
		end
	end
end
