function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oooh.. Hello, [guard]. Please do not let the [Teir'Dal] at me again. I can take no more.");
	elseif(e.message:findi("teir.*dal")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("The Teir'Dal are what all elves call the dark elves, such as those vile torturers. I don't know what they are doing in Highpass.");
		else
			e.self:Say("Your ways are considered vile to Faydark's Champions. Leave before my rage overcomes my restraint.")
		end	
	elseif(e.message:findi("not a guard")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("Then what are you doing down here? Leave before they shackle you to this cage or strap you to the operating table!");
		else
			e.self:Say("Your ways are considered vile to Faydark's Champions. Leave before my rage overcomes my restraint.")
		end				
	elseif(e.message:findi("fenn")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Are you searching for the rogue named Fenn Kaedrick? He used to be locked in here with me. That Lady McCabe bailed him out just minutes before the Teir'Dal planned to operate on him. He said that if I ever did escape, to venture to the very roof of this keep and wait till he showed up to escort me away from here.");				
			eq.unique_spawn(6184,0,0,-89.59,-24.55,83.10,66); -- NPC: Fenn_Kaedrick
		else
			e.self:Say("Your ways are considered vile to Faydark's Champions. Leave before my rage overcomes my restraint.")
		end		
	elseif(e.message:findi("princess")) then
		e.self:Say("Sshhh...  You know of the Princess Lenya Thex?! She is not that imposter in the cell down here! That one is a Teir'Dal assassin in disguise! I should know. I was one of the Princess' escorts. We were overtaken by Highpass guards.  All the escorts were used in Teir'Dal pain experiments. I am the last and I feel death at my door. The princess lives! She is somewhere in the keep. Find her and rescue her! Now, go, my friend!  Rescue the princess!")
	elseif(e.message:findi("lady mccabe")) then
		e.self:Say("A stunning lady if I ever saw one. There is truly a rose missing from the gardens of Erudin. Just look, but do not touch. She is the spouse of Carson McCabe himself. How  even he won the heart of a lady as beautiful as that is an amazement to us all.")
	elseif(e.message:findi("carson mccabe")) then
		e.self:Say("Carson McCabe is the ruler of Highpass Hold. It was his father, Sean McCabe, who established this great community.")
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
