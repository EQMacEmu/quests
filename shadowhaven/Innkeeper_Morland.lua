function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there and welcome to Shadelings! I'm the head Innkeeper here and I will be attending to any needs or concerns you might have while staying with us. So if something is on your mind please do not hesitate to ask!");
	end
end
