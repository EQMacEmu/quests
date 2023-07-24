function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The gems I carry were actually collected by geonids, a race of rock and gem people that communicate with their minds alone. If'n ye haven't had the chance to see one yet I suggest ye journey to the Wakenin' Lands; they've reportedly got a colony somewhere in that area.");
	elseif(e.message:findi("pure enchanted velium")) then
		e.self:Say("Wow that is an odd request " .. e.other:GetCleanName() .. ". Very rarely do we make an item that requires a pure bar of metal. Pure enchanted velium bars are made by combing three enchanted velium bars in a forge along with a coldain velium temper, pure water and a Coldain smithy hammer. Tis quite expensive but it enables the crafter to obtain pure working materials.");
	elseif(e.message:findi("etching tool")) then
		e.self:Say("Oh, really? There are not many that work in faceting gems. I am surprised to see your interest. You can have this old set of mine. There is no need to return the tools, Talem recently made me a new sturdy set. Brell bless him.");
		e.other:SummonCursorItem(8893); -- Item: Etching Tools
	end
end
