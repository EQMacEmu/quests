--The Magic Pool
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("looks deeply into the pool in front of him, 'Well darn it! I still can't see anything in this blasted [pool], can you Wicas?");
		--Need to trigger Wicas to say: "Nothing at all. Do you think that he led us astray?" right after this.
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(202301)) then
			eq.get_entity_list():GetMobByNpcTypeID(202301):Say("Nothing at all. Do you think that he led us astray?"); -- Make Wicas Adaolath also talk.
		end
	elseif(e.message:findi("pool")) then
		e.self:Emote("glances up at you like he just noticed your presence, 'This pool. There is supposed to be strong [magic] in it.'");
	elseif(e.message:findi("magic")) then
		e.self:Say("Scrying magic. These pools can supposedly glance into all of the knowledge past, present, and future.");
		--Need to trigger Wicas to say: "I think we should just do what [Tarerd] wants us to do."
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(202301)) then
			eq.get_entity_list():GetMobByNpcTypeID(202301):Say("I think we should just do what [Tarerd] wants us to do."); -- Make Wicas Adaolath also talk.
		end
	elseif(e.message:findi("tarerd")) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(202301)) then
			eq.get_entity_list():GetMobByNpcTypeID(202301):Say("Tarerd is the one who told us about these pools. He wanted us to kill some sort of lizards for him, but we have neither the time nor energy for such adventures. Perhaps you can get some information about the pools from him.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 15960})) then--The Reflecting Pools of Tanaan
		e.self:Emote("leafs quickly through the book. 'Thank you, it will take quite some time to go through all the information here. Here is a little something for your troubles.'");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,{itemid = 9321,exp = 150000}); --Fine Cut, Diamond Inlaid Mask
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
