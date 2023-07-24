function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I am Astaed Wemor of the Paladins of the Temple of Life. We are the defenders of the all-giving Prime Healer. Are you [here to pray] or are you [here to assist the temple]?");
	elseif(e.message:findi("here to pray")) then
		e.self:Say("Then pray long and silently, " .. e.other:GetCleanName() .. ". Fill your soul with the breath of life.");
	elseif(e.message:findi("assist the temple")) then
		e.self:Say("Good.  There are a few in the congregation who require assistance.  Will you be [traveling afar] or are you [staying close to Qeynos]?");
	elseif(e.message:findi("traveling afar")) then
		if(e.other:GetFactionValue(e.self) >= 150) then
			e.self:Say("Then outfit yourself well. We will require you to visit Rivervale, the village of the halflings. There you shall find an herb merchant named Kizzie Mintopp. She has an ingredient we require. Tell her you are from the Temple of Life");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I do not dislike you, but I cannot fully trust one who has yet to prove his service to the Prime Healer.  Perhaps you can assist us in ridding the land of diseased animals. Priestess Caulria will accept all pelts from rabid beasts.");		
		else
			e.self:Say("Foolish person! The word is out amongst the followers of the Prime Healer not to trust you."); 
		end
	elseif(e.message:findi("staying close to qeynos")) then
		if(e.other:GetFactionValue(e.self) >= 150) then
			e.self:Say("Then you can help with one of our distraught members. The priests have noticed that Nerissa Clothspinner has been a little down lately. Go console her and ask her how she is doing. She is a sweet girl and the temple is worried about her.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I do not dislike you, but I cannot fully trust one who has yet to prove his service to the Prime Healer.  Perhaps you can assist us in ridding the land of diseased animals. Priestess Caulria will accept all pelts from rabid beasts.");		
		else
			e.self:Say("Foolish person! The word is out amongst the followers of the Prime Healer not to trust you."); 
		end
	elseif(e.message:findi("Lempeck Hargrin")) then		
		e.self:Say("Have you run into poor, sick Lempeck? He has been ill for quite some time. I have promised to deliver a secret healing potion which might help. Perhaps you can be of assistance and retrieve the potion for me... That is, if you don't mind [traveling afar].");		
	elseif(e.message:findi("bertoxxulous") or e.message:findi("plaguebringer")) then
		e.self:Say("The beast of the plague.  Bertoxxulous is the foe who spits disease upon the land and mutates the perfection which is life.  He shall soon meet his fate at the hands of Rodcet Nife and as for his followers, the Bloodsabers, they shall meet their doom by the hand of the Temple of Life.");
	elseif(e.message:findi("rodcet")) then
		e.self:Say("The river of life which flows through us all originates from the power of Rodcet Nife, the Prime Healer.  He maintains the flow and if any ailment should block its path, the Temple of Life does whatever is necessary to keep the river running.  If this calls for the death of another being, then so be it.  Let one river die so that all may flow freely.");
	elseif(e.message:findi("heal")) then
		e.self:Say("I cannot help you with your request.   You must speak with Brother Tonmerk Plorsin.");
	end
end

function event_trade(e)
	local item_lib = require("items");	

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18862})) then		
		e.self:Say("So you have helped Nerissa. That is good. Here, then, is a small reward. May you find it useful. Keep fighting the good fight!");
		-- confirmed live faction
		e.other:Faction(e.self,341,5,0); -- Faction: Priests of Life
		e.other:Faction(e.self,280,1,0); -- Faction: Knights of Thunder
		e.other:Faction(e.self,262,2,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,221,-1,0); -- Faction: Bloodsabers
		e.other:Faction(e.self,219,1,0); -- Faction: Antonius Bayle
		e.other:QuestReward(e.self,0,math.random(15),math.random(10),0,eq.ChooseRandom(6022,6023,6024,6025),4000);
	elseif(e.other:GetFactionValue(e.self) >= 150 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13952})) then
		e.self:Say("I pray to Rodcet Nife that you have made it back in time. Let's add a small amount of this honey jum to this and.. here is the potion. This potion must be taken to a sick member of the congregation. The man is Lempeck Hargrin. He lives in the west plains of Karana between the river and the crop fields. He is in dire need of this potion. He has an odd disease. We have tried everything to cure him and this is his last chance. Run to him.");
		-- confirmed live faction
		e.other:Faction(e.self,341,20,0); -- Faction: Priests of Life
		e.other:Faction(e.self,280,6,0); -- Faction: Knights of Thunder
		e.other:Faction(e.self,262,10,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,221,-5,0); -- Faction: Bloodsabers
		e.other:Faction(e.self,219,3,0); -- Faction: Antonius Bayle
		e.other:QuestReward(e.self,0,math.random(10),0,0,eq.ChooseRandom(13954,13955),1000); -- either good or bad Prime Healer Potion
	elseif(e.other:GetFactionValue(e.self) >= 150 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13970})) then
		e.self:Say("It is good to know that we saved Lempeck. He has given us his scythe as a donation to the temple. We shall find a use for it. As for your fine work at preserving the life of another, I reward you with the Shining Star of Life. Should you ever desire more strength in battle, call upon it to give you strength, but let it be known that at battle's end, you shall feel weaker than before you called upon the power. Just for a short time. When the power is drained, go to our temple storehouse and ask Whysia to [recharge the Shining Star of Life]. Go and serve life.");
		-- confirmed live faction
		e.other:Faction(e.self,341,20,0); -- Faction: Priests of Life 
		e.other:Faction(e.self,280,6,0); -- Faction: Knights of Thunder
		e.other:Faction(e.self,262,10,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,221,-5,0); -- Faction: Bloodsabers
		e.other:Faction(e.self,219,3,0); -- Faction: Antonius Bayle
		e.other:QuestReward(e.self,0,math.random(10),math.random(10),0,6356,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:qeynos2  ID:2094 -- Astaed_Wemor 
