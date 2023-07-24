-- Claw Needle
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ", watch where you step for the [needle clawed hoppers] are just about everywhere!");
	elseif(e.message:findi("hopper")) then
		e.self:Say("Those wretched vermin swarm to our city and trade routes in search of the refuse left by careless travelers who pass through these parts. They are just about useless and their stench brings bile to my throat. I would have set out to poison the whole lot of them if it was not for their unique [claws].");
	elseif(e.message:findi("claws")) then
		e.self:Say("The claws of the hoppers act as a [spirit anchor]. They are specialized in tearing into the fiber of the shadow beings that roam the thicket. I find these claws useful in binding the silk fashioned by the [shadeweavers].");
	elseif(e.message:findi("shadeweavers")) then
		e.self:Say("The shadeweavers hunt the beings of shadow found within the thicket. From them they fashion their shadow armor they call Xakra. We have tried to use this strong and lightweight armor in the past, but the shadows just disperse. I have found that sewing this armor onto a suitable [spirit anchor] will keep it from dispersing.");
	elseif(e.message:findi("spirit anchor")) then
		e.self:Say("A spirit can only materialize within our realm by binding themselves to an object that is a spirit anchor. Some bones and stones have such properties. A spirit anchor can also do the most damage to the material form of such spirits when used as a weapon. I use the claws of the hoppers as a sewing needle of sorts to [bind the silk] made by the [shadeweavers]. A standard sewing needle would only pass through the substance of the silk. The hopper claws can pierce through their ethereal fabric effectively.");
	elseif(e.message:findi("bind the silk")) then
		e.self:Say("A spirit must be bound to material from our own realm. Stones such as those used to build cities can be great anchors for spirits. The more ritual and culture that a stone is exposed to, the stronger it becomes as an anchor. You can use the claws of a hopper to sew the shadeweavers silk onto a suitable anchor. If you bring me four of these claws, I can fashion one of them into a needle for you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30601, item2 = 30601, item3 = 30601, item4 = 30601})) then
		e.self:Say("Well done! You have brought me plenty of claws. I have enough now to make a needle for you. May it serve you well.");
		e.other:QuestReward(e.self,0,0,0,0,30617,750);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
