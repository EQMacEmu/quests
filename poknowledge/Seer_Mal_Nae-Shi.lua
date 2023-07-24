--[[
	Character flags
	---------------
	mavuin				- Mavuin flag series (three values)
	seventh				- all PoJ trial marks obtained, said 'information' to Tribunal.  No Seer text for this flag apparently (one value)
	thelin				- PoNightmare flag series (four values)
	poi_door			- Plane of Innovation door openable: Xanamech killed (one value)
	zeks				- PoI Giwin flags + Zeks in Tactics (seven values)
	fuirstel			- PoDisease and CoD flag series (five values)
	grummus				- Grummus planar projection and access to CoD (one value) Grummus grants two flags: this and one for the fuirstel series
	aerindar			- Aerin`Dar flag; access to HoH (two values; first value is hidden PP hail flag)
	bertox_key			- Access to Bertoxxulous level in CoD (needed to use chair teleport)
	hohtrials			- HoH trials; 3 characters long; either a 1 or 0 for each trial, like "110"
	mmarr				- Mith Marr cipher half (one value)
	mmarr_book			- Mith Marr book half; combined with karana to make zebuxoruk flag; Marr planar projection grants two flags (one value)
	tylis				- Tylis flags for PoTorment (two values)
	saryrn				- Saryrn (one value)
	karana				- Askr + Karana flags (four values)
	cipher				- cipher of druzzil; deletes mmarr, saryrn flags (one value)
	sol_room			- Flags of the five Solusek Tower wings; 5 characters long; either a 1 or 0 for each wing, like "01101"
	zebuxoruk			- deletes mmarr_book and karana flags; Air, Earth, Water plane access at value "2" (two values)
	pofire				- PoFire flag and preflag (two values)
	time				- PoTime series (1 value)
	earthb_key			- 
	
	Checklist flags - temporary flags that turn into character flags when you unlock memories with the proper preflags
	---------------
	cl_grummus
	cl_maze
	cl_behemoth
	cl_aerindar
	cl_terris
	cl_bertox
	cl_keeper
	cl_saryrn
	cl_vallon
	cl_tallon
	cl_rallos
	cl_karana
	cl_mmarr
	cl_mmarr_book
	cl_solusek
]]

local checklistFlags = {
	{ "cl_grummus", -- checklist flag qglobal
	  -- unlock memories text without preflags
	  "You remember seeing a small trinket by Grummus' body and wondering what it was for. Perhaps speaking to someone near the Plane of Disease will shed some light on the situation.",
	  -- unlock memories text after obtaining preflags and new character flag granted
	  "For a moment you pause, sticking a hand in your pocket.  Inside you find the small ward that was lying near Grummus' body, perhaps you should bring this to Milyk.",
	  "fuirstel", "1", -- the flag needed to unlock
	  "fuirstel", "2" -- the new unlocked character flag value
	},
	{ "cl_maze",
	  "", -- note: this checklist flag does not appear to have 'unlock memories' text associated with it.  At least one Live
	  "Thelin speaks in your mind, 'It was an act of kindness to help me in the maze before you knew I was in need of help.  Please finish your task and free me from Terris' grasp.'",
	  "thelin", "1",
	  "thelin", "2"
	},
	{ "cl_behemoth",
	  "", -- note: this checklist flag does not appear to have 'unlock memories' text associated with it.  At least one Live
	  "Giwin Mirakon's image appears in your mind, 'Sorry for the misunderstanding, I forgot that I asked you to test the machine for me.  The Zeks will be proud of your warrior spirit, meet me in the Plane of Tactics.",
	  "zeks", "1",
	  "zeks", "2"
	},
	{ "cl_aerindar",
	  "You have defeated Aerin`Dar but have yet to learn the true meaning of Justice.",
	  "You have learned the meaning of both Justice and Honor.  You may now pass into the Halls of Honor.",
	  "mavuin", "3",
	  "aerindar", "2"
	},
	{ "cl_terris",
	  "Terris still haunts your nightmares whenever you attemt to recall your battle with her.",
	  "You black out for a moment, in your nightmare you see Terris-Thule, still alive.  There is a blur which seems like hours, finally you manage to strike Terris down with Thelin's dagger.  Terris' image flutters for a moment and you see Thelin's image, 'Finally, you have freed me from nightmare.  I thank you, my friend.'",
	  "thelin", "2",
	  "thelin", "3"
	},
	{ "cl_bertox",
	  "As you recall your memory of your battle against the Plaguebringer, an image of the Fuirstel brothers flashes through your mind.",
	  "You focus back to your battle with the Plaguebringer, memories of his death give you a moment of clarity.  You now have the knowledge to help Milyk.",
	  "fuirstel", "3",
	  "fuirstel", "4"
	},
	{ "cl_keeper",
	  "Although it was kind of you to help him, Tylis still seems to have no idea who you are.",
	  "Tylis voice rings in your ears, 'Now I remember you.  Thank you for saving me, your spirit now may access places in my prison where it could not.  Beware Sorrowsong.'",
	  "tylis", "1",
	  "tylis", "2"
	},
	{ "cl_saryrn",
	  "You attempt to recall your defeat of Saryrn, but whenever you try to focus you feel a searing pain on your arm.",
	  "You feel the searing pain of torment as half of the Cipher of the Gods glows on your arm.",
	  "tylis", "2",
	  "saryrn", "1"
	},
	{ "cl_vallon",
	  "Vallon fell before you with great ease, you seem to remember some strange pouches around his body, but... well it is probably nothing.",
	  "Giwin's invitation to Drunder reminds you of some notes you found around Vallon's body.",
	  "zeks", "2",
	  "zeks", "3"
	},
	{ "cl_tallon",
	  "Tallon fell before you with great ease, you seem to remember some strange pouches around his body, but... well it is probably nothing.",
	  "Giwin's invitation to Drunder reminds you of some notes you found around Tallon's body.",
	  "zeks", "2",
	  "zeks", "4"
	},
	{ "cl_rallos",
	  "Your heart beat speeds as you recall the Warlord's flaming axe, behind the dark sockets of his helm you sense darker intentions.",
	  "The Cipher on your arm glows for a moment, the booming voice of the Warlord rings through your ears, 'You have finally earned the right to claim you have 'defeated' me.'",
	  "zeks", "6",
	  "zeks", "7"
	},
	{ "cl_karana",
	  "You recall meeting with Karana, but the memory is clouded.  You sense that the answer you seek may be in Storms.",
	  "As you think back to your meeting with Karana the Talisman in your chest warms and a light rain falls from the sky.  When you look down, a small book written in a language you can not read, rests in your hands.",
	  "karana", "3",
	  "karana", "4"
	},
	{ "cl_mmarr",
	  "An Image of Mithaniel flashes before you, 'You have yet to earn a place of Honor.  When you have, we will speak again.'",
	  "An Image of Mithaniel flashes before you, 'You have finally earned a place of Honor.  Wear this Cipher with pride.'",
	  "hohtrials", "111",
	  "mmarr", "1"
	},
	{ "cl_mmarr_book",
	  "An image of Mithaniel flashes before you.  He looks up from a small book in his hands and smiles at you, 'You have not yet earned the Honor to see these words.'",
	  "An Image of Mithaniel flashes before you, 'These notes should assist you on your quest for the Fallen.  Justify the Honor that you have been given.'",
	  "hohtrials", "111",
	  "mmarr_book", "1"
	},
	{ "cl_solusek",
	  "Besting the Burning Prince proves your might, but you still must prove your warrior's spirit.",
	  "", -- might be blank? I got a flag without purple text
	  "zeks", "7",
	  "pofire", "2"
	}
};

