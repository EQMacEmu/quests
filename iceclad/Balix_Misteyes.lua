function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Outlander, hail. Share the fire. I have little but if you are in need then take what I have. If you need nothing then take nothing. Balix my name is. Shaman to the tribe of Snowfangs.");
	elseif(e.message:findi("shaman")) then
		e.self:Say("Yes, shaman. I listen to the land to tell my tribe what the winds and waters will bring. Good or bad. Little good and much bad these days. That is why I sit here listening.");
	elseif(e.message:findi("listening")) then
		e.self:Say("I am on spirit quest. No food do I take. All day I listen only. I wait until the land tells me how to help my tribe. Maybe nothing will happen but I cannot fail to try. Hard is this. Many dangerous creatures are near but none come close so far.");
	elseif(e.message:findi("dangerous creatures")) then
		e.self:Emote("growls under his breath. 'Most dangerous is the Garou. Evil spirit of the land. It was made from long dead wolf spirits when the tower spread its dark magics through the islands. It preys on the Snowfang. We have tried to hunt it but always it is too strong.'");
	elseif(e.message:findi("hunt")) then
		e.self:Say("If you want to try, you can hunt Garou. If you kill, spread its soul to the air for cleansing, then all is good. Its skin is powerful from the magics that made it. With a cougar's bone, fresh with the spirit of earth, I can make you powerful talisman in thanks for your service to Snowfangs.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30055,item2 = 30032})) then
		e.self:Emote("pulls its lips back as it scratches and cuts the skin, working it around the bloody puma bone. 'Good for hitting or for talisman. Powerful thing to hold. All Snowfang thank you. Now, all of us are safer.' ");
		e.other:QuestReward(e.self,0,0,0,0,30056,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
