function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Greetings, child of Tunare. As druids of the Mother of all, we may only use blunt weapons and the scimitar, all other blades are forbidden. Prove your devotion by bringing me a [rusty short sword], a [rusty long sword], a [rusty broad sword], and a [rusty bastard sword]. I will destroy them and reward your faith.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Tunare be praised! Do you have the rest I requested?";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18786})) then -- Tattered Note
		e.self:Say("Welcome! We are the Soldiers of Tunare, the sworn protectors of Faydark. I thank you for joining our cause, we can always use the help. Here, put on this tunic, and let's get started.. you have much to learn.");
		e.other:Faction(e.self,310,100); -- soldier of Tunare
		e.other:Faction(e.self,279,15); -- King Tearis Thex
		e.other:Faction(e.self,246,15);  -- Faydark's Champions
		e.other:QuestReward(e.self,0,0,0,0,13537,20);
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 5013,item2 = 5016,item3 = 5019,item4 = 5022},1,text)) then
		e.self:Say("You have done well, child! Take this as a blessing from Tunare for doing her will.");
		e.other:Faction(e.self,310,1); -- soldier of Tunare
		e.other:Faction(e.self,279,1); -- King Tearis Thex
		e.other:Faction(e.self,246,1);  -- Faydark's Champions
		e.other:QuestReward(e.self,math.random(9),math.random(9),math.random(9),0,eq.ChooseRandom(5047,6012),250);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:gfaydark  ID:54083 -- Heartwood_Master 
