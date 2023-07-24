function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, friend, and welcome to the Mermaid's Lure. Here, we sell fishing supplies and some imported goods from far-off lands. And, if you've got a few minutes, I could even tell you a [story] or two.");
	elseif(e.message:findi("story")) then
		e.self:Say("Stories? Stories? I saw more adventure before I was ten years tall than you'll see in your whole miserable existence. I've been everywhere, [Odus], [Faydwer], [Kunark]. . . You name it, and I can tell ya a little something 'bout it. . . If you buy me a sip of brandy, of course!");
	elseif(e.message:findi("odus")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You haven't lived until you've seen Odus. Erud was the first human to cross the sea, and he founded the great city of Erudin. The trade routes from here to Odus are busy and prosperous, but can also be very dangerous.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("faydwer")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I call Faydwer the home of the little people. They say the continent was named by the high elves when they landed on its shores long ago. I've even heard tales of an ancient elven vampire who lives there. . . Just another Felwithe legend, I'll bet!");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("kunark")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Even I can't tell you much about that continent. Kunark is a tough place, populated by even tougher creatures. I hear the high elves of Faydwer have been trying for years to establish a small port on Kunark's hostile shores.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("antonica")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Antonica?  You're standing on it!  This is the largest continent on all of Norrath, as well as the most populated.  We humans rule over most of Antonica, from this beautiful city to Everfrost, to Highpass and all the way to Freeport.");				
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end			
	elseif(e.message:findi("tax")) then -- triggers without starting quest
		e.other:Faction(e.self,291,-1,0); -- Faction: Merchants of Qeynos
		e.self:Say("Argh! You curvy sea goblin! Taxes, you say?! Peh! I got your taxes right here! I sure don't get the services those taxes are supposed to provide! You can tell them ol' Captain Rohand said so!");
		e.other:SummonCursorItem(13177); -- Item: Rohands Tax Payment
	end
end

function event_trade(e)
	local brandy = 0;
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13034, item2 = 13034, item3 = 13034, item4 = 13034}, 0)) then
		brandy = 4;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13034, item2 = 13034, item3 = 13034}, 0)) then	
		brandy = 3;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13034, item2 = 13034}, 0)) then
		brandy = 2;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13034}, 0)) then
		brandy = 1;
	end
 
	if(brandy > 0) then
		repeat
			e.self:Say("Yeah, this is just what I've been craving!");
			e.other:Faction(e.self,291,25,0); -- Faction: Merchants of Qeynos
			e.other:Faction(e.self,223,-5,0); -- Faction: Circle of Unseen Hands
			e.other:Faction(e.self,219,3,0); -- Faction: Antonius Bayle
			e.other:Faction(e.self,229,2,0); -- Faction: Coalition of Tradefolk
			e.other:Faction(e.self,262,5,0); -- Faction: Guards of Qeynos
			-- Confirmed Live Experience
			e.other:QuestReward(e.self,0,0,0,0,0,10);
			brandy = brandy - 1;
		until brandy == 0
	end		 
	item_lib.return_items(e.self, e.other, e.trade, e.text)
  end