function GuidedMeditation(client)
	local qglobals = eq.get_qglobals(client);

	-- these are in order as they are in Sony's code

	if ( qglobals.time ) then
		client:Message(257, "Your soul has formed a bond with the Plane of Time.  You can now pass through the portal in the Plane of Tranquility safely.");
	end

	if ( qglobals.zebuxoruk ) then
		if ( qglobals.zebuxoruk == "1" ) then
			client:Message(257, "The History translated for you reveals the fate of Zebuxoruk.  Trapped in the Plane of Time you must gain the power of the elements to gain entrance.");
		elseif ( qglobals.zebuxoruk == "2" ) then
			client:Message(257, "Learning of Zebuxoruk's fate, the only way to save him is gather materials that will allow you to power up the machine to send you into the Plane of Time.  Maelin has charged you with finding an elemental power source sufficient to activate Meldrath's time machine.");
		end
		
		-- sanity checks
		if ( qglobals.mmarr_book ) then
			eq.delete_global("mmarr_book");
		end
		if ( qglobals.karana ) then
			eq.delete_global("karana");
		end
	end

	if ( qglobals.mmarr_book ) then
		client:Message(257, "The information obtained from Mithaniel is written in a language that you cannot comprehend.");
	end

	if ( qglobals.karana and not qglobals.zebuxoruk ) then
	
		if ( qglobals.karana == "1" ) then
			client:Message(257, "You have shown your prowess in battle to Askr, now you must make strides to get to the Bastion of Thunder.");
		elseif ( qglobals.karana == "2" or qglobals.karana == "3" ) then
			client:Message(257, "You have obtained the Talisman of Thunderous Foyer from Askr, he seeks further assistance in the Bastion of Thunder.");
		elseif ( qglobals.karana == "4" ) then
			client:Message(257, "The information obtained from Karana is written in a language that you cannot comprehend.");
		end
	end

	if ( qglobals.cipher ) then
		client:Message(257, "The Cipher of the Divine Language appears on your arms for a brief moment then fades.");
		
		-- sanity checks
		if ( qglobals.saryrn ) then
			eq.delete_global("saryrn");
		end
		if ( qglobals.mmarr ) then
			eq.delete_global("mmarr");
		end
	end
	
	if ( qglobals.saryrn ) then
		client:Message(257, "Saryrn been destroyed.  An aura surrounds the mystical symbols that have appeared on your arm.");
	end

	if ( qglobals.mmarr ) then
		client:Message(257, "Mithaniel has been bested.  An aura surrounds the mystical symbols that have appeared on your arm.");
	end
	
	if ( qglobals.hohtrials ) then
	
		if ( qglobals.hohtrials == "111" and (qglobals.mmarr or qglobals.cipher) ) then
			client:Message(257, "You have completed all of Honor's Trials.");
		else
			if ( qglobals.hohtrials:sub(1, 1) == "1" ) then
				client:Message(257, "You have beaten Rydda`Dar in the first of Honor's Trials.");
			end
			if ( qglobals.hohtrials:sub(2, 2) == "1" ) then
				client:Message(257, "You have saved the villagers in the second of Honor's Trials.");
			end
			if ( qglobals.hohtrials:sub(3, 3) == "1" ) then
				client:Message(257, "You have defeated the nomads in the third of Honor's Trials.");
			end
		end
	end
	
	if ( qglobals.aerindar and qglobals.aerindar == "2" ) then
		client:Message(257, "You have bested Aerin`Dar and proven yourself honorable enough to pass into Mithaniel's Halls.");
	end

	if ( qglobals.mavuin ) then
		if ( qglobals.mavuin == "1" ) then
			client:Message(257, "The evidence of Mavuin is the only thing that can save him now.");
		elseif ( qglobals.mavuin == "2" ) then
			client:Message(257, "Having endured the trials, the Tribunal has agreed to reconsider Mavuin's case.");
		elseif ( qglobals.mavuin == "3" ) then
			client:Message(257, "Mavuin is grateful to you for taking his case before the Tribunal.  The information provided to you, that Mithaniel Marr and Karana carry information you should seek, could be quite useful.");
		end
	end
	
	if ( qglobals.tylis ) then
		if ( qglobals.tylis == "1" ) then
			client:Message(257, "Tylis is being tortured by Saryrn.  The only way for him to get away from his misery is to escape from the Plane of Torment.");
		elseif ( qglobals.tylis == "2" ) then
			client:Message(257, "Tylis has been removed from his agony.");
		end
	end
	
	if ( qglobals.thelin ) then
		if ( qglobals.thelin == "1" ) then
			client:Message(257, "Thelin being tormented by the imagery of Terris Thule needs assisstance escaping from the Plane of Nightmares.");
		elseif ( qglobals.thelin == "2" ) then
			client:Message(257, "Thelin has completed his pact with Terris Thule, but has been refused. The only way to escape his torment now is to destroy Terris Thule.");
		elseif ( qglobals.thelin == "3" ) then
			client:Message(257, "Terris Thule's grasp over Thelin has been released.");
		elseif ( qglobals.thelin == "4" ) then
			client:Message(257, "Saved from a world of eternal nightmares, Thelin is forever in your debt.");
		end
	end
	
	if ( qglobals.fuirstel ) then
		if ( qglobals.fuirstel == "1" ) then
			client:Message(257, "Alder Fuirstel wishes you to obtain the Ward from the Plane of Disease and take it to his ill brother Milyk.");
		elseif ( qglobals.fuirstel == "2" ) then
			client:Message(257, "Grummus has been destroyed, about his corpse you found a small ward to protect from disease.");
		elseif ( qglobals.fuirstel == "3" ) then
			client:Message(257, "Milyk has been saved from certain death, but is not recovering.  Only by destroying the ruler of all things pestilent will his curse be lifted.");
		elseif ( qglobals.fuirstel == "4" ) then
			client:Message(257, "Bertoxxulous has been slain, the curse from Milyk now lifted.");
		elseif ( qglobals.fuirstel == "5" ) then
			client:Message(257, "Saved from certain doom, Milyk and Adler are forever in your debt.");
		end
	end

	if ( qglobals.grummus ) then
		client:Message(257, "Now that Grummus has been destroyed, the entrance to the Crypt of Bertoxxulous should open before your might.");
	end
	
	if ( qglobals.pofire ) then
	
		if ( qglobals.pofire == "1" ) then
			client:Message(257, "The portal into the Plane of Fire has been altered.  Miak needs you to find the correct way to channel the portal.");
			
			if ( qglobals.sol_room ) then
			
				if ( qglobals.sol_room:sub(1, 1) == "1" ) then
					client:Message(257, "Xuzl's arcane wisdom pulses in your mind.");
				end
				if ( qglobals.sol_room:sub(2, 2) == "1" ) then
					client:Message(257, "Arlyxir's wealth of knowledge flows through your mind.");
				end
				if ( qglobals.sol_room:sub(3, 3) == "1" ) then
					client:Message(257, "The power of Dresolik surges through you.");
				end
				if ( qglobals.sol_room:sub(4, 4) == "1" ) then
					client:Message(257, "Rizlona's song slips through your thoughts.");
				end
				if ( qglobals.sol_room:sub(5, 5) == "1" ) then
					client:Message(257, "Jiva's strength fills your body.");
				end
			end	

		elseif ( qglobals.pofire == "2" ) then
			client:Message(257, "The true route to the Plane of Fire is now clear in your mind.");
		end		
	end

	if ( qglobals.zeks ) then

		if ( qglobals.zeks == "2" ) then -- preflag doesn't appear to have text
			client:Message(257, "Giwin would like you to find him in Drunder so he can present you to Rallos Zek.");
		elseif ( qglobals.zeks == "3" ) then
			client:Message(257, "The pack of notes from Vallon are scribbled in a language that you cannot comprehend.");
		elseif ( qglobals.zeks == "4" ) then
			client:Message(257, "The pack of notes from Tallon are scribbled in a language that you cannot comprehend.");
		elseif ( qglobals.zeks == "5" ) then
			client:Message(257, "The pack of notes from Vallon are scribbled in a language that you cannot comprehend.");
			client:Message(257, "The pack of notes from Tallon are scribbled in a language that you cannot comprehend.");
		elseif ( qglobals.zeks == "6" ) then
			client:Message(257, "The words of Maelin echo in your mind, 'The Zeks and Solusek are planning an invasion of Norrath, find out more from Rallos if you can.'");
		elseif ( qglobals.zeks == "7" ) then
			if ( not qglobals.pofire or qglobals.pofire == "1" ) then
				client:Message(257, "The parchments of Rallos are scribed in a language that you cannot comprehend; they do however have detailed drawings of the manaetic behemoth that you have already destroyed.");
			end
		end
	end

	if ( qglobals.poi_door ) then
		client:Message(257, "You remember Nitram's words - 'three small turns to the right on the bottommost rivet should open the door'.");
	end
	
	if ( not qglobals.mavuin and not qglobals.fuirstel and not qglobals.thelin and not qglobals.poi_door
		and not qglobals.zeks and not qglobals.aerindar and not qglobals.tylis and not qglobals.hohtrials
		and not qglobals.mmarr and not qglobals.mmarr_book and not qglobals.saryrn and not qglobals.karana
		and not qglobals.cipher and not qglobals.sol_room and not qglobals.grummus and not qglobals.zebuxoruk
		and not qglobals.pofire and not qglobals.time
	) then
		client:Message(257, "You manage to recover some images from your childhood, but no recent events spark a memory.");
	end
end

function UnlockMemories(client)
	local qglobals = eq.get_qglobals(client);
	local flagFound;
	local flagName, lockedText, unlockedText, reqFlagName, reqFlagValue, newFlagName, newFlagValue;
	
	for i, t in ipairs(checklistFlags) do
		flagName, lockedText, unlockedText, reqFlagName, reqFlagValue, newFlagName, newFlagValue = t[1], t[2], t[3], t[4], t[5], t[6], t[7];
		
		if ( qglobals[flagName] ) then
			flagFound = true;
			
			-- special logic for zek brothers; otherwise two more qglobals would be needed, so they were just combined into one zeks series
			if ( qglobals.zeks ) then
				if ( flagName == "cl_tallon" and qglobals.zeks == "3" ) then
					reqFlagValue = "3";
					newFlagValue = "5";
				end
				if ( flagName == "cl_vallon" and qglobals.zeks == "4" ) then
					reqFlagValue = "4";
					newFlagValue = "5";
				end
			end
			
			if ( qglobals[reqFlagName] and qglobals[reqFlagName] == reqFlagValue ) then
				
				client:Message(257, unlockedText);
				eq.set_global(newFlagName, newFlagValue, 5, "F");
				qglobals[newFlagName] = newFlagValue;
				client:Message(15, "You have received a character flag!");
				eq.delete_global(flagName);
			else
				client:Message(257, lockedText);
			end
		end
	end
	
	if ( not flagFound ) then
		client:Message(257, "You manage to recover some images from your childhood, but no recent events spark a memory.");
	end
