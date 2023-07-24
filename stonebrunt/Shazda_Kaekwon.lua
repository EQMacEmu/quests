function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("Shalom, " .. e.other:GetCleanName() .. "! I welcome you to our humble village in these [trying times].");
		else
			e.self:Say("You have done much to anger the spirits thus you are not accepted by our people.");
		end
	elseif(e.message:findi("trying time")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("There are many threats currently facing this village. The kobolds of Clan Kolbok are becoming bolder in pushing the boundaries of the territory in which they usually hunt. A few of the kobolds now hunt recklessly, killing for pleasure instead of sustenance. [Rognarog] the Infuriated is the most murderous of such kobolds. Then there are the [heretics] that have been invading both Clan Kolbok and Kejek territories alike, practicing their dark sorceries as a show of devotion to their faceless god.");
		else
			e.self:Say("You have done much to anger the spirits thus you are not accepted by our people.");
		end
	elseif(e.message:findi("heretic")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("The heretics have not only corrupted their own spirits but they defile the spirits of the dead with their evil sorceries. Fill this satchel with the heads of invading heretics and I shall reward you for your allegiance to Kejek.");
			e.other:SummonCursorItem(17883); -- Item: Burlap Satchel
		else
			e.self:Say("You have done much to anger the spirits thus you are not accepted by our people.");
		end
	elseif(e.message:findi("rognarog")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("Rognarog the Infuriated was once a mighty warrior for Clan Kolbok until his devotion to the kobold god Rolfron Zek devoured his spirit and drove him mad with anguish. Now he wanders the mountains and valleys of Stonebrunt shedding the blood of whatever creatures cross his path. Should you face Rognarog and release him from this life I will reward you for his severed head.");
		else
			e.self:Say("You have done much to anger the spirits thus you are not accepted by our people.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= -200 and item_lib.check_turn_in(e.self, e.trade, {item1 = 6969}, 0)) then
		e.self:Say("Less heretics to defile the lands and spirits. You have the gratitude of Kejek for your assistance in repelling the heretic threat.");
		e.other:Faction(e.self,5011,8); -- Faction: Kejek Village
		e.other:Faction(e.self,298,1); -- Faction: Peace Keepers
		e.other:QuestReward(e.self,math.random(9),math.random(9),math.random(9),math.random(3),eq.ChooseRandom(6955,6953),5000);
	elseif(e.other:GetFactionValue(e.self) >= -200 and item_lib.check_turn_in(e.self, e.trade, {item1 = 6968}, 0)) then
		e.self:Say("By slaying Rognarog you have spared the lives of those who would have crossed his path. I thank you for your assistance, the spirits have noticed your actions and are pleased.");
		e.other:Faction(e.self,5011,3); -- Faction: Kejek Village
		e.other:Faction(e.self,298,1); -- Faction: Peace Keepers
		e.other:QuestReward(e.self,math.random(9),math.random(9),math.random(9),0,eq.ChooseRandom(6982,6983,6984),5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
