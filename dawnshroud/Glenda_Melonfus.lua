function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. ". Did Kanthek send you to me?");
	elseif(e.message:findi("yes")) then
		e.self:Say("Ahh, so you're interested in the Galorians then? Good to hear. The Galorians seem to be at war with the [Dawnhoppers]. The Galorians are known as the Sambata Tribe. I heard that they once lived in the caves behind us, but that all changed when the Dawnhoppers grew in numbers.");
	elseif(e.message:findi("dawnhopper")) then
		e.self:Say("The Dawnhoppers are the rockhoppers who inhabited Dawnshroud. They are a cruel bunch of hoppers. I swear, if I didn't know any better I'd think that the hoppers were out to kill every last galorian they encountered. They don't like 'em very much.");
	end
end
