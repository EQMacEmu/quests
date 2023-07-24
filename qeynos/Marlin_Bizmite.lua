function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, fellow fisherman. You must be a fisherman. You have the stench of one. If you are not, might I suggest this new pastime I have heard of? A bath!!");
	elseif(e.message:findi("prexus")) then
		e.self:Say("Oh no!! Not another Prexus freak!! Listen up aqua man, if you think a man named Marlin has any chance of giving up fishing, you have got another thing coming. Go night diving in the north pond, you might find some bait for your Prexus blessing.");
	elseif(e.message:findi("donation.* temple.* thunder") or e.message:findi("donate.* temple.* thunder")) then
		e.self:Say("Please! Can't you pester the Ironforges? They are the richest family in Qeynos.");									
	end
	
end
