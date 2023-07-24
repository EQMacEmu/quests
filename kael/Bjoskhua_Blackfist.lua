function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Emote("'s lips do not move, though your mind is filled with a voice.  'What is it you want, mortal?  I have little patience for those who do not come here to study.'");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("study")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Emote("looks you over and his voice invades your mind again.  'What is it you wish to study?'");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("combat")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Those who walk the path of the fist are fierce indeed.  Stories in my books tell of great contests once held.  Contests of skill without weapons.  Only the body and the warriors' training would keep them alive.  The last warriors to survive would be given a set of magical chest straps as a status symbol.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("clrakk")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Clrakk is my youngest brother. He walks a path of shadows and deceit. If he were to battle, it would not be one without weapons or armor. I may use these as a bargaining chip some day. I do not think my family has any more need of these old chest straps.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("chest strap")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The chest straps are simply a status symbol to some gladiators and warriors. They are passed down from generation to generation. When a warrior enters one of these contests of the fist, they wear the chest straps of their family. My family was awarded a set of the enchanted chest straps ages ago. None of my brothers save Clrakk would even consider entering the contest.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("contest")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Ages ago there was a race of fish men named the Kedge.  Prexus spread them throughout the waters of the world and they were prosperous.  Rumors abound that even near the waters of Velious they had great cities.  All at once they seemed to be wiped from the face of Norrath.  One of the travelers I recently spoke to informed me that a single Kedge may still live in the lands of Faydwer.  As grotesque as it sounds, the backbone of a Kedge may be used to create indestructible scroll cases.  Bring me the backbone of this fishman, if he exists, and you will find yourself a richer person.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 20524}, 0)) then
		e.self:Say("Excellent, I guess his entire race is now wiped from Norrath. This will indeed make a wonderful scroll case. I am a giant of my word. Take your prized item and be gone, you greedy little beast!");
		e.other:Faction(e.self,419,10); -- Kromrif
		e.other:Faction(e.self,448,2); -- Kromzek
		e.other:Faction(e.self,406,-5); -- Coldain
		e.other:Faction(e.self,430,-1); -- Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,25053,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
