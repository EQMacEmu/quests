--Edited by anubisrwml
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, did you need assistance with something or are you just browsing?");
	elseif(e.message:findi("treat") or e.message:findi("buckler")) then
		e.self:Say("Sure, I can help you with that.  You'll need a specially soaked cloth to help the tincture set into the material of the shield.  Please let me see the buckler so that I can give you the appropriate size of cloth.");
	elseif(e.message:findi("soaking solution") or e.message:findi("spore")) then
		e.self:Say("It's really not as difficult as it sounds. The spores required to make the solution that you'll need are easy to find. They grow in the dulfis mushrooms that are found in the caves beyond the thicket. You'll just need to throw the whole mushroom into a flask of water to brew. Once the dulfis has boiled in the water for a while, you'll get a murky gray liquid. Boil the cloth in that liquid for a bit in the brew barrel and then wrap the steaming cloth around the buckler and the tincture that Fharra gave you. Let the cloth cool and you should see the desired results. Bring the buckler to me once you're done and I'll tell you if you did it correctly.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3495})) then
		e.self:Emote("cuts the cloth big enough to cover your buckler twice over and folds it neatly. She puts the cloth on the buckler and hands it to you. She looks around for a moment...");
		e.self:Say("Sometimes I feel as if the spirits are playing tricks on me. I'm out of spores. I never seem to run out of spores until the times when I need them most. You'll need to gather them on your own to make the [soaking solution].");
		e.other:QuestReward(e.self,{items = {3495,5538}}); -- Item: Large Folded Cloth
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5543})) then
		e.self:Say("Quite impressive! Quite impressive, indeed! To be honest it took me a very long time to become that good at imbuing items and enhancing their natural properties. You show a great deal of promise. If you will be willing to help me with another task, I could recommend you for a possible promotion within the ranks of the Dar Khura. I need you to take this bag and fill it with wet fang eyes. Just find a stagnant body of water, spear a wet fang, and pop its eyes out!");
		e.other:QuestReward(e.self,{items = {5543,17076}}); -- Item: Imbued Hopperhide Buckler
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5541})) then
		e.self:Say("Thank you very much! I was almost out of these eyes and I'm sure you'll agree they aren't easy to come by. Your assistance will not go unnoticed. Here is the blessing I promised you. Take this token to Spiritualist Fehril along with your recruits cloak, and your wonderful new buckler. He'll know that I send you with my blessing. Take care and may the spirits guide you, young Dar Khura.");
		e.other:Faction(e.self,1533,10); -- Faction: Dar Khura
		e.other:QuestReward(e.self,0,0,0,0,5542,3500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
