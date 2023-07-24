function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ahh, a new student perhaps?  Have you come to [learn] the history of our wonderful kingdoms?");
	elseif(e.message:findi("learn")) then
		e.self:Say("Why the Kingdoms of Above and Below!  Would you like to learn more about the [Kingdom of Above] or the [Kingdom of Below.]  Or perhaps you want to hear about our [humble beginnings.]");
	elseif(e.message:findi("kingdom of above")) then
		e.self:Say("Ahh, yes, the Kingdom of Above.  We discovered these tunnels shortly after arriving here on Luclin and King Grery in his infinite wisdom recognized immediately the importance this place.  It was foretold in ancient prophecies that we would one day find our promised lands and from there rule over all the universe.  King Grery wisely noted that we had reached a place as far Above as we ever would and from this highly enlightened place we would be able to rule over Norath and all of the universe.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(153073)) then
			eq.get_entity_list():GetMobByNpcTypeID(153073):Say("Of course King Gromklin had some very convincing counter arguments, else we would not also have the Kingdom of Below.");
			e.self:Say("True and that's what led to that minor disagreement that had us all fighting amongst ourselves for a while, but we [worked it all out] and everything has been wonderful ever since.");
		end
	elseif(e.message:findi("kingdom of below")) then
		e.self:Say("Of course, the Kingdom of Below.  You see once we had arrived here and King Grery had first made his discovery, King Gromklin had wisely and correctly noted that the prophecy said nothing about ruling Above only that we would rule 'over'.  As you may have noticed these tunnels go fairly deep into the center of Luclin.  From here everything is above us, not just the surface of Luclin but also Norath and all of the universe.  Therefore this must be the Kingdom of Below, for are we not rightfully 'below' everything?  And from here we rule over everything.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(153073)) then
			eq.get_entity_list():GetMobByNpcTypeID(153073):Say("But never forget King Grery had first recognized this as our promised lands and the prophecies did specifically say we would rule 'over' the universe so should this not truly be the Kingdom of Above?");
			e.self:Say("True and that's what led to that minor disagreement that had us all fighting amongst ourselves for a while, but we [worked it all out] and everything has been wonderful ever since.");
		end
	elseif(e.message:findi("humble beginnings")) then
		e.self:Say("Long ago many of us gnomes became frustrated with the goings on around Akanon.  You see we felt that the true greatness of us Gnomes was being held back because of the constant religious bickering.  If we could just unite ourselves we would be capable of anything.  So several of us decided to leave Akanon and headed out to find our [promised lands.]");
	elseif(e.message:findi("worked it all out")) then
		e.self:Say("Well, as you can see there are very convincing arguments for both the Kingdom of Above and the Kingdom of Below.  We did get a little caught up there for a while as to which Kingdom was the true Kingdom, but as Crates here will constantly point out both philosophies are sound and the prophecies never mention what we should call our Kingdom once we reached the promised lands.  So we finally agreed that both Kingdoms can exist together and we have peacefully and mutually ruled the universe ever since.  Long live King Grery of the Kingdom of Above and King Gromklin of the Kingdom of Below.");
	elseif(e.message:findi("promised land")) then
		e.self:Say("We had in our possession an ancient prophecy that foretold of the coming greatness of gnomes.  This prophecy said that from our promised land we would rule over all the universe.  Of course the prophecy mentioned nothing of where we could find this promised land.  We started by seeking out the assistance of the Combine Empire in our search.  For the Combine controlled a great many lands and knew of places we had never heard about.  We were beginning to lose hope that we would ever find our promised land when the first [gate to Luclin] was opened.");
	elseif(e.message:findi("gate to luclin")) then
		e.self:Say("We knew at once that we needed to continue our search up here on Luclin and agreed to be amongst the first to travel here.  It wasn't long until we discovered these caverns and knew that our long search was over.  We had found our promised land.  Ever since we have been carefully controlling the destiny of the universe.");
	end
end
