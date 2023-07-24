function event_spawn(e)
	e.self:CastToNPC():SetNoQuestPause(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:DoAnim(48);
		e.self:Emote("nods deeply to Ezamnoe in a formal, almost regal greeting of mutual respect, 'Hail to you, traveler, and may the spirits hold you well in their favor through your endeavors. The residents of Quellious' domain have come together in haste to make efficient accommodations for whatever needs you may have whilst you are among us. Before you venture to the outer domains of the divine, perhaps it would be wise to investigate our inventories. What we hold is modest, though the supplies may prove a necessity in the dangerous climate to surround your current journey.'");
	end
end
