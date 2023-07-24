
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What you want!! You make fun of [helm of Hukulk]?!! Me smash you!! Maybe you come learn ways of Hate and Fear! You be dark power. You be Pain. You [want join Nightkeep]?");
	elseif(e.message:findi("helm")) then
		e.self:Say("Oh!!  Yooz tink you great enough to wear helm of Hukulk?  Me have another just like it. Me make deal with yooz.  If yooz want helm den yooz help Hukulk get revenge.  Youz better be strong or yooz useless!!  So.. Yooz [make deal with Hukulk]?");
	elseif(e.message:findi("deal")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Yooz smart!!  Yooz go and walks to dark elf city.  Yooz finds one whos make Lynuga breaks up with Hukulk!  Maybe first yooz find Lynuga.  Find who she visits in dark elf city!!  Den yooz go and top off him head!!  Bash Lynuga too, if she no give me back [happy love bracer]!!  Me want head of dat home wrecker an' me happy love bracers, den me give yooz helm of Hukulk.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Me talk to you 'bout dat when you do more to help Nightkeep!  Kill all Greenbloods!  Kill all froggies!");
		else
			e.self:Say("<..Sniff, sniff, sniff..>  Me smell the blood of enemy in you.  You fool to talk to Nightkeep shadowknight!  Me bleed you if you no run!");
		end
	elseif(e.message:findi("bracer")) then
		if(e.other:GetFactionValue(e.self) >= 100) then			
			e.self:Say("Happy love bracers are mines!!  Me make dem for Lynuga.  Dey all shiny and green like da forests me see in adventures when me young.  Dey make Hukulk all warm and happy.  Den me give to Lynuga and.. and <sob>.. and.. AND LYNUGA RIP OUT HUKULK HEART!!  Yooz makes Lynuga give back [happy love bracers]!!");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Me talk to you 'bout dat when you do more to help Nightkeep!  Kill all Greenbloods!  Kill all froggies!");
		else
			e.self:Say("<..Sniff, sniff, sniff..>  Me smell the blood of enemy in you.  You fool to talk to Nightkeep shadowknight!  Me bleed you if you no run!");
		end
	elseif(e.message:findi("join")) then
		if(e.other:GetFactionValue(e.self) >= 100) then			
			e.self:Say("Good. Hate and Pain. Innoruuk teach power, I teach power. Me make you power. You do what me say. You no mess up, I no kill you. We no like dead creature we no own. Go, kill dem. Bring four bone chips. I make you power.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Me talk to you 'bout dat when you do more to help Nightkeep!  Kill all Greenbloods!  Kill all froggies!");
		else
			e.self:Say("<..Sniff, sniff, sniff..>  Me smell the blood of enemy in you.  You fool to talk to Nightkeep shadowknight!  Me bleed you if you no run!");
		end
	elseif(e.message:findi("lynuga")) then
		e.self:Say("Oooh!  Lynuga!  Why yooz leave powerful Hukulk?  Now yooz just spen' time collectin' gems and tings in Innothule.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "No, No, No! I said to bring me the happy love bracers and the troll head of the homewrecker! You not done the right things! Messed up you are!";
	
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 18792})) then -- Tattered Note
		e.self:Say("Haaah!! Bow to Hukulk!! Hukulk make you feared.. make you powered! Dark power flow through you! Hate and Fear in your blood! Go to Vergad. He give you first lesson in pain.");
		e.other:Faction(e.self,308,100);	-- Shadowknights of Night Keep
		e.other:Faction(e.self,261,-15);	-- Green Blood Knights
		e.other:Faction(e.self,222,-25);	-- Broken Skull Clan
		e.other:Faction(e.self,235,5);	-- Da Bashers
		e.other:QuestReward(e.self,0,0,0,0,13530,20);	-- Black and Green Tunic*
	elseif (e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13073, item2 = 13073, item3 = 13073, item4 = 13073})) then -- Bone Chips
		e.self:Say("You good. Take dis. Make much pain and hurt. Make tings bleeds. Kill, hurt all. Innoruuk and me say do, now go. You do much, come bak. Teach you how more hurt and pain make. Go.");
		e.other:Faction(e.self,308,5);	-- Shadowknights of Night Keep
		e.other:Faction(e.self,261,-1);	-- Green Blood Knights
		e.other:Faction(e.self,222,-1);	-- Broken Skull Clan
		e.other:Faction(e.self,235,1);	-- Da Bashers
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,5023,250); -- Rusty Two Handed Sword
	elseif (e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12201, item2 = 12202},1,text)) then -- Happy Love Bracers and Troll Head(Lumpin)
		e.self:Say("Ha!! Ha!! Who have last laugh now!! You do good werk.  Now me give you extra helm of Hukulk. Now go away!!");
		e.other:Faction(e.self,308,40);	-- Shadowknights of Night Keep
		e.other:Faction(e.self,261,-6);	-- Green Blood Knights
		e.other:Faction(e.self,222,-10);	-- Broken Skull Clan
		e.other:Faction(e.self,235,2);	-- Da Bashers
		e.other:QuestReward(e.self,0,0,0,math.random(10),3316,5000); -- Helm of Hukulk
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
