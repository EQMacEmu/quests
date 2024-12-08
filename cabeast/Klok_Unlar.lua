function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("wipes flour from his hands and turns to greet you. 'Welcome! Please look over my many treats. Do not think of the coin you shall spend. Heavy coin buys the finest and sweetest of treats. Feel free to ask me about any of the rare pies you see as I can tell you exactly how I make them.");
	elseif(e.message:findi("bugrin")) then
		e.self:Say("My apprentice baker, Bugrin?  You have no reason to concern yourself with one who is under my tutelage.  I shall summon him if need be.  He is under my control and protection.");
	elseif(e.message:findi("bixie berry pie")) then
		e.self:Say("Bixie berry pie?!!  It is no treat and is poisonous to the Iksar.  We use it to keep our froglok slaves nourished.  My apprentice baker, Bugrin, bakes them and delivers them to the slaves.  Only he has access to the bixie berry pie recipe.  All the pies are eaten by the slaves. If you think you have one, you must be mistaken.  Let me see it if you believe you have one.");
	elseif(e.message:findi("mudcomb muffin")) then
		e.self:Say("Mudcomb muffins are a rare treat indeed. Who would ever think such a sweet tasty morsel would require mudcombs from the giant wasps?");
	elseif(e.message:findi("mist myre pudding")) then
		e.self:Say("Mist Myre pudding is made from a secret ingredient from the legendary City of Mist.");
	elseif(e.message:findi("honey berry pie")) then
		e.self:Say("Honey berry pie is made with the sweet bixie berries of Warsliks Woods and also, with honey from the great honey caves in the dangerous land dubbed the Overthere.  It has become a Cabilis favorite.");
	elseif(e.message:findi("cactus tart")) then
		e.self:Say("From the Dreadlands comes the main secret ingredient of the tasty cactus tarts.");
	elseif(e.message:findi("whipped hunkle pear pie")) then
		e.self:Say("The Dreadlands and the Swamp of No Hope supply me with the sweet ingredients necessary to bake the fabulous whipped hunkle pear pie.");
	elseif(e.message:findi("lichen clover sweet bread")) then
		e.self:Say("Many Iksar gatherers were lost in the effort to obtain the sweet lichen clover.  Think of them every time you taste the lichen clover sweet bread.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12676})) then --Bixie Berry Pie
		e.self:Emote("breaks open the crust of the pie. 'Wait! What is this? A device of some kind? It looks kind of like some sort of lockpick. BUGRIN!! Get in here and answer some questions at once!!");
		eq.unique_spawn(106302,0,0,120,563,4,0); -- NPC: Bugrin_the_Gatherer 
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
