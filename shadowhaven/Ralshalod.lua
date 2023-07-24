function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Haven " .. e.other:GetCleanName() .. ", I don't believe I've met you before. My name is Ralshalod and I run this little tavern here. Let me know if there is anything I can help you with.");
	end
end
