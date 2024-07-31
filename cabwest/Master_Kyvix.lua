function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Quite busy!! Quite busy!! Things must be done. [New components] to be collected!!");
	elseif(e.message:findi("New components")) then
		e.self:Say("Yes, yes!! I will need components from beyond the gates. I must find an [apprentice of the third rank].");
	elseif(e.message:findi("apprentice of the third rank")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("If you truly be an apprentice of the third circle, then there is a Dark Binder skullcap to be earned. Take this sack and fill it with a creeper cabbage, a heartsting telson with venom, brutling choppers and a scalebone femur. When they are combined within the sack, you may return it to me with your third rank skullcap and and we shall bid farewell to the title, apprentice.");
			e.other:SummonCursorItem(17024); -- Item: Brood Sack
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you have shown more devotion to the Brood of Kotiz, we can discuss such things.");
		else
			e.self:Say("You are a true simpleton to think you can speak to me.  You are no ally to the Brood of Kotiz.  Begone, before I make your blood boil!");
		end
	elseif(e.message:findi("true mission")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("I have been waiting for a Nihilist to return. His name was Ryx and I fear his love of ale and the high seas has kept him from his mission. All I want you to do is find him. He should be disguised as a worker and he will give you a tome to bring to me. Return it with your Dark Binder Cap. I am sure that is simple enough for one as simple as you. Be sure to give him this.");
			e.other:SummonCursorItem(12848); -- Item: A Spectacle
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you have shown more devotion to the Brood of Kotiz, we can discuss such things.");
		else
			e.self:Say("You are a true simpleton to think you can speak to me.  You are no ally to the Brood of Kotiz.  Begone, before I make your blood boil!");
		end
	elseif(e.message:findi("Kor Sha Candlestick")) then -- missing text
		e.self:Say("I need the foot and stem of my candlestick. The Stem comes from Sarnaks. The foot has been stolen by Grype, in East Cabilis.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "I demand a full fish sack and your third circle apprentice skullcap.";
	local text2 = "So you are expecting to earn your way to rank of revenant, eh? You shall when I have the base and stem of the candle and your occultist skullcap.";
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12420, item2 = 4262},1,text1)) then 				--full component sack, apprentice skullcap - 3rd rank
		e.self:Say("you have taken far too long!! Already another apprentice has performed this task. You will still be rewarded with the Dark Binder skullcap, but now you must aid in a [true mission].");
		e.other:Faction(e.self,443,10); -- Faction: Brood of Kotiz
		e.other:Faction(e.self,441,2); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,math.random(15),0,4263,200); --dark binder skullcap
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18065, item2 = 4263})) then 				--a journal and dark binder skullcap
		e.self:Say("I did not expect you to return. You have made me lose a bet with one of the other scholars. Seeing as you have delivered the tome, I shall not harm you, but rather welcome you into the rank of occultist. Now go see Keeper Rott and tell him you are [the chosen occultist]");
		e.other:Faction(e.self,443,10); -- Faction: Brood of Kotiz
		e.other:Faction(e.self,441,2); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,math.random(15),0,4264,200); --occultist skullcap
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12853, item2 = 12852, item3 = 4264},1,text2)) then	--Stem of Candlestick, Foot of Candlestick, occultist skullcap
		e.self:Emote("grabs the candle parts and puts them in an odd pouch, then takes your cap which disintegrates in his palm. He hands you another cap. 'Welcome, Revenant " .. e.other:GetCleanName() .. ". You have done well. The Harbinger awaits you. He seeks a [new revenant].'");
		e.other:Faction(e.self,443,20); -- Faction: Brood of Kotiz
		e.other:Faction(e.self,441,5); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,math.random(15),0,4265,200); --Revenant Skullcap
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
