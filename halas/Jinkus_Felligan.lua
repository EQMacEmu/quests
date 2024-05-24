function event_say(e)
	if(eq.is_the_ruins_of_kunark_enabled()) then
		if(e.message:findi("hail")) then
			e.self:Say("Welcome! Welcome to the Church o' the Tribunal! Do ye require healing or are ye [new to the Shamans o' Justice], then, eh?");
		elseif(e.message:findi("new to the shamans") and e.other:GetFaction(e.self) < 5) then
			e.self:Say("Then I welcome ye into our noble order. Ye'll serve us well or spend an eternity in the dungeons o' the Tribunal. Are ye willing to [contribute to our church] or did ye just come to meditate within our walls?");
		elseif(e.message:findi("contribute") and e.other:GetFaction(e.self) < 5) then
			e.self:Say("Ye'll help all o' Halas by doing the bidding o' this church. Go to Holana. Tell her [Jinkus sent] ye to assist her. She'll have work fer ye. Perhaps, if ye're planning on passing near Qeynos, ye can [make a delivery] as well?");
		elseif(e.message:findi("make a delivery") and e.other:GetFaction(e.self) < 5) then
			e.self:Say("Excellent! First, visit Cindl and tell er ye need a Mammoth Hide Parchment. Then, I need ye to visit Greta and tell her you need some ink. Bring these back to me and we will continue from there.");
		elseif((e.message:findi("make a delivery") or e.message:findi("contribute") or e.message:findi("new to the shamans")) and e.other:GetFaction(e.self) == 5) then
			e.self:Say("Ye're no criminal to the Shamans o' Justice, but ye've yet to prrove yer devotion to justice.");
		elseif((e.message:findi("make a delivery") or e.message:findi("contribute") or e.message:findi("new to the shamans")) and e.other:GetFaction(e.self) > 4) then
			e.self:Say("The scales o' the Shamans o' Justice dinnae tip in yer favor. Ye'd best flee while ye still have the chance.");
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Welcome! Welcome to the Church o' the Tribunal!"); --made up text
		end
	end
end
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12621, item2 = 12619})) then 		--Mammoth Hide Parchment, Vial of Datura Ink
		e.self:Say("Here is th' bounty poster. Take it to a bank guard in Qeynos, immediately!");
		-- faction confirmed on live and works at doubious
		e.other:Faction(e.self,327, 1);   														-- Shamen of Justice
		e.other:Faction(e.self,328, 1);   														-- Merchants of Halas
		e.other:Faction(e.self,223, -1);   														-- Circle of Unseen Hands
		e.other:Faction(e.self,336, -1);   														-- Coalition of Tradefolk Underground
		e.other:Faction(e.self,244, -1);   														-- Ebon Mask
		e.other:QuestReward(e.self,0,0,0,0,12620,100);									--Wanted Poster
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12622})) then	--List of Qeynos Most Wanted
		e.self:Say("Fantastic, Fantastic... Here you have more than proven your right to wear this. Use it wisely...");
		-- faction confirmed on live and works at indifferent
		e.other:Faction(e.self,327, 25);   													-- Shamen of Justice
		e.other:Faction(e.self,328, 3);   														-- Merchants of Halas
		e.other:Faction(e.self,223, -3);   														-- Circle of Unseen Hands
		e.other:Faction(e.self,336, -3);   														-- Coalition of Tradefolk Underground
		e.other:Faction(e.self,244, -5);   														-- Ebon Mask
		e.other:QuestReward(e.self,0,0,0,0,1376,1000);									--Initiate Symbol of the Tribunal
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
