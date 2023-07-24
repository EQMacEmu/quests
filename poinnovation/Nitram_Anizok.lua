local FLAG_LIMIT = 72;
local DRAGON_TYPE = 206208; -- #Xanamech_Nezmirthafen

local dragonSlain = false;
local walking = false;
local flags = 0;
local rid, gid, cid;

function ClientCanFlag(mob)
	if ( mob:IsClient() ) then
		local client = mob:CastToClient();
		
		local raid = client:GetRaid();
		local group = client:GetGroup();
		
		if ( rid and raid.valid and raid:GetID() == rid ) then
			return true;
		elseif ( gid and group.valid and group:GetID() == gid ) then
			return true;
		elseif ( cid and client:GetID() == cid ) then
			return true;
		end
	end
	return false;
end

function event_spawn(e)
	dragonSlain = false;
	walking = false;
	flags = 0;
end

function event_signal(e)
	dragonSlain = true;
	e.self:CastToNPC():SetNoQuestPause(false);
	eq.set_timer("depop", 600000);
	
	rid, gid, cid = nil, nil, nil;
	local client = eq.get_entity_list():GetClientByID(e.signal);	-- the signal # is the entity ID of a client with kill credit
	
	if ( client.valid ) then
	
		local raid = client:GetRaid();
		local group = client:GetGroup();
		
		if ( raid.valid ) then
			rid = raid:GetID();
		elseif ( group.valid ) then
			gid = group:GetID();
		else
			cid = client:GetID();
		end
		eq.debug("Flagger NPC will acknowledge "..client:GetName().."'s raid/group; Raid ID == "..(rid or "(nil)")..";  Group ID == "..(gid or "(nil)"), 1);
	end
end

function event_say(e)

	if ( dragonSlain ) then

		if ( e.message:findi("hail") and ClientCanFlag(e.other) ) then
		
			e.other:Message(0, "Nitram Anizok tells you, 'Whew that was a close one!  I shall have to study these schematics and see where I went wrong.  Maybe if I build a new one that uses the correct kind of power source it would work better!  Anyhow, why don't you stop these beasts at the source?  If you go up to the main factory door and twist the very bottom rivet of the icon three times to the right, it will open.  I doubt they have changed how this works.  Good luck!'");
			
			local qglobals = eq.get_qglobals(e.other);
			if ( not qglobals.poi_door and flags < FLAG_LIMIT ) then
				eq.set_global("poi_door", "1", 5, "F");
				e.other:Message(15, "You have received a character flag!");
				flags = flags + 1;
			end
		end

	elseif ( not walking ) then
	
		if ( e.message:findi("hail") ) then
			e.self:Say("Oh my hello!  It has been such a long time since I have had visitors.  Have you come to learn of [advanced tinkering] as well?");
		
		elseif ( e.message:findi("advanced tinkering") ) then
			e.self:Say("Aye, I advanced to this plane due to my work on tinkering back in Ak`Anon.  A grand city it is, but my abilities were compromised with the materials I had to work with there.  My body and soul has come to rest here, forever coming up with new ideas.  You should be aware though that this plane is not how it was when I arrived.  Much [construction] has taken place.");
		
		elseif ( e.message:findi("construction") ) then
			e.self:Say("When I first arrived I started creating smaller things.  As time went on my inventions became more and more focused and impressive.  I started building steam powered clockwork to help me gather materials. I had gone too far giving them the ability to learn and with a built in desire of self perpetuation.  They began to integrate themselves with the clockwork that already existed within the factory that you can see if you step outside.  I once worked within the factory with a kind and fair gnome, Meldrath.  Now that he has gone missing the clockworks seem to be working towards a more devious goal.  The clockwork out here in the junkyard have been discarded due to their malfunction or replacement by a more efficient series.  Needless to say their [instinct for survival] has not been lost.");
		
		elseif ( e.message:findi("instinct for survival") ) then
			e.self:Say("The clockwork have become increasingly aggressive because of their desperation for spare parts.  I have to defend myself anytime I head out to find parts for my tinkering.  I fear for my safety with what is being built in the factory.  I have started to build myself my own means of defense.  It is nearly completed but I need an odd combination of batteries to start it up.  I should have planned more carefully for it to use simple mana batteries.");
		
		elseif ( e.message:findi("combination of batteries") ) then
			e.self:Say("Well you see when I was back home it was common for me to use a mycological spore extricate-kinetoconvertor to power my devices.  I started planning my defense to use this as a power source out of sheer habit.  Here in this desolation the mushrooms that were grown back home do not exist.  I am going to have to rig something from spare parts.  It is taking a long time with my having to search the junkyard small portions at a time due to the clockworks.  Would you help me in [collecting materials]?");
		
		elseif ( e.message:findi("collecting materials") ) then
			e.self:Emote("peers over some schematics laying on a table next to him. 'Let us see here.  I have some of the base parts for the power source.  If you could collect a copper node, a bundle of super conductive wires, and an intact power cell I could power up the machine.  Good luck to you "..e.other:GetCleanName()..", I hope that we can work together on this.'");
		end	
	end
end

function event_trade(e)
	local item_lib = require("items");

	if ( not walking and item_lib.check_turn_in(e.self, e.trade, {item1 = 9295, item2 = 9426, item3 = 9434}) ) then
		e.self:Say("Excellent!  This is wonderful, please follow me!  I will show you the power of my greatest invention.");
		walking = true;
		e.self:CastToNPC():SetNoQuestPause(true); -- do not pause on say events
		e.self:AssignWaypoints(22);
		e.self:SetNPCFactionID(1006);
		eq.set_timer("depop", 3600000);
	end

	item_lib.return_items(e.self, e.other, e.trade);
end

function event_waypoint_arrive(e)

	if ( e.wp == 20 ) then
		eq.spawn2(DRAGON_TYPE, 0, 0, -711, 1583, -45, 128);
		
	elseif ( e.wp == 27 ) then
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(DRAGON_TYPE) ) then
			e.self:Emote("places the power unit right into the chest of the huge metallic beast.  It roars to life as steam begins pouring out of its huge gaping maw.  Suddenly it begins to attack!  'Malfunction!  There is an error in its recognization process!  Help me to stop it before it destroys us all!'");
			eq.signal(DRAGON_TYPE, 1);
		else
			eq.depop_with_timer();
		end
	end
end

function event_timer(e)
	if ( e.timer == "depop" ) then
		eq.depop_with_timer();
	end
end
