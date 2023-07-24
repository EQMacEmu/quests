function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to The Abattoir fellow Cazicite. I am Shwara Volerno. Mistress of Necromancy. If you have just begun to study the Necromantic arts I will assist you with obtaining some [clothing] and a robe that will be most useful when conducting research outside of The Abattoirs walls. We members of the Abattoir are the most feared of the residents of Paineel by the citizens of Erudin. to venture too far beyond the safety of our city unprepared would be foolish.");
	elseif(e.message:findi("clothing")) then
		e.self:Say("You will require this Curing Kit that has been specially prepared for the crafting of a suit and robe of Abattoir Initiate Clothing. The components necessary to craft the clothing vary according to the article that  you desire to fabricate. Once you have been outfitted in the proper attire return to me and you may assist with some [important research]. Do you desire to fabricate an [abattoir initiate cap]. [abattoir initiate wristband]. [abattoir initiate gloves]. [abattoir initiate boots]. [abattoir initiate sleeves]. [abattoir initiate pantaloons]. or [abattoir initiate robe]?");
		e.other:SummonCursorItem(17125); -- Item: Curing Kit
	elseif(e.message:findi("important research")) then
		e.self:Say("We Cazicites of the Abattoir are the most advanced Necromancers in all of Norrath. Our greatness is due to the diligence and studiousness we apply to our research. and our powers over fear. The foolish sorcerers in Erudin are afraid of the knowledge we possess. They fear the magic we wield and control. for their minds are too weak to harness it themselves. Despite our vast knowledge there is always more to learn that can prove to be beneficial to The Abattoir. I require your assistance in obtaining some [new information].");
	elseif(e.message:findi("new information")) then
		e.self:Say("The Abattoir has recently discovered a Kobold Spiritist that wields necromantic powers. We believe this unusual kobold resides in the Warrens of Clan Kolbok as he has been sighted entering and exiting those ruinous caverns. It is possible that this kobold has somehow acquired this necromantic knowledge from Paineel but I would not like to rule out the possibility that it is a rare form of kobold sorcery. Find this Kobold Spiritist and bring me whatever arcane parchments you discover in his possession.");
	elseif(e.message:findi("cap")) then
		e.self:Say("To craft an Abattoir Initiate Cap you must obtain two [silk thread]. woven widow silk. and a briar snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Cap Pattern.");
		e.other:SummonCursorItem(19555); -- Item: Tattered Cap Pattern
	elseif(e.message:findi("glove")) then
		e.self:Say("To craft Abattoir Initiate Gloves you must obtain two [silk thread]. woven widow silk. two briar snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
		e.other:SummonCursorItem(19559); -- Item: Tattered Glove Pattern
	elseif(e.message:findi("wristband")) then
		e.self:Say("To craft an Abattoir initiate Wristband you must obtain a [silk thread]. woven widow silk. and a briar snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
		e.other:SummonCursorItem(19558); -- Item: Tattered Wristband Pattern
	elseif(e.message:findi("sleeve")) then
		e.self:Say("To craft Abattoir Initiate Sleeves you must obtain two [silk thread]. woven widow silk. and two large briar snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
		e.other:SummonCursorItem(19557); -- Item: Tattered Sleeve Pattern
	elseif(e.message:findi("boot")) then
		e.self:Say("To craft Abattoir Initiate Boots you must obtain two [silk thread]. two woven widow silk. and two briar snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
		e.other:SummonCursorItem(19561); -- Item: Tattered Boot Pattern
	elseif(e.message:findi("pantaloon")) then
		e.self:Say("To craft Abattoir Initiate Pantaloons you must obtain two [silk thread]. woven widow silk. and four large briar snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Leggings Pattern.");
		e.other:SummonCursorItem(19560); -- Item: Tattered Pant Pattern
	elseif(e.message:findi("robe")) then
		e.self:Say("To craft an Abattoir Initiate Robe you must obtain three [silk thread]. two woven widow silks. and two giant briar snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Robe Pattern.");
		e.other:SummonCursorItem(11395); -- Item: Tattered Robe Pattern
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20420})) then
		e.self:Say("Well done " .. e.other:GetCleanName() .. ".These parchments will be inspected immediately by some of The Abattoirs most experienced translators and researchers. Take this Rough Abattoir initiate Staff then go forth an obtain a Giant Briar Snake Skin and a Petrified Eyeball. Once you have done so bring me those items and the rough abattoir initiate staff and I will put the final touches on what will be your new instrument of power.");
		e.other:Faction(e.self,265, 1); -- Faction: Heretics
		e.other:Faction(e.self,242, -1); -- Faction: Deepwater Knights
		e.other:Faction(e.self,254, -1); -- Faction: Gate Callers
		e.other:Faction(e.self,231, -1); -- Faction: Craftkeepers
		e.other:Faction(e.self,233, -1); -- Faction: Crimson Hands
		e.other:QuestReward(e.self,0,0,0,0,20358);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20358, item2 = 20356, item3 = 20402})) then
		e.self:Emote("fashions a grip out of the Giant Briar Snake Skin, fastens the Petrified Eyeball to a steel mount on one end of the staff, and tarnishes the wood of the staff with a shimmering black substance. 'Here is your new Abattoirs Initiate Staff, " .. e.other:GetCleanName() .. ". May it serve you well in your pursuit for power.'");
		e.other:Faction(e.self,265, 1); -- Faction: Heretics
		e.other:Faction(e.self,242, -1); -- Faction: Deepwater Knights
		e.other:Faction(e.self,254, -1); -- Faction: Gate Callers
		e.other:Faction(e.self,231, -1); -- Faction: Craftkeepers
		e.other:Faction(e.self,233, -1); -- Faction: Crimson Hands
		e.other:QuestReward(e.self,0,0,0,0,20418);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:paineel  ID:75015 -- Shwara_Volerno
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
