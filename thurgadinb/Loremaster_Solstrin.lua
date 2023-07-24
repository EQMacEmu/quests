function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("bows before you and says, 'Greetings to you as well, " .. e.other:GetCleanName() .. ". I have recently heard many tales of your people and their glory. I am honored to welcome you to the Hall of Ancestors. Here our people come to pay tribute to the bravest and wisest of our kin who have passed from this life into Brell's holy domain. If you are interested I'd be happy to tell you a little bit about the heroes buried here.");
		e.self:DoAnim(70);
	elseif(e.message:findi("heroes")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- need faction requirement, only know its higher than indiff
			e.self:Emote("smiles at you, obviously pleased by your interest. 'This hall contains the bodies of Dain Frostreavers the I, II, and III as well as his grace Grand Historian Nicmar. There is also an empty bier in the back awaiting the next hero of our people. But the most sacred tomb of all lies right behind me here.'");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("My instincts tell me you are almost ready to share in the knowledge of our greatest people, but you have a little ways to go to prove yourself worthy of such an honor.");
		else
			e.self:Say("You have yet to prove yourself as an ally to my people, " .. e.other:GetCleanName() .. ". Therefore, you have yet to earn the honor of sharing in the knowledge of these heroes.");
		end
	elseif(e.message:findi("nicmar")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- need faction requirement, only know its higher than indiff
			eq.move_to(244,746,-41,0,false);
			e.self:Say("Here lies the body of his grace Grand Historian Nicmar. Nicmar was a very prominent priest, scholar, architect, and artist. As an advisor to both Dain Frostreaver II and his son, Dain Frostreaver III, Nicmar still holds the record for oldest Coldain before dying of old age at the onset of the War of Yesterwinter. Nicmar was the chief architect of Thurgadin.  He also built this Hall of Ancestors and sculpted the statues in Remembrance Park.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("My instincts tell me you are almost ready to share in the knowledge of our greatest people, but you have a little ways to go to prove yourself worthy of such an honor.");
		else
			e.self:Say("You have yet to prove yourself as an ally to my people, " .. e.other:GetCleanName() .. ". Therefore, you have yet to earn the honor of sharing in the knowledge of these heroes.");
		end
	elseif(e.message:findi("dain frostreaver i")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- need faction requirement, only know its higher than indiff
			eq.move_to(244,714,-41,128,false);
			e.self:Say("Here lies the body of his majesty Dain Frostreaver I. As the son of Colin Dain, he was the first crowned Dain of our people and also the first to carry the name Frostreaver, which was given to him by our people for his skills of dispatching Kromrif in melee combat. Original keeper of the magic axe Frostreaver, which has been passed down to our current Dain, he was a close friend of Glight Snowchipper and aided him in engineering the crystal caverns. It was there he met his death on a mining expedition deep into the caverns. No one was ever quite sure what killed him, only that the bodies of him and his party were found bloated and corrupted by foul poisons.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("My instincts tell me you are almost ready to share in the knowledge of our greatest people, but you have a little ways to go to prove yourself worthy of such an honor.");
		else
			e.self:Say("You have yet to prove yourself as an ally to my people, " .. e.other:GetCleanName() .. ". Therefore, you have yet to earn the honor of sharing in the knowledge of these heroes.");
		end
	elseif(e.message:findi("dain frostreaver ii")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- need faction requirement, only know its higher than indiff
			eq.move_to(214,714,-41,128,false);
			e.self:Say("Here lies the body of his majesty Dain Frostreaver II. Known as the Priest King, he was the only Dain whot was a loremaster before his father died and he was crowned Dain. It was by his will that we left our home in the Crystal Caves and founded Thurgadin. He worked closely with the architects and miners to ensure Thurgadin would be built secretly and defensively. Dain Frostreaver II died of old age with his dream intact, our city had yet to be discovered and our people lived in relative peace and safety for more than five centuries.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("My instincts tell me you are almost ready to share in the knowledge of our greatest people, but you have a little ways to go to prove yourself worthy of such an honor.");
		else
			e.self:Say("You have yet to prove yourself as an ally to my people, " .. e.other:GetCleanName() .. ". Therefore, you have yet to earn the honor of sharing in the knowledge of these heroes.");
		end
	elseif(e.message:findi("dain frostreaver iii")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- need faction requirement, only know its higher than indiff
			eq.move_to(214,746,-41,0,false);
			e.self:Say("Here lies the body of his majesty Dain Frostreaver III. Known as the War King for his hot temper and brutal combat tactics, he ran a brutally offensive campaign that routed most of the giants from the Great Divide and half of the Eastern Wastes. Eventually, with the powerful magic of the Kromzek and the overwhelming might of the Kromrif, his armies were forced to retreat to the border of the Great Divide where he was killed on the battlefield in single combat at the hand of King Tormax. This war is now known as the War of Yesterwinter.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("My instincts tell me you are almost ready to share in the knowledge of our greatest people, but you have a little ways to go to prove yourself worthy of such an honor.");
		else
			e.self:Say("You have yet to prove yourself as an ally to my people, " .. e.other:GetCleanName() .. ". Therefore, you have yet to earn the honor of sharing in the knowledge of these heroes.");
		end
	elseif(e.message:findi("sacred tomb")) then
		e.self:Say("In this block of ice lie the sole remnants of our great father, leader, and founder, Colin Dain. While leading our people to the safety of the mountains following the destruction of our beloved Froststone. Colin came to a grim realization. He knew that there was no way our people could outrun the giants and safely get away. And so he took thirty volunteers and led them in a suicide ambush to halt the giants' chase while the rest of our people got away. Without his sacrifice, the Coldain might very well have been wiped out that day. Once we were safe, scouts were dispatched to the battle with the hope of finding survivors. Amidst the field of bodies they found this crown, axe, and breastplate which belonged to our beloved leader. Of Colin's actual body, no remnant was ever found.");
	elseif(e.message:findi("working with gemstone")) then
		e.self:Say("Aye, gems are placed within the armor. Brell is pleased with this fusion of ore and gem. The combination produces a sturdy piece of armor. You will need some Etching Tools to work with the gems. If you ask Meg Tucter for a set, she should have some laying about.");
	elseif(e.message:findi("issue kit")) then
		e.self:Say("The Standard Issue Kit is what we issue to soldiers at the beginning of their mission. I have this empty one here. Before I give it to you, could you show me your Runed Coldain Prayer Shawl? I would like to see how skilled you are.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8896}, 0)) then
		e.self:Say("So, the Dain needs your assistance with the Field Plate. The Dain must trust you a great deal to impart the wisdom of our armor creation to you. Here are the tomes. The first details how to make the basic armor, the other details how to begin [working with gemstones]. If the Dain is asking you for them you should place them in an [Issue Kit]. May Brell guide your hand friend, good luck to you.");
		e.other:QuestReward(e.self,{items = {18611,18610}}); -- Forge of Icewell Arms (Precious Gem Study), Forge of Icewell Arms (Royal Field Plate Study)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1199}, 0)) then -- Runed Coldain Prayer Shawl (mark 1)
		e.self:Say("Incredible! Never before has an outlander been skilled and determined enough to craft our sacred rune. You are now worthy of the Dain's most perilous task. You should seek an audience with the Dain immediately. Show him your Runed Prayer Shawl; he will give you the task that has been prepared for you. If the Dain is away show your Shawl to Chamberlain Krystorf and he will call for him.");
		e.other:QuestReward(e.self,{items = {1199,17651}}); -- Runed Coldain Prayer Shawl (mark 1), Empty Coldain Issue Kit
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8895}, 0)) then -- Runed Coldain Prayer Shawl (mark 2)
		e.self:Say("Incredible! Never before has an outlander been skilled and determined enough to craft our sacred rune. You are now worthy of the Dain's most perilous task. You should seek an audience with the Dain immediately. Show him your Runed Prayer Shawl; he will give you the task that has been prepared for you. If the Dain is away show your Shawl to Chamberlain Krystorf and he will call for him.");
		e.other:QuestReward(e.self,{items = {8895,17651}}); -- Runed Coldain Prayer Shawl (mark 2), Empty Coldain Issue Kit
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
