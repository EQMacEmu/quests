---- Changes by Kagehi.
---- Shar_Vahl_Cit tracks the steps you take to gain your initiate cloak.
---- Since we don't want to hand people things that they can't normally get, or
---- stuff they haven't earned, we need to track which stage in the quest they
---- are at. 1 = Citizen Application. 2 = Cert. of Taxability, 3 = Stamped Cert.,
---- 4 = Note to King Raja, 5 Note 'from' the king, 6 = Notarized Application
---- and 7 = Initiate's Cloak.
function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	---- Non-canon fixmes. Note: One issue with these is that they will say the text, even if you
	---- have the item. At some point someone might consider changing the guildmasters and the
	---- others to first check if you are already carrying the items.
	if(e.message:findi("certificate") and tonumber(qglobals.Shar_Vahl_Cit) == 2) then
		e.self:Say("Luckily for you, someone found this blowing around the plaza.");
		e.other:SummonCursorItem(2874); -- Item: Certificate of Taxability
	elseif(e.message:findi("note") and tonumber(qglobals.Shar_Vahl_Cit) == 4) then
		e.self:Say("Luckily for you, someone found this stuck in a bush.");
		e.other:SummonCursorItem(18299); -- Item: Note to King Raja
	elseif(e.message:findi("application") and tonumber(qglobals.Shar_Vahl_Cit) == 6) then
		e.self:Say("Luckily for you, someone found this on the floor in the bakery.");
		e.other:SummonCursorItem(2897); -- Item: Notarized Application
	elseif(e.message:findi("acrylia slate") and tonumber(qglobals.Shar_Vahl_Cit) > 5) then
		---- No idea what she says here, so won't bother.
		e.other:SummonCursorItem(2877); -- Item: Acrylia Slate of Shar Vahl
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "This item, by itself, means nothing to me.";
	
	-- Confirmed Live Experience and Factions
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2873}, 0)) then
		e.self:Say("Young " .. e.other:GetCleanName() .. ", I will be happy to process your registration for you. While I etch your name on our people's book of records I will require you to run a couple of errands. Take this certificate to the tax collector and obtain his seal. While you're out doing that, have Mignah create your personal Acrylia slate for you. Bring both the seal and the slate to me as soon as you can.");
		eq.set_global("Shar_Vahl_Cit","2",5,"F");
		e.other:QuestReward(e.self,0,0,0,0,2874,300); -- Certificate of Taxability
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2875, item2 = 2876},1,text)) then-- Stamped Certificate of Taxability & Acrylia Slate
		e.self:Say("Ahh, there you are. I was about to send someone looking for you. Everything seems to be in order here, only one task remains. You must gain audience with the king and swear fealty to his highness by handing him this document. Return to me when this is done.");
		eq.set_global("Shar_Vahl_Cit","4",5,"F");
		e.other:QuestReward(e.self,0,0,0,0,18299,300); -- Note to King Raja
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18304}, 0)) then -- Note from King Raja
		e.self:Say("Well done, " .. e.other:GetCleanName() .. ", I am honored to be the first to welcome you to citizenship of Shar Vahl! May you serve our society as well as it serves you. Return to your guildmaster and present both the slate and the application to him. The acrylia slate shall henceforth serve as proof of your citizenship.");
		eq.set_global("Shar_Vahl_Cit","6",5,"F");
		e.self:Say("Oh, by the way, be careful with this as it will be important for recording your service to our society. If you should somehow lose it, ask me about your slate and I will issue you a new one.");
		e.other:Faction(e.self,1584,400); -- Faction: Citizens of Sharvahl
		e.other:QuestReward(e.self,{items = {2877,2897},exp = 400}); -- Item: Acrylia Slate of Shar Vahl, Notarized Application
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
