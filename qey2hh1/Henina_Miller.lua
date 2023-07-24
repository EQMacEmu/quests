-- Gathering Grain

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings, %s. Welcome to the Miller Farmstead. [Cleet] and I have lived out here on the plains of Karana for thirty years now. We grow the finest grains in all of Norrath. Admire the grains all you like, but steer clear of those [scarecrows].",e.other:GetName()));
	elseif(e.message:findi("cleet")) then
		e.self:Say("Cleet is my husband. He is a hard worker and provides for the [kids] and me.");
	elseif(e.message:findi("kids")) then
		e.self:Say("We have five children.  [Cleet Junior] is our youngest and the only one born of my womb.  [Furball] is second youngest.  [Chanda] is a little bit older than him and [Baobob] is a few years older than her.  [Tiny] is our oldest.");
	elseif(e.message:findi("junior")) then
		e.self:Say("Cleet Junior is a bit of a problem.  He just was not meant to be a farmer.  Cleet wants the boy, being our only child to actually have Miller blood, to take over the farm when he is gone but Cleet Junior is more interested in adventure.");
	elseif(e.message:findi("furball")) then
		e.self:Say("We adopted Furball after [Tiny] found him dying in our field.  We couldn't very well send him back to that awful Blackburrow place!  Those gnolls kill their young who come back to the clan after being defeated in battle.  Furball doesn't even remember that place and his home is here now.");
	elseif(e.message:findi("tiny")) then
		e.self:Say("Tiny is our adopted son.  [Cleet] rescued him from a bunch of hooligans who were trying to kill him like they did his momma.  Cleet is quite a heroic man.  We took Tiny in and raised him as a Miller.  We are quite proud of him.  I just wish folks would not pester him like they do.  It is not his fault he was born an ogre.");
	elseif(e.message:findi("scarecrow")) then
		e.self:Say("Yep, those scarecrows are snarky. I've told Cleet more than a few times that I'd like to cook their heads into a pie, but he won't let me get near them. Oh, there was a recipe book that the Hutchison's gave us as a gift that described how to bake five different wisp lightstones into a scarecrow head to make it glow. Ah well.");
	elseif(e.message:findi("chanda") or e.message:findi("baobob")) then
		e.self:Say("We adopted Chanda and Baobob at the same time.  They're blood kin, ya know!  Tiny found them sleeping in the field one day.  Baobob told us how their folks had been killed, so we took them in as part of our growing family.  They have left the farm, though, to pursue careers as tanners.  I miss them sometimes.  They don't visit often enough.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13990})) then -- Sack of Hay
		e.self:Say("Thank you so much. Tiny gets quite tired doing this by himself. Here you go.");
		e.other:Faction(e.self,345,1); -- Faction: Karana Residents
		e.other:Faction(e.self,262,1); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,341,1); -- Faction: Priests of Life
		e.other:Faction(e.self,280,1); -- Faction: Knights of Thunder
		e.other:QuestReward(e.self,math.random(5),0,0,0,0,100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE zone: ID:12026 -- Henina_Miller.pl 
