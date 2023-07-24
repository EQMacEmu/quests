function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Good to meet you, %s! I hope you are enjoying your time in High Hold. We have the finest food and entertainment around. All I ask is that you do not spend your time on the top floor of High Keep. Those are my personal living quarters. Other than that, SPEND AND INDULGE!",e.other:GetName()));
	end
end
