local count = 0;
function event_spawn(e)
	eq.set_timer("story",10000);
end

function event_timer(e)
	count = count + 1;
	if(count == 1) then
		e.self:Say("This is the tale of Taruun, the first Vah Shir scout.");
	end
	if(count == 2) then
		e.self:Say("Taruun was discovered as a small child. He was found wandering the Old World continent of Odus alone. His face was scarred and his fur was burned in patches. It was apparent that he had been with out food for some time. The orphan was very near death when Kerran hunters found him and brought him back to their village.");
	end
	if(count == 3) then
		e.self:Say("The Shir tribe adopted the child and nursed him back to health. The tribe searched for some trace of his family, but did not succeed in finding them. The young cub was either unable or unwilling to speak which made the hunt for his origins that much more difficult. After several years of searching all efforts to find his family were officially ended and the boy was adopted into the tribe. That is when they gave him the name Taruun.");
	end
	if(count == 4) then
		e.self:Say("As Taruun grew it became clear that he would never grow to be like the other Kerrans. It was obvious to those who knew him that whatever trauma he suffered had scarred him deeply. He never spoke, nor even growled for that matter. He kept to himself mostly, somtimes wandering off on his own for days.");
	end
	if(count == 5) then
		e.self:Say("As time passed, he demonstrated abilities that no Kerran had possessed before. All Kerrans could move quietly while they hunted, but Taruun was different. He moved silently, undetectable by even his fellow Kerrans. Added to this was an amazing ability to instantly blend into any background. He did so without the normal visual effects that a shaman displays while casting a spell of invisibility. Taruune could disappear at will.");
	end
	if(count == 6) then
		e.self:Say("The boy never spoke, but he proved his value to the tribe during those first years. He often returned from his solo treks into the wilderness with more food than an entire gathering of hunters. The tribal elders watched this and grew curious.");
	end
	if(count == 7) then
		e.self:Say("One morning the tribal elders asked the youth if they could send hunters with him on one of his treks. He simply nodded and motion for the elder hunters to follow. The hunters had learned to respect young Taruun prior to that day and followed the youth with open minds. It is fortunate for all ofus that they did so. The skills that they learned in that expedition and all of the ones that followed it are still used today.");
	end
	if(count == 8) then
		e.self:Say("Taruun continued to take hunters with him for several years after that first trip. The hunters that he taught passed their knowledge to the hunters that follwed behind them. Seasons passed and the tribe flourished and grew under the tutelage of silent youth. This continued until the day that he left the tribe. No one can remember when or why the youth left. Some speculate that he was a spirit. Other had said that he never existed. I prefer to think that he was a fleeting part of the shadows, destined to move with the sun.");
	end
	if(count == 9) then
		e.self:Say("Our people all learn the story of Taruun at an early age. The boy never spoke the name himself, but his actions and skill spoke like no words could. Our elders say that the story of Taruun is a lesson in humility. He helped our tribe without the use of words and with no desire for gratitude. That is why we have named out scouts after the youth. They are the epitome of what he represented to our people.");
	end
	if(count == 10) then
		e.self:Say("That is the story of Taruun, the child that taught a tribe to survive. He is the namesake of our scout sect. It was an honor to be able to recite this story for you.");
		eq.signal(155105,10); -- NPC: Jharin_Hajka
		eq.signal(155140,10); -- NPC: Dar_Khura_Aylin
		eq.signal(155139,10); -- NPC: Khala_Dun_Gurish
		eq.signal(155108,10); -- NPC: Ahjiq_Mumir
		eq.signal(155107,10); -- NPC: Khala_Dun_Rorya
		eq.set_timer("story",300000);
	end
	if(count == 11) then
		e.self:Say("This is the story of Dar Khura. As with the other sects of the Vah Shir, the Dar Khura took their name from one of our greatest historic figured We honor the memory of our fallen leaders through our actions each day. It is the duty of every Vah Shir to epitomize the values that make our civilization strong, for without these values we are no better than the creatures that wallow in the filth of the darkest caves.");
		eq.set_timer("story",10000);
	end
	if(count == 12) then
		e.self:Say("Dar Khura was the spiritual advisor to Vah Kerrath himself even before the ascension... or shifting. After the great event, it was his solemn conviction that we had not ascended to this world by mere chance, but that we were led here for a special purpose. Dar Khura focused on discovering that purpose and leading the tribe to fulfill their destiny.");
	end
	if(count == 13) then
		e.self:Say("Shortly after our city's first walls were completed, Dar Khura went to King Kerrath and told him of a recurring vision he had been experiencing. In the dream, the shaman perceived some unknown force tampering with the balance of the spirit realm.");
	end
	if(count == 14) then
		e.self:Say("An overwhelming feeling of urgency and desperation lingered with the Spiritist each time he awoke from the visions. Dar expressed to the king that it was his opinion that this was the purpose for their being delivered to this place.");
	end
	if(count == 15) then
		e.self:Say("The king found Dar Khura's words to be compelling. So convinced was the king that by the end of the day a decree went out to the tribe to afford Dar Khura any resource he needed to carry on his search. This research bore fruit sooner than any of the tribal elders could have expected.");
	end
	if(count == 16) then
		e.self:Say("Dar Khura's research was quick to provided insight into one of the races of this new place. The Spiritists grew to know this race as the Akheva. They were determined to be a semi-immortal race.");
	end
	if(count == 17) then
		e.self:Say("Research found that when one is slain, it is reborn anew. Over time, Dar Khura discovered that when an Akheva was reborn, a sacred member of the spirit realm was destroyed. This, he surmised, was the meaning of his initial visions.");
	end
	if(count == 18) then
		e.self:Say("Dar Khura gathered an element of soldiers and moved into the darkness with the hope of gathering more information on this new race. That morning Dar Khura and his soldiers moved out of the sanctuary of the city walls and into the darkness. That was the last time that Dar Khura and his noble group of soldiers were seen. Only speculation was left behind.");
	end
	if(count == 19) then
		e.self:Say("Our people have named the Shamanic sect of our tribe after that visionary spiritual leader. May the eyes of Vah watch over his spirit as they do ours.");
		eq.signal(155105,10); -- NPC: Jharin_Hajka
		eq.signal(155140,10); -- NPC: Dar_Khura_Aylin
		eq.signal(155139,10); -- NPC: Khala_Dun_Gurish
		eq.signal(155108,10); -- NPC: Ahjiq_Mumir
		eq.signal(155107,10); -- NPC: Khala_Dun_Rorya
		eq.set_timer("story",290000);
	end
	if(count == 20) then
		count = 0;
		eq.set_timer("story",10000);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
