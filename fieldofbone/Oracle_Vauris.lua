--Shaman Skull Quest 8
function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 100) then			
			e.self:Emote("Oracle Vauris motions for silence and points at the shifting sands below him without a word.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));		
		end
	elseif(e.message:findi("rile")) then
		if(e.other:GetFactionValue(e.self) >= 100) then			
			e.self:Say("Have you learned nothing in all your years of service to the hall of Terror? The skulls on that necklace were the bones of the traitorous Iksar who defiled Rile's Relics. Their final moments were spent in Charasis, destroyed by their own dark magics. Rile was the son of the most powerful and terrible [emperor] the Iksar have ever known. Not since the days of Ssrae... 'His voice trails off and his eyes glaze over a bit. You sense that Vauris has been touched by some unmentionable terror.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));		
		end
	elseif(e.message:findi("xalgoz")) then
		if(e.other:GetFactionValue(e.self) >= 100) then			
			e.self:Say("At last you see " .. e.other:GetCleanName() .. ". The one you speak of is indeed a servant of Rile's father. His presence on this world has disrupted the spirits of the ancients. This disruption must be put to an end. Slaying him will do little good unfortunately. We will have to make use of other powers to truly banish him from this world. If we are to do this we shall need a true relic of Rile, and the soul of his father. Only with these items can we hope to free Rile's soul from the void between death and life. But first there are others that serve the risen emperor that must be destroyed.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));		
		end
	elseif(e.message:findi("other")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The servants of the emperor wear many faces. One in particular is know to wear several himself. Of Serpents and Iksar is his current incarnation, a twisted vision of a dark union. Bring me his essence, for I will need a vessel to siphon the emperor's soul into. Bring me these 3 items along with the pouch of bone dust and we shall see what fate the ancients have chosen for us.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));		
		end
	elseif(e.message:findi("venril")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Emote("smiles coldly. So you have learned a thing or two about your ancestors, that is good. But what do you know of the present young mystic? A true Oracle's power is in his ability to entwine past present and future into a single entity. You have already encountered the emperor's servants, although you may not have know it. Show me that you have the clarity of mind to discern this riddle and we shall embark on a journey of enlightenment you and I.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));		
		end
	elseif(e.message:findi("emperor")) then
		if(e.other:GetFactionValue(e.self) >= 100) then			
			e.self:Emote("seems to snap back into reality and again looks into your eyes.  Your lack of knowledge of our history is pathetic Seer.  Were you a true follower of the order you would know of that which I speak.  Find for yourself the knowledge to understand.  Only then will I be able to help you in your quest for the knowledge of the ancients.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));		
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	--Turn in the Shrunken Iksar Skull Necklace
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 30989},0)) then
		e.self:Emote("takes the necklace from you without a word. He looks into your eyes for a moment. He seems to be searching for something. Apparently he finds whatever he was looking for as he pulls an empty bag from his belt. He takes the necklace and snaps the cord with his teeth allowing the skulls to fall into the bag. He looks you square in the eyes again and motions for you to put out your hand. You do so and almost immediately regret it. Vauris takes the knife from his belt and slices open your forearm allowing your blood to fall into the bag. He uses the cord to tie the bag and hands it back to you. 'You now share the mark of Rile, " .. e.other:GetCleanName() .. ". Your fates are intertwined.'");
		e.other:QuestReward(e.self,0,0,0,0,30990); --give the player Bag of Iksar Skull Dust
	--Turn in the Changeling Essence, Bag of Iksar Skull Dust, Glowing Kunzar Amulet, Blackened Iksar Bones
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 30991, item2 = 30990, item3 = 30993, item4 = 30992})) then
		e.self:Say("You have done well " .. e.other:GetCleanName() .. ". Now it is time for the true test of your clairvoyance. Only a true Scaled mystic will be able to put these spirits to rest. Be warned, these souls will not go quietly into the next world. They have strong ties to this land, and it is these ties we must break. Take them to the City of the Kunzar, the birthplace of the emperor. Only there will you be able to tear asunder the dark rituals that have twisted the souls of our ancient heroes. I will await you in that place " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,30994); --give the player Iksar Relics
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
