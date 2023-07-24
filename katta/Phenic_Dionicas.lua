function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings adventurer. I am Phenic Dionicas, Magistrate of the Loyalist Combine Empire. I hope the [vampyres] did not cause you troubles on your journey here. ");
	elseif(e.message:findi("vampyres")) then
		e.self:Say("Aye, the vampyres of the Coterie of the Eternal Night. I was among the first to ever [discover] the vampyre threat when I was just a young boy freshly initiated into the [Validus Custodus].");
	elseif(e.message:findi("discover")) then
		e.self:Say("I was on a routine trade route patrol through the tenebrous mountains and the grimling forest when we were attacked by a pack of the vile undead. The creatures that attacked us wore the garments of Shadow Haven merchants and nearly my entire patrol was slain by their claws and fangs. Only [Heratius Grolden] and myself made it back to the safety of Katta Castellum alive and shortly after I was the only survivor of the attack.");
	elseif(e.message:findi("Validus Custodus")) then
		e.self:Say("The Validus Custodus is the army of the Loyalist Empire. It was formerly known as the Tsaph Katta Militia when the city of Katta Castellum was still being erected upon the cliffs that it now stands. As the city grew and the duties of the militia expanded the governors and magistrates of the time met in council and the Validus Custodus was formed. My father Galin Dionicas was elected the first Commander and Chief of the Validus Custodus. Commander Galin was slain in his sleep the very same night that Heratius body was stolen from the graveyard by the vile Coterie of the Eternal Night. Their deeds shall not go unpunished.");
	elseif(e.message:findi("Heratius Grolden")) then
		e.self:Say("Heratius Grolden was a boyhood friend of mine and a brave legionnaire in the Validus Custodus. He was buried with honor in the graveyard of Katta Castellum. Several nights after his burial Heratius' grave had been dug up and his body was missing. I suspect and fear that the Coterie of the Eternal Night returned for him to make him one of their own. I pray to whatever gods are listening that some day we are able to [track down the defilers]!");
	elseif(e.other:GetFaction(e.self) < 6 and e.message:findi("track down the defilers")) then
		e.self:Say("It has been several decades since the first group of vampyres that are responsible for the death of Heratius Grolden were encountered. I have been watching for signs of their origins since that time to little avail. What we do know is that they wore the apparel of merchants from Shadow Haven. How and why they were turned into the bloodsucking creatures they became is still a mystery and shrouded in many rumors. Take this official request form to the merchant records keeper in Shadow Haven and he may be able to provide you with records of any merchant caravans that departed for Katta Castellum within a reasonable time before the attacks and never returned.");
		e.other:SummonCursorItem(31753); --Request Form
	elseif(e.other:GetFaction(e.self) > 5 and e.message:findi("track down the defilers")) then
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	elseif(e.message:findi("Valdanov Zevfeer")) then
		e.self:Say("Valdanov Zevfeer was a traveling alchemist and magical reagent peddler that used to occasionally visit Katta Castellum. At one point before the initial vampyre attacks he decided to remain in Katta Castellum for a while with the wealthy Katta citizen Nathyn Illuminious. Apparently that decision saved his life as according to the records you have provided the caravan he arrived with never completed the return trip to Shadow Haven. That is as much as I know about the individual as he primarily kept to himself during his stay here.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);
	local text = "I require the Ashes of Valdanov Zevfeer, the Magus Conlegium Token, and the Katta Castellum Badge of Service in order to reward you the honor you strive for.";
	if(e.other:GetFaction(e.self) < 6 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18330}, 0)) then
		e.self:Say("I was afraid of this. I do not know how much Halle managed to tell you, but we have had our suspicions about one of the Legionnaires ever since she overheard him talking in his sleep. She was meant to get close to him, I guess she found something out... I should have been more careful!  Take this to Governor Markil, it concerns his men and I've no doubt he can handle it. Thank you much for your help.");
		e.other:Faction(e.self,1561,2); -- Concillium Universus
		e.other:Faction(e.self, 1483, -1); -- Seru
		e.other:Faction(e.self, 1486, -1); -- Heart of Seru
		e.other:QuestReward(e.self,0,0,0,0,18331,1000); -- Sealed Message
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18352}, 0)) then
		e.self:Say("Most interesting. One of the names on this list I recognize. The alchemist [Valdanov Zevfeer]. Nathyn Illuminious would know more of Valdanov. Present this badge to Nathyn so that he knows you have been sent by the Magistrates to inquire about this issue and question him about the alchemist.");
		e.other:Faction(e.self,1561,2);
		e.other:Faction(e.self,1483,-1);
		e.other:Faction(e.self,1486,-1);
		e.other:QuestReward(e.self,0,0,0,0,31752,1000); -- First Badge of Service (Katta Castellum Badge of Service)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31755}, 0)) then
		e.self:Say("So Valdanov had an interest in a Vah Shir vampyre?!! Perhaps we should seek out this Vah Shir and find more clues. Take these orders to Legionnaire Falion during his next shift at the Tenebrous Mountains Gate, he will question any travelers that pass by about this mysterious Vah Shir.  Should you locate the Vah Shir Vampyre attempt to present him with your Badge of Service for questioning, he just may agree to cooperate rather than anger the Validus Custodus.");
		e.other:Faction(e.self,1561,2);
		e.other:Faction(e.self,1483,-1);
		e.other:Faction(e.self,1486,-1);
		e.other:QuestReward(e.self,0,0,0,0,31756,1000); -- Orders for Legionnaire Falion
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18449}, 0)) then
		e.self:Emote(" listens to your account of the events that have occurred since last you spoke and reads through the journal. 'This investigation is getting more and more baffling the further we delve. Among other things, I am wondering if the shade that was imprisoned in the chest is the same that was providing Valdanov with the blood for his research. Take the belt that the shade was wearing with these instructions to Governor Lathin at the Magus Conlegium. In the meantime I will pay a visit to Nathyn Illuminious.");
		e.other:Faction(e.self,1561,4);
		e.other:Faction(e.self,1483,-1);
		e.other:Faction(e.self,1486,-2);
		e.other:QuestReward(e.self,0,0,0,0,7270); -- Instructions for Lathin Firetree
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 7361}, 0)) then -- Enchanted Record of Events
		e.self:Say("There is much that is disturbing about these revelations. I will make sure the Validus Custodus is alert than they already are to the presence of powerful vampyre among our citizens. If you can find this Valdanov Zevfeer slay him and bring me his ashes your Katta Castellum Badge of Service, and your Magus Conlegium Token I will bestow upon you an honorable reward.");
		e.other:Faction(e.self,1561,25);
		e.other:Faction(e.self,1483,-2);
		e.other:Faction(e.self,1486,-12);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29899}, 0)) then
		e.self:Emote("looks at you and smiles despite the fact that you have splashed water all over him- he does not appear to be burning at all.  'Oh, excuse me.  You seem to have spilled your water, here have some of mine my friend.  Good day to you, " .. e.other:GetCleanName() .. ",' he says.");
		e.other:QuestReward(e.self,0,0,0,0,29898);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 7397,item2 = 31757,item3 = 7394}, 1, text)) then
		e.self:Say("You have done a great service for Katta Castellum and the Loyalist Empire. I award you for your honorable Services. Know that you will be remembered for your deeds.");
		e.other:Faction(e.self,1561,50);
		e.other:Faction(e.self,1483,-5);
		e.other:Faction(e.self,1486,-25);
		e.other:QuestReward(e.self,0,0,0,0,7398,100000); -- Loyalist Shield of Honor
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
