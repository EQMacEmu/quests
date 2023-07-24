function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail. adventurer!!  Stand tall and fight for the forest folk and all good races of Norrath. We shall claim this land for the kingdom of Thex!  My warriors shall not fail.  Already we patrol deep in the wilds of Kunark.  We welcome all mercenaries and urge adventurers to [join the defense of the outpost].");
		e.self:DoAnim(60);
	elseif(e.message:findi("join the defense")) then
		e.self:Say("I salute you!!  Join the hunt.  Reports from the front line indicate a rise in the drolvarg	population.  Abandon your fear and slay these beasts for the greater good.  Already. they have taken far too many lives. even my sibling's!!  I shall pay you your wages upon the return of four drolvarg teeth.");
		e.self:DoAnim(67);
	elseif(e.message:findi("sibling")) then --Captain Nealith's Brother quest
		e.self:Emote("appears saddened by the mention of his sibling. 'My brother Marltek has been missing for quite some time. I found coarse Drolvarg hair inside his tent which leads me to believe he has become a meal for the dogs. CURSE THE EVIL DOGS!! I shall see them all dead!!'");
		e.self:DoAnim(28);
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "holds the canine in his palm. 'Good work, but you will have to slay more than this to earn your wages.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12977, item2 = 12977, item3 = 12977, item4 = 12977},1,nil,text)) then
		e.self:Emote("tosses the teeth into a very large cask full of similar teeth. 'Fine work, " .. e.other:GetCleanName() .. ". I wish all my own troops showed the same tenacity. I salute you. This will keep you well fed during your long patrols. Use your wages to better equip yourself. Continue the fight!! The General is pleased.'");
		-- verified live experience and faction
		e.other:Faction(e.self,248,5); -- +Inhabitants of Firiona Vie
		e.other:Faction(e.self,326,3); -- +Emerald Warriors
		e.other:Faction(e.self,312,3); -- +Storm Guard
		e.other:Faction(e.self,441,-1); -- -Legion of Cabilis
		e.other:Faction(e.self,313,-1); -- -Pirates of Gunthak
		e.other:QuestReward(e.self,{copper = math.random(5),silver = math.random(15),gold = math.random(10),itemid = 13155,exp = 10000});
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18076})) then --blood soaked note Captain Nealith's Brother quest
		e.self:Emote("nearly faints after reading the letter. 'Dear Marltek!! I shall miss you. There is more evil in this land!! Madness beyond description. Thank you " .. e.other:GetCleanName() .. ". You put my soul at ease and give me new direction. Please accept my brothers blade. He found it in the wilds. May you use it to slay many Drolvarg!!'");
		e.other:Faction(e.self,248,5); -- +Inhabitants of Firiona Vie
		e.other:Faction(e.self,326,3); -- +Emerald Warriors
		e.other:Faction(e.self,312,3); -- +Storm Guard
		e.other:Faction(e.self,441,-1); -- -Legion of Cabilis
		e.other:Faction(e.self,313,-1); -- -Pirates of Gunthak
		e.other:QuestReward(e.self,0,0,0,14,12978,25580); --Glaive of Marltek
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
