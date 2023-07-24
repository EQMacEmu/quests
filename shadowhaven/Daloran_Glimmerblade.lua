-- Gemmed Sword Hilt

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". I am Lord Daloran Glimmerblade. I preside over the Fordel section of the Haven with my dear Mistala. I have not seen you around these parts, so I would imagine you are a [newcomer] to our great city.");
	elseif(e.message:findi("newcomer")) then
		e.self:Say("Excellent, " .. e.other:GetCleanName() .. ". It's nice to have you here as a guest. I am very proud of all that we have accomplished here, and I invite you to make yourself at home when you are with us. If you wish to further [prove your allegiance] to the House of Fordel I may have some tasks for you to complete.");
	elseif(e.message:findi("prove my allegiance")) then
		e.self:Say("Ah that is excellent to hear, " .. e.other:GetCleanName() .. ". I believe I have a task that I could entrust you with. I have numerous Gemmed sword hilts that I have yet to attach to a blade. They have all been glowing for quite some time with an [unknown force]. All of my residing magicians and enchanters have been unable to decipher the magics that surround these hilts.");
	elseif(e.message:findi("unknown force")) then
		e.self:Say("I wish that I was able to discover this myself. Unfortunately not one person in my quarter possesses such identification powers. However, I do have a [friend] in Katta Castellum that specializes in discovering such magical origins.");
	elseif(e.message:findi("friend")) then
		e.self:Say("Yaeorat is who I speak of, he is a very trusted and old friend of mine that is a very powerful and skillfull enchanter. Will you bring to him the [Gemmed sword hilt]? I feel that if anyone will be able to identify this it will be Yaeorat.");
	elseif(e.message:findi("gemmed sword hilt")) then
		e.self:Say("That is great to hear, " .. e.other:GetCleanName() .. ". Here is the hilt. Please go see Yaeorat at once and bring me news about the magic that surrounds this sword hilt good or bad.");
		e.other:SummonCursorItem(4762); -- Gemmed Sword Hilt
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4763}, 0)) then -- Gem encrusted Sword Hilt
		e.self:Say("Fantastic work, " .. e.other:GetCleanName() .. ". It would seem that this hilt is fit to be attached to a blade and distributed amongst my guards. I have many other hilts that I need delivered to Yaeorat should you choose to courier another in the future. Until then good luck to you.");
		e.other:Faction(e.self,1510,25); -- house of fordel
		e.other:Faction(e.self,1509,25); -- haven defenders
		e.other:Faction(e.self,1508,2); -- traders of the haven
		e.other:QuestReward(e.self,0,0,0,0,0,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
