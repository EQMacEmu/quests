function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("What brings you to the hall of the frost giants, little one? Have you come to serve our lord and master? Or are you simply a scout for a raiding party? I warn you, do not make war on my kin. I will twist the elements to my will and destroy you if that is your intent.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("serve")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("You could best serve the masters by serving me. The more time I have to tend to my research the better. I have several minor tasks which you could easily handle...");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("minor task")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("In the wreched jungle to the west there lives a race of faries protected by Tunare and her other minions. These abominations are called the Sifaye. I belive that the strength of the Wakening lands is linked not only to Tunare herself, but her connection with these foul beasts. Bring me the wings of one of their so called knights and the heads of three commoners and I will reward you for such busy work.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("elements")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The elements of  nature, of course!  Over the years, I have learned that I can bend the powers of nature and the spirits of those long passed to my will and achieve many things.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 25112,item2 = 25113,item3 = 25113,item4 = 25113})) then
		e.self:Say("Congratulations, slayer of tiny beasts. Take this living tattoe for your troubles.  If you wish to continue to serve me, find a way to capture more noble sifaye... alive.");
		-- verified live faction
		e.other:Faction(e.self,419,10); -- Kromrif
		e.other:Faction(e.self,448,2); -- Kromzek
		e.other:Faction(e.self,406,-5); -- Coldain
		e.other:Faction(e.self,430,-1); -- Claw of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,25056,5000); -- Silver Dragon Tattoo
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
