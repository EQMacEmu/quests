function event_spawn(e)
	e.self:CastToNPC():SetNoQuestPause(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:DoAnim(70);
		e.self:Emote("gives a solemn bow -- the natural regality of his race shining through his almost divinely graceful movement and unearthly beauty, 'Welcome, traveler, to the realm of tranquility. May peace lull your weary spirit and heart from the horrors that lay beyond in both endeavors past and not yet ventured. I am Paurnil Goldenleaves, a citizen of tranquility and humble servant to all of Norrath's adventurers that pass through this plane. I am one of three who have offered to hold the excess belongings of adventurers whilst they embark upon the dangers that lay in the domain of the gods. Do not hesitate to trust us, " .. e.other:GetCleanName() .. ", for we have little need of earthly possessions and with many of our Elders in a state of immobility from their expenditure of energy, we will not be leaving this place any time soon.'");
	end
end
