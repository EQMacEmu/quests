-- Beer for the guards

function event_say(e)
	local rowle = eq.get_entity_list():GetMobByNpcTypeID(160207);
	if(e.message:findi("share a pint")) then
		if(rowle.valid) then
			rowle:Say("That'd be great! By Brell, a short beer or a honey mead'd be a nice change from?");
		end
		e.self:Say("Shhhhhh!!' He runs over and kicks Rowle in the kneecap and chuckles under his beard in your direction. Speaking under his breath to Rowle, 'Don' be such an idjit, now this lad came all the way from Norrath, why not try some of the fabled ales we'd heard our pappy's talkin' of?");
		if(rowle.valid) then
			rowle:Emote("catches on slowly, 'ahhh, roight! Good show, Tack! D'ye think 'e would go te that kinda trouble fer us?'");
		end
	elseif(e.message:findi("trouble")) then
		if(rowle.valid) then
			rowle:Emote("clears his throat and flashes a broken-toothed grin your way, 'Ye know, me dwarven heart longs for me first taste o' some underfoot brown, a reputed fine stout not available 'ere on Luclin... Ye know, if ye can manage it that is.'");
		end
		e.self:Say("Ahhh, worthy o' Brell hisself or so they say. Ye know when I was just a pup, back before the exodus, me uncle used te talk about stompin' trolls and then sitting back with a  Boot Beer te celebrate the day's victory. I, ummm, really would be able te get in touch with me heritage were I able to sample some o' that fine stout. Ye'd be a true friend to the Validus Custodus fer helpin' us out friend. My thanks to ye in advance.");
	end
end


function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19188}, 0)) then
		e.self:Emote("gingerly takes the boot from you, handling it as though it were a fine porcelain. With a look of thanks to you he slowly lifts it to his lips and suddenly tips it back to empty it in one gulp, frothing his beard in the process. 'Yar! That's the ticket! Damn fine stuff that is, just like me uncle always said. A service to the Validus Custodus have ye done, my friend... And I'd be happy to assist ye in that service again sometime. HAR!'");
		e.other:Faction(e.self,1503,1); -- validus custodus
		e.other:Faction(e.self,1502,1); -- katta castellum citizens
		e.other:Faction(e.self,1504,1); -- magus conlegium
		e.other:Faction(e.self,1505,-1); -- nathyn illuminious
		e.other:Faction(e.self,1506,-1); -- coterie of the eternal night
		e.other:Faction(e.self,1483,-1); -- seru
		e.other:Faction(e.self,1484,-1); -- hand of seru
		e.other:Faction(e.self,1485,-1); -- eye of seru
		e.other:Faction(e.self,1541,-1); -- hand legionnaires
		e.other:QuestReward(e.self,0,0,0,0,0,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
