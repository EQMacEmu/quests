function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. "!  Welcome to Rivervale!  I hope you plan to stay on and assist us in any way you can.  We all have talents to aid in the prosperity of the hollow.");
	end
end

-- END of FILE Zone:rivervale  ID:19104 -- Mayor_Gubbin 
