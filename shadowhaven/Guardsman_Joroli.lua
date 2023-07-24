function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". The Mother has been quite sick lately, so out of respect for her and for the house, I hope that you will kindly leave her to rest.  Should you have an urgent matter that needs to be brought to the attention of House Fordel, please see Daloran or Mistala.");
	end
end
