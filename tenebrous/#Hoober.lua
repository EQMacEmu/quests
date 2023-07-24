local elixer = 0;

function event_spawn(e)
	eq.set_timer("feign",1000);
	eq.set_timer("depop",300000);
end

function event_timer(e)
	if(e.timer == "feign") then
		e.self:SetAppearance(3);
		eq.stop_timer("feign");
	elseif(e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5994}, 0)) then
		e.self:Emote("coughs a bit as you feed him the elixir. With a bit o a start he comes around to full consciousness with a calm in his eyes. 'Do I know you?' he asks.");
		elixer = 1;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_say(e)
	if(elixer == 1 and e.message:findi("happened to behari")) then
		e.self:Emote("sobs into his hands, 'horrible tings... such horrible things... I remember this man named Behari, take this, it belonged to him before... before I... 'suddenly, Hoober begins to shake uncontrollably. He starts to look at you, something between fear and dementia behind his eyes, 'Go! GO NOW! It's starting again, I shouldn't be around decent people! LEAVE ME ALONE! Stop treating me like a fool, I will leave the money in a sack under the seventy-third pillar from the giant froglok just as I agreed with your master NOW GET AWAY FROM ME!' His shouts echo throughout the mountains as he tears off at a full sprint.");
		e.other:QuestReward(e.self,0,0,0,0,5996,500);
		elixer = 0;
		eq.depop();
	end
end


function event_death_complete(e)
	elixer = 0;
	eq.spawn2(172012, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end