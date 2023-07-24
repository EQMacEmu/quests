function event_say(e)
	if(e.message:findi("follower of karana")) then
		e.self:Say("Yes. I am a follower of Karana, the Rainkeeper. It is He who keeps the plains fertile.");
	elseif(e.message:findi("blessing")) then
		e.self:Say("Of the things I desire, I can think of nothing I wish for more than the blessings of Karana. By drinking from the temple chalice of a Karana cleric I can attain this.");
	elseif(e.message:findi("karana bandit")) then
		e.self:Say("The Karana bandits are rogues who operate in the plains. I have heard there are bounties for the bandits. Within the Temple of Thunder in Qeynos, Cleric Gehna offers one for bandit spectacles and Paladin Chesgard offers one for bandit sashes.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12103})) then
		e.self:Say("May the Rainkeeper keep you safe. I thank you. Here is the empty chalice. By the way, inform your superior that the operations of the [Karana bandits] are getting closer to Qeynos.");
		-- Confirmed Live Faction
		e.other:Faction(e.self,345,5,0); -- Faction: Karana Residents
		e.other:Faction(e.self,280,1,0); -- Faction: Knights of Thunder
		e.other:Faction(e.self,262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,341,1,0); -- Faction: Priests of Life
		e.other:QuestReward(e.self,0,0,0,0,12104,2000); -- Item: An Empty Chalice
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
