-- Attempt to limit players level 53 and over from engaging nagafen and vox.
-- Banished to Lavastorm.
local SpawnX = 0;
local SpawnY = 0;
local SpawnZ = 0;
local SpawnH = 0;

function event_spawn(e)
	SpawnX = e.self:GetX();
	SpawnY = e.self:GetY();
	SpawnZ = e.self:GetZ();
	SpawnH = e.self:GetHeading();
	local range = 230;
	eq.set_proximity(SpawnX - range, SpawnX + range, SpawnY - range, SpawnY + range);
end

function event_enter(e)
	if(e.other:GetLevel() > 52 and e.other:Admin() < 80) then
		e.other:Message(4,"I will not fight you, but I shall banish you!");
		e.other:MovePC(27,534,913,55,0); -- Zone: bothunder 
	end
end

function event_combat(e)
	if(e.joined) then
		eq.set_timer("1",1000); --a 1 second leash timer.
	else
		eq.stop_timer("1");
		e.self:GMMove(SpawnX,SpawnY,SpawnZ,SpawnH);
	end
end

function event_timer(e)
	if(e.timer == "1") then
		if(e.self:GetX() < -1000 or e.self:GetX() > -650 or e.self:GetY() < -1500 or e.self:GetY() > -1170) then
			e.self:GMMove(SpawnX,SpawnY,SpawnZ,SpawnH);
		elseif(e.self:CountHateList() > 0) then
			e.self:ForeachHateList(
				function(ent, hate, damage, frenzy)
					if(ent:IsClient()) then
						ent:CastToClient():Message(4,"I will not fight you, but I shall banish you!");
						if(ent:CastToClient():GetBindZoneID() == 32) then
							ent:CastToClient():SetBindPoint(27,534,913,55);
						end
						ent:CastToClient():MovePC(27,534,913,55,0);
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

function event_signal(e)
	if ( e.signal == 1 ) then
		e.self:Shout("Ha!  The Ring and Claws are doomed!  The Sleeper has been awakened, what a glorious day!  Lady Vox, I will see you soon, our long delayed nuptials can now proceed!");
	end
end
