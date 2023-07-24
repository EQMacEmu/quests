function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("If you want a conversation, find one of your own kind to talk to.  I'm just here to sell this fine ale.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 25279}, 0)) then -- Voucher for toolset
		e.self:Say("Here you go " .. e.other:GetCleanName() .. ". I dunno why master Wenglawks trusts you with this but take it anyways and don't mess up.' smacks his fists together as he looks at you.");
		e.other:QuestReward(e.self,0,0,0,0,25104); -- Summon: Coldain Toolset
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25280}, 0)) then -- Voucher for spear 
		e.self:Say("Another delivery eh? Be careful with this spear, if you break it I'll break you.");
		e.other:QuestReward(e.self,0,0,0,0,25106); -- Bekerak's New Spear
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25281}, 0)) then -- Mechanical Net Delivery
		e.self:Say("It's hard to believe a " .. e.other:Race() .. " like you is going to make a trip like this. I don't envy you little fool.");
		e.other:QuestReward(e.self,0,0,0,0,25107); -- Mechanical Net
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1722}, 0)) then -- Helssen's Voucher
		e.self:Say("I still cannot believe we are giving such a prized possesion as the Collar of the Storm to a mere mercenary. You better pray you don't bring shame upon the smith who created and enchanted this item. Oh and here is your seal as Helssen has ordered me to give you. It is proof of your service to us.");
		e.other:QuestReward(e.self,{items = {1723,1721},exp = 2000}); -- Noble's Seal, Collar of the Storm
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
