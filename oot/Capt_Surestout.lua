-- This is to spawn a lesser spirit upon the Capn's death for Shaman epic 1.0

function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Say("Only a fool drops such booty upon the ground. 'Tis the now the property of the Pirates of Gunthak!");
		end
	end	
end

function event_death_complete(e)
	if(eq.is_the_ruins_of_kunark_enabled()) then
		eq.unique_spawn(69149,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	end
end

--Submitted by: Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------