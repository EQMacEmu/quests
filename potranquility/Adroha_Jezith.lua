function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	local thelinFlag = tonumber(qglobals.thelin) or 0;
	
	if ( thelinFlag <= 2 ) then
	
		if ( e.message:findi("hail") ) then
			e.other:Message(0, "Adroha dabs Thelin's forehead with a cold towel and looks up to you, her gentle features veiled in concern. Her voice is gentle and sweet in its hushed tones as she gently returns to your greetings, 'Poor, poor Thelin. I wonder if he will ever recover from opening the portal to the Nightmare plane. I hope he will recover. That seems to be all we have right now, hope. Perhaps you should move along, traveler, and leave the suffering elders to their rest.'");
		elseif ( e.message:findi("portal") ) then
			e.self:Say("The portal lies just outside of this building.  It was to be a small dwelling in which the elders could try to understand the nature of Terris-Thule without her direct harm.  However when she connected with Thelin the structure began to deteriorate, and none of us dared interfere with it.");
		elseif ( e.message:findi("coma") ) then
			e.self:Say("My pity onto Thelin.  His life on Norrath was a miserable one. As a young man he began to study the workings of fear inspired by Cazic-Thule. The workings had been translated for mortals by Zebuxoruk. Pouring over the texts, Thelin felt his mind being invaded by Cazic. This information was not for mortal usage and the malevolent god stripped him of all his earthly belongings and cursed him to live in [poverty and ruin].");
		elseif( e.message:findi("poverty and ruin") ) then
			e.self:Say("Aye, he lived in the streets of Eastern Freeport, begging from those passing through the port. He sat quivering, propped up against a wall with one hand out as he watched the travelers pass by. None of them even gave him a second glance. Several years would pass before a female dwarf would arrive to trade some of her family's armor and weapons. She saw and took pity on Thelin. She knelt down, scratched her beard then began to rummage through her backpack. She then placed a [jeweled dagger] in his hand, smiled and returned to her former business.");
		elseif( e.message:findi("jeweled dagger") ) then
			e.self:Say("This was the only gift that Thelin had received since the curse.  It was beautifully crafted and would likely have fetched a handsome price upon the market. He decided to keep the dagger as it was such a kind gesture. Later that eve, Thelin heard the calling of others that studied Zebuxoruk's workings. He recognized the language they called out in. He approached the men and explained he had studied the writings of Zebuxoruk.  One of the shaded figures then began to mutter an incantation. Suddenly, there was a bright flash, lush vegetation and a peaceful breeze surrounded them. They had ascended here, to the [Plane of Tranquility] where they could further study the works without interference from the gods and mortals alike.");
		elseif( e.message:findi("Plane of Tranquility") ) then
			e.self:Say("Thelin enjoyed it here. He assisted the other followers by using all his mana to open a portal to the Plane of Nightmares, the demi-plane ruled by the child of The Faceless, Terris-Thule. Spent from using all his energies, he went to bed early after his victory had been achieved in this task.  As he laid in bed, he looked over the dagger that had been given to him by the female dwarf. He smiled at the new peace he had found here and began to fall asleep.  Drifting away into the realm of dreams, his subconscious was assulted by the horrors of a nightmare. He tossed and turned from the visions that came before him. So bad did he writhe in his subconscious torment that he turned on the dagger. He was critically injured, and let out a wrenching scream. We found him and were able to heal his wound enough to keep him alive. However, he still lies in a deep coma seemingly [tortured by nightmares].");
		elseif( e.message:findi("tortured by nightmares") ) then
			e.other:Message(0, "Adroha Jezith tells you, 'It is our belief that Terris-Thule is punishing him for allowing entrance into her plane. She seems to have an exceedingly strong tie to him. Since her father has already punished him, she likely found that he was easily tormented by her own powers. Sometimes he talks while tossing and turning. We have taken note of everything he has said. He has said 'I accept your offer Terris-Thule', 'I must find the pieces', and 'It never ends'. You must help him.  Go through the portal that he has helped to create. Try to find his planar projection in Terris' plane. Help him wake from this torment. Please, I beg you. I cannot stand to watch him suffer any longer.'");
			if ( thelinFlag == 0 ) then
				eq.set_global("thelin", "1", 5, "F");
			end
			e.other:Message(15, "You have received a character flag!");
		end
	else
		if ( e.message:findi("hail") ) then
			e.other:Message(0, "Adroha Jezith tells you, 'This is wonderful! Thelin is starting to recover slowly.  He still needs to rest here so please try not to bother him too much!'");
		end
	end
end