end

function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Emote(" snaps from her meditation,  'Greetings traveler, I am Mal Nae`Shi.  I have come here to heighten my awareness through meditation, much can be learned through a brief exploration of one's self... Assuming there is something there to learn.  While reaching inner peace is a journey each spirit must undertake on its own, I can begin your voyage with [guided meditation] which will aid your memory, once you are seated.  I can also [unlock] some [memories] which may previously been inaccessible.'");
		
	elseif ( e.message:findi("guided meditation") ) then
		if ( e.other:IsSitting() ) then
			GuidedMeditation(e.other);
		else
			e.other:Message(0, "Seer Mal Nae`Shi tells you, 'You will never be able to focus unless you are relaxed.  Please, sit down for a moment and allow me to [guide your meditation].'");
		end
		
	elseif ( e.message:findi("unlock") and e.message:findi("memories") ) then
		if ( e.other:IsSitting() ) then
			UnlockMemories(e.other);
		else
			e.other:Message(0, "Seer Mal Nae`Shi tells you, 'You will never be able to focus unless you are relaxed.  Please, sit down for a moment and allow me to [unlock your memories].'");			
		end
		
	elseif ( e.message:findi("time") and e.other:GetGM() and e.other:Admin() >= 80 ) then
		eq.set_global("poi_door", "1", 5, "F");
		e.other:Message(15, "You have received a character flag!");
		eq.set_global("mavuin", "3", 5, "F");
		e.other:Message(15, "You have received a character flag!");
		eq.set_global("fuirstel", "5", 5, "F");
		e.other:Message(15, "You have received a character flag!");
		eq.set_global("thelin", "4", 5, "F");
		e.other:Message(15, "You have received a character flag!");
		eq.set_global("zeks", "7", 5, "F");
		e.other:Message(15, "You have received a character flag!");
		eq.set_global("aerindar", "1", 5, "F");
		e.other:Message(15, "You have received a character flag!");
		eq.set_global("tylis", "2", 5, "F");
		e.other:Message(15, "You have received a character flag!");
		eq.set_global("hohtrials", "111", 5, "F");
		e.other:Message(15, "You have received a character flag!");
		eq.set_global("cipher", "1", 5, "F");
		e.other:Message(15, "You have received a character flag!");
		eq.set_global("grummus", "1", 5, "F");
		e.other:Message(15, "You have received a character flag!");
		eq.set_global("sol_room", "11111", 5, "F");
		e.other:Message(15, "You have received a character flag!");
		eq.set_global("zebuxoruk", "2", 5, "F");
		e.other:Message(15, "You have received a character flag!");
		eq.set_global("pofire", "2", 5, "F");
		e.other:Message(15, "You have received a character flag!");
		eq.set_global("time", "1", 5, "F");
		e.other:Message(15, "You have received a character flag!");
		eq.set_global("bertox_key", "1", 5, "F");
		e.other:Message(15, "You have received a character flag!");
		eq.set_global("earthb_key", "1", 5, "F");
		e.other:Message(15, "You have received a character flag!");
		
	elseif ( e.message:findi("delete") and e.other:GetGM() and e.other:Admin() >= 80 ) then
		eq.delete_global("mavuin");
		eq.delete_global("seventh");
		eq.delete_global("fuirstel");
		eq.delete_global("thelin");
		eq.delete_global("poi_door");
		eq.delete_global("zeks");
		eq.delete_global("aerindar");
		eq.delete_global("tylis");
		eq.delete_global("hohtrials");
		eq.delete_global("mmarr");
		eq.delete_global("mmarr_book");
		eq.delete_global("saryrn");
		eq.delete_global("karana");
		eq.delete_global("cipher");
		eq.delete_global("grummus");
		eq.delete_global("sol_room");
		eq.delete_global("zebuxoruk");
		eq.delete_global("pofire");
		eq.delete_global("time");
		eq.delete_global("bertox_key");
		eq.delete_global("earthb_key");
		eq.delete_global("cl_grummus");
		eq.delete_global("cl_maze");
		eq.delete_global("cl_behemoth");
		eq.delete_global("cl_aerindar");
		eq.delete_global("cl_terris");
		eq.delete_global("cl_bertox");
		eq.delete_global("cl_keeper");
		eq.delete_global("cl_saryrn");
		eq.delete_global("cl_vallon");
		eq.delete_global("cl_tallon");
		eq.delete_global("cl_rallos");
		eq.delete_global("cl_karana");
		eq.delete_global("cl_mmarr");
		eq.delete_global("cl_mmarr_book");
		eq.delete_global("cl_solusek");
--[[
	elseif ( e.message:findi("test") and e.other:GetGM() and e.other:Admin() >= 80 ) then
	
		eq.set_global("cl_maze", "1", 5, "F");
		eq.set_global("cl_grummus", "1", 5, "F");
		eq.set_global("cl_vallon", "1", 5, "F");
		eq.set_global("cl_tallon", "1", 5, "F");
		eq.set_global("cl_mmarr", "1", 5, "F");
		eq.set_global("cl_mmarr_book", "1", 5, "F");
		eq.set_global("cl_saryrn", "1", 5, "F");
		eq.set_global("cl_terris", "1", 5, "F");
		
		eq.set_global("cl_rallos", "1", 5, "F");
	elseif ( e.message:findi("t2") and e.other:GetGM() and e.other:Admin() >= 80 ) then
		eq.set_global("mmarr", "1", 5, "F");
		eq.set_global("mmarr_book", "1", 5, "F");
		eq.set_global("karana", "4", 5, "F");
		eq.set_global("saryrn", "1", 5, "F");
		eq.set_global("zeks", "5", 5, "F");
]]
	end
end
