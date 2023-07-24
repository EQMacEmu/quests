function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Heya " .. e.other:GetCleanName() .. ", please feel free to let me know what ya need from my shop. I'm sorry if ya don't have my full attention, however I'm busy trying to get this darn chimney workin.");
	end
end
