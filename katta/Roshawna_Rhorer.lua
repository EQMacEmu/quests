--  Rakshasa Skulls

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("A pleasure to speak with you! You appear to be a foreigner to Katta Castellum as well. I hope your reasons for visiting this noble city are more leisurely than my own. In addition to my normal duties as a Shar Vahl Emissary to Katta Castellum there is the issue of the [Tormented Vah Shir] in Tenebrous Mountains that must be dealt with."); 
	elseif(e.message:findi("tormented vah shir")) then
		e.self:Say("Recently the skeletons of Vah Shir have been spotted wandering the Tenebrous Mountains ferociously and blindly attacking the living. There are legends among my people that speak of Vah Shir warriors that were murdered dishonorably in their sleep by a traitor allied with [dark spirits]. The spirits of these murdered warriors become trapped in their decaying mortal shells for often many years before they are driven mad by the despair, rage, and torturous experience. When this negative spirit energy becomes strong enough the corpses rise and attempt to slaughter all that crosses their path in their state of eternal rage. Spirits tormented in such a manner must be assisted so that they may finally find peace in death. Will you [help the souls] find peace?");
	elseif(e.message:findi("dark spirits")) then
		e.self:Say("Not all spirits that can be called upon by those who are in touch with the spirit realms are of good intentions. There are spirits who seek to destroy and corrupt.These dark spirits are best avoided and kept from manifesting their influence on the mortal realms.Unfortunately the foolish or the weak willed are tempted by their promises of power. Most who deal with the dark spirits are shortly driven mad by the spirits influence or destroyed by the very powers they were promised.  There are tales however of powerful shaman capable of harnessing and controlling the dark spirits and their evil powers of corruption. These wicked traitors to the Vah Shir teachings are called [Rakshasa].");
	elseif(e.message:findi("rakshasa")) then
		e.self:Say("Like I said the Rakshasa are spoken of only in old tales. Whether they truly existed or not can not be proven for sure and the elder spiritualist insist they are nothing more than creatures of fiction. If there truly is a Rakshasa alive today it would be a powerful creature indeed. They are said to no longer have a physical body of their own, having traded it to a powerful evil spirit so that it may enter the mortal realm in exchange for dark gifts. Because the Rakshasa no longer has a physical body of its own it must take the forms of other creatures and can not be destroyed with conventional weapons.");
	elseif(e.message:findi("help the souls")) then
		e.self:Say("The only way for a tormented undead Vah Shir to be put to rest is to destroy its body and take its skull to Shar Vahl where our spiritualists can perform a ritual to cleanse and free the imprisoned spirit. Fill this chest with skulls and return it to me and I will make the preparations for it to be sent to Shar Vahl.  The spiritualists there have just recently received word of the situation and will be prepared to perform the proper rituals when the time comes.");
		e.other:SummonCursorItem(17079);  -- Runed Iron Bound Chest
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31836}, 0)) then
		e.self:Emote("purrs an incantation and waves her claws back and forth over the chest. The runes inscribed on the chest and iron bands begin to softly glow with a golden light. 'You have done a great service for these poor souls. I have sent for a courier to come for the chest of skulls but he is quite late in his arrival. I will keep it safe until the courier arrives.");
		e.other:Faction(e.self,1513,5); -- Guardian of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,17,0,10000);
		eq.unique_spawn(160171,31,0,-544,665,4,0);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31839}, 0)) then -- Resealed Runed Iron Bound Chest
		e.self:Say("It appears this situation is much more dire than we had first presumed. It would be unsafe to send this crate within the walls of Shar Vahl should another innocent be possessed and the tormented vah shir be resurrected once more. I shall scribe a note explaining the occurrences for you to deliver along with the crate to Spiritist Roleko at the vah shir outpost in Grimling Forest.");
		e.other:Faction(e.self,1513,2); -- Guardian of Shar Vahl
		e.other:QuestReward(e.self,{items = {31840,31841},exp = 10000}); -- Resealed Warded Iron Bound Chest, Roshawna's Report of Occurrences
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
