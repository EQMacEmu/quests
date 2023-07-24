-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Eh!!? What do I see before me? A young upstart? Some child pretending to be a great mind? If you wish to test your mettle then you will assist Tergon. Will you [Help Tergon] or are you far [too superior] to deal with such things?");
	elseif(e.message:findi("help")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- Needs amiably or better
			e.self:Say("No!! You will help yourself. Your task shall find your skills tested. Succeed and knowledge is yours. Fail and death shall embrace you. Go to the Steamfont Mountains and seek out a troll named Bugglegupp. As a youngster I once tried to attack the beast with a device of mine. It sent an Iron Pellet deep into the beasts head. Kill Bugglegupp and return the Iron Pellet. I hope the Pellet does not get lost in the battle.");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("There is much more you must do for the Library of Mechanimagica before such things can be revealed to you.  Perhaps fetching minotaur horns and returning them to Professor Theardor will earn you membership to the Library of Mechanimagica.");
		else
			e.self:Say("You dare to speak to a member of the Eldritch Collective! You had best leave before you find your soul displaced from your body.");
		end
	elseif(e.message:findi("too superior")) then
		e.self:Say("Well excuse me!! your majesty. Please forgive my arrogance. Now get out of here, before you stink this place up with that rotting grape you call a brain!");
	elseif(e.message:findi("further tasks")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- Needs amiably or better			
			e.self:Say("Not all experience is gained upon the battlefield. We magicians must heighten our minds to become formidable opponents. I see much promise in you, " .. e.other:GetCleanName() .. ". I will require you to [travel abroad] toward Freeport.");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("There is much more you must do for the Library of Mechanimagica before such things can be revealed to you.  Perhaps fetching minotaur horns and returning them to Professor Theardor will earn you membership to the Library of Mechanimagica.");
		else
			e.self:Say("You dare to speak to a member of the Eldritch Collective! You had best leave before you find your soul displaced from your body.");
		end
	elseif(e.message:findi("travel abroad")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- Needs amiably or better
			e.self:Say("You will go to Freeport and seek out the Academy of Arcane Science. There you shall find my brother Retlon. He has scribed some new spells in my [personal spellbook]. Hand him this note as proof of your alliance. He works closely with Master Dooly Jonkers.");
			e.other:SummonCursorItem(1717); -- Item: Sealed Letter
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("There is much more you must do for the Library of Mechanimagica before such things can be revealed to you.  Perhaps fetching minotaur horns and returning them to Professor Theardor will earn you membership to the Library of Mechanimagica.");
		else
			e.self:Say("You dare to speak to a member of the Eldritch Collective! You had best leave before you find your soul displaced from your body.");
		end
	elseif(e.message:findi("defector")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- Needs amiably or better
			e.self:Say("It seems a gnome magician by the name of Toko Binlittle has gone and left the guild. He joined forces with the [Pirates of Gunthak]. Find him. He must be destroyed. Our secrets cannot be known. Return his head to me and I shall give you the [Elemental Grimoire].");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("There is much more you must do for the Library of Mechanimagica before such things can be revealed to you.  Perhaps fetching minotaur horns and returning them to Professor Theardor will earn you membership to the Library of Mechanimagica.");
		else
			e.self:Say("You dare to speak to a member of the Eldritch Collective! You had best leave before you find your soul displaced from your body.");
		end
	elseif(e.message:findi("pirates of gunthak")) then
		e.self:Say("From what I know, the Pirates of Gunthak are from the southern Gulf of Gunthak. It seems as though a small band of them has been operating within the Ocean of Tears, leagues from their own territory.");
	elseif(e.message:findi("elemental grimoire")) then
		if(e.other:GetFactionValue(e.self) >= 0) then -- Needs indifferent
			e.self:Say("The Elemental Grimoire contains the knowledge which will advance your techniques in research. With it you shall learn to research spells and scribe them for your own spellbook.");
		else
			e.self:Say("You dare to speak to a member of the Eldritch Collective! You had best leave before you find your soul displaced from your body.");
		end
	elseif(e.message:findi("personal spellbook")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- Needs amiably or better
			e.self:Say("My spellbook is very important to me. It is impossible for anyone to open it. I have magically locked it. Only my brother Retlon knows the words to release its secrets.");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("There is much more you must do for the Library of Mechanimagica before such things can be revealed to you.  Perhaps fetching minotaur horns and returning them to Professor Theardor will earn you membership to the Library of Mechanimagica.");
		else
			e.self:Say("You dare to speak to a member of the Eldritch Collective! You had best leave before you find your soul displaced from your body.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13333})) then
		e.self:Say("So, you have survived. There is no doubt in my mind that you achieved this solely with your own powers. Only a dim one requires the assistance of others. Take this. May it help you in your pursuit of greatness. [Further tasks] may bring you to that point.");
		e.other:Faction(e.self,245,15); -- Faction: Eldritch Collective
		e.other:Faction(e.self,238,-2); -- Faction: Dark Reflection
		e.other:Faction(e.self,239,-1); -- Faction: The Dead
		e.other:Faction(e.self,255,2); -- Faction: Gem Choppers
		e.other:Faction(e.self,333,2); -- Faction: King Ak'Anon
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(15400,15397,15399,15398,15317,15058),150); -- Item(s): Spell: Elementaling: Air (15400), Spell: Elementaling: Earth (15397), Spell: Elementaling: Fire (15399), Spell: Elementaling: Water (15398), Spell: Elementalkin: Air (15317), Spell: Elementalkin: Earth (15058)
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13387})) then
		e.self:Say("You have done well. I did not expect you for weeks. It is good to have my spellbook returned. It was a simple task. Now I have news of a larger matter. It has to do with a [defector].");
		e.other:Faction(e.self,245,10); -- Faction: Eldritch Collective
		e.other:Faction(e.self,238,-1); -- Faction: Dark Reflection
		e.other:Faction(e.self,239,-1); -- Faction: The Dead
		e.other:Faction(e.self,255,1); -- Faction: Gem Choppers
		e.other:Faction(e.self,333,1); -- Faction: King Ak'Anon
		e.other:QuestReward(e.self,0,0,0,0,15399,150);
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13388})) then
		e.self:Say("The Elemental Grimoire contains the knowledge which will advance your techniques in research. With it you shall learn to research spells and scribe them for your own spellbook.");
		e.other:Faction(e.self,245,20); -- Faction: Eldritch Collective
		e.other:Faction(e.self,238,-3); -- Faction: Dark Reflection
		e.other:Faction(e.self,239,-1); -- Faction: The Dead
		e.other:Faction(e.self,255,3); -- Faction: Gem Choppers
		e.other:Faction(e.self,333,3); -- Faction: King Ak'Anon
		e.other:QuestReward(e.self,0,0,0,0,17502,300); -- elemental grimoire
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
