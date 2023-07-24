function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. ". Might you be interested in helping us make a [delivery]?");
	elseif(e.message:findi("delivery")) then
		e.self:Say("We have a barrel of brew that we must deliver to Ryann Desgrey. We've been meaning to deliver it, but haven't been able to, because Caelin's been feeling ill. But before you can deliver it I have to know that you're able to make the trek across these lands. Bring me back a Fungus Mushroom.");
	end
end
