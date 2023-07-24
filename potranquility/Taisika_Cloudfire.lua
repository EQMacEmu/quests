function event_spawn(e)
	e.self:CastToNPC():SetNoQuestPause(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:DoAnim(48);
		e.self:Emote("smiles warmly as she nods in recognition and respectful greetings, 'Good day to you, traveler, and may you know peace among us. We understand the turmoil that you must endure and we are truly regretful that we cannot do more than we already have. The Elders are spent -- many are near death from the energies expended to open these portals. The rest of tranquility's inhabitants must maintain the order of things while our Elders are in recovery so we must rely upon you -- the adventurers, scholars, and heroes of Norrath -- to make use of our portals and render our Elders' sacrifice to not be one in vain. I understand that the planes may offer many unique treasures to you, and you will need a place to store them whilst your endeavors rage onward. If you are in need of a fair, trustworthy place to store your belongings, then know that I shall humbly take such a responsibility and guard your treasures with my life, should it come to it.'");
	end
end
