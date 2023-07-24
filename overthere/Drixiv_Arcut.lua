function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sighs heavily and after a long while says, 'Leave us, " .. e.other:Race() .. ". Leave us to our eternal damnation.");
	elseif(e.message:findi("curse")) then
		e.self:Emote("twists his face into a frown and says, 'You read what's written, " .. e.other:Race() .. ". It's clear enough so we won't bother to explain the details. We can only stand our guard and hope for [redemption].");
	elseif(e.message:findi("redemption")) then
		e.self:Emote("It's very simple, " .. e.other:GetCleanName() .. "! We are fallen! We seek redemption! We guard our 'brothers' here among the Howling Stones until we are relieved. Whether that will ever happen, we do not know. We can only hope that by providing the great warriors of the legion with our [ancient armor], we will earn salvation.");
	elseif(e.message:findi("armor")) then
		e.self:Say("You wish the armor of our ancestors? The armor donned by the Guard whose duty was to protect the Chosen? A warrior relies not on strength alone, but many virtues. If a warrior learns to balance each virtue, then he may be fit to guard the Chosen. Each piece of armor reflects a [virtue], and each virtue must be learned before the armor is given.");
	elseif(e.message:findi("virtue")) then
		e.self:Say("The virtues symbolized by the armor I keep are confidence and righteousness. The [boots], [greaves], [gauntlets], and [bracers]. Bring me proof that you have mastered these virtues as well as a piece of Banded armor of the type you desire and the appropriate armor shall be yours, " .. e.other:GetCleanName() .. ". If you wish the other pieces you must speak to my brother.");
	elseif(e.message:findi("boots")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("You wish the boots worn by the ancients? Then you must first master the virtue of confidence. For our brothers of the dead, confidence is the virtue that allows them to control the forces that would tear them apart if they knew it not. When a warrior steps, he must be confident, for a weak step cannot crush your enemies. Take this note to the current Harbinger in Cabilis and learn from him.");
			e.other:SummonCursorItem(14794); -- Item: Illegible Note: Boots
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("bracer")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The bracers of our ancestors embody righteousness. When we strike, and our forearms are soaked in the blood of our enemies, our purpose must be pure. Else that blood will burn our souls and anger that which we live for. Go and find the Archduke in Cabilis and give him my note. He will teach you of righteousness. For if our chosen did not know righteousness, our people would not be. Go!");
			e.other:SummonCursorItem(14791); -- Item: Illegible Note: Bracer
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("guantlets")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Our hands are our most useful and deadly instruments, after our minds. When we use them other than in service of our lord and ancestors, our actions are false. Without knowing righteousness we can never be sure if our actions are in the name of fear. The Chosen, the Crusaders of Greenmist, know fear intimately. Their actions are never without the blessing of our lord. Take this note to the Archduke. He will recognize my writing and instruct you.");
			e.other:SummonCursorItem(14792); -- Item: Illegible Note: Gauntlets
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("greaves")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Our legs move us forward. If we move with hesitance we will surely fall and leave our charge exposed. Before you can wear the greaves, you must learn from the Brood of Kotiz. For if they did not wield their powers over the dead with confidence, their life forces would be sucked from them instantly, leaving them empty husks. Take this note to the Harbinger and listen to his instructions.");
			e.other:SummonCursorItem(14793); -- Item: Illegible Note: Greaves
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14813, item2 = 3064})) then
		e.other:QuestReward(e.self,0,0,0,0,4983,10000);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14808, item2 = 3061})) then
		e.other:QuestReward(e.self,0,0,0,0,4980,10000);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14831, item2 = 3063})) then
		e.other:QuestReward(e.self,0,0,0,0,4982,10000);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14809, item2 = 3062})) then
		e.other:QuestReward(e.self,0,0,0,0,4981,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
