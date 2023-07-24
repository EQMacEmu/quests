function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Say("What is this? Just another piece of rubbish littering my library. The deceased are so much more tidy than the living!");
		end
	end	
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Lots to do! Many books to place and scrolls to file! Feel free to browse but. please. don't make a mess!");
	end
end

--END of FILE Zone:paineel  ID:75017 -- library_assistant
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------