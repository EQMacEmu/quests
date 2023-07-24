function event_waypoint_arrive(e)
	if(e.wp == 17) then
		e.self:Say("When will my sister show up? I need her!");
	elseif(e.wp == 27) then
		e.self:MerchantOpenShop();
	elseif(e.wp == 28) then
		e.self:MerchantCloseShop();
	elseif(e.wp == 43) then
		e.self:Say("Bartender! Some water, please.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day to you! Be careful in the city of Qeynos. [Rumors] of corruption may be true. Believe me. I wish my [sister] were here to help.");
	elseif(e.message:findi("sister")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("My sister is in the Karanas. She is a warrior. Her name is Milea. I really need her. Would you please deliver a note to her? You look able-bodied enough for the job.");
		else
			e.self:Say("I do not trust you. I heard word that you are not a good person. Mend your ways and then I may trust you with such talk.");		
		end
	elseif(e.message:findi("deliver a note")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Here you go then, brave adventurer. Godspeed to you.");
			e.other:SummonCursorItem(18801); -- Item: A Tattered Note
		else
			e.self:Say("I do not trust you. I heard word that you are not a good person. Mend your ways and then I may trust you with such talk.");		
		end
	elseif(e.message:findi("rumors")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I have heard that a few of the Qeynos merchants and guards are not very happy with the current state of the city. Taxes are too high and many of the guards have been sent to the outlands, leaving Qeynos vulnerable to attack. I do not feel the same way, but I fear these few may become many. I [fear for my life].");
		else
			e.self:Say("I do not trust you. I heard word that you are not a good person. Mend your ways and then I may trust you with such talk.");		
		end
	elseif(e.message:findi("fear")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("During a late night stroll by the pond in north Qeynos I spied a guard carrying a very large carpet on his shoulders. He approached the pond's edge and unrolled the carpet, the body of another guard rolled out and began to moan. The other guard grabbed for a long spear like weapon from his back. He drove the weapon into the man and pushed him into the pond. I screamed. He turned to me and I ran. I do not think he gave chase, too bad, he would not like to run into my [guardian] at home. I told my guardian and we both went to the pond and saw no body. He believes I was drinking too much wine. I do not drink. Now I fear for my life when I am in the streets of Qeynos.");
		else
			e.self:Say("I do not trust you. I heard word that you are not a good person. Mend your ways and then I may trust you with such talk.");		
		end
	elseif(e.message:findi("guardian")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When my big sister left Qeynos for adventure, she left me in the hands of her old time friend Kane Bayle. Yes, the commander of the Qeynos Guards is my guardian. You would think I would be safe. Every time I tell him the rumors I hear he just ignores me. He is too busy I guess.");
		else
			e.self:Say("I do not trust you. I heard word that you are not a good person. Mend your ways and then I may trust you with such talk.");		
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13302})) then --Monogrammed Cloth
		e.self:Say("Thank you my friend. I understand that Astaed Wemor of the Temple of Life has been concerned for my well being. Take him this note. I am sure he will reward you for easing my troubled mind.. If you are a respected member.");
		e.other:Faction(e.self,291, 15, 0); -- confirmed live factions
		e.other:Faction(e.self,223, -3, 0); -- Faction: Circle of Unseen Hands
		e.other:Faction(e.self,219, 2, 0); -- Faction: Antonius Bayle
		e.other:Faction(e.self,229, 1, 0); -- Faction: Coalition of Tradefolk
		e.other:Faction(e.self,262, 3, 0); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,0,math.random(10),0,0,18862,3000); -- Item: A tattered note
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
