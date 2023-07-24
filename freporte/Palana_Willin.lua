local signal = 0;
local lastSong = 0;

function event_spawn(e)
	eq.set_timer("ready",300000);
end

function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Nice to meet you, " .. e.other:GetCleanName() .. ". I hope you stay to hear my fine compositions.");
	end
end

function event_timer(e)
	if ( e.timer == "ready" ) then
		e.self:Say("What a cheerful crowd.");
		eq.stop_timer("ready");
		
	elseif ( e.timer == "bar" ) then
		eq.stop_timer("bar");
		eq.set_timer("table", 1000);
		eq.signal(10186, signal); -- NPC: Tlin_Bowfright
		eq.signal(10157, signal); -- NPC: Tykar_Renlin
		eq.signal(10163, signal); -- NPC: Plnorrick_Spinecracker
		eq.signal(10160, signal); -- NPC: Biggle_Limbokker

	elseif ( e.timer == "table" ) then
		eq.stop_timer("table");
		eq.signal(10199, signal); -- NPC: Sir_Edwin_Motte
		eq.signal(10182, signal); -- NPC: Talym_Shoontar
		eq.signal(10012, signal); -- NPC: Imxil_Tbrow
		eq.signal(10195, signal); -- NPC: Groflah_Steadirt	
	end
end

function event_signal(e)
	song = math.random(1, 6);
	while ( song == lastSong ) do
		song = math.random(1, 6);
	end
	lastSong = song;
	
	if ( song == 1 ) then
		e.self:Say("Here's one for Sir Lucan... He's just a ruler. In a long line of rulers. Looking for a few more orcs to slay. They say that he fights them with one hand tied to his back. And he won't leave Freeport till you remember his name. Thank you.");
		eq.set_timer("bar", 1000);
		signal = 7;
	elseif ( song == 2 ) then
		e.self:Say("Yo ho, in the merry old harbor of Sir D'lere. There lived a small man who lived in fear. Fear of the pawns and fear of the fish, but most of all fear of the bottle. One day as he sailed overseas, he encountered a spat. A lovely lady being harrassed by a buccaneer, tall and fat. He hid all his fear and yelled 'Let her go!' The buccaneer said that he would do so. 'I will do so if you can drink from this bottle, oblong and of weight, for twenty whole seconds. Will you test your fate?' So as the ship did thread the needle around a quater to live, foolish Turgin drank, passed out and took a dive. Under went he and the evil bottle too. Now all should fear the bottle of ochre goo.");
	elseif ( song == 3 ) then
		e.self:Say("All clap and pass the ale. Sir Lucan is in charge so don't set sail. All clap and pass the ale. Sir Lucan is in charge and he shall never fail. He saved our fair city when the others had fled. Off on a crusade, or so they said. All clap  and pass the ale, Sir Lucan is in charge so don't you bail. All clap and pass the ale, Sir Lucan is in charge so sing or go to jail. All clap and pass the ale, Sir Lucan beat the orcs and next is Bayle. Thank you. I hope the Freeport citizens liked that one.");
		eq.set_timer("bar", 1000);
		signal = 3;
	elseif ( song == 4 ) then
		e.self:Say("My city is mighty and all shall learn to cower. We are nothing less than the ultimate power. My city is pure and filled with beautiful charm. I shall conquer you to save you from harm. My city shall first send its guards to back you in times of need. Soon you shall learn to live under my laws, indeed. So bow down when you see me and give out my favorite cheer, 'All Hail Antonius Bail!' My city is Qeynos and there is nothing to fear.");
		eq.set_timer("bar", 1000);
		signal = 4;
	elseif ( song == 5 ) then
		e.self:Say("Life is dull and dreary when you know it all. To the planes of the gods, is their next call. An Erudite, an Erudite has come to drink. All the knowledge in the world, or so they think. One drink, two drinks, grab and down the ale! Then they step off their stools and their faces begin to pale. For all their love of music and their great schools of magic, up come their lunches, how very tragic. So let all sit back and be ready with Hijinks, an Erudite has come to the Seafarer to down a few drinks.");
		eq.set_timer("bar", 1000);
		signal = 5;
	elseif ( song == 6 ) then
		e.self:Say("Here is one for my former lover, Joffrey Clay. You took the lute. It was my favorite one. A little white lute, and went off to Qeynos. You took the songs. They were all special ones. Packed them all up. Off to Qeynos. You killed the plant. Put it in a deep freeze. Dumped it in the trunk. With the rest of the refuse. You, left to Qeynos. You, left to Qeynos. You, left to Qeynos. You, left to Qeynos.");
		eq.set_timer("bar", 1000);
		signal = 6;
	end
end