function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail noble, " .. e.other:GetCleanName() .. "!  Can you be of [service to the Clerics of Tunare] or are you not from our order?");
	elseif(e.message:findi("service to the clerics of tunare")) then
		if(e.other:GetFactionValue(e.self) >= 100) then	
			e.self:Say("That is good. Prove yourself, then.  Are you [new to Felwithe] or have I been conversing with a [veteran of the good fight]?");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you have furthered your service to the Paladins of Tunare, we shall make conversation.");
		else
			e.self:Say("You have some nerve to approach a loyal member of the Paladins of Tunare! Run, while you can!");
		end
	elseif(e.message:findi("new to felwithe")) then
		if(e.other:GetFactionValue(e.self) >= 100) then	
			e.self:Say("Then stand at attention when I speak.  I want you to venture to Kelethin and seek out Tandan Nybright.  He is an old member of ours.  He had some hardships and he fell from Tunare's grace, yet he is still a member of our family.  He will be the one who reeks of elven wine.  Greet him by name.  We are worried for him.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you have furthered your service to the Paladins of Tunare, we shall make conversation.");
		else
			e.self:Say("You have some nerve to approach a loyal member of the Paladins of Tunare! Run, while you can!");
		end
	elseif(e.message:findi("veteran of the good fight")) then
		if(e.other:GetFactionValue(e.self) >= 100) then	
			e.self:Say("I command you to venture to Innothule and seek a beast called Jojongua, a name penned by the trolls.  It is said to be ten feet tall and nothing but fury.  Some say it resembles a kobold, but how can that be?  You bring this beast's hide to me and then I will believe you to be a veteran.  Beware!  Innothule is a very dangerous place even for a noble veteran.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you have furthered your service to the Paladins of Tunare, we shall make conversation.");
		else
			e.self:Say("You have some nerve to approach a loyal member of the Paladins of Tunare! Run, while you can!");
		end
	elseif(e.message:findi("honored member")) then
		if(e.other:GetFactionValue(e.self) >= 50) then	
			e.self:Say("Yes. The light of righteousness shines from within you.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you have furthered your service to the Paladins of Tunare, we shall make conversation.");
		else
			e.self:Say("You have some nerve to approach a loyal member of the Paladins of Tunare! Run, while you can!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18781})) then -- Tattered Note
		e.self:Say("Greetings. young paladin!  I am Master Tynkale of the Clerics of Tunare.  Here. we shall teach and train you in the skills needed to defeat our evil and diseased enemies.  Take this, our guild tunic - it will help protect you. Wear it with pride, for you are now one of us.");
		e.other:Faction(e.self,226,100,0);  --Clerics of Tunare
		e.other:Faction(e.self,279,100,0); --King Tearis Thex
		e.other:Faction(e.self,5002,75,0);   --Anti-mage
		e.other:QuestReward(e.self,0,0,0,0,13591,20);  -- Used Gold Training Tunic*
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13351})) then
		e.self:Say("So you have proven yourself to be a great slayer of beasts.Now it is time to prove yourself to be an asset to the Crown. You are to meet a man named Tolon Nurbyte. He will be at the local inn. Go to him and repeat the phrase, 'The glory of the Mother shines bright.' I can say no more. Oh.. and here. This may help you on your upcoming adventure.");
		e.other:Faction(e.self,226,20,0);  --Clerics of Tunare
		e.other:Faction(e.self,279,20,0); --King Tearis Thex
		e.other:QuestReward(e.self,0,0,0,0,0,250); 
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:felwithea  ID:61018 -- Tynkale
