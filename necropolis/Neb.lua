function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Chika val na vi Paebala Neb'ri. I am Neb of the Paebala. Aknila sa rik nor valkuta aknila. Start no trouble, there will be no trouble. Nish ala ro tak na re Chetari, skas vena ral. Avoid the Chetari, they will kill you.");
	elseif(e.message:findi("chetari")) then
		e.self:Say("Rika sa vi na Chetari aga val rak Zlandicar. The Chetari are an evil breed, shaped by Zlandicar. Asila sa vi ne Paebala ika so takina. They enslave the Paebala. Canti ri va ni makata ra Paebala. The Paebala revolted years ago. Mishi ro ka rilla vi ne graka sal ogoo mashan rina, villi rassa rassa ke! They are powerful in the ways of death, but they fear our goo friends, and our teeth are sharp! Rika re rika so malti fe isha kora, Chetari fa rish na Paebala. But the Chetari will not rest until we are all dead or slaves. Villi rassa rassa ke, korta ne riki sa vena. Our teeth are sharp, but we can not win. Wilta fa unala kisha Zlandicar maka re, villa rasssa, moa Chetari isa rolak. Zlandicar has the sharpest teeth, and the Chetari do his bidding.");
	elseif(e.message:findi("zlandicar")) then
		e.self:Say("Ika nora drikinava, vaa ria solta drikinava, misa ni vi isa Zlandicar. Zlandicar is the oldest dragon, the evil dragon. Maka drikinava raeli Veeshan, muta ne ri falaka Zlandicar. He is outcast from the other children of Veeshan, for he eats upon their flesh. Ifa no ri ve ala bakari mo drikinavi wo isa maka. This flesh makes him strong, the other dragons fear him and shun him.");
	elseif(e.message:findi("help")) then
		e.self:Say("Aakaka! Aakaka! I rejoice! I rejoice! Vala ni veena rika tal, rala vin mo taka, mata nish Vaniki ep Zlandicar! You must be strong, to be here, you perhaps can kill Vaniki and Zlandicar! Moaka sish vanava, Neb'ri anta Paebala tu pa sil ro mitika! Do this thing, and prove it, and I Neb, and all of the Paebala, shall reward you!");
	elseif(e.message:findi("vaniki")) then
		e.self:Say("Vaniki morka ta, so aka ral faka sa! Vaniki is a witch, she should die! Bantaka se vi rish Zlandicar, bo kal neta Paebala. She was the first to approach Zlandicar, and he made her other than Paebala. Vasu ris oto Chetari, maka so ni inta sla Zlandicar. Out of his boredom, the Chetari were born, they are the toys of Zlandicar.");
	elseif(e.message:findi("paebala")) then
		e.self:Say("Ika woka asa chelaki sa asa Paebala ian raka yi no sa! We are the first to walk on hind feet, to use hands. Toku mala nealopa chelaki wuna saka no Paebala. From rats we come, but the magic of this land, and what we... eat, makes us more, makes us Paebala. Whana so vi re nik ala iva Paebala, so ni valato ut Chetari. The magic breeds true, all ratmen were first from here, even the Chetari...");
	elseif(e.message:findi("goo")) then
		e.self:Say("Unana ogoo Paebala, ni ni ni! Unana ogoo Chetari vi vi vi! The Paebala taste very bad to the goo! The Chetari tast very good to the goo! Moaka sai Slani, ogoo ranta vis Paebala. Thanks to our clever shaman, we teach the goo not to eat us. Ogoo via ranca toka ra to itu. They eat everything else though, even you. Paebala visa ranca so to so to itu ogoo. We would have to feed many of you to the goo to teach them you are bad to eat. Isak to, isak Slani, elasa Paebala ras ogoo so to so to mis. That is what the shaman did, poisoned our dead and fed the goo for years. Makari et ne va mi to mis oh naka? Do you wish to volunteer for this task? Yiyiyiyieh, mita vo Neb'ta! Hahaha, Neb jokes with you!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 26033,item2 = 26009})) then
		e.self:Say("Ika Paebala ma ri skasha, Neb`ri mi re skashi! The Paebala are joyful, Neb is joyful! Misu na tona Vaniki esa Zlandicar, no re Paebala soka mora Chetari, ika tu. With the death of Vaniki and Zlandicar, the Paebala can conquer the Chetari, and rule! Mika na so kaka rika, ug boro Neb`ri, ek val Vaniki ushta. Take this, it is Neb's fighting bone, and here, this key I took from Vaniki.");
		e.other:Faction(e.self,463,100); -- Faction: Paebala
		e.other:Faction(e.self,462,-10); -- Faction: Chetari
		e.other:Faction(e.self,464,-10); -- Faction: Zlandicar
		e.other:QuestReward(e.self,{items = {28060,26040},exp = 25000}); -- Item: Neb's Warbone
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
