--Dragoon_Szorn.pl
--Part of Innoruuk Regent
--Some of this was done already (all the important bits, really).
--Cleaned up what was there and added a response to quest text -Kilelen


function event_say(e)
	if(e.message:findi("missing shipment")) then
		e.self:Say("Seek out Ennixy and tell her [hate be my guide]. She typically works from her homeland in the steamfont mountains.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19030})) then--Crate of Teir`Dal Provisions
		e.self:Say("Finally!! We have been in dire need of these supplies for quite some time, " .. e.other:GetCleanName() .. "!  Here is the receipt for the shipment. The last shipment never made it here and there is an item of great importance stored in the lost crate. Before you return to Neriak, your services are needed to retrieve our [missing shipment]. I command your obedience as is my right as a dragoon of Naythox Thex's personal regime.");
		e.other:QuestReward(e.self,0,0,0,1,19029,500); --Receipt for Provisions Crate
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 19028})) then
		e.self:Say("What is this!! The items of importance have been removed from the crate!! This is most unfortunate. However, you have done well in your service to the Teir'Dal Empire. Take this voucher of services rendered under the command of Naythox Thex back to Ithvol along with the head of that slain Fier'Dal, the receipt for the provisions, and your disciple symbol of Innoruuk.");
		e.other:QuestReward(e.self,0,0,0,1,12499,500); --Voucher of Service to Naythox
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:lfaydark  ID:57063 -- Dragoon_Szorn
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------