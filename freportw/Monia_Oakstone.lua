function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Pay mind to the authorities of Freeport. Vile they may be, but powerful and many they are.");
	elseif(e.message:findi("prisoner")) then
		e.self:Say("Do not ponder much about the prisoners. They are mostly beggars and alley rats brought to us by the militia for use in our games. Stay clear of the [one on the end].");
	elseif(e.message:findi("on.* end")) then
		e.self:Say("That one is crazy. The lantern is lit, but no one is home. Some fellow named Pietro brought him to us. He said he was in a terrible accident and now is a threat to the community. The stitches to his cranium show that it was once split wide. If you ask me, a big chunk of his brain fell out during that accident!");
	end
end