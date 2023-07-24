function event_say(e)
--------------------------
--  Ring 1 Quest        --
--------------------------
	if(e.message:findi("hail")) then
		e.self:Say("Hrmff, what's this? A spy sent from the giant heathens, or the selfrighteous wurms perhaps? Either way, you'd be no [friend] of the great Coldain.");
	elseif(e.message:findi("friend")) then
		e.self:Say("A friend, you say? That remains to be seen. Much more to being a friend of the Coldain than just sayin' so. Anyway, I'm too [tired] to argue about it. I haven't slept in days.");
	elseif(e.message:findi("tired")) then
		e.self:Say("Did I say tired? Exhausted is more like it. Ever since that blizzard last week I haven't slept a wink. I came back from huntin' snow orcs to find that my [blanket] had blown away and now I'm just too tired to rustle up a new one.");
	elseif(e.message:findi("blanket")) then
		e.self:Say("Not just any old blanket, mind ye, mine was made of the finest tundra kodiak hides and snow panther skins, two of each. When I was wrapped up in it ya couldn't see me a bit, no, I blended right into the snow, I did. Say, if you be a friend, here's yer chance to prove it. Sew me up a new blanket so I can get some rest.");
---------------------------
--  Ring 2 Quest         --
---------------------------
	elseif(e.message:findi("nephew")) then
		e.self:Say("My nephew, Boridain, keeps running away from home to kill a bothersome [beast], thinking this will prove to all of Thurgadin that he is a great hunter. Every time he does this my sister gets hysterical and I am sent out to find him.");
	elseif(e.message:findi("beast")) then
		e.self:Say("A rabid tundra kodiak has been feeding on our people for weeks now. If Boridain ever stumbled across the critter I doubt he'd stand a chance. I have a solution, but it would require the [assistance] of an outsider.");
	elseif(e.message:findi("assistance")) then
		e.self:Say("I'm taking a liking to you, stranger. Your eagerness to help us will not go unnoticed. Find my nephew and give him this axe. It should keep him from hurting himself. Return to me with the ring and proof that he is safe.");
		e.other:SummonCursorItem(30265); -- Item: Dull Bladed Axe
---------------------------
--  Ring 3 Quest         --
---------------------------
	elseif(e.message:findi("hunting")) then
		e.self:Say("My camp here boasts the most proficient hunters in the recorded history of the mighty Coldain empire. We alone could feed an entire clan. Things have been frustratingly [slow] lately, though.");
	elseif(e.message:findi("slow")) then
		e.self:Say("After years of skinning the hides of the giantmen, my hunting knife has lost its edge. The dull blade has slowed me down considerably. It has served me well, but a new [knife] would make me a much more proficient hunter.");
	elseif(e.message:findi("knife")) then
		e.self:Say("Hunt a wooly rhino and take his horn, then take a flawless hide from a walrus. Combine them in a forge with a skinning rock and bring me the new knife and the silver insignia ring.");
---------------------------
--  Ring 4 Quest         --
---------------------------
	elseif(e.message:findi("smithing hammer")) then
		e.self:Say("[Tain] Hammerfrost can get you one. Find him and give him this.");
		e.other:SummonCursorItem(30139); -- Item: Note to Tain
	elseif(e.message:findi("tain")) then
		e.self:Say("Tain left a short time ago, he said he had a score to settle with a particular Kromriff.");
---------------------------
--  Ring 5 Quest         --
---------------------------
	elseif(e.message:findi("plans")) then
		e.self:Say("The bloody Ry'Gorr, friends of the frost giants, plan to raid our encampment. Their captain, Scarbrow Ga'hruk is leading the raid. I need someone to intercept his [orders] so we may prepare for the attack. Without them we could be in serious trouble.");
	elseif(e.message:findi("orders")) then
		e.self:Say("Find the Ry'Gorr messenger and cut him down. Bring the message he carries to my lookout. When the attack is thwarted, return to me with the head of Scarbrow and the platinum insignia ring.");
---------------------------
--  Ring 6 Quest         --
---------------------------
	elseif(e.message:findi("favor")) then
		e.self:Say("For several seasons there has been an unsolved mystery in this land. Not far from here an elite team of Coldain and their trained wolves were gathered to make a strike at the Kromrif. No one knows just what became of our strike force. Bring me proof of their fate and proof that whoever was responsible for their loss is no more.");
---------------------------
--  Ring 7 Quest         --
---------------------------
	elseif(e.message:findi("mission")) then
		e.self:Say("A Coldain... A very important Coldain, has been abducted by the Rygorr. He was gathering information that is imperative to our victory over the brainless heathens. You must find him before he is killed and escort him to safety. Return to me with proof that Corbin Blackwell is safe.");
---------------------------
--  Ring 8 Quest         --
---------------------------
	elseif(e.message:findi("ready")) then
		e.self:Say("Very well, " .. e.other:GetCleanName() .. ", give me the Adamantite ring and I will give you the marching orders. Once the orders are given to Gloradin in the next hut, we will be underway. You then must follow me to what will be our battleground. I must warn you, I will hold your ring until the head of Chief Ry`gorr is given to me. If we fail, all will be lost... for both of us.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "Excuse me, " .. e.other:GetCleanName() .. ", aren't you forgetting something?";	
	
---------------------------
--  Ring 1 Reward        --
---------------------------	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30135}, 0)) then
		e.self:Say("Ahh, that'll do fine. Take this, it is but a trinket for now, but continue to serve the Coldain and it will grow in power. I must get some rest now, for I have been told my [nephew] has disappeared again and I will need to track him down tomorrow.");
		-- Faction confirmed live
		e.other:Faction(e.self,406,5); -- Coldain
		e.other:Faction(e.self,405,1); -- Dain Frostreaver IV
		e.other:Faction(e.self,448,-1); -- Kromzek
		e.other:Faction(e.self,419,-2); -- Kromrif
		e.other:QuestReward(e.self,0,0,0,0,30131,1000);
---------------------------
--  Ring 2 Reward        --
---------------------------			
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30131,item2 = 30267},1,text1)) then
		e.self:Say("Well done friend! My nephew is safe at home and his thirst for adventure is quenched for now. The beast will claim no more of our people. I couldn't have handled it better myself. Now I can get back to the business of [hunting].");
		-- Faction confirmed live
		e.other:Faction(e.self,406,10); -- Coldain
		e.other:Faction(e.self,405,2); -- Dain Frostreaver IV
		e.other:Faction(e.self,448,-1); -- Kromzek
		e.other:Faction(e.self,419,-5); -- Kromrif
		e.other:QuestReward(e.self,0,0,0,0,30133,2000);
---------------------------
--  Ring 3 Reward        --
---------------------------			
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30133,item2 = 30137},1,text1)) then
		e.self:Say("Hrmm, not quite the work of a Coldain. Barely functional, in fact. I'll be needing to touch this up a bit. Fetch me a Coldain [smithing hammer] and I'll be sure to tell my associates in Thurgadin of your deeds.");
		-- Faction confirmed live
		e.other:Faction(e.self,406,20); -- Coldain
		e.other:Faction(e.self,405,5); -- Dain Frostreaver IV
		e.other:Faction(e.self,448,-2); -- Kromzek
		e.other:Faction(e.self,419,-10); -- Kromrif
		e.other:QuestReward(e.self,0,0,0,0,30132,3000);
---------------------------
--  Ring 4 Reward        --
---------------------------			
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30140,item2 = 30132},1,text1)) then
		e.self:Say("Ahh, there we go now, that's more like it. It would be time to return to the hunt were it not for the [plans] our spies have discovered.");
		-- Faction confirmed live
		e.other:Faction(e.self,406,25); -- Coldain
		e.other:Faction(e.self,405,6); -- Dain Frostreaver IV
		e.other:Faction(e.self,448,-2); -- Kromzek
		e.other:Faction(e.self,419,-12); -- Kromrif
		e.other:QuestReward(e.self,0,0,0,0,30134,4000);
---------------------------
--  Ring 5 Reward        --
---------------------------			
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30141,item2 = 30134},1,text1)) then
		e.self:Say("Without your assistance, we would have lost our camp and our lives. Again, I thank you. Now that you have proven your loyalty to the throne I have a special [favor] to ask of you.");
		-- Faction confirmed live
		e.other:Faction(e.self,406,25); -- Coldain
		e.other:Faction(e.self,405,6); -- Dain Frostreaver IV
		e.other:Faction(e.self,448,-2); -- Kromzek
		e.other:Faction(e.self,419,-12); -- Kromrif
		e.other:QuestReward(e.self,0,0,0,0,30268,5000);
---------------------------
--  Ring 6 Reward        --
---------------------------			
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1045,item2 = 18084,item3 = 30268},1,text1)) then
		e.self:Emote("lowers his head and mutters, 'At least there will be some closure for their families, thanks to you. The Ry`gorr will pay for this with their lives! I will ask you to help us in the invasion of Ry`gorr keep, but first I have a delicate [mission] I was hoping you'd handle.");
		-- Faction confirmed live
		e.other:Faction(e.self,406,25); -- Coldain
		e.other:Faction(e.self,405,6); -- Dain Frostreaver IV
		e.other:Faction(e.self,448,-2); -- Kromzek
		e.other:Faction(e.self,419,-12); -- Kromrif
		e.other:QuestReward(e.self,0,0,0,0,30162,6000);
---------------------------
--  Ring 7 Reward        --
---------------------------			
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1047},0)) then
		e.self:Emote("Thank you, " .. e.other:GetCleanName() .. ", your service to our people has been most helpful. The time has come for our people to make war with the Ry`gorr. They must pay for their transgressions against our people. We are just waiting on you. Prepare yourself for glorious battle and tell me when you are [ready].");
		-- Faction confirmed live
		e.other:Faction(e.self,406,25); -- Coldain
		e.other:Faction(e.self,405,6); -- Dain Frostreaver IV
		e.other:Faction(e.self,448,-2); -- Kromzek
		e.other:Faction(e.self,419,-12); -- Kromrif
		e.other:QuestReward(e.self,0,0,0,0,30163,7000);
---------------------------
--  Ring 8 Quest         --
---------------------------			
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30163},0)) then
		e.self:Emote("Give this to Gloradin and return to me immediately, it is time. May Brell be with us!");
		-- Faction confirmed live
		e.other:Faction(e.self,406,15); -- Coldain
		e.other:Faction(e.self,405,3); -- Dain Frostreaver IV
		e.other:Faction(e.self,448,-1); -- Kromzek
		e.other:Faction(e.self,419,-7); -- Kromrif
		e.other:QuestReward(e.self,0,0,0,0,1093,3500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
