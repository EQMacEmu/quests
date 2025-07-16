-- Attempt to limit players level 53 and over from engaging nagafen and vox.
-- Banished to Permafrost.
local SpawnX = -261;
local SpawnY = 857;
local SpawnZ = 22;
local SpawnH = 207;

function event_spawn(e)
	local range = 210;
	local range2 = 98;
	eq.set_proximity(SpawnX - range, SpawnX + range, SpawnY - range2, SpawnY + range, SpawnZ - 20, SpawnZ + 50);
	eq.discord_send("TLP Spawn Notices", "".. e.self:GetCleanName() .." has spawned");
end

function event_enter(e)
	if(eq.is_the_scars_of_velious_enabled() and e.other:GetLevel() > 52 and e.other:Admin() < 80) then
		e.other:Message(4,"I will not fight you, but I shall banish you!");
		e.other:MovePC(30,-7024,2020,-60.7,0); -- Zone: everfrost 
	end
end

function event_combat(e)
	if(e.joined) then
		eq.set_timer("1",1000); --a 1 second leash timer.
		eq.discord_send("TLP Spawn Notices", "".. e.self:GetCleanName() .." has engaged");
	else
		eq.stop_timer("1");
		e.self:GMMove(SpawnX,SpawnY,SpawnZ,SpawnH);
	end
end

function event_timer(e)
	if(e.timer == "1") then
		if(e.self:GetX() < -431 or e.self:GetX() > -85 or e.self:GetY() < 770 or e.self:GetY() > 1090 or e.self:GetZ()  < -50) then
			e.self:GMMove(SpawnX,SpawnY,SpawnZ,SpawnH);
		elseif(eq.is_the_scars_of_velious_enabled() and e.self:CountHateList() > 0) then
			e.self:ForeachHateList(
				function(ent, hate, damage, frenzy)
					if(ent:IsClient()) then
						ent:CastToClient():Message(4,"I will not fight you, but I shall banish you!");
						if(ent:CastToClient():GetBindZoneID() == 73) then
							ent:CastToClient():SetBindPoint(30,-7024,2020,-60);
						end
						ent:CastToClient():MovePC(30,-7024,2020,-60.7,0);
					end
				end,
				function(ent, hate, damage, frenzy)
					if(ent:IsClient()) then
						if(ent:CastToClient():GetLevel() > 52) then
							return true;
						end
					end
					return false;
				end
			);
		end
	end
end

function event_death_complete(e)
	eq.discord_send("TLP Spawn Notices", "".. e.self:GetCleanName() .." has been defeated.");
end

function event_signal(e)
	if ( e.signal == 1 ) then
		e.self:Shout("The Sleeper stirs!  A glorious new age for Norrath is about to begin, and my exile is about to end!");
	end
end
