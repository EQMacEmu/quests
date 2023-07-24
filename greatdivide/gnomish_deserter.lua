function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("smiles at you and nods congenially.  'Hullo there.  Nice ta meet ya.' He moves to shake your hand and then seems to remember that his hand is currently frozen to a very heavy, very solid hunk of metal shaped somewhat like a box.");
	elseif(e.message:findi("box")) then
		e.self:Say("Huh?  Box?  Where's a box?  Heh.  I don't see a box.");
	elseif(e.message:findi("stuck")) then
		e.self:Say("Erm.  Well ya see.  One day I was on guard duty and a huge white cat knocked me over.  It looked like it was running away towards the bridge island.  Anyways, I fell into the water.  I guess I passed out because next thing I knew I was over near the gnolls laying on top of this huge box.  It's then that I made the decision.");
	elseif(e.message:findi("decision")) then
		e.self:Say("To leave.  I'm really tired of this pirate stuff.  Captain Nalot said it was gonna be great fun and an adventure but all I've seen is a lot of biscuits, slush water, and guard duty.  So I'm here.");
	elseif(e.message:findi("here")) then
		e.self:Say("Yup.  This isn't such a bad spot.  It's nice and peaceful.  I can see for miles and every once in a while someone like you drops by to talk.  There's no guard duty and I don't have to say 'Arrrr' anymore.  That really starts to hurt your throat, you know.  The only problem I have anymore is my hand frozen to this box.  If ya find a way to fix it let me know.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30061}, 0)) then -- dissolving liquid
		e.self:Emote("grins and pours the ooze on his hand and the box.  You hear a burning sizzle and then the box thumps onto the ground.  'Ow! Ow! Take it!  Hah.  I never thought I'd get rid of that piece of...'");
		e.other:QuestReward(e.self,0,0,0,0,30039); -- Locked Rum Box
	end
	item_lib.return_items(e.self, e.other, e.trade)
end