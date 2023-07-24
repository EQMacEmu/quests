function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("If you wish to stay here by all means go ahead. Most of the animals who roam in this area are afraid of fire. They tend to stay away from it, but the courageous ones do tend to get close. And they're always venturing into the [ponds].");
	elseif(e.message:findi("pond")) then
		e.self:Say("The ponds are known as the Ponds of Influence. It carries a special power. All the animals here can feel it. Just take notice and see how the animals are always swimming into the water.");
	end
end
