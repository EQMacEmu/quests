function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings to you as well, " .. e.other:GetCleanName() .. ". Down these stairs lies the hall of our ancestors. May Brell guide my axe swiftly to the necks of those who dare attempt to desecrate such a sacred place.");
	elseif(e.message:findi("hall")) then
		e.self:Say("The Hall of Ancestors is one of the most sacred places in all of Thurgadin. Therein lie the bodies of some of our greatest heroes and leaders. Loremaster Solstrin is the current Keeper of the Hall and can surely tell you more than I.");
	elseif(e.message:findi("loremaster")) then
		e.self:Say("As I said, Loremaster Solstrin is the current Keeper of the Hall. He rarely leaves to eat or sleep so can almost always be found down there. If he's not there you should only have to wait around a short while before he returns.");
	end
end
