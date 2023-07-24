function event_say(e)
    if(e.language == 19 and e.other:GetLanguageSkill(19) >= 100) then
		if(e.other:GetFaction(e.self) < 5) then
			if(e.message:findi("Hail")) then
				e.self:Say("Ragh!' His eyes you with pure hatred. 'Indigo, my dark bowels. . . treachery it is, treachery against the clan. Gharol paid! Paid for it!' He shows you his hands and grins maliciously. 'Paid, he did!",19);
			elseif(e.message:findi("rare disease")) then
				e.self:Emote("snorts 'You have someone that needs killing, or someone that needs saving? It not matter to Brugga, but you smell of a hero, so Brugga think there someone need saving. Well Brugga have time, so you give Brugga the disease and Brugga see.");
			end
		else
			e.self:Say("I wont deal with one such as you...",19);
		end
    else
         e.self:Emote('does not appear to understand you.');
    end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 29302}, 0)) then
		e.self:Emote("dips his finger into the flask and tastes the liquid, 'Hmm, someone start work on this already and it still vile. This nothing that Brugga have trouble to cure, we just need stronger toxins to drive this one back. Brugga need a gnome made crawlerpoison, a venom sack from the Terror Matriarch, and the stinger from a Nettling Wraith, Brugga make you a cure.");
		e.other:QuestReward(e.self,0,0,0,0,29302);
	elseif(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 29297,item2 = 29298,item3 = 29299})) then
		e.self:Say("Yes, Brugga work with this.' Brugga chants and makes strange gestures while mixing the objects in his mortar and pestle. 'Ok, Brugga finished now. You have your cure, give cure with the bile and that will heal. You go now, Brugga done talking.",19);
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,29295,100000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
