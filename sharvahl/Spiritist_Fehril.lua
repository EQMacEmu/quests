--Code by Kagehi - edited by anubisrwml
--Shar_Val_Cit is used to track you up to when you get your initiate cloak and beyond.--We use it once here, to determine that you should get back your Dar Khura recruit cloak instead,--if you lose it somehow.
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("opens his eyes as he awakens from a deep meditaion, 'Hello, " .. e.other:GetCleanName() .. ", how might I be of assistance to you?");
	elseif(e.message:findi("Merchant Ayyad")) then
		e.self:Say("You can find Merchant Ayyad in 'The Merchants' Quarter which lies in the middle of the city just east of the Royal Palace.");
	elseif(e.message:findi("love potion")) then
		e.self:Say("Hmmm, while I dabble in the art of potions mixing myself, I am no scholar in the field. Perhaps Spiritist Ragnar would be of more assistance to you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2877})) then
		e.self:Say("" .. e.other:GetCleanName() .. "! So good to see you! It is my honor to guide you for a time. May the spirits inspire my words that you might grow wise in the hearing. You are young and need to be strengthened. Bring me three hairless hides of rockhopper young. You can find them in the crater surrounding our city, formed when the portion of Norrath our city is built upon came to rest in its current location.");
		e.other:QuestReward(e.self,0,0,0,0,2877);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3488, item2 = 3488, item3 = 3488})) then
		e.self:Emote("craftily places the hides in a circular frame and hands you the product, 'You've completed my first task and as a reward I present you with this small token. May it serve to protect you from our enemies.");
		e.self:Say("As a member of the sacred Dar Khura, you will be asked to become proficient in the art of brewing. Sweetwater is produced by combining xakra bile and scorpion blood with a flask of water in a brew barrel. Pour two flasks of sweetwater into this cask and return it to me.");
		eq.signal(155164,1,0); -- NPC: Elder_Spiritist_Grawleh
		e.other:QuestReward(e.self,{items = {3489,17232},exp = 500}); --Hopper hide Buckler.
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3493})) then
		e.self:Emote("takes a sip from the cask and furrows his brow.");
		e.self:Say("Well, it's a start I suppose. With a little practice you are certain to get better. Here is some hide treatment I just made, it will make your buckler stronger. It just needs some time to ferment before I apply it.");
		e.self:Say("Citizens often need assistance and the Dar Khura must be available whenever possible. [Merchant Ayyad] has requested someone to run an errand and I am sending you. Return to me with Ayyad's seal, the hide treatment, your buckler, and your initiate's cloak.");
		e.other:QuestReward(e.self,0,0,0,0,3494,500); --Hopperhide Treatment.
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3489, item2 = 3494, item3 = 3499, item4 = 2878})) then
		e.self:Say("Well done you " .. e.other:GetCleanName() .. ", your deeds will not go unnoticed. You will now be known throughout the land as an official recruit of the revered Dar Khura. As your status improves so will the rewards for your service. Here is your treated buckler, your new cloak, and a spell I trust you will find a use for. Show your buckler to Fharra Cawfeet and she will continue your training.");
		e.self:Emote("shouts, 'My fellow Vah Shir, I present to you the newest recruit to the sacred Dar Khura. " .. e.other:GetCleanName() .. " has shown great potential in the service of our sect. Please join me in thanking this citizen for service to our people!'");
		eq.set_global("Shar_Vahl_Cit","8",5,"F");
		e.other:QuestReward(e.self,{items = {3495,3496,15275},exp = 500}); --Treated Hopperhide Buckler, Cloak of the Dar Khura Recruit, Spell: Frost Rift.
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5542, item2 = 3496, item3 = 5543})) then
		e.self:Say("Your progress fills me with pride. Please take these things as a sign of our appreciation. I hope that they help you as much as you have helped us. When you are ready to continue your training, please contact Jaima Seyel. You'll most likely find her in the Dar Khura Guildhall. She will train you from this point.");
		e.self:Shout("Fellow citizens, may I present to you with our newest apprentice to the sacred Dar Khura. " .. e.other:GetCleanName() .. " has assisted us for some time now and we can only hope that this assistance doesn't go unnoticed. Now, please join me in thanking " .. e.other:GetCleanName() .. " for such selfless service to our people.");
		e.other:Faction(e.self,1533,20); -- Faction: Dar Khura
		e.other:QuestReward(e.self,{items = {5543,5544,15282},exp = 1500}); -- Item: Imbued Hopperhide Buckler, Cloak of the Dar Khura Apprentice
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
