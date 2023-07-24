function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ", I am Aderius Rhenar, priest of Quellious and assistant to Lady Laraena. I have been fortunate to be imprisoned here with these Kejekan cat men, they are a very wise people. Are you planning on returning to Erudin soon my friend?");
	elseif(e.message:findi("erudin") or e.message:findi("yes")) then
		e.self:Say("I have managed to prepare a message on this scrap of cloth for the priestess Laraena. It is a matter of great importance to the High Council of Erudin. Please deliver this message to her promptly. I must stay here for a while longer and converse further with my Kejekan friends.");
		e.other:SummonCursorItem(2049); -- Item: rolled up strip of cloth
	end
end

-- END of FILE Zone:warrens  ID:101087 -- Aderius_Rhenar