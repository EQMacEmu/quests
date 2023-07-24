function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The eyes of Vah watch over you.  You are safe within our walls.");
	elseif(e.message:findi("vah")) then
		e.self:Say("Vah Kerrath was our beloved leader. He was mortally wounded during the [shifting] and has passed on to the realm of spirits. This city is blessed with his spirit who guards our people to this day.");
	elseif(e.message:findi("shifting")) then
		e.self:Say("The story of the shifting has been passed down from our fathers and their fathers before them. It was the time when we were ripped from our home and brought to this world. Vah led us to rebuild what you see here before you. We are his beloved children and will stand strong, united as one in our new home. We love our home as we love our lives and forever will the eyes of Vah watch over all of us.");
	end
end
