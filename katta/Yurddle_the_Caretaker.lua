function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings stranger. It's nice to have visitors of the living sort. Seems like my work here is never done. When I'm not having to dig fresh graves and keep the mausoleum clean I'm having to refill old graves that have been dug up by the [restless dead] or them disrespectful [grave robbers]!");
	elseif(e.message:findi("restless dead")) then
		e.self:Say("That's right. We've got our fair share of undead lurking around our fine city. Most of the sorry souls aren't as troublesome as the vampyres and we've even got a few [friendly spirits] right here in this very mausoleum.");
	elseif(e.message:findi("friendly spirits")) then
		e.self:Say("Every so often when Norrath is near its zenith a group of spirits gathers at the podium and chairs over there. Seems they were some of the original Loyalists that arrived here on Luclin and helped build our great city of Katta Castellum. Their bodies are at rest in the stone crypts along these mausoleum walls and guarded by the [gargoyle warders]. Yet even in death their spirits convene to discuss the condition of Katta Castellum and the teachings of Tsaph Katta.");
	elseif(e.message:findi("gargoyle warders")) then
		e.self:Say("The gargoyles that guard the residents of this mausoleum are quite fascinating. They were carved late in the construction of Katta Castellum by a very talented dwarven stone worker. Gundle Chislebeard. Gundle used a type of stone found in the very cliffs Katta Castellum is built upon. At first the gargoyles were nothing more than impressive statues but then over time they began to [change].");
	elseif(e.message:findi("change")) then
		e.self:Say("I noticed the eyes of the gargoyles developed a slight glow to them. then they began to shift every so often. The movements were so slight that I probably would not have noticed had I not been working near them every day. Then one night a group of robbers entered the mausoleum and attempted to remove the lids of several crypts. The gargoyles came to life and chased the bandits away. The common presumption is that the spirits of fallen Validus Custodus Legionnaires inhabit the stone forms and continue the duties they performed in life.");
	elseif(e.message:findi("grave robbers")) then
		e.self:Say("It is unfortunate that there are so many disrespectful people that would rob the graves of the dead. The citizens of Katta Castellum do not commit such crimes against their ancestors but thieves from Shadow Haven. greedy Vampyres. and even members of the traitorous Inquisition seeking old combine relics have been caught digging up the dead. I have [lists of belongings] that have been stolen. it would please the spirits of Katta Castellum greatly if these items are returned.");
	elseif(e.message:findi("list of belongings")) then
		e.self:Say("Here are some lists of items that have been stolen from the crypts of the mausoleum in the past. You may bring each crypts set of four missing items to me separately. It is not necessary to find all three sets of items before returning but any set you do return must be complete to please the spirits. Perhaps you should ask around the shops in the other cities of Luclin if the merchants there have seen the missing items.");
		e.other:QuestReward(e.self,0,0,0,0,18353) -- List of Stolen Items
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10670,item2 = 10673,item3 = 10672,item4 = 10671})) then
		e.self:Say("I require the Aeridia Family Signet Ring, the Sealed Golden Scroll Tube, the Faded Silver Embroidered Robe, and the Tarnished Copper Runed Wand that were stolen from Holin Aeridias crypt.");
		e.self:Say("Give this box to the ghost of Holin Aeridia.");
		eq.unique_spawn(160168,0,0,-1702,-633,11,2);
		e.other:Faction(e.self,1502,2); -- Katta Castellum Citizens
		e.other:Faction(e.self,1503,1); -- Validus Custodus
		e.other:Faction(e.self,1504,1); -- Magus Conlegium
		e.other:Faction(e.self,1499,-1); -- Citizens of Seru
		e.other:Faction(e.self,1483,-1); -- Seru 
		e.other:Faction(e.self,1487,-1); -- Shoulders of Seru
		e.other:QuestReward(e.self,0,0,0,0,10682,1000); --  Holin Aeridia's Belongings
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10674,item2 = 10675,item3 = 10676,item4 = 10677})) then
		e.self:Say("I require the Ancient Ornate Combine Dagger, Talikar Family Signet Ring, Faded Portrait of a Lady, and the Antique Platinum Medal that were stolen from Raien Talikars crypt.");
		e.self:Say("Give this crate to the ghost of Raien Talikar.");
		eq.unique_spawn(160169,0,0,-1730,-568,11,100);
		e.other:Faction(e.self,1502,2); -- Katta Castellum Citizens
		e.other:Faction(e.self,1503,1); -- Validus Custodus
		e.other:Faction(e.self,1504,1); -- Magus Conlegium
		e.other:Faction(e.self,1499,-1); -- Citizens of Seru
		e.other:Faction(e.self,1483,-1); -- Seru 
		e.other:Faction(e.self,1487,-1); -- Shoulders of Seru
		e.other:QuestReward(e.self,0,0,0,0,10683,1000); --  Raien Talikars Belongings
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10678,item2 = 10679,item3 = 10680,item4 = 10681})) then
		e.self:Say("I require the Gold Embroidered Kilt, Silver Embroidered Tabard, Ancient Ceremonial Varhammer, and Old Sealed Medicine Pouch that were stolen from Shoeon Malicus' crypt.");
		e.self:Say("Give this crate to the ghost of Shoeon Malicus.");
		eq.unique_spawn(160170,0,0,-1667,-559,11,130);
		e.other:Faction(e.self,1502,2); -- Katta Castellum Citizens
		e.other:Faction(e.self,1503,1); -- Validus Custodus
		e.other:Faction(e.self,1504,1); -- Magus Conlegium
		e.other:Faction(e.self,1499,-1); -- Citizens of Seru
		e.other:Faction(e.self,1483,-1); -- Seru 
		e.other:Faction(e.self,1487,-1); -- Shoulders of Seru
		e.other:QuestReward(e.self,0,0,0,0,10684,1000); --  Shoeon Malicus' Belongings
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
