-- Iramai_Sacredsoul
-- Alternate Access: Plane of Torment

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh, hello. I am sorry, I did not see you approach. I have been giving all of my attention to poor [Phanti] here.");
	elseif(e.message:findi("phanti")) then
		e.self:Say("A few days ago Phanti started to get very ill, while she was preparing herself for another trip into [Saryrn's domain]. We are not sure exactly was caused her to fall into this malaise, although we do have our [suspicions].");
	elseif(e.message:findi("suspicions")) then
		e.self:Say("Torment, the Plane of Pain. She was doing some research on the denizens there, should you [help] us, I could grant you and your companions entry. The key will not do Phanti any good for quite some time.");
	elseif(e.message:findi("help")) then
		e.self:Say("Recently, the portal from the Plane of Disease has been unusually active. People have been reporting strange sounds from around the portal at night, and a few of our trackers have seen strange, almost rodent like, footprints. Our best guess is that one of the denizens of the Plane of Disease managed to make its way into our plane. If this is true, it may explain the unnaturally quick manifestation of the disease. Perhaps, the bile from one of the rodents will help us learn of the cause, and hopefully a cure.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Hmm, it looks like I will need both the cure and the purified bile in order to heal Phanti.";
	
	-- Confirmed Live Experience
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29295,item2 = 29302}, 1, text)) then -- Vial of Opaque Fluid, Purified Bubonian Bile
		e.self:Say("You've done it! Praise the Tranquil! I can already see Phanti's condition improving. Take these, Phanti is not going to be doing any planar exploration any time soon. She was planning on using them to bring her research party into Torment, make good use of them, and stay safe. Thank you again for your help.");
		e.other:QuestReward(e.self,{itemid = 29213,exp = 6250});
		
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29315}, 0)) then
		e.self:Emote("pours the bile into a small flask, there is a puff of green smoke, which turns white as it floats into the sky. 'This is good news. It appears that this is the cause for her disease, but I have neither the tools, nor the knowledge to create a cure. There is rumor of an indigo orc who may prove useful to us in this area, but he is imprisoned in the Plane of Justice. Ask him about rare diseases. He was known to have cured many, prior to his imprisonment.");
		e.other:QuestReward(e.self,0,0,0,0,29302,50000); -- Purified Bubonian Bile
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
 