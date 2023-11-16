function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 200) then
			e.self:Say("Hail, " .. e.other:GetCleanName() .. "! Stand tall whenever you are speaking to the Sheriff of Rivervale. I command the warriors of this vale. You must be new to the ranks of the Guardians of the Vale, so be sure to report to your squad at once. We must protect our people. The [danger] has come closer to home. If you are not a deputy, then please leave these halls.");
		else
			e.self:Say("Please come back when you have proven yourself more and I may have a task for you.");	
		end
	elseif(e.message:findi("danger")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("What danger?!! You must be new to the community. The goblins of Clan Runnyeye have been scaling our wall somehow. You must join our forces in exterminating every one of those beasts. Your wages are earned with every four bloody goblin warbead necklaces you return to me. Now be off and fight the good fight.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You are in good standing with the Guardians of the Vale. Continue with your good work and then we may speak.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end	
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18733})) then -- Hand in Warrior Recuitment Letter
		e.self:Say("Welcome to the Guardians of the Vale. I'm Roglio Bruth, and I run this proud little outfit. You seem to be of hearty stock, let's put you to work. Here's your guild tunic - hope it fits. Start your training right away.  Speak with the marshals of this guild.");
		e.other:Faction(e.self,263, 100,0); -- Gaurdians of the Vale
		e.other:Faction(e.self,286, 15,0); -- Mayor Gubbin
		e.other:Faction(e.self,355, 10,0); -- Storm Reapers
		e.other:Faction(e.self,292, 15,0); -- Merchants of Rivervale
		e.other:Faction(e.self,334,-15,0); -- Dreadguard Outer
		e.other:QuestReward(e.self,0,0,0,0,13540,20); -- Old Tan Tunic
	elseif(item_lib.count_handed_item(e.self, e.trade, {13931}, 4) > 0) then -- Hand in Runnyeye Warbeads -- works regardless of faction for takp era
		e.self:Say("Good work, Deputy " .. e.other:GetCleanName() .. "! We shall soon rid our countryside of the goblin threat. Here are your wages. Eat well tonight!");
		e.other:Faction(e.self,263, 1,0); -- Gaurdians of the Vale
		e.other:Faction(e.self,286, 1,0); -- Mayor Gubbin
		e.other:Faction(e.self,355, 1,0); -- Storm Reapers
		e.other:Faction(e.self,292, 1,0); -- Merchants of Rivervale
		e.other:Faction(e.self,334,-1,0); -- Dreadguard Outer
		e.other:QuestReward(e.self,{silver = math.random(10),items = {13024,13023},exp = 5000}); -- Tanglefoot Tingle Drink, Bixie Berry Buns ; exp data confirmed
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- End of File, Zone:rivervale  NPC:19058 -- Sheriff_Roglio
