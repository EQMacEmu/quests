-- Earring of Veracity #1 (Insignia)
-- Sanctus Seru : torsten reidan

function event_spawn(e)
	eq.set_timer("hum",300000);
end

function event_timer(e)
	e.self:Emote("looks through the bookcase as if searching for something.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh, hello there. Sorry I didn't notice you before I was thinking of an [old friend]. This used to be his room. I guess no one else has been assigned to these quarters.");
	elseif(e.message:findi("old friend")) then
		e.self:Say("His name was Bregun Dorey. What a funny little halfling he was. He had a good heart and worked hard. That is up until one day he just started acting odd, very nervous like he was hiding something. Then all he would talk about was Bixie Treats and then show off some weird heirloom charm bracelet. His time for the question came and due to his odd behavior he was sent to Marus Seru. I sure wish I knew how he was doing.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29852}, 0)) then
		e.self:Say("Bregun is still alive!? Amazing, I thought in his fragile state he wouldn't last long in Marus Seru or the Lair of the Netherbians for that matter. Here before anyone hears us talking, take this note to him. I believe he was onto something big and I must know what it was.");
		e.other:QuestReward(e.self,{itemid = 29853}); -- Sealed Note to Bregun
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29854}, 0)) then
		e.self:Emote("pulls out a hollow book entitled 'A Detailed Look at Etiquette and Proper Grammar' and opens it to find a journal placed inside. 'This is astounding. The information in this journal is invaluable and must be brought to the others attention. Take this insignia. When you are ready to help us further seek out Euzan Jurek, tell him you were sent by me, and he will tell you what you can do to further our cause. I can not tell you more than this, but keep the insignia close to you for now.'");
		e.other:Faction(e.self,1503,10); -- Validus Custodus
		e.other:Faction(e.self,1502,1); -- Katta Castellum Citizens
		e.other:Faction(e.self,1504,1); -- Magus Conlegium
		e.other:Faction(e.self,1505,-1); -- Nathyn Illuminious
		e.other:Faction(e.self,1506,-1); -- Coterie of the Ethernal Night
		e.other:Faction(e.self,1483,-1); -- Seru
		e.other:Faction(e.self,1484,-5); -- Hand of seru
		e.other:Faction(e.self,1485,-1); -- Eye of seru
		e.other:Faction(e.self,1541,-1); -- Hand legionnaries
		e.other:QuestReward(e.self,{itemid = 29857}); -- Insignia Earring of Veracity
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

