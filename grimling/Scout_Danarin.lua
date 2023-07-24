function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". Welcome to the front lines of our war against the bastard grimlings. As I'm sure you know, we Vah Shir shun violence, but with this enemy there is no other way. Let me know if you'd like to see some action.");
	elseif(e.message:findi("see some action")) then
		e.self:Emote("smiles, 'I can escort you to a camp rich with enemies. With my help you can take possession of their camp. They'll try desperately to reclaim their lost territory and, if we're lucky, an officer will show up. You'll want to bring about ten soldiers as powerful as me. When you're all here and ready for battle, give me a marbled acrylia sphere.");
	end
end

function event_trade(e)
	if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(167681) ) then -- ##Scout_Danarin 
		return;
	end
	
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4349}, 0)) then -- Marbled Acrylia Sphere
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
		e.self:Say("May the spirits guide us "..e.other:GetCleanName()..". Now summon your friends and all the courage you possess, this won't be easy.");
		eq.unique_spawn(167035,14,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #Scout_Danarin
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

