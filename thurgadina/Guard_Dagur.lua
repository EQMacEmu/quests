function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings and welcome to Thurgadin, " .. e.other:Race() .. ". Ye best watch yer step on the bridge there, it can be a bit slippery."); 
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(115132)) then
			eq.get_entity_list():GetMobByNpcTypeID(115132):Say("Aye, we wouldn't want ye fallin into the pit now would we."); -- Make Guard Baldvin also talk.
		end
	end
end
