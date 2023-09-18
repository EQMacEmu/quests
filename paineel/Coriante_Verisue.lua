function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then -- not exact faction, dubious doesn't work and 0 indifferent works
			e.self:Say("Greetings, young one! There are many tasks to be performed aside from your studies to truly harness the powers passed down to us by our ancestor [Miragul]. The most basic of these tasks is the gathering of bat wings and snake fangs from the yard outside our city. I will reward you for every two bat wings and two snake fangs you bring to me.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("miragul")) then
		if(e.other:GetFactionValue(e.self) >= -100) then -- not exact faction, dubious doesn't work and 0 indifferent works
			e.self:Say("You do not know of Miragul?!! You have more to learn of the heritage of the Dark Truth than at first I thought. Miragul was the first High Man to unlock the secrets of necromancy and is the founder of our city as well as the creator of the treacherous Hole.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You must gather all four of the required items in order to receive your reward. I expect more reliability from you in the future."
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18018})) then --Dark Truth Guild Note
		e.self:Say("You are welcomed into the fold.  Now go out, and prove yourself, young one.  You have much to learn about the Dark Truth.");
		e.other:Faction(e.self,265,100); -- Heretics
		e.other:Faction(e.self,242,-100); -- Deepwater Knights
		e.other:Faction(e.self,254,-100); -- Gate Callers
		e.other:Faction(e.self,231,-100); -- Craftkeepers
		e.other:Faction(e.self,233,-100); -- Crimson Hands
		e.other:QuestReward(e.self,0,0,0,0,13551,20); --Dirt Soiled Robe*
	elseif(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13068, item2 = 13068, item3 = 13067, item4 = 13067}, 1, text)) then --Bat Wing x 2, Snake Fang x 2
		e.self:Say("Very good, young acolyte. Maintain your diligence in your duties and you will quickly learn the secrets of the Dark Truth.");
		e.other:Faction(e.self,265,2);  -- Heretics
		e.other:Faction(e.self,231,-2);  -- Craftkeepers
		e.other:Faction(e.self,233,-2);  -- Crimson Hands
		e.other:Faction(e.self,242,-2);  -- Deepwater Knights
		e.other:Faction(e.self,254,-2); -- Gate Callers
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(15338,15342),5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
