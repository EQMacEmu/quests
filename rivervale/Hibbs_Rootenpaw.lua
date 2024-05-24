function event_say(e)
	if(eq.is_the_shadows_of_luclin_enabled()) then
		if(e.message:findi("hail")) then
			e.self:Emote("Hello! I am Hibbs Rootenpaw, Master Druid of the Storm Reapers. If you have not yet ventured beyond Rivervale beware of the [dangers] that lurk through out the lands beyond our shire. There are many evil beings that would not hesitate to end the life of a young druid of the Storm Reapers.");
		elseif(e.message:findi("dangers")) then
			e.self:Say("The Teir'Dal, or Dark Elves, to the east have slain a number of brave Storm Reapers that are attempting to cleanse the Nektulos Forest of the corruption caused by the Teir'Dals evil magics. To the west, the human farmers in the Plains of Karana are beset upon by vicious tribes of Gnolls and must valiantly defend their farms. Closer to home the Death Fist Orcs and Goblin Clans Runnyeye and Pick Claws all attempt to control the Misty Thicket and chop down its sturdy trees for lumber. If you are planning on leaving the safety of Rivervale I advise you to deliver this note to Bartle Barnick. He will help you get yourself outfitted for survival in the wilds. When he has outfitted you in a suit of protective leather return here for [further instruction].");
			e.other:SummonCursorItem(19629); -- Letter to Bartle Barnick
		elseif(e.message:findi("further instruction")) then
			e.self:Say("If you feel you are ready for the responsibility of an important task then you may assist with the [investigation] of the ancient cursed fields in the Misty Thicket. The crumbling walls that surround the cursed fields are believed to have been constructed around the same time as the ruined tower and the great wall of Cetelt. We Storm Reapers believe that the walls once surrounded beautiful and fruitful gardens. The arrogance of the caretaker of the gardens offended the Gods and in turn the gardens were cursed with disease and an evil power that animates the corpses of the dead. The Scarecrow, Old Gourdhead, stands in one of these two fields and warns passers by that it is an accursed place. Recently someone has been placing rats in the fields to become diseased.");
		elseif(e.message:findi("investigation")) then
			e.self:Say("We Storm Reapers are searching for the culprit that is seeding the cursed fields with the diseased and undead creatures. The person responsible has committed great offenses to the ways of Karana and the people of Rivervale and must be stopped. Should you identify the individual responsible slay them and bring their head to me and you shall be rewarded for your deed. It is a shame that our otherwise peaceful lives must occasionally be interrupted by the necessity for bloodshed.");
		end
	else
		if(e.message:findi("hail")) then
			e.self:Emote("Hello! I am Hibbs Rootenpaw, Master Druid of the Storm Reapers.");	-- Text made up
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18734})) then -- Tattered Note
		e.self:Say("Hello, friend! I am Hibbs Rootenpaw, leader of the Storm Reapers. Our guild works together with Will Tagglefoot and his family on their farm, to produce the food supply for all of Rivervale. With Karana's help, we have a bountiful harvest every season. We're glad you could help us out. Here's your guild tunic, it'll help keep you dry during the wet months. Go find Reebo out in the fields. He'll help get you started. Welcome aboard! May you serve Karana well.");
		e.other:Faction(e.self,355,100,0); -- +Storm Reapers
		e.other:Faction(e.self,286,10,0); -- +Mayor Gubbin
		e.other:Faction(e.self,292,15,0); -- +Merchants of Rivervale
		e.other:Faction(e.self,324,-15,0); -- -Unkempt Druids
		e.other:QuestReward(e.self,0,0,0,0,13541,20); -- Jumjum Sack Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 19689})) then -- Rusbek's Head
		e.self:Say("Excellent work young Storm Reaper. It is sad that one of our own would resort to such vile acts; his mind must have been twisted by evil desires. Such behavior is practically unheard of among the kind people of Rivervale. Take this dull scimitar and sharpen it in the forge here at the Tagglefoots Farm with a sharpening stone. It may take several attempts if you are unfamiliar with the process. Once that is done give the sharpened scimitar and a large fruit bat wing to Bodbin Gimple and he will put the finishing touches on what will be a fitting scimitar for a Druid of the Storm Reapers.");
		e.other:Faction(e.self,355,10,0); -- +Storm Reapers
		e.other:Faction(e.self,286,1,0); -- +Mayor Gubbin
		e.other:Faction(e.self,292,1,0); -- +Merchants of Rivervale
		e.other:Faction(e.self,324,-1,0); -- -Unkempt Druids
		e.other:QuestReward(e.self,0,0,0,0,19626,10); -- Dull Storm Reaper Scimitar
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
