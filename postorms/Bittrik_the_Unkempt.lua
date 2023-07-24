-- Instead of using qglobals, tracking conversation status this way instead
-- Needs to reset on zoning which can't be done with qglobals
-- Sony has some sort of temporary character flag that deletes on zone-out
local stateTable = {}; -- key is player name, value is conversation status
local entries = 0;

local RESPONSES = {
	"Bittrik the Unkempt says 'Oh me oh my! A visitor! Pardon me for not cleaning up, but I wasn't expecting company so early! Bittrik's the name, stories are my game. Looking to unmask the secret of the Kingdom of Lok? I might indeed have that story tucked away somewhere. Perhaps you'd fancy a smaller story, one revolving around an ill-tempered giant? That one happens to be one of my favorites! Of course, there are the stories of raging Storms to be found through this land, which I know plenty about as well. So, what'll it be, friend?'",
	"",
	"Bittrik the Unkempt says 'Ah, you're interested in one of the most peculiar stories I know, eh? Most would say that the story is a fluke, derived from a crazed mind. We'll see what you think. Of course I'm sure you're aware of the fact that this place has been in existence long before any of our time. But, in the beginning, there were only a small population of beasties and creatures that lived in the plains, desert and forest. One day though, after a particularly nasty storm, a large mountain giant washed ashore. He was battered and beaten, weathered by the storm, and nearly dead.' [continue]",
	"Bittrik the Unkempt says 'I'm sure you can believe that this massive creature felt slightly out of place, being so far from his mountainous homelands, however he took it upon himself to find suitable living areas in the region he was now in. His journey started in the Plains of Lost Souls, Srerendi; the mild trees and vegetation, while appealing, weren't enough to satiate his hunger for a land close to that of his home. The trees were sparsely packed, the wildlife was mundane, and he felt that the rivers that flowed through the plains were far too gloomy. Not only that, but he couldn't stand to be so close to the shipwreck that landed him here in the first place.' [continue]",
	"Bittrik the Unkempt says 'Dissatisfied with the look and feel of the plains, the giant looked westward for greener pastures. As he walked through the hills making his way west, he thought back to days gone past, of his comrades in arms and his cohorts in exploration. He was known to be a strong and proud warrior, but he was not known to be the most friendly of giants, certainly not to outsiders and certainly not when he was outnumbered. The younger giants in the tribe thought of him as very ornery and somewhat short-tempered, yet very noble and well versed in the ways of the world. These things harked back to more pleasant times long before he arrived in this wretched place of vast storms.' [continue]",
	"Bittrik the Unkempt says 'As he reminisced about days of yore, the ground under his feet changed from a pale green to that of blistering white sands. Rocks encased this deserted area, long forgotten except for the sparse collection of desert-going creatures. He was amazed at the sudden climate change he found; that rolling plains could twist and contort so quickly into a desert region puzzled him. One thing he was sure of, he wasn't going to live in a dry, overheated place like this. He decided he would go north to see if there was another climate change nearby, perhaps one that was more closely linked to his home climate in the mountains.' [continue]",
	"Bittrik the Unkempt says 'He saw the scorched, burning sand below his feet and pondered what could do such a thing to this land. Had there been such severe storms that it caused all the vegetation and trees in this area to be swept away into nothing? Or was this a foreshadowing of events that would eventually engulf him and these lands in a shroud of death and demise? He shuddered at the questions rolling around in his mind; why was he so afraid of these questions anyway? He was a mighty warrior with decades of training and experience. He figured he was just being paranoid from being so far away from home and shrugged it off as just that -- paranoia.' [continue]",
	"Bittrik the Unkempt says 'The longer he walked, the more he thought that this may be it; he thought that there was endless desert from here on out. After some time, he came upon a small oasis, filled with glistening water. He gulped down the water as though he had not had any for years. When he was thoroughly quenched, he stopped to think about the logic of such cool, clear water in the middle of a desert before finally realizing that there must be cooler lands nearby. He moved on through the heat, hoping that his next step would bring him to the edge of the next climate.' [continue]",
	"Bittrik the Unkempt says 'He ran a few more steps when out of nowhere, he found himself in the middle of a densely packed, lush and fertile forest. He could hardly believe his eyes as he looked around at the tall trees and their very green leaves. He strolled through the forest glowing at the thought of having found a new home for himself, even though he was so far from the reaches of civilization. It was high time he started to build a place to live.' [continue]",
	"Bittrik the Unkempt says 'He spent many weeks laboring away, cutting down nearby trees and turning them into lumber for a cabin. The end result was a modest cabin that he could live in without disturbing the peace and tranquility of the surrounding forest area. He was to live there for a long time, living among the forest and in peace... alone. That is until the Storms came, but that is another story altogether.' [continue]",
	"Bittrik the Unkempt says 'That's all there is to the story of the ornery giant who lived in the forest. I happen to think that it's a wonderful story, but to each their own I guess. I have other stories, if you're interested though! Perhaps you'd like to hear about the Kingdom of Lok and the tribulations of a once proud land? Or maybe you'd like to be dragged into the stories of how the Storms came to be in these lands? Of course if you like, I can tell you the story of the ornery giant again. So what'll it be, friend?'",
	"",
	"Bittrik the Unkempt says 'Aha! You prefer a story of myth and legend. The story of Lok begins with a hero, as does any good story. In the days before time was time, when enchanted creatures roamed the land and created havoc at every stopping ground, there lived a group of beings that you now know as the frogloks. They were not always as heartless and thoughtless as they seem, and in fact were once a proud and dignified race and a cunning adversary for anyone that might try to defile their lands or trounce upon their good name.' [continue]",
	"Bittrik the Unkempt says 'Centuries passed and king after king found his way to the throne of the mighty Kingdom of Lok. A few filled the role nobly, passing on the edicts of their ancestors and persuing a rich and honorable lifestyle for their people. But most were tyrannical in nature, oppressive and diabolical, mean-spirited and otherwise horrible kings. Yet it seemed, with each and every king that ruled and passed away, the Kingdom of Lok would not sway; it would remain ever-present for the world of Norrath to see in all its glory, always there to instill fear into the minds of any would-be aggressors.' [continue]",
	"Bittrik the Unkempt says 'Little did the people of Lok know that there was an even more sinister character orchestrating the kingdom and its kings; little did they know that a very powerful wizard held control over the kingdom and used it as he pleased as a weapon of destruction against any and all who got in his way. Of course, he was also the reason the kingdom had lasted in the eyes of the world for so long. Year after year, he would strive to become the most powerful wizard in the world, sending armies out after those who might pose a threat to him and eliminating them. 'Krrovok klek Tor', they called him. Translated into common, it means 'Deliverer of Doom'; more and more the title given to this horrifying wizard became all too true.' [continue]",
	"Bittrik the Unkempt says 'Then the day came when a hero was born to the people of Lok, shrouded in secrecy and hidden far away from the reaches of the Arch Mage. This Loknite was to be the savior of the kingdom; he was to grow strong and purge the evil wizard from the lands forever. For years, he was trained to be a holy knight, learning all that he could about discipline, the ways of the warrior, and the principles of knighthood. He grew powerful, but did not lose sight of the fact that he must follow the path of nobility, or else nothing would ever change in the kingdom.' [continue]",
	"Bittrik the Unkempt says 'After so much training, the people's hero was finally ready to enter into their hearts. 'Drornok Tok Vo`Lok', or 'Noble Hero of Lok'; the people chanted this as he strode by them, the hope that he would bring evident on their faces, in their voices, and in their hearts. He knew that he was destined to bring order and peace back to Lok and to rid it of the wicked evil that had plagued it for so very long; he was making his trek to the Arch Mage's tower, and for better or for worse, he was not likely going to leave it.' [continue]",
	"Bittrik the Unkempt says 'The tale of a hero is wrought with hardships, both great and small, and the same was true for Drornok Tok Vo`Lok. The closer he got to the towering stronghold of the mighty wizard, the easier it was for the Arch Mage to sense him and send his denizens forth to wreak mayhem on the lands of Lok. Alone, and without fear, Drornok Tok Vo`Lok looked to all that he had learned until now and found the strength to defeat the gruesome and loathsome minions of Krrovok klek Tor. He moved slowly but surely through the Kingdom of Lok, his dedication was tried, but true. From every nook and cranny of the kingdom, passers by would stop to wish him luck and safety on his journey.' [continue]",
	"Bittrik the Unkempt says 'It seemed as if there was an aura of courage sprouting from every step Drornok took, bolstering his esteem, both within and from the citizens of the kingdom. His trek to the wizard tower turned from one of lonliness to that of heartfelt pride and overwhelming support from the lands of Lok. The maniacal wizard Krrovok knew that this hero of Lok would be his undoing; there was no amount of magic he could conjure that would quash the power that Drornok held with him now.' [continue]",
	"Bittrik the Unkempt says 'Despite his best efforts, his minions were hardly slowing Drornok down. He wasn't about to give up his fight though, because if this peasant Loknite was to be the end of him, then he would surely be the death of this Loknite. He readied his tower with serpents and gangrenous rats, elementals and festering bats; he summoned forth the mightiest dragonite elemental he could muster, nearly exhausting his mental energies in the process. Then, as he waited for the Hero of Lok to make his way through the tower, he readied two final incantations to bestow upon the faithful champion.' [continue]",
	"Bittrik the Unkempt says 'Drornok was careful as he came upon the massive tower. He avoided obvious traps set by the merciless wizard and battled any and all minions that had been laid before him. He twisted the serpents into knots, tossing them aside; rats knew no peril like that which Drornok instilled into them. The elementals crumbled to pieces from the might of his sword, and the bats felt the long corridor of everlasting unlife flow through them. All that lay between Drornok and the wizard now was a hideous beast, sewn of draconic spirit and born of ferocious, unrelenting hatred.' [continue]",
	"Bittrik the Unkempt says 'The roar of the beast sent minor chills through the young hero's spine, yet nothing could shake his determination, not even the bone-shattering shrill of an undead dragonite spirit. A great battle was fought between the mighty dragon spirit and Drornok Tok Vo`Lok; the Lokian hero slashed and gouged at the dragon, all the while being pelted with fiery hot dragon breath. The battle raged on and on until the noble and holy prowess of Drornok shone through to defeat the monstrous beast. All that was left for him now was Krrovok klek Tor.' [continue]",
	"Bittrik the Unkempt says 'The final steps to the top of the wizard's tower were slow, and they filled him with slight anxiety about his fate. However, as he stepped through the door, he saw nothing more than a weak, fledgling wizard sitting in a corner of the room. Drornok moved toward him, ready for any monster the wizard might throw at him, but when he got near, Krrovok fell to his knees and began chanting in an ancient dialect. It was clear to Drornok that Krrovok was sobbing while chanting, and figured him to be repenting his ways, in hope that he would spare the pitiful wretch's life.' [continue]",
	"Bittrik the Unkempt says 'Alas, it was not to be, and the wizard finished his last two incantations, cursing Drornok to share the hatred and contempt for life that he had held for so long. He also cursed him to live out the rest of his days far from the reaches of the Lok kingdom, in a place where he would never be allowed to rule it, where he would never be allowed to lounge in the splendor of having bested the evil Krrovok. As he finished the incantations, he began to laugh hysterically, calling for Drornok to finish the deed that he had been brought up to do for so long.' [continue]",
	"Bittrik the Unkempt says 'With one fell swoop, Drornok cleaved the wizards head from his shoulders and only then, in that brief, everlasting moment did he realize what he had done, that he had been cursed for eternity. His heart smoldered and burned within his chest as it turned from noble purity to wretched, black, vile despair. His skin cracked and peeled as he was sucked into the vastness of space, and finally onto the sullen land of storms. Deep within this very mount Grenidor was he set, to live out his life in anguish and without a kingdom to rule over. However, it wasn't long before he came to find an indigenous race of frogs in the new lands.' [continue]",
	"Bittrik the Unkempt says 'The frogs were not like the Loknites of his former lands, but he figured that they could be molded and twisted to be his servants, his subjects. Over time, he turned them against any and all who would try to disturb his new kingdom, deep in the mountains of Storms, and found that he was indeed able to rule over a group of beings similar to himself. He would not be stranded for all of eternity in a place without being able to fulfill his destiny, and so it was that those frogs lived and died under his leadership.' [continue]",
	"Bittrik the Unkempt says 'That, my friend, is the story of Drornok Tok Vo`Lok and the Kingdom of Lok. Some say it's true, claiming that they've heard the long lost King of Lok brooding deep within the caves of Grenidor, while others think it is nothing but a myth, passed down by great story tellers of yore. Would you care to hear another of my stories? Perhaps you'd like to hear about the cantankerously timid giant? Or would you like to be entranced by the stories of Storms that pervade these mighty lands? If you'd like to hear about the Kingdom of Lok, I can retell that to you as well, just let me know!'",
	"",
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
				--eq.debug(name.." deleted from "..e.self:GetCleanName().." conversation memory", 3);
			end
		end
	end
	if ( entries == 0 ) then
		eq.stop_timer(e.timer);
		--eq.debug("memory timer stopped for NPC "..e.self:GetCleanName(), 3);
	end
end

function event_say(e)

	local name = e.other:GetName();
	
	if ( not stateTable[name] ) then
		stateTable[name] = 1;
		
		if ( entries == 0 ) then
			eq.set_timer("checkreset", 15000);
			--eq.debug("memory timer started for NPC "..e.self:GetCleanName(), 3);
		end
		entries = entries + 1;		
	end
	local state = stateTable[name];
	
	if ( RESPONSES[state] ~= "" ) then
		e.other:Message(0, RESPONSES[state]);
		stateTable[name] = state + 1;
	else
		if ( e.message:findi("kingdom") ) then
			state = 13;
			e.other:Message(0, RESPONSES[state]);
			stateTable[name] = state + 1;
		
		elseif ( e.message:findi("giant") ) then
			state = 3;
			e.other:Message(0, RESPONSES[state]);
			stateTable[name] = state + 1;
		end
	end
end
