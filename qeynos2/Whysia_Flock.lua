function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good evening, " .. e.other:GetCleanName() .. ". Feel free to take your time browsing. The temple shop is open night and day for your convenience. Most clerics need access to their [scroll strongbox] at all times.");
	elseif(e.message:findi("scroll strongbox")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The scroll strongboxes are kept here. They are used by the temple clerics to hold their valuable scrolls. I tend to the 30 and 40 numbered boxes and [Tyokan] deals with the 20s. Presently all are taken and the waiting list is quite long. If you are here to turn in your key, then please do so. I shall get your scroll for you.");
		else
			e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");	
		end
	elseif(e.message:findi("tyokan")) then
		e.self:Say("Tyokan Mekase is the day merchant here at the temple shop. He usually arrives around eight in the morning or so.");	
	elseif(e.message:findi("recharge.* shining star")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Are you interested in recharging your Shining Star of Life? I can do it for you, but I require the Shining Star of Life and 20 gold.");	
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Temple of Life smiles upon you, friend...  but such a delicate matter can only be entrusted to our most loyal members.");	
		else
			e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");	
		end
	elseif(e.message:findi("prayer bead")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The prayer beads are the blessed necklaces of the Priests of Life.  The beads have a few charges of minor healing.  I recharge them for all members in good standing.  All I need are the beads and a donation of 100 gold pieces.");			
		else
			e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");	
		end
	end
end

function event_trade(e)

	local item_lib = require("items");
	local text = "As instructed by High Priestess Jahnda I must ask for the beads and a donation of 100 gold coins.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6356, gold=20})) then -- Shining Star of Light
		e.self:Say("Here you are, then.  May the power of the Prime Healer guide you through life and keep you healthy.");		
		e.other:QuestReward(e.self,0,0,0,0,6356); -- Note this quest is superficial because the shining star has no charges
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13296, gold=100},1,text)) then -- must be amiable
		e.self:Say("I see your beads need to be charged. Very well, here you are. Use them and good health to you!!!");
		e.other:QuestReward(e.self,0,0,0,0,13296); -- Item: Prayer Beads
	end
	item_lib.return_items(e.self, e.other, e.trade)
	
end