function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Can I help you?  I'm just finishing up here. but I may be available to assist you if you return [when I'm done].");
	elseif(e.message:findi("when I'm done")) then
		e.self:Say("I'm not sure. but I do know that it won't be for a while yet. Are you here to assist with our [purpose]?");
	elseif(e.message:findi("purpose")) then
		e.self:Say("The people you will meet on this island are all here in the hopes of discovering a more balanced path.  Many of these people have moved beyond the boundaries established by their abstruse cultural beliefs.  They may never be able to return to the lands of their birth.'  The youth then whispers. 'It is rumored that some of the elders are sought by the gods themselves.  They are the truest seekers of balance.  Their [knowledge] is what compels us all.");
	elseif(e.message:findi("knowledge")) then
		e.self:Say("Most of the elders have been researching for decades.  The drakes have been studying even longer.  The information that you will find here is the culmination of everyone's search for arcane knowledge.  This research has produced amazing power.  It is their belief that this power will lead them towards the [balance].");
	elseif(e.message:findi("balance")) then
		e.self:Say("The elders believe that the fallen god. Zebuxoruk. gave mortals much of the power that they have now.  It is the knowledge that he shared with mortals that is sought by the elders.  They believe that this information will allow mortals to ascend along the [path] to deification. thus restoring true balance to the world.");
	elseif(e.message:findi("path")) then
		e.self:Say("If you wish to be a follower of the true path of balance. speak to the elders.  There are many duties to be performed here.  Assisting the elders is the easiest route to take to earn their trust.  They are a quiet bunch. but for good reason.  We are performing treasonous acts in the eyes of the gods.  After you have earned their trust. the elders are really amazing people to speak to.  I would just go look for someone to assist. if I were you.");
	end
end
