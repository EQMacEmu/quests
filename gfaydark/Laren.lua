function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, my friend! What is it you seek from Laren and the Scouts of Tunare?");
	elseif(e.message:findi("scouts blade")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("So you have heard of the dagger created especially for the rogues of Kelethin! The creator of these blades has since passed away. We mourn his death. And, I am sorry to say, we have no more to offer our new scouts. There is a way though.. A way to gain a blade and a way to [avenge the craftsman].");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("The Scouts of Tunare have no quarrel with you, but perhaps a few less Crushbone Orcs would prove your worth. Then we shall speak.");
		else
			e.self:Say("You dare to speak with a loyal member of the Scouts of Tunare?!  You are truly foolish!  Run away, while you still can.");			
		end
	elseif(e.message:findi("avenge the craftsman")) then
		if(e.other:GetFactionValue(e.self) >= 400) then -- requires high amiably faction
			e.self:Say("You must journey to Antonica. Seek out a castle high in the Serpent's Spine. A castle called Highkeep. Search for a man named Fenn Kaedrick. Give him this token and he shall know why you were sent. Perhaps the merchants will know of his whereabouts. Go at once. I have faith in you. Good luck, " .. e.other:GetCleanName() .. ".");
			e.other:SummonCursorItem(12185); -- Useless Token
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("The Scouts of Tunare have no quarrel with you, but perhaps a few less Crushbone Orcs would prove your worth. Then we shall speak.");
		else
			e.self:Say("You dare to speak with a loyal member of the Scouts of Tunare?!  You are truly foolish!  Run away, while you still can.");			
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 400 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12186})) then -- Half Elf Head
		e.self:Say("You have proven yourself to be a worthy Scout of Tunare and as such you are worthy to hold the hilt of a scout blade. Remember, rogues in class are we, but in our chests beats the heart of the forest. Our skills are used in defense of Kelethin and her allies. Next you shall speak to Master Tylfon. He will inform you of the [scout silvermesh leggings].");
		e.other:Faction(e.self,316,10); -- Scouts of Tunare
		e.other:QuestReward(e.self,0,0,math.random(30),0,7321,20000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:gfaydark  ID:54085 -- Laren
