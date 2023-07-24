function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to our shop, " .. e.other:GetCleanName() .. ". Why don't you take a look at what my husband Morgan and I have for sale? Morgan is a great sketch artist but he's a bit old fashioned.");
	elseif(e.message:findi("fort") or e.message:findi("throne")) then
		e.self:Say("I don't know which I like better really. It is sad to see such a historic name be thrown away but at the same time, it was kind of a silly name I think.");
	end
end