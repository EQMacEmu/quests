function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, young adventurer! I'm the chief overseer o' the Shamans o' Justice. We serve the will o' the Tribunal. Justice is our way. Within Halas, there are none who are above the scales o' justice. There are still some who have defied our laws. We wish to [apprehend the fugitives].");
	elseif(e.message:findi("apprehend the fugitives") or e.message:findi("young shaman") or e.message:findi("standin' member of the court")) then -- requires amiable
		if(e.other:GetFaction(e.self) < 5) then -- requires amiably
			if(e.message:findi("apprehend the fugitives")) then
				e.self:Say("Maybe so, however, there are some who may be too much fer ye to handle. I'll need to know if ye're a [young shaman] or a [standin' member of the court].");
			elseif(e.message:findi("young shaman")) then
				e.self:Say("We seek a former member who dared to curse the righteousness of the Tribunal. We'll have his head for that remark. His name is Granin O'Gill and he has run to the wastelands of Everfrost seeking safe haven. Find him. Return his head to me. Do so, and earn the ninth circle spell, Spirit o' the Bear. Go at once!");
			elseif(e.message:findi("standin' member of the court")) then
				e.self:Say("At the moment, I've no word o' heretics about for ye to hunt down. I pray that there will be no more, too!");				
			end				
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("Ye're no criminal to the Shamans o' Justice, but ye've yet to prrove yer devotion to justice.");
		else
			e.self:Say("The scales o' the Shamans o' Justice dinnae tip in yer favor. Ye'd best flee while ye still have the chance.");
		end
	end		
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13729})) then 		--Barbarian Head
		local spelltext = "";
	
		-- : Drowsy : Frost Rift : Sicken : Fleting Fury : Spirit of Bear : Cure Blindness : Spirit Sight : In that order
		local spellreward = eq.ChooseRandom(15270,15275,15075,15271,15279,15212,15079);
		local dialog0;
		local dialog1 = "Drowsy ";
		local dialog2 = "Frost Rift";
		local dialog3 = "Sicken";
		local dialog4 = "Fleeting Fury";
		local dialog5 = "Spirit o' the Bear"; --check dialog with alla or live
		local dialog6 = "Cure Blindness";
		local dialog7 = "Spirit Sight";
		if(spellreward == 15270) then
			dialog0 = dialog1;
		elseif(spellreward == 15275) then
			dialog0 = dialog2;
		elseif(spellreward == 15075) then
			dialog0 = dialog3;
		elseif(spellreward == 15271) then
			dialog0 = dialog4;
		elseif(spellreward == 15279) then
			dialog0 = dialog5;
		elseif(spellreward == 15212) then
			dialog0 = dialog6;
		elseif(spellreward == 15079) then
			dialog0 = dialog7;
		end
		
		spelltext = "Take and remember this spell, " .. dialog0 .. ", I hope ye've attained the necessary skills to scribe it.  If not, I'm sure ye soon will. Go now, and serve justice.";		
		e.self:Say("We can now rest assured that justice has been served. Ye'll be a valuable asset to our court. " .. spelltext .. "");
		-- Confirmed Live Factions
		e.other:Faction(e.self,327, 20);   														-- Shamen of Justice
		e.other:Faction(e.self,328, 3);   														-- Merchants of Halas
		e.other:Faction(e.self,223, -3);   														-- Circle of Unseen Hands
		e.other:Faction(e.self,336, -3);   														-- Coalition of Tradefolk Underground
		e.other:Faction(e.self,244, -4);   														-- Ebon Mask
		e.other:QuestReward(e.self,math.random(0,10),math.random(0,10),math.random(0,5),0,spellreward,1600);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18761})) then
		e.self:Say("Welcome t' the Church o' the Tribunal. Here, we practice the will o' the Six Hammers. This is our guild tunic - wear it with pride and represent us well.");
		e.other:Faction(e.self,327, 100);   														-- Shamen of Justice
		e.other:Faction(e.self,328, 15);   														-- Merchants of Halas
		e.other:Faction(e.self,223, -15);   														-- Circle of Unseen Hands
		e.other:Faction(e.self,336, -15);   														-- Coalition of Tradefolk Underground
		e.other:Faction(e.self,244, -20);   														-- Ebon Mask
		e.other:QuestReward(e.self,0,0,0,0,13512,20); 										-- Faded Blue Tunic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
