function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(e.message:findi("hail")) then
		e.self:Say("Hail. Are you here to assist with something specific or just looking for something to do?");
	elseif(e.message:findi("application") and tonumber(qglobals.Shar_Vahl_Cit) == 1) then
		e.self:Say("Luckily for you someone found it.");
		e.other:SummonCursorItem(2873); -- Item: Application for Citizenship
	elseif(e.message:findi("cloak") and tonumber(qglobals.Shar_Vahl_Cit) == 7) then
		e.self:Say("Someone found this under a table at the one of the pubs. Try not to lose it this time.");
		e.other:SummonCursorItem(2878); -- Item: Initiate's Cloak of Shar Vahl
	elseif(e.message:findi("essence of sonnet")) then
		e.self:Emote("stops what he is doing and looks at you, most surprised, 'An essence of sonnet? I have never produced such a thing my friend, though the fact that you would even request one from me is very flattering.' His eyes leave your face and settle off in the distance somewhere as he continues, 'I was present once when one was created... it was beautiful. I was only a child, but there was no mistaking the significance. Oh how I would love to produce such a thing myself- an accomplishment without peer for one of my art. They say that the inspiration must be genuine, should you know of something that could inspire me so then by all means, I will see if I have an essence of sonnet within me.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "This item, by itself, means nothing to me.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18324}, 0)) then
		e.self:Emote("opens the diary and reads. Before long he is utterly engrossed in the story of purest love that you have given him, and it begins. You are something less than fully aware of what happens next, the wind whistles and you could swear that the room fills with light though you could not prove it. A moment later, a sense of completeness has filled you. All you know for sure is that Hortitosh stands before you, fully spent, and you hold in your hand what could only be an essence of sonnet.");
		e.other:QuestReward(e.self,0,0,0,0,5991);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18552}, 0)) then -- Hymnist Guild Summons
		e.self:Say("Our newest instrumentalist arrives! You have grown strong in the safety of our city and it is time now for you to repay our society. The Jharin, keepers of our history, accept you and deem you to be worthy of our training. Take this application to Registrar Bindarah and return to me with proof of your citizenship.");
		e.self:Say("I know that you may be nervous right now... after all, this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar, just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
		eq.set_global("Shar_Vahl_Cit","1",5,"F");
		-- Confirmed Live Faction
		e.other:QuestReward(e.self,{itemid = 2873,exp = 20}); -- Application for Citizenship
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2897,item2 = 2877}, 1, text)) then
		e.self:Say("" .. e.other:GetCleanName() .. ", citizen of Shar Vahl, accept this cloak as a symbol of your loyalty and service to our noble people. It will grow with you, young initiate, and like you it has incredible potential. Present your slate of citizenship to Gherik and he will guide you through your early training. May your songs inspire us all!");
		eq.set_global("Shar_Vahl_Cit","7",5,"F");
		e.other:QuestReward(e.self,{items = {2877,2878},exp = 450}); -- Item: Acrylia Slate of Shar Vahl, Initiate's Cloak of Shar Vahl
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3920}, 0)) then
		e.self:Say("These are finely crafted indeed, " .. e.other:GetCleanName() .. ". Merchant Fahaar told me you were quite the prodigy, but don't tell him I told you that. Take this receipt and show it to Fahaar and tell him the king is quite pleased with both your work, and his teaching!");
		e.other:QuestReward(e.self,0,0,0,0,3921,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
