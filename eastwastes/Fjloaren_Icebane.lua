-- The Supply Run
-- author - robregen
-- date - 4/10/12

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("What is it you want, " .. e.other:Race() .. "?  I have no time to speak with your kind.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("supplies")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("If you have supplies give them to me fool.  Do not keep me waiting!");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("coldain")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("The Coldain have created several small outposts within  these wastes.  They hunt the same beasts we do for food and have made this season unbearable.  Our war bands will crush them yet though!");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 25266}, 0)) then -- Giant Sack of Supplies
		e.self:Say("Thank you for bringing the supplies, " .. e.other:GetCleanName() .. ". This season has not treated my clan well.  The winds have grown colder and the Coldain are now brazen enough to hunt the same animals we do.  Take this torque back to Svekk and he will repay you for the supplies.");
		e.other:Faction(e.self,419,5); -- Kromrif
		e.other:Faction(e.self,448,1); -- Kromzek
		e.other:Faction(e.self,406,-2); -- Coldain
		e.other:Faction(e.self,430,-1); -- Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,25278,500); -- Velium Torque
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
