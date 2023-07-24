function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and well met," .. e.other:GetCleanName() .. ". I can see by your appearance that you are well traveled. I congratulate you on your thirst for adventure as you are obviously far from where you call home. Would you happen to [study the art of sorcery]?");
	elseif(e.message:findi("art of sorcery")) then
		e.self:Say("Then I believe you would be interested in hearing of the sad tale of our beloved Hsagra. Many years ago, Hsagra was slain by the wicked Kromzek Porlos. Unfortunately, Porlos found out that Hsagra had discovered a new magic that was extremely powerful against the Giants. Hsagra was the mate of Yelinak. You might have heard the tale of Yelinak, for he still lives with the terrible memory of the horrid day that he lost his wingmate. The Giants even have the gall to have made the throne of King Tormax out of the skull of Hsagra. Do you [wish to avenge Hsagra] after what I have told you?");
	elseif(e.message:findi("avenge")) then
		e.self:Say("The Kromzek have been a bane upon our very existence for far too long. If you wish to aid our cause, I will need proof of your devotion and allegiance. We will not waste our time educating anyone who does not have our best interests at heart. The journey will prove very dangerous both to you as well as whom you choose to accompany you. After knowing this, do you still [wish to prove your allegiance]?");
	elseif(e.message:findi("prove my allegiance")) then
		e.self:Say("Before I divulge the secret behind the sorcery against the Kromzek, I require three items from you, and you alone. Please also keep in mind I will need to combine these three items together, so I will not accept them individually. First, we must start out with the teachings of Relinar, for it is necessary in recreating the magic against the vile giants. Our [lorekeeper] is one you must seek out to acquire those teachings, he resides within the confines of our dwelling.");
	elseif(e.message:findi("lorekeeper")) then
		e.self:Say("Jualicn is the one that you seek. Ask him of Relinar and he will guide you in acquiring the teachings of our Relinar who rediscovered the lost magic that once belonged to Hsagra. Once you have all of the items in hand that are needed to recreate this powerful spell, come back and we will continue this discussion then. Until that point, our business here is done. May you be blessed in your efforts to assist in the annihilation of the Kromzek.");
	elseif(e.message:findi("problem")) then
		e.self:Say("Hello again " .. e.other:GetCleanName() .. ". I see that you have spoken to Jualicn. We have been having problems with spies in this area. I require three items in order to recreate the magic necessary to scribe the spell. I need the head of a Kromzek spy, the teachings of Relinar, and finally a scale from Hsagra. In order for the magic of Hsagra to work, we must have some of her remains to complete the components. It is rumored that a high ranking giant noble that goes by the name Helssen, treasures a scale that came from the body of Hsagra herself. But I believe you will have to kill him in order to take the scale away from him. He resides in the giant city with the other vile creatures. Bring it to me along with the head of the spy and the teachings of Relinar and we will conclude our dealings.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1897,item2 = 1898,item3 = 1899})) then
		e.self:Say("" .. e.other:GetCleanName() .. ", you are to be commended for your valor and determination in assisting my Kin. Here is the spell that Hsagra died so long ago over. I only ask that each time that you use the sorcery here, that you remember Hsagra in a silent prayer of thanks. For I hope that will help ease Yelinak's still tormented soul from his loss. I bid you farewell. You are welcome amongst our ranks.");
		e.other:Faction(e.self,430,100); -- ClawsofVeeshan 
		e.other:Faction(e.self,436,25); -- Yelinak
		e.other:Faction(e.self,448,-50); -- Kromzek
		e.other:QuestReward(e.self,0,0,0,0,19470,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
