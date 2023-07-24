-- Quest Name: Treskar's Secret Mission
-- Quest for SK GM Treskar in Grobb

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You dare speak to Master Treskar!  You be [sent by Hukulk] or you be hurtin'! Me have no time to waste with ugly one like you!");
	elseif(e.message:findi("sent by hukulk")) then
		e.self:Say("Ha!  Hukulk accept puny troll now?!  Ha!  You join us and you join fight.  Nightkeep enemy is " .. e.other:GetCleanName() .. " enemy!  You help smash [other weak shadowknights].  Them weak.  We true power!  You bash good and maybe you do [secret mission] for Treskar.");
	elseif(e.message:findi("other weak shadowknights")) then
		if(e.other:GetFactionValue(e.self) >= 100) then	
			e.self:Say("Other shadowknights is ogre shadowknights! They name is Greenbloods. They no match for Nightkeep! We tear arms from ogre bodies. You not as powerful as Treskar so you smash young Greenbloods. You hunt YOUNG members of Greenblood shadowknights. You bring me black shadow tunic and me share treasures from Nightkeep vault with puny " .. e.other:GetCleanName() .. ". Go");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Me talk to you 'bout dat when you do more to help Nightkeep!  Kill all Greenbloods!  Kill all froggies!");
		else
			e.self:Say("<..Sniff, sniff, sniff..>  Me smell the blood of enemy in you.  You fool to talk to Nightkeep shadowknight!  Me bleed you if you no run!");
		end
	elseif(e.message:findi("secret mission")) then
		if(e.other:GetFactionValue(e.self) >= 100) then	
			e.self:Say("Nightkeep hear bashers see fungus man spore guardian at Innothule. Him protect young fungus man spores so they grow big, BIG an' attack trolls!! You go find spore guardian. Smash hi big red head!! Bring Treskar that huge mushroom head of his to prove he walk no more. You do this and me give you froglok skin mask.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Me talk to you 'bout dat when you do more to help Nightkeep!  Kill all Greenbloods!  Kill all froggies!");
		else
			e.self:Say("<..Sniff, sniff, sniff..>  Me smell the blood of enemy in you.  You fool to talk to Nightkeep shadowknight!  Me bleed you if you no run!");
		end	
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Me change mind! Me want total of THREE ogre black shadow tunics. Ha Ha! And you also pay two gold for Nightkeep tax! Ha! Ha!";	
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12190})) then
		e.self:Say("You do it! You am great knight. Me give you special froglok skin mask. Shaman make for Nightkeep. It am make you smarter like Treskar... Me tink so!");
		e.other:Faction(e.self,308,20); 	-- Shadowknights of Night Keep (Troll SK)
		e.other:Faction(e.self,222,-3); 	-- Green Blood Knights (Ogre SK)
		e.other:Faction(e.self,222,-5); 	-- Broken Skull Clan
		e.other:Faction(e.self,235,1); 	-- Da Bashers (Grobb general guards)
		e.other:QuestReward(e.self,0,0,0,0,2308,10000);  -- Item: Froglok Skin Mask
	elseif (e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12199,item2 = 12199,item3 = 12199, gold = 2},1,text)) then -- factions not verified
		e.self:Say("Hmm... You do good job. You surprise Treskar. Maybe you good after all. Maybe Treskar give you [secret mission]. Maybe not");
		e.other:Faction(e.self,308,20); 	-- Shadowknights of Night Keep (Troll SK)
		e.other:Faction(e.self,222,-3); 	-- Green Blood Knights (Ogre SK)
		e.other:Faction(e.self,222,-5); 	-- Broken Skull Clan
		e.other:Faction(e.self,235,1); 	-- Da Bashers (Grobb general guards)
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(6014, 5023, 6013, 7009, 5013, 5021),1000); -- Random rusty weapon
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
