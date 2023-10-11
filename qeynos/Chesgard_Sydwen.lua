function event_say(e)
	local fac = e.other:GetFaction(e.self);
	
	if(e.message:findi("hail")) then
		e.self:Say('May [Karana] guide you. Are you a [citizen of Qeynos] or a [visitor]?');
	elseif(e.message:findi("citizen of qeynos")) then
		e.self:Say("Then I would urge you to attend daily services in the Temple of Thunder.  You are a [member of Thunder] are you not?  Or maybe I am mistaken and you are just [lost].");
	elseif(e.message:findi("lost") or e.message:findi("visitor")) then
		e.self:Say("Then study and spread the words of Karana the Rainkeeper.  May all the storms in your heart be controlled by the Rainkeeper.  You are young to the world just as [Cheslin] is.");
	elseif(e.message:findi("member of thunder")) then
	 	if(fac <= 4) then
			e.self:Say("I welcome you. Karana cares for all of His flock. He bestows a touch of His power upon the souls of the Clerics and Paladins of our temple. We look after His flock. Speaking of which, I require the assistance of a young paladin to [deliver provisions to needy members].");
		elseif(fac == 5) then
			e.self:Say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us.  But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
		else
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
		end			
	elseif(e.message:findi("karana bandit")) then
		e.self:Say("In the Plains of Karana can be found the [Karana Bandits]. They plague our followers and dare to use the name of the Rainkeeper as title.  For this, Karana commands their deaths. I have a bounty for every returned Bandit Sash, collectible by members only. For clerics, Gehna has a bounty on Binder Spectacles.");
	elseif(e.message:findi("cheslin")) then
		e.self:Say("My son, Cheslin, is currently in training to be a Qeynos Guard.  I fear it was not his calling.  He is not quite in our realm of reality.  He spent too many years of playing games of warriors and dragons.  He will be doing his first patrols in Qeynos Hills this week.  If you are near there, I would appreciate it if you would watch and see him safely through his first patrols.  Tell him I sent you.");
	elseif(e.message:findi("deliver provisions to needy members")) then
		if(fac <= 4) then	
			e.self:Say("Good show!! Here you are, young knight. Take these blankets to any resident who desires warmth. Ask them if they are followers of Karana, then ask if they require temple blankets. Be careful, the plains are quite dangerous for a young knight.");
			e.other:SummonCursorItem(12102); -- Item: Temple Blankets
		elseif(fac == 5) then
			e.self:Say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us.  But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
		else
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
		end					
	elseif(e.message:findi("Karana") or e.message:findi("Rainkeeper")) then
		e.self:Say("Karana, the Rainkeeper, is the provider of the storms. If it were not for the storms of Karana, life would not flourish. All should pay tribute to the Rainkeeper.");						
	elseif(e.message:findi("Bertoxxulous")) then
		e.self:Say("Bertoxxulous, the Plaguebringer, is the Lord of Disease. It is he who smites Norrath with his diseases and imperfections. Those who follow him are called [Bloodsabers].");				
	elseif(e.message:findi("Bloodsabers")) then
		e.self:Say("It is rumored that there is a shrine in the great city of Qeynos which pays homage to the Plaguebringer, Bertoxxulous. The members of this vile church of the damned are called the Bloodsabers. They are dreaded shadowknights, necromancers and evil clerics. It is our duty to destroy all who dare to pray to such a deity. Join our fight. Speak more of this matter with Chesgard Sydwend.");
	elseif(e.message:findi("heal")) then
		e.self:Say("If you need to be healed, I suggest you speak with the Priests of Life. You can find them in the Temple of Life on the other side of Qeynos. The only service you can pay for here is holy armor. Daedet Losaren charges followers of Karana for that blessing.");							
	end
end

function event_trade(e)	
	local item_lib = require("items");
	local sash = item_lib.count_handed_item(e.self, e.trade, {12100});

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18839})) then
		e.self:Say("Hmmph!! My son is living in a fantasy world. Still, you have done well. Take this as a token of appreciation. It is not much, but it may come in handy.");
		-- Backpack, Cast-Iron Warhammer, Raw-hide Gorget, Small Raw-hide Mask, Buckler
		-- Confirmed Live Factions
		e.other:Faction(e.self,280,10,0); -- Knights of Thunder
		e.other:Faction(e.self,221,-10,0); -- Blood Sabers
		e.other:Faction(e.self,341,7,0); -- Priests of Life
		e.other:Faction(e.self,262,7,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(17005,6041,2139,2150,9001),1500);
	end

	if(sash > 0) then
		repeat
		e.self:Say("Good work " .. e.other:Class() .. ". The Karana Bandits have been plaguing the Rainkeepers flock for some time.  Take this as a small reward for your devotion.  Continue the fight against the Karana Bandits.  Ahh... I wish [Cheslin] was equally as skilled.");
		-- random bronze item reward
		-- Confirmed Live Factions and exp data
		e.other:Faction(e.self,280,20,0); -- Knights of Thunder
		e.other:Faction(e.self,221,-20,0); -- Blood Sabers
		e.other:Faction(e.self,341,15,0); -- Priests of Life
		e.other:Faction(e.self,262,15,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(10),math.random(2),eq.ChooseRandom(7012,7013,7014,7015,7016,5026,5027,5028,5029,5030,5031,5032,5033,5034,5035,5036,5037,6019,6021,6022,6023,6024,9002),4850);
			sash = sash - 1;
		until sash == 0
	end	

	item_lib.return_items(e.self, e.other, e.trade)
end
