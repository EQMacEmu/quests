function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Why. hello there fellow scholar!  Don't you just love books?  I am quite a bookworm myself.  I could read forever!  I am currently working my way through the 'T's.");
	elseif(e.message:findi("erud's tonic")) then
		e.self:Say("Erud's Tonic! That is none of your concern!"); 
	elseif(e.message:findi("phloatin")) then
		e.self:Say("Phloatin Highbrow is my brother. He spends his time grogging it up."); 
	elseif(e.message:findi("kiss")) then
		e.self:Say("Hey! What do think you are doing?! Help!"); 
		eq.attack(e.other:GetName());
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13121})) then
		e.self:Say("It's about time you figured it out, genius! Maybe you should spend more time in the library. Here, take this tonic and get out of here before they see me giving it to you and turn us both inside out.");
		-- confirmed live faction
		e.other:Faction(e.self,694,5,0); -- Faction: Erudite Citizen
		e.other:QuestReward(e.self,0,0,0,0,13118,500); -- Item: Eruds Tonic
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98036 -- Sinnkin_Highbrow
