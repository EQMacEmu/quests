-- Beer for the guards

function event_say(e)
	local tack = eq.get_entity_list():GetMobByNpcTypeID(160398);
	if(e.message:findi("hail")) then
		if(tack.valid) then
			tack:Say("Oi there, friend!");
		end
		e.self:Say("Sure'n this one came from Norrath, eh Tack? One wonders if'n a bottle o' one on o' the finer things in life might be in our future, if we were to ask politely?");
		if(tack.valid) then
			tack:Say("Yar, Rowle. So whadda ye say, friend? We stand around drinkin' water on duty all day, and that ain't no life fer a dwarf. Now we bin hearin' bout all these new ales and suchnot comin' up from Norrath. Ye think ye might be so kind as to share a pint and raise our spirits?");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19967}, 0)) then
		e.self:Emote("takes a wee sip and smacks his lips together, proclaiming, 'Ahhh, a finer stout has never passed my lips, ' before draining the mug in one gulp. 'Yer a saint amongst us, I say. Feel free to keep 'em coming, " .. e.other:GetCleanName() .. "!'");
		e.other:Faction(e.self,1503,1); -- validus custodus
		e.other:Faction(e.self,1502,1); -- katta castellum citizens
		e.other:Faction(e.self,1504,1); -- magus conlegium
		e.other:Faction(e.self,1505,-1); -- nathyn illuminious
		e.other:Faction(e.self,1506,-1); -- coterie of the eternal night
		e.other:Faction(e.self,1483,-4); -- seru
		e.other:Faction(e.self,1484,-1); -- hand of seru
		e.other:Faction(e.self,1485,-1); -- eye of seru
		e.other:Faction(e.self,1541,-1); -- hand legionnaires
		e.other:QuestReward(e.self,0,0,0,0,0,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
