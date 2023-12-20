function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met brave " .. e.other:Race() .. ". I am Lathin Firetree, Governor of Wizardry here at the Magus Conlegium. I have an abundance of research and experimentation to attend to so unless you have an issue of importance to present or are going to assist me with the research I must get back to my studies.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I require the instructions from Phenic and the Autarkic Shade Lord Belt.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7270,item2 = 7169},1,text)) then
		e.self:Say("Phenic wishes me to summon the Shade that is the owner of this belt for questioning. That is quite a dangerous request but it is not uncommon of Phenic to be a risk taker when it comes to his plots against the Coterie of the Eternal Night. Take this sketch and find a skilled potter to craft you a likeness of a shade from a large block of clay as a focus item for the ritual. When you have the unfired figurine fire it in a kiln with this special glaze on a High Quality Firing Sheet and return to me.");
		e.other:Faction(e.self,1504,2); -- Magus Conlegium
		e.other:Faction(e.self,1502,1); -- Katta Castellum Citizens
		e.other:Faction(e.self,1503,1); -- Validus Custodus
		e.other:Faction(e.self,1483,-1); -- Seru
		e.other:Faction(e.self,1484,-1); -- Hand of Seru
		e.other:Faction(e.self,1485,-1); -- Eye of Seru
		e.other:Faction(e.self,1541,-1); -- Hand Legionnaries
		e.other:QuestReward(e.self,{items = {7271,7272},exp = 1000000}); -- Shade Figurine Sketch, Conlegium Enchanted Glaze
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 7273}, 0)) then
		e.self:Say("Excellent, this figurine will work wonderfully. A group of my best summoners is gathering on the first floor at the largest of the summoning circles to call forth the shade. Please take the figurine to Theurgus Ajeea Polaja immediately.");
		e.other:Faction(e.self,1504,5);
		e.other:Faction(e.self,1502,1);
		e.other:Faction(e.self,1503,1);
		e.other:Faction(e.self,1483,-1);
		e.other:Faction(e.self,1484,-1);
		e.other:Faction(e.self,1485,-1);
		e.other:Faction(e.self,1541,-1);
		e.other:QuestReward(e.self,0,0,0,0,7779); -- Second Shade Summoning Figurine
		eq.depop_with_timer(160410); -- depop Theurgus
		eq.depop_with_timer(160252); -- depop Incanter
		eq.depop_with_timer(160253); -- depop Preecantor
		eq.unique_spawn(160133,0,0,-75,-807,8,164); --  -- Theurgus_Ajeea_Polaja
		eq.unique_spawn(160142,0,0,-120,-808,8,88); --  -- Praecantor_Sels_Dawneyes
		eq.unique_spawn(160160,0,0,-97,-858,8,0); --  -- Incantator_Jak_Masric
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
