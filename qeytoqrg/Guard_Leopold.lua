function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". You had best keep moving. One who stands around too long in Qeynos Hills tends to get surprised by vicious creatures.");
	elseif(e.message:findi("donation.* temple.* thunder") or e.message:findi("donate.* temple.* thunder")) then		
		e.self:Say("Why, yes! I would love to donate to the Temple of Thunder. My father was a brave and noble member of that order. Here you are. You should ask Guard Cheslin also. His father and mine are both members of Thunder. Now, move along!");
		e.other:SummonCursorItem(13294); -- Item: A Donation
	elseif(e.message:findi("blackburrow") or e.message:findi("gnoll")) then
		e.self:Say("Blast those dogs!  The Sabertooths is what they call themselves around here.  They have a nest, or whatever you call it, up there east of Surefall Glade.  We can always use help here, keeping those dirty gnolls away from our fine city.  Talk to Captain Tillin in South Qeynos and tell him you want to join the fight.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 2) then
		e.self:DoAnim(29);
	end
end
