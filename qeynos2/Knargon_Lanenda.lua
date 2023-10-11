function event_waypoint_arrive(e)
	if(e.wp == 2) then
		e.self:Say("Hey Pelshia, how's business?");
		eq.signal(2073,1); -- NPC: Pelshia_Thuxpire
	elseif(e.wp == 7) then
		e.self:Say("And what about you, gorgeous? Looking as delightful as ever, I must say.");
	elseif(e.wp == 18) then
		e.self:Say("So, yeah, that Pelshia, she's all over me. And Renux, too. She was giving me the look, man. I'm telling ya. Zan, all the ladies want a piece of the Knargman.");
		eq.signal(2085,1); -- NPC: Zannsin_Resdinet
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("How about you and I go take a stroll under the docks tonight?");
		eq.signal(2073,2); -- NPC: Pelshia_Thuxpire
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("Hey..  What's up? My name's Knargon Lanenda. I just came over here from [Freeport] a couple of months ago. I used to run a big business importing goods from [Faydwer]. If you've been to [Freeport]. I'm sure you've heard of me.");
		else
			e.self:Say("Heh...  With all you've done, I'm surprised you're still alive.");
		end
	elseif(e.message:findi("freeport") or e.message:findi("faydwer") or e.message:findi("highpass")) then
		e.self:Say("It's a long way from here. . .which is a good thing for me.");
	elseif(e.message:findi("jracol")) then
		e.self:Say("I don't know why [Carson] likes that guy ... he's certainly been nothing but trouble for me.");
	elseif(e.message:findi("carson")) then
		e.self:Say("Carson McCabe? He runs that sham of a fortress called [Highpass Hold]. We've been dealing with him for a few years, now. But, lately he seems to be losing control of his business. [Hanns] will whip him into shape pretty soon though, I bet.");
	elseif(e.message:findi("shipment")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("We have a small shipment of goods coming in later tonight. The [courier] will be waiting outside the city gates. Casually tell the courier [Lovely night for a stroll], and give him this old card as proof that you work for us. Make certain that you are not followed, and return the shipment to me.");
			e.other:SummonCursorItem(13903); -- Bent Playing Card
		else
			e.self:Say("Heh...  With all you've done, I'm surprised you're still alive.");
		end
	elseif(e.message:findi("courier")) then
		e.self:Say("The courier that usually runs [McCabe]'s shipment, is that good for nothing J'Racol. I don't trust his kind.");
	elseif(e.message:findi("Hanns")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("He is genuinely dangerous. If you think otherwise, you won't be thinking for long.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Circle has recognized your deeds and contributions, but I think you need to prove your worth to us a little more.");
		else
			e.self:Say("Heh...  With all you've done, I'm surprised you're still alive.");
		end
	elseif(e.message:findi("renux") or e.message:findi("pelshia")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Ain't she a little vixen?! She wants me, I can tell.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Circle has recognized your deeds and contributions, but I think you need to prove your worth to us a little more.");
		else
			e.self:Say("Heh...  With all you've done, I'm surprised you're still alive.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18722})) then -- Sealed Note For Knargon
		e.self:Say("Hmm. Carson better deal with his little 'problem' soon, it's costing us a lot of money. Hanns is gonna skin us all when he hears this. Go tell Hanns that [Carson has a mole in the Highpass] guards, and see what he wants us to do.");
		e.other:Faction(e.self,223,5,0); -- Circle of Unseen Hands
		e.other:Faction(e.self,291,-1,0); -- Merchants of Qeynos
		e.other:Faction(e.self,230,1,0); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,262,-1,0); -- Guards of Qeynos
		e.other:Faction(e.self,273,1,0); -- Kane Bayle
		e.other:QuestReward(e.self,0,0,0,0,0,100);	-- confirmed Live exp
	end
	local returned = item_lib.return_items(e.self, e.other, e.trade, false)
	if ( returned ) then
		e.self:Say("I'm... erm, not quite sure what to do with this, but... thanks, I guess.");
	end
end

--END of FILE Zone:qeynos2  ID:2063 -- Knargon_Lanenda
