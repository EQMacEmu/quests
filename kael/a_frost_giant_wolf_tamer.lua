function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Yes, small one?  You seek to interrupt my work for what reason?");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("looking for work")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Do you not see the wolves?  I train them.  I break them of their pride and make them into useful servants.  Only when they willingly accept the harness are they useful.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("harness")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Aye.  Good metal.  We make their harnesses and wraps here in Kael from strong black steel.  You can't break a beast without a good strong harness.  I've learned that from years of working with them.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("more work")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Yes. I was charged with a certain... delivery. Apparently one of our good friends named Erdarf in Thurgadin needs a shipment of one karsin acid bottle. You can find such a thing in Crystal Caverns. Maybe one of the orc dogs has it. Find a way to get one of those bottles to our good friend eh? When you do, let me see whatever it is you find on him.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30245}, 0) or item_lib.check_turn_in(e.self, e.trade, {item1 = 30246}, 0)) then
		e.self:Say("Ahhh.  Now this is interesting indeed.  I see.  Crafty little ice gnats.  Here, perhaps you can find use for one of our harnesses.  Fair trade eh?  If you want more work let me know.");
		e.other:QuestReward(e.self,0,0,0,0,30249);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30270}, 0)) then
		e.self:Say("Ahhh.  Now that really is an interesting little trinket.  You know, that might be interesting with a harness.");
		e.other:QuestReward(e.self,0,0,0,0,30273);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30273}, 0)) then
		e.self:Say("Yes.  Exactly as I thought.  Hrm.  I'd keep this but you've done much work.  You may be one of the filthy outlanders but you can keep it.  You can save your thanks.");
		e.other:QuestReward(e.self,0,0,0,0,30274);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30273,item2 = 30249}, 0)) then
		e.self:Say("Yes.  Exactly as I thought.  Hrm.  I'd keep this but you've done much work.  You may be one of the filthy outlanders but you can keep it.  You can save your thanks.");
		e.other:QuestReward(e.self,{items = {30274,30249}}); -- Item: Blood Wolf Harness
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
