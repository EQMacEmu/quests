function event_spawn(e)
	e.self:CastToNPC():SetNoQuestPause(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:DoAnim(48);
		e.self:Emote("nods softly, her feline eyes remaining strongly fixated upon yours in a motion of mutual respect, 'Welcome, Ezamnoe. Know that your presence is comforting to the people of tranquility despite our weary natures of the present. Our Elders have slaved for so long that many have become deathly ill -- stricken by unearthly ailments due to their struggles in opening the portals to the divine realms. Many of the deities are not pleased with our presence and they will offer a great resistance to you, should you choose to enter the other divine realms through our established portals. In the event of this occurring, the people of tranquility have gathered supplies as we have been able and offer them to you at a fair price. They may seem modest, but they will prove useful in the long endeavor that awaits you beyond this realm.'");
	end
end
