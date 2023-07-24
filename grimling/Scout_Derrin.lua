function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". What brings you to the battlegrounds? Looking to raid a grimling camp perhaps?");
	elseif(e.message:findi("looking to raid")) then
		e.self:Say("I can lead a dozen men of my strength on a raid against a well fortified grimling encampment. It's a risky mission, but one that has the potential to yield substantial rewards. If you have the manpower and the courage, give me a glowing acrylia sphere and we'll get started.");
	end
end

function event_trade(e)
	if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(167682) ) then -- ##Scout_Derrin
		return;
	end
	
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4376}, 0)) then -- Glowing Acrylia Sphere
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
		e.self:Say("Draw your best weapons, memorize your most deadly spells and cast your best enhancements. Prepare yourselves for a fierce battle!");
		eq.unique_spawn(167036,15,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #Scout_Derrin
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

