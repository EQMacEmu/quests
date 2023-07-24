function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well hey-there yourself, welcome to Fort Jaggedpine! My business has really picked up lately with all these newcomers around lately. If you're handy, I've got just about all you'd want in the way of molds to make all kinds of baking supplies, from Cookie Molds to Frying Pans! Have a look!");
	elseif(e.message:findi("throne")) then
		e.self:Say("I didn't much care for the name myself. I mean, it's great to honor Karana and everything but I mean a clearing is a clearing. No need to get all misty eyed about it.");
	elseif(e.message:findi("fort")) then
		e.self:Say("I personally like the name. Yes, my family has been living here for generations but personally I like the change. I certainly don't want to see our little settlement become as big as Qeynos but I don't mind seeing the new faces around and it is good for business too. Times change, that's all.");
	end
end