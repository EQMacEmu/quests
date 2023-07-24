function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, citizen! Keep clear of the waterways which run through this grand city. For swimming they are not. Many times have playful broodlings fallen prey to the sharp teeth of barracudas.");
	elseif(e.message:findi("sign the restraining order")) then
		e.self:Say("So the legion has sent you to have me sign this order, eh? Nay. I shall not do so unless the messenger, you, gathers two barracuda teeth for me. Hand me the legion order when you hand me the two barracuda teeth and then your task shall be complete.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You shall get my signature when I have the legion order and two barracuda teeth.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18244, item2 = 12465, item3 = 12465},1,text)) then --Legion Order (4 signed), Barracuda Tooth x 2
		e.self:Emote("grabs the barracuda teeth and attaches them to a necklace. 'Good. Now this barracuda charm shall keep me safe from slipping into the waters and becoming a feast for the barracuda. And you, take this legion order and be gone.'");
		-- confirmed faction hits
		e.other:Faction(e.self,441,2); 	--Legion of Cabilis
		e.other:Faction(e.self,440,1); 		--Cabilis Residents
		e.other:Faction(e.self,445,1); 	--Scaled Mystics
		e.other:Faction(e.self,442,1); 		--Crusaders of Greenmist
		e.other:Faction(e.self,444,1); 	--Swift Tails
		e.other:QuestReward(e.self,0,0,0,0,18245,800);	--Legion Order (5 signed)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
