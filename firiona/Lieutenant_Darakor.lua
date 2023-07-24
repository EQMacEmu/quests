function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, adventurer, and welcome to the outpost of Firiona Vie. You should find just about everything you need in this outpost from supplies to information. But beware if you travel outside our patrol region, as the [drolvargs] and other minions of evil will be quick to end your adventuring days.");
	elseif(e.message:findi("drolvarg")) then
		e.self:Say("The Drolvarg are a race of bloodthirsty werewolves. It's said they can smell a traveler from a mile away so  be cautious. They are reputedly led by a powerful sorcerer, but of him I'm afraid I know nothing else. [General Veredeth] has left us strict orders to slay the beasts on sight.");
	elseif(e.message:findi("general veredeth")) then
		e.self:Say("General Galeth Veredeth is the leader and founder of this outpost. His exploits in the [Bloody Kithicor] war are infamous and his skill in tactics is legendary. He is currently traveling about this new land, assessing it for hostility and further colonization.");
	elseif(e.message:findi("bloody kithicor")) then
		e.self:Say("Surely you've heard about the battle of Bloody Kithicor! It was only a few years ago that the dark elves attempted to conquer Highkeep and from there all of Antonica. Legend has it they were led by the the daughter of Innoruuk herself, Lanys T'Vyl. It was only through the heroics of Firiona Vie and her companions that the threat was put to an end in Kithicor Forest. Many brave souls were sent to Tunare that day when Innoruuk bestowed his wrath upon the battlefield.");
	end
end