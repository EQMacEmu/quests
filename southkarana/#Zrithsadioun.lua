function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("curls his lips back, revealing a row of jagged fangs lining his monstrous jaw. Arching his hunched, boney spine, the old and almost sickly looking gnoll glares down upon you with his yellow eyes, 'What " .. e.other:Race() .. " come to Zrithsadioun for? He cares nothing for " .. e.other:Race() .. " -- Zrithsadioun cares nothing for anyone but Zrithsadioun. Go. Now. Zrithsadioun is occupied with more important task than speaking with " .. e.other:Race() .. ", but soon his belly will grow with pain of hunger, and then young " .. e.other:Race() .. " may return...' The haggard gnoll swipes his black tongue quickly across his maw and then snaps at you with a snarling growl, 'Yes! Then you come back... then Zrithsadioun have use for young " .. e.other:Race() .. " that be of Zrithsadioun's while.' Another growl leaves the gnoll as he continues to eye you -- warily and in unveiled agitation.");
	end
end

