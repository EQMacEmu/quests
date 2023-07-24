function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Pleased to meet you, " .. e.other:GetCleanName() .. ". I will have numerous herbs and grains as soon as I receive my shipment, so please check back later. If you are in need of something now, I believe Satoen has some in stock.");
	end
end
