-- Quest Name: A job for Nanrum
-- Author: BWStripes
-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Peh! What am you wanted?! I am Basher Nanrum. You? " .. e.other:GetCleanName() .. " ? Heh, you look for works? Hmm, me tinks you too weakling for [job] me need done. Hmm.. You might do, mebbe.");
	elseif(e.message:findi("skeleton")) then
		e.self:Say("Yeah! Me see dat bone man. He over by da Cleaver. He tink he a butcher or sumting!");
		eq.unique_spawn(52125,0,0,-466,361,9.8,41); -- NPC: #a_skeleton		
	elseif(e.message:findi("job")) then
		e.self:Say("Me in charge of making torches for basher patrols. But Nanrum is much too mighty for such stupid job and Nanrum get idea. Dem fire bugses in da desert - dem eyes glowed. And dem don't burneded like torches. If " .. e.other:GetCleanName() .. " getted Nanrum three fire beetle eyes me would giveded " .. e.other:GetCleanName() .. " a shiny thingie dat you wanteded. Go ahed, " .. e.other:GetCleanName() .. " , an' get me da eyes.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Chain, plate, leather, Krung's Clubs and Junk inside you will find.  Grobb, in the center it be.");
	elseif(e.message:findi("warrior guild")) then
		e.self:Say("Da bashers warriors of Grobb close to entrance they be.");
	elseif(e.message:findi("supplies")) then
		e.self:Say("Entrance toward the front and right.  Gunthak's Belch inside you will find.");
	elseif(e.message:findi("bank")) then
		e.self:Say("Back, back to the rear, bank you will find.");
	elseif(e.message:findi("tavern")) then
		e.self:Say("Gunthak's Belch toward entrance.");
	elseif(e.message:findi("food")) then
		e.self:Say("If hungry you be Gunthak's Belch to entrance and side you will find.");
	elseif(e.message:findi("shaman guild")) then
		e.self:Say("Shaman of Grobb called the Darkones.  Back towards Carver is where you will find.");
	elseif(e.message:findi("darkone")) then
		e.self:Say("The Darkones to the back found are they.  Shaman of Grobb they be.");
	elseif(e.message:findi("inn") or e.message:findi("rest") or e.message:findi("sleep")) then
		e.self:Say("Rocks and ground upon which you will lay.  No inn inside Grobb you will find.");
	elseif(e.message:findi("shadowknight guild")) then
		e.self:Say("Shadowknights of Knightkeep guild of shadowknights they be.  To the side and middle is where you find.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Well dat be some of da eyeballses I askeded for. But I you needs ta give me three for da shiny.";
	
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 10307, item2 = 10307, item3 = 10307},1,text)) then
		e.self:Say("Heh heh. All da eyeballses! I didn't think ya could do it but ya did. Here is da shiny. If you gets more I always have more shinies.");
		e.other:Faction(e.self,235, 1); -- Da Bashers
		e.other:Faction(e.self,222, -1); -- Broken Skull Clan
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10351, 10026, 10060, 10018, 10006, 10017),100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
