function event_spawn(e)
	e.self:CastToNPC():SetNoQuestPause(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:DoAnim(29);
		e.self:Emote("gives a hearty smile wave of his callused hand to you, 'Greetings, friend, an' welcome t'tranquility. We 'ave called this place 'ome for a bit of time now -- enough time fer the Elders t'be wastin' themselves away in opening these portals, in any case. Aaaah... What an excitin' time we are in an' I dinnae say that lightly, friend. This time is one as much dedicated t'turmoil as it be to enlightenment and self-learning, ye understand. Unfortunately, the Elders be too weary t'continue their research in opening the portals an' we must remain 'ere t'tend t'their recovery. Tis nothin' t'scoff or regret -- we owe 'em much more than that! In any event, perhaps ye be makin' the Elders' sacrifice worth while, aye? Ye venture into the planes and perhaps ye will find something of what the Elders were lookin' fer? Well, if ye be travelin' t'the planes, then ye be needin' a place t'store unwanted luggage. I be yer man, friend! Ye can certainly trust Dormi Gemstriker!'");
	end
end
