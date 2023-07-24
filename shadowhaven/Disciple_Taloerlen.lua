function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It's a pleasure to meet you " .. e.other:GetCleanName() .. ", I welcome you to the Midst. If you are interested in the origination of our great quarter please visit one of our many librarians. You may also be asking yourself what lies behind the door here that I guard. Well not too long ago there was a great evil that was trying to enter from the Netherbian lair into Shadowhaven. I cannot say for sure that we defeated it and that it will never return, but for now this door keeps us safe from it until the time comes again to unseal it.");
	end
end
