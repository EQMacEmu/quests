function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("gulps down the rest of his ale. 'Looks like I'll need another.");
	elseif(e.message:findi("blue talon")) then -- attack animation
		e.self:Emote("takes a swipe at you. 'We used to be the bruisers of the west side. We didn't take nothin' from no one!! Fist and mind was our motto. Now get lost before I introduce my fist to your face. Hmpf. Too late, I see.");
		e.self:DoAnim(5);
	elseif(e.message:findi("stein")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Emote("is staggering from one too many pale ales.  'Lishen... Listen here.  I have been forced to cut back on my drinking because my favorite sloshing stein was stolen from me by some stubby little thief in black.  I was jus' minding my own business and picking flowers in the fields of the drixies when he comes and snatches it from me.  Return it to me, and I will give you this treasure I acquired from a sarnak revenant.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you have shown more devotion to the Brood of Kotiz, we can discuss such things.");
		else
			e.self:Say("You are a true simpleton to think you can speak to me.  You are no ally to the Brood of Kotiz.  Begone, before I make your blood boil!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "drinks the ale as if it were a shot. 'Ahhh!! Keep it coming. I think we are going to be good friends. Or something.";
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12862})) then	--Stein from halfling swashbuckler in FV
		e.self:Emote("nearly faints. His eyes begin to tear up. 'Oh my sweet stein of sloshing! This is the great treasure. A shiny piece of broken metal! Ha! You never win when you deal with a Blue Talon!");
		e.other:QuestReward(e.self,0,0,0,0,12852);	--Foot of Candlestick
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12609, item2 = 12609, item3 = 12609, item4 = 12609},1,nil,text)) then
		e.self:Emote("swallows the whole bottle in one gulp. 'Here, go buy yourself a brain. What?!! You expecting something? How about this.. <BUUURRRPPPP!!> Thanks for helping me get through my dry spell, croak!! Never mess with a Blue Talon!!");
		e.other:QuestReward(e.self,math.random(5),0,0,0,0,100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
