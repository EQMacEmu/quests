function event_spawn(e)
	e.self:CastToNPC():SetNoQuestPause(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:DoAnim(70);
		e.self:Emote("bows deeply at the waist. his appreciation and unobstructed respect apparent in his motion. 'Welcome. traveler. to the domain of tranquility. The residents of this place are all grateful for your presence. despite many of our members' seemingly sour disposition. Understand that this time is not one of rejoicing for us -- though your presence is a comfort. we are still in a place of uncertainty. In order to benefit and protect you where we are able. the Elders have placed wards upon the portals that link the domains of the gods to this place. If your will and spirit are not yet suited to challenge a specific domain. then you will be informed of such. Do not take offense and know that we do this only to protect all of us. for we do not wish to see you fall to the malignant grasp of the gods as so many of our own.'");
	end
end
