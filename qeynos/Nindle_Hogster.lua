function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello! You should take up fishing. It really relieves the stress that accompanies heavy adventuring.");
	elseif(e.message:findi("donate") or e.message:findi("donation")) then
		e.self:Say("First someone asks me to donate to Prexus and now this. Don't you people have better things to do than beg from us hard working citizens?");
	elseif(e.message:findi("prexus") or e.message:findi("donation")) then
		e.self:Say("Prexus!? I should have figured you for one of those Prexus fanatics. Why don't you go take a dip in the harbor?! I hear the sharks are hungry. You should take a trip to the aqueducts. You might find a fellow Prexus praiser named Bait Masterson. He loves to sneak down there at night.");		
	end
end
