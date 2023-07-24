function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Whats you wants!!  Me great master of da bashers.  Me tinks yooz must be lookin' fer trainin'.  Yooz looks like a weaklin'.  Me train yooz and yooz helps me get fatter.  Well!!  Are yooz gonna [helps Hergor get fatter]?!!");
	elseif(e.message:findi("get fatter")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Yooz makes da good choice.  Me nevers get enuff ta eats.  Eats more and gets more stronger. me always say.  Yooz gos and speaks wit carver Cagrek.  Yooz tell him [Hergor wants his fungus dung pie].  Yooz duz dis and me gives you sum rawhide armer or tatters armer.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("More service to da bashers, den me listen.");
		else
			e.self:Say("Me smell death coming your way!  Da bashers no like you. Hey!  Me am basher!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if (e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12210})) then -- Fungus Spore Pie
		e.self:Say("Mmmmm... Mm... Mmm! Dat smells gud! Me gets more fat and gets more strength. You dus gud job weekling. Me gives you dis armer. It keeps you from getting bashed gud. Now gos away. Me no share pie wit weekling.");
		e.other:Faction(e.self,235,5); --Da Bashers
		e.other:Faction(e.self,222,-1); --Broken Skull Clan
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(2161,2162,2163,2164,2165,2166,2167,2168,2169,2170,2171,2172),500); -- various large raw hide armor
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
