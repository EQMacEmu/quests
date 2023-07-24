function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Beware the bone field beyond the path. It is said that the bones of a thousand fallen warriors walk its grounds at night.");
	elseif(e.message:findi("sign the restraining order")) then
		e.self:Say("Blast! The masters have condemned me to a life of sobriety and bloodshed! At least I still have bloodshed. But I would like one last drink. I would like a bottle of Legion Lager from Cabilis. Bring me the lager and the legion order and then I shall sign it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "What?! I need the Legion Lager and the legion order.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18242, item2 = 12463},1,text)) then --Legion Order (2 signed), Legion Lager
		e.self:Emote("slowly signs the order. '...Love, Innoruuk. There you go. Now run along. Let me enjoy my last brew alone.'");
		-- confirmed faction hits
		e.other:Faction(e.self,441,1); --Legion of Cabilis
		e.other:Faction(e.self,440,1); --Cabilis Residents
		e.other:Faction(e.self,445,1); --Scaled Mystics
		e.other:Faction(e.self,442,1); --Crusaders of Greenmist
		e.other:Faction(e.self,444,1); --Swift Tails
		e.other:QuestReward(e.self,0,0,0,0,18243,500); --Legion Order (3 signed)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
