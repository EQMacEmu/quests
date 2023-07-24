function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("curtsies politely 'Welcome to our home! I am the Countess Silveana of the Tunarean Court.");
	elseif(e.message:findi("tunarean")) then
		e.self:Say("The Tunarean Court consists of several of Tunares most blessed creatures. We Sifaye help defend the wakening land from the invading giants to the east and watch for threats from the dragons to the west.");
	elseif(e.message:findi("giant")) then
		e.self:Say("There is a giant with a strange metal stick that has been the largest threat as of late. He wanders further into our lands than the other with the stick to his eye and squashes my Sifaye when he finds them. If you eliminate him for us I would like to see that stick he carries.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30221}, 0)) then
		e.self:Emote("claps boisterously 'My people are in your debt for putting an end to that monsters murderous squashings! Here is the crest of the Sifaye");
		e.other:Faction(e.self,449, 20); -- Tunarean Court
		e.other:QuestReward(e.self,0,0,0,0,24866,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
