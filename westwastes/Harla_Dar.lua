-- Shroud of the Dar Brood

function event_say(e)
	if(e.other:GetFactionValue(e.self) >= 0) then
		if(e.message:findi("hail")) then
			e.self:Say("Have you seen him? I must find him, he has been gone far to long! If you have harmed him, I will slay you and all of your race! Tell me where he is!");
		elseif(e.message:findi("Seen who")) then
			e.self:Say("My whelp, Frakadar. I was sunning myself and he wandered off. At first I did not worry, for he never went far before. But it has been hours and hours, and no other dragon has seen him. I have flown calling his name, but he does not answer. Klandicar was the last to see him, near the entrance of the Necropolis. I am forbidden to enter the Necropolis as long as this body draws breath, for good reason. But I must know if my son is in there!");
		elseif(e.message:findi("klandicar")) then
			e.self:Say("Klandicar is an old old dragon. He has been staying near the Necropolis, but much like the rest of us, he will not enter there until it is his time. A spirit rests uneasy inside, and any dragon who enters risks madness. For me, a fate worse than madness awaits, for the spirit was my first mate, from the days when I flew with the Ring of Scale. It is a long story, but I do not have time to relate it now.");
		elseif(e.message:findi("spirit")) then
			e.self:Say("Jaled Dar was my mate long ago, proud and mighty leader of the Ring of Scale. We produced a fine daughter, Phara Dar, who inherited Jaled Dar's leadership of the Ring. Due to Trakanon's treachery, he was killed in the war with the Iksar. He was laid to rest inside the Necropolis, mourned by all. Given the finest tomb and all honors yet his spirit will not rest, and he still seeks to enact his revenge upon Trakanon. Powerful even after death, his spirit can rend the minds of dragons, so the Necropolis has been shunned by all but the dying since that day. I have a special fear, for Jaled Dar may have learned that I took a new mate after his passing. I know Jaled Dar like no other, and I feel he would consider that another treachery.");
		elseif(e.message:findi("yelinak")) then
			e.self:Say("Yelinak resides in the Skyshrine, last of the Servants there. Bitter beyond compare, he is obsessed with the destruction of the Kromzek. Knowing first hand the perils of revenge, I consider him foolish and dangerous to the extreme. I came to this land from the warmth of Skyfire after war and revenge nearly destroyed us all, and will have no part in it now.");
		end
	else
		e.self:Say("I do not have time for you now, " .. e.other:GetCleanName() .. ". My son is lost, and you can not help me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 27260}, 0)) then
		e.self:Say("This...this is not what I had hoped for. My whelp is lost, but I take some comfort in knowing that you helped destroy his killer. Zlandicar has been a blight upon our race since the beginning. Here is your reward, as I promised. It will protect you in more ways than are obvious. Leave me now, it is time to mourn.");
		e.other:Faction(e.self,430,10);  	--CoV
		e.other:Faction(e.self,436,2);  	-- Yelinak
		e.other:Faction(e.self,448,-5); 	-- Kromzek
		e.other:QuestReward(e.self,0,0,0,0,27261,150000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
