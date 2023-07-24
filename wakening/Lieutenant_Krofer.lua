function event_say(e)
	if(e.other:GetFaction(e.self) <= 5 and e.message:findi("hail")) then
			e.self:Say("Unless you're the new mercenary reinforcements I suggest you remove yourself from my presence before I decorate the bottom of my boot with your intestines.");
	elseif(e.other:GetFaction(e.self) < 5) then
		if(e.message:findi("next assignment")) then
			e.self:Say("Well, ready or not, this must be done now. Out there in the forest are our enemies. For us to be successful, we must know what they are doing and how they are going about it. Our probing attacks have revealed little so we've decided to send you out to gather any info you can. There must be some sort of messenger out there, bring any info you might find.");
		elseif(e.message:findi("prepared")) then
			e.self:Say("Very well. We've decided to attack the small Sifaye village northeast of here and I want you to coordinate the attack. I will send you into Kael Drakkel with a request for troop assistance. After the squad is assembled you will lead them to the staging point where you will oversee the battle. Here is the request. Take it to Drioc in the city and return here with the troops.");
			e.other:SummonCursorItem(1706); -- Krofer's Requisition
		elseif(e.message:findi("reinforcement")) then
			e.self:Say("Oh? Well then show me your assignment, " .. e.other:Race() .. ".");
		end
	elseif(e.other:GetFaction(e.self) == 5) then
		if(e.message:findi("next assignment") or e.message:findi("prepared")) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		end
	elseif(e.other:GetFaction(e.self) > 5) then
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself."));
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Where is the rest, manling?";
	
	if(e.other:GetFaction(e.self) <= 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1702}, 0)) then -- Mercenary Assignment
		e.self:Say("Drioc sent you? I suppose one can't expect much from a mercenary. Well then, " .. e.other:GetCleanName() .. ", your first assignment will be to clear out some of this forest's annoying populace. Bring me the meat of one of the raptors, the meat of two panthers, and the remains of one of those living puddles of black sludge found in the caves. You will then have your payment.");
		e.other:Faction(e.self,448,10); -- Faction: Kromzek
		e.other:Faction(e.self,419,2); -- Faction: Kromrif
		e.other:Faction(e.self,429,2); -- Faction: King Tormax
		e.other:Faction(e.self,430,-5); -- Faction: Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
	elseif(e.other:GetFaction(e.self) <= 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 22851,item2 = 22851,item3 = 22852,item4 = 1703},1,text)) then -- 2x panther meat, raptor meat, Tar Goo Strand
		e.self:Say("Well, I suppose you may be worth something more than fodder after all. Here is your payment. Speak to me again when you are ready for your next assignment. For now, get some rest, you will need it.");
		e.other:Faction(e.self,448,10); -- Faction: Kromzek
		e.other:Faction(e.self,419,2); -- Faction: Kromrif
		e.other:Faction(e.self,429,2); -- Faction: King Tormax
		e.other:Faction(e.self,430,-5); -- Faction: Claws of Veeshan
		e.other:QuestReward(e.self,1,7,0,12,0,1000);
	elseif(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1704}, 0)) then -- Sifaye messenger's report
		e.self:Say("Excellent, " .. e.other:GetCleanName() .. ". With this we can plan an attack that might actually accomplish something. Here is your payment. You have also earned this cloak, it should help protect you from the clawing undergrowth of this savage land. Your next mission will be more complex and dangerous, however we may be able to spare a laborer or two to assist you. Rest now, and tell me when you are prepared.");
		e.other:Faction(e.self,448,13); -- Faction: Kromzek
		e.other:Faction(e.self,419,3); -- Faction: Kromrif
		e.other:Faction(e.self,429,3); -- Faction: King Tormax
		e.other:Faction(e.self,430,-6); -- Faction: Claws of Veeshan
		e.other:QuestReward(e.self,0,5,4,11,1705,1000); -- Velium Studded Cloak
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1707}, 0)) then -- Signed Requisition
		e.self:Emote("takes the note and looks it over, then sighs and says, 'This will have to be enough. The squad should be here shortly. When they arrive you will march with them to the staging area near the village of those insect Sifaye. When you are satisfied with the formation, give the corporal the order to attack and observe the battle. After the village is destroyed return this report to me and we'll plan our next move.'");
		e.other:QuestReward(e.self,0,0,0,0,1708,1000); -- Mission Report
		eq.unique_spawn(119022,0,0,-4975,-699,-182,63);  -- Corporal_Hlash
		eq.unique_spawn(119025,0,0,-4954,-697,-182,63);  -- Berzerker_Dolvad
		eq.unique_spawn(119027,0,0,-4954,-671,-182,63);  -- Berzerker_Voldak
		eq.unique_spawn(119028,0,0,-4976,-672,-182,63);  -- Disciple_Atharm
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
