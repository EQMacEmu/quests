-- Custodus Helms

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("So " .. e.other:Race() .. ", you dare to stand before the mighty Tymoz?  I am the Governor of this village of the Coterie of the Eternal Night.  Do you wish to assist the Coterie, or will you better serve us as sustenance for our eternal lives?");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("assist the coterie")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("You have made an intelligent decision my friend.  Our primary foe is the meddling Validus Custodus, the militia of Katta Castellum.  I will reward you for every two damaged custodus legionnaire helms or two damaged custodus centurion helms that you present to me as proof that you have slain members of our enemies ranks.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I require two damaged custodus helms as proof of your deeds.";
	
	if(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 31748,item2 = 31748},1,text)) then
		e.self:Say("Excellent! Two less of those self righteous Validus Custodus goons to worry about!");
		e.other:Faction(e.self,1506,1);
		e.other:Faction(e.self,1503,-1);
		e.other:Faction(e.self,1505,-1);
		e.other:Faction(e.self,1507,1);
		e.other:QuestReward(e.self,{items = {31750,eq.ChooseRandom(0,31750),eq.ChooseRandom(0,31750),eq.ChooseRandom(0,31750),eq.ChooseRandom(0,31750)},exp = 5000});
	elseif(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 31749,item2 = 31749},1,text)) then
		e.self:Say("Excellent! Two less of those self righteous Validus Custodus goons to worry about!");
		e.other:Faction(e.self,1506,1);
		e.other:Faction(e.self,1503,-1);
		e.other:Faction(e.self,1505,-1);
		e.other:Faction(e.self,1507,1);
		e.other:QuestReward(e.self,0,0,0,0,31833,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
