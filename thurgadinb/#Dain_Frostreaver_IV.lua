function event_say(e)
	if(e.message:findi("greetings and good fortune to you, honored dain frostreaver iv")) then
		if(e.other:GetFaction(e.self) >= 5) then
			e.self:Emote("seems to stare right into your soul with his one good eye. A chill runs down your spine.");
		elseif(e.other:GetFaction(e.self) >= 3) then
			e.self:Emote("smiles at you and nods his head indicating he has been pleased with your progress.");
		else
			e.self:Say("Greetin's and good fortune to yerself, " .. e.other:Race() .. ". Chamberlain Krystorf speaks highly of the deeds you have performed for our people and so I welcome you to my Keep. I ask you now to take up a most dangerous duty for our people. Would you accept such a challenge from the King of a people not your own?");
			e.self:DoAnim(48);
		end
	elseif(e.message:findi("accept")) then
		if(e.other:GetFaction(e.self) < 3) then
			e.self:Emote("smiles at you with pride and says, 'Something told me you would, " .. e.other:GetCleanName() .. ". For years upon years the plagues of King Tormax have been unleashed upon my people. And indeed it was also by Tormax's hand that me own father, Dain Frostreaver the Third was slain. My attempts at assassinating him have only met with failure, and our forces, while strong, are not yet mighty enough to assault Kael Drakkel. Therefore I have ye and yer companions as my last hope, " .. e.other:GetCleanName() .. ". Kill that bastard who calls himself King Tormax... and bring me his head!'");
		end
	elseif(e.message:findi("mission")) then
		if(e.other:GetFaction(e.self) < 3) then
			e.self:Say("After General Bragmur has equipped the armor you have created for him, give him these orders. He is a skilled diplomat and will need to reach the pirate Gnomes. We must enter into a pact with them. We will supply them the velium that they need to build their silly gadgets, and they will take their ship back to Antonica and call for reinforcements from out ancestors. We hope they will acceppt this pact, after all Brell has been known to align himself with Bristlebane whom the Gnomes of Iceclad follow. You may be an important [factor] in their success.");
		end
	elseif(e.message:findi("factor")) then
		if(e.other:GetFaction(e.self) < 3) then
			e.self:Say("I fear that spies lurk in every corner. You may need to help the General reach the gnomish camp if the Kromrif have gotten word of our efforts. You should call on any allies that you have to assist in case they ambush you. Brell bless you " .. e.other:GetCleanName() .. ", good luck.");
		end
	elseif(e.message:findi("count on my help")) then
		e.self:Say("Several of our greatest officers, including a few veterans from the war on Yesterwinter are assembling just outside our city. Gather your army at once and give this parchment and the ninth ring to Sentry Badian. I will remain inside the city with a few of my troops to defend it against any who might penetrate your defense. May Brell be with you, " .. e.other:GetCleanName() .. ".");
		e.other:SummonCursorItem(1567);
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8886}, 0)) then -- Coldain Standard Issue Kit
		e.self:Say("Excellent work " .. e.other:GetCleanName() .. ". If I didn't know I would assume this was made by our most skilled artisans.  You must hurry, General Bragmur has formed camp in Iceclad. Take the kit to the General, he had to drudge forward without any armor. His [mission] must be a success if we hope to successfully defend Thurgadin against the Giants.");
		e.other:QuestReward(e.self,{items = {8898,8897}}); -- Expedition Orders, Approved Issue Kit
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1199}, 0) or item_lib.check_turn_in(e.self, e.trade, {item1 = 8895}, 0)) then
		e.self:Say("Ah " .. e.other:GetCleanName() .. ". I was hoping to see you. We require your skilled hand. The Armory is overtaxed preparing armor for the war we are preparing to wage on the Kromzek. We need you to help by creating some Field Plate for a mission that is near to execution. Go see Loremaster Solstrin in the Hall of Ancestors, give him these orders. He holds the lore recorded on how to make the field plate. Return to me when you have completed a Standard Issue Kit.");
		e.other:QuestReward(e.self,{items = {8895,8896}}); -- Royal Coldain Orders, Runed Coldain Prayer Shawl (mark 2)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1465}, 0)) then
		e.self:Say("My good " .. e.other:GetCleanName() .. ", you have served me well. You have flushed out all who sought to oppose me and my people. I am afraid I need to call upon you and your friends one final time. The dissention and treason ran deeper than I had anticipated. Our population has been cleansed, but we lost a full third of our army to the poisonous words of those rebels. In retaliation for your deeds, the Kromrif have made plans to attack us in this, our weakest hour. Can I count on your help outlander?");
		e.other:QuestReward(e.self,0,0,0,0,1465);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30516}, 0)) then
		if(e.other:GetFaction(e.self) <= 2) then -- warmly or better
			e.self:Say("You have done what no Coldain could do, " .. e.other:GetCleanName() .. "! This is indeed a glorious say in our people's history. In return for your invaluable service I present you with the Tri-plated Golden Hackle Hammer. Its magic is powerful and I am sure it will serve you well.");
			e.self:Shout("Let it be know from this day forth that " .. e.other:GetCleanName() .. " and their companions are Heros of the Coldain Kingdom. King Tormax has been slain, it is a time for celebration. Let no tankard go unfilled!");
			e.other:Faction(e.self,405,100); -- Faction: Dain Frostreaver IV
			e.other:Faction(e.self,406,100); -- Faction: Coldain
			e.other:Faction(e.self,429,-50); -- Faction: King Tormax
			e.other:QuestReward(e.self,0,0,0,0,30502);
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30385},0)) then -- 10th ring
		if(e.other:GetFaction(e.self) <= 1) then
			e.self:Say("" .. e.other:GetCleanName() .. ", your deeds have changed the fate of my people forever. Not since the sacrifice of Colin Dain himself has anyone so selflessly risked so much for our well being. Accept this blessing as a token of my gratitude.");
			e.other:QuestReward(e.self,{items = {1747,30385}}); -- Protection of the Dain, 10th ring
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1500,item2 = 30164})) then
		e.self:Say("The people of Thurgadin are in your debt, " .. e.other:GetCleanName() .. ". Please accept the Coldain Hero's Ring as a token of our gratitude. The curse has been removed from the blade as well. I hope you find it useful against our common foes. When you are interested in assisting me further please show me the blade. Until that day, may Brell bless and protect you.");
		e.other:QuestReward(e.self,{items = {1465,30369}}); -- dirk of the Dain, 9th ring
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
