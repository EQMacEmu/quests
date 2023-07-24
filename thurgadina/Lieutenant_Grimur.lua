function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You got a dispute to settle or are ya here to yap it up?");
	elseif(e.message:findi("yap")) then
		e.self:Say("Well then ye kin turn yerself right around and walk out the door!  I ain't got time fer the ramblings of a fool, " .. e.other:Race() .. ".");
	elseif(e.message:findi("dispute")) then
		e.self:Say("Well then, get down there with who ye got the argument with and duke it out! That's how we do things here in this great city. Might is right. Brell don't let the dishonest overcome the honest. An the dishonest never get ta see Brell's Table, either. We kin only hope we earn a seat at that table when our time is at hand. Roasted walrus, steamed mushrooms, gingered lichen, and several types of gravy...  Mmmmm... Gravy...");
	end
end
