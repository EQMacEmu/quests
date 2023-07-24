-- Instead of using qglobals, tracking conversation status this way instead
-- Needs to reset on zoning which can't be done with qglobals
-- Sony has some sort of temporary character flag that deletes on zone-out
local stateTable = {}; -- key is player name, value is conversation state
local entries = 0;
local headTable = {}; -- remember who turned in a head; this persists after zoning

local RESPONSES = {
	"Askr looks up at you and when he does, you take note of the scraggly beard on his weather-worn face; the scent of ale permeates your senses and pushes you to look away slightly. In an apparent drunken stupor, Askr begins to speak with surprising clarity. 'Here to wash the windows and clean the flooring, are you? No? Well, you can't be much help then. And the likes of you obviously wouldn't be able to get rid of the massive problem we're having. Bah, says I. You can help me no more than any of these other vagrants. Leave me alone to my ale and my misery.'",
	"Askr the Lost says 'Did you not hear me? If you're not here to help, then go elsewhere. I am so very busy... busy with ale, busy with misery... hah, that rhymed!'",
	"Askr raises an eyebrow your way, as though he is becoming slightly irritated by your constant babble. He goes back to his drinking with hopes that you'll leave him alone long enough to drink in peace.",
	"",
	"The drunken stupor that Askr had been in earlier appears to vanish in an instant; a glimmer of hope now flashes in the depths of his eyes. 'This is the head of a giant... a storm giant from outside the caves.' Askr ponders what this revelation could mean. He mutters to himself, 'If it is possible that someone has indeed bested a giant here in the planes, then perhaps it is possible...' He looks back at you very sternly and asks, 'Tell me now and be truthful, was it you who severed the head of this giant from his body?'",
	"Askr the Lost says 'Truly, I am amazed that someone of your caliber was able to do what I could not. I have been stuck in these desolate caves for so long, I had almost lost hope that I would ever find a way to get rid of those accursed giants. But you...  you have been able to best at least one of them. It is reasonable to suggest that if you are able to dispatch one, you may be able to dispatch others. I need to know for sure if you are as capable an individual as it appears you are. This is very important, so are you paying attention?'",
	"Askr the Lost says 'This place was once beautiful and serene, with the great Karana's showers falling day and night soothing the lands and the creatures that inhabit it. Alas, there was an invasion of a superior force -- the storm giants which you have encountered. They laid waste to the lands, burned down trees, and have caused so much havoc I don't even know what is to become of it. Originally, they came as one group and crossed the breadth of the land pillaging and plundering all that they could find. Over time, though, they grew apart and distinct factions grew around Mount Grenidor.' [continue]",
	"Askr the Lost says 'To the south of Grenidor lay Srerendi, Shores of the Lost and the Srerendi storm giants. Born of the ocean and the cool air, they lay claim to the shores and the plains inland as their own. To the west of Grenidor lay Krendic, Sands of Chaos and the Krendic storm giants. They have skin that is thick as dirt and blend in well with their surroundings. To the north of the great mount lay Kelek`Vor, the Forest of Tears and the Kelek`Vor storm giants. They are born of the wood and take great pleasure in seeing it used to their own purposes.' [continue]",
	"Askr the Lost says 'I must know if you are truly capable of defeating the storm giants that abound here. To do this, you must slay one of each of the three factions and return to me something specific to each tribe: from the Srerendi storm giants, return their shorn beard; from the Krendic storm giants, a piece of their rocky carcass; from the Kelek`Vor storm giants, the crest from their warrior garments. These three items will ensure that you indeed do have the ability to defeat the foul denizens that have seized control of these lands. When you have acquired the three of these items, seal them in this bag and return them to me, so that I know that you are indeed capable of fulfilling a hero's destiny.'",
	"",
	"Askr looks over the remnants of the storm giants in his hands then looks up at you with a glimmer of hope in his eyes. 'Then it's true! You have the means to push back the scourge of giants... you must go forth to the Bastion of Thunder and finish there what you have started here. It is imperative that you clear the forces of giants from the Bastion so that order can be restored to the thunderous reaches beyond.'",
	"Askr the Lost says 'To be honest, I cannot say that it is entirely possible, what with the ferocity of the giants and their reluctance to leave the lands they now inhabit. From what I do know, each of the Leaders of each tribe has one piece to allow entrance into the Bastion of Thunder. When two of these pieces are combined, they form an esoteric medallion that allows instant passage to the thunderous plains beyond. If you can find and seal two pieces of the medallion in this bag, I will be able to forge them into the medallion that will help you on your journey.'",
	"",
	"Askr the Lost says 'You have retrieved the pieces! You are well on your way to pushing forth on your quest to return balance to the plains of thunder. The most difficult part lies before you... deep in the heart of Mount Grenidor, there is a tempest that rages on eternally. It is there that you must present your medallion to the skies above to be transported to the citadel of thunderous might. Take the medallion and go forth, then deliver these storm giants to their creator!'",	
	"Askr the Lost says 'A hearty welcome back to you, friend. You have the means to push back the scourge of giants... you must go forth to the Bastion of Thunder and finish there what you have started here. It is imperative that you clear the forces of giants from the Bastion so that order can be restored to the thunderous reaches beyond.'",
	"Askr the Lost says 'You have returned to me, but for what purpose? You already have the way to the Bastion of Thunder, so please make haste there and rid the Bastion of those horrid storm giants! Only then may the balance that once ruled over these thunderous lands return to its rightful place.'",
	"Askr points drunkenly towards the exit of the cave. 'Have you not seen the foul denizens of destruction outside? Hrmph! Going everywhere they please, pillaging, plundering... I'm lucky to have survived this long. Bah, it doesn't matter, there's nothing that anyone can do to stop them, and that is why I'm still stuck here with my *hic* potions.'",
	"Askr the Lost says 'I was afraid you would not return to finish the noble story you had started! But now I see my worries were ill placed. You have proven yourself a worthy adversary to even the mightiest of foes, but your journey does not end here! Seek me out that which I require and let your story continue on its way to greatness!'",
	"Askr the Lost says 'You did well defeating one giant, but you have yet to prove that you are able to best giants from each tribe. I bid you luck friend, but you must go forth before I can speak with you more.'",
	"Askr merely glances at you with a questioning look, as though he doesn't know what that is to be used for. Perhaps you should speak with him to clarify.",
};

function event_timer(e)
	-- periodocally check if players have left the zone, then clear their quest status if so
	if ( e.timer == "checkreset" ) then
	
		local mob;
		local elist = eq.get_entity_list();
		
		for name, id in pairs(stateTable) do
		
			mob = elist:GetClientByName(name);
			
			if ( not mob or not mob.valid ) then
				stateTable[name] = nil;
				entries = entries - 1;
				--eq.debug(name.." deleted from Askr the Lost conversation memory", 3);
			end
		end
	end
	if ( entries == 0 ) then
		eq.stop_timer(e.timer);
		--eq.debug("memory timer stopped for Askr the Lost", 3);
	end
end

function GetState(name, karana)

	local state = 1;
	
	if ( not stateTable[name] ) then
		stateTable[name] = state;
		
		if ( entries == 0 ) then
			eq.set_timer("checkreset", 15000);
			--eq.debug("memory timer started for Askr the Lost", 3);
		end
		entries = entries + 1;		
	end
	return stateTable[name];
end

function SetState(name, state)
	stateTable[name] = state;
end

function event_say(e)

	local name = e.other:GetName();
	local qglobals = eq.get_qglobals(e.other);
	local karana = tonumber(qglobals.karana or 0);
	if ( qglobals.zebuxoruk ) then
		karana = 4;
	end
	local state = GetState(name, karana);

	if ( karana == 0 ) then
	
		if ( e.message:findi("hail") ) then
		
			if ( headTable[name] ) then
				e.other:Message(0, RESPONSES[18]);
				state = 8;
				SetState(name, state);
			end

			if ( state <= 3 ) then
				e.other:Message(0, RESPONSES[state]);
				SetState(name, state + 1);
			end
			
		elseif ( e.message:findi("massive problem") ) then
			e.other:Message(0, RESPONSES[17]);
			
		elseif ( e.message:findi("it was me") ) then
			if ( state == 6 ) then
				e.other:Message(0, RESPONSES[state]);
				SetState(name, state + 1);
			end
		
		elseif ( e.message:findi("paying attention") ) then
			if ( state == 7 ) then
				e.other:Message(0, RESPONSES[state]);
				SetState(name, state + 1);
			end
			
		elseif ( e.message:findi("yes") ) then
			if ( state == 6 or state == 7 ) then
				e.other:Message(0, RESPONSES[state]);
				SetState(name, state + 1);
			end
		
		elseif ( e.message:findi("continue") ) then
			if ( state == 8 or state == 9 ) then
				e.other:Message(0, RESPONSES[state]);
				if ( state == 9 ) then
					e.other:SummonCursorItem(17192); -- Askr's Bag of Verity
				end
				SetState(name, state + 1);
			elseif ( state > 9 ) then
				e.other:Message(0, RESPONSES[19]);
			end
		end
		
	elseif ( karana == 1 ) then
	
		if ( e.message:findi("hail") ) then		
			e.other:Message(0, RESPONSES[15]);
			
		elseif ( e.message:findi("bastion of thunder") ) then
			e.other:Message(0, RESPONSES[12]);
			e.other:SummonCursorItem(17192); -- Askr's Bag of Verity
			SetState(name, state + 1);
		end
	
	elseif ( karana >= 2 ) then
	
		if ( e.message:findi("hail") ) then		
			e.other:Message(0, RESPONSES[16]);
		end
	
	end
	
end

function event_trade(e)
	local karana = tonumber(eq.get_qglobals(e.other).karana or 0);
	local item_lib = require("items");
	
	if ( item_lib.check_turn_in(e.self, e.trade, { item1 = 28749 }) -- wind giant head
		or item_lib.check_turn_in(e.self, e.trade, { item1 = 28781 }) -- desert giant head
		or item_lib.check_turn_in(e.self, e.trade, { item1 = 28782 }) -- forest giant head
	) then
	
		e.other:Message(0, RESPONSES[5]);
		e.other:QuestReward(e.self, 0, 0, 0, 0, 0, 1);
		e.other:SummonCursorItem(11486); -- returns a 'Storm Giant Head' that doesn't work for turn-in
		SetState(e.other:GetName(), 6);
		headTable[e.other:GetName()] = true;
	end
	
	if ( item_lib.check_turn_in(e.self, e.trade, { item1 = 11487 }) ) then -- Askr's Sealed Bag of Verity
	
		if ( karana == 0 ) then		
			e.other:Message(0, RESPONSES[11]);
			e.other:QuestReward(e.self, 0, 0, 0, 0, 0, 1000);
			eq.set_global("karana", "1", 5, "F");
			e.other:Message(15, "You have received a character flag!");
			SetState(e.other:GetName(), 12);
		end
	end
	
	if ( item_lib.check_turn_in(e.self, e.trade, { item1 = 11488 }) ) then -- Esoteric Meld
	
		if ( karana == 1 ) then		
			e.other:QuestReward(e.self, 0, 0, 0, 0, 0, 10000);
			eq.set_global("karana", "2", 5, "F");
			e.other:Message(15, "The mystical medallion given to you by Askr settles around your neck and then disappears into nothingness. There is no call for alarm, for the medallion is now a part of your soul.");
			e.other:Message(0, RESPONSES[14]);
			e.other:Message(15, "You have received a character flag!");
		else
			e.other:Message(0, RESPONSES[20]);
			e.other:SummonCursorItem(11488);
		end
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end
