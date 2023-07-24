function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi there " .. e.other:GetCleanName() .. ", my name is Grimthor and this here is my distillery. My little bar sure has come a long way since the beginning. If you would like to have a drink please help yourself. Woolf has a nice selection along with some information about any spirit you may choose.");
	end
end
