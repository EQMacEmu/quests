function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". Rueppy's my name. Why don't you buy us something to [drink] and we can talk?");
	elseif(e.message:findi("drink")) then
		e.self:Say("How about a short beer? That sounds good.");
	elseif(e.message:findi("blackburrow stout")) then
		e.self:Say("Oh, well we can't get that here. However, you can always [smuggle] it in...");
	elseif(e.message:findi("smuggle")) then
		if(e.other:GetFactionValue(e.self) >= 300) then -- requires high amiably
			e.self:Say("You interested in a little job? I need you to meet someone who is bringing me some stout. He was supposed to meet me in the ruins on the other side of the Great Wall, but I have other business to attend to. His name is Gunrich. You might have to wait for a while for him to show up, as he will be skittish at the sight of a stranger. Payment has already been made. Just tell him, 'Dark rivers flow east,' and he will know to trust you. Make sure you don't say anything else to him or the deal will sour. Meet me back here with the stout.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.")
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end	
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13032})) then -- Short Beer
		e.self:Say("Oh, thank you.  AH! That sure is good. Not as good as a [Blackburrow stout], but what is?");
		e.other:QuestReward(e.self,0,0,0,0,0,100);		
	elseif(e.other:GetFactionValue(e.self) >= 300 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13131})) then -- Case of Blackburrow Stout
		e.self:Say("Heh heh! You did it! I thought the deputies would get you for sure! I mean... You did it! Heh! Here buy yourself a drink on me.");
		e.other:Faction(e.self,241,10,0); -- Deeppockets
		e.other:Faction(e.self,223,1,0); -- Circle of Unseen Hands
		e.other:Faction(e.self,292,-1,0); -- Merchants of Rivervale
		e.other:Faction(e.self,336,1,0); -- Coalition of Tradefolk Underground
		e.other:Faction(e.self,329,1,0); -- Carson McCabe
		e.other:QuestReward(e.self,math.random(10,40),2,0,0,0,3000); -- rewards confirmed from Live
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
