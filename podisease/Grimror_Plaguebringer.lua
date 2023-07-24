function event_spawn(e)
	local sp = e.self:GetSpawnPointID();
	local spawn = eq.get_entity_list():GetSpawnByID(sp);
	spawn:SetRespawnTimer(5);
	e.self:AssignWaypoints(math.random(1,6));
end

function event_death(e)
	local sp = e.self:GetSpawnPointID();
	local spawn = eq.get_entity_list():GetSpawnByID(sp);
	spawn:SetRespawnTimer(3000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Grimror no have time ta talk. Gots stuffs ta do.");
	elseif(e.message:findi("stuff")) then
		e.self:Say("I wuz sent here by Zulort to, err. . . To gadder some alchemy type stuffs. Him have big plan, and need me to travel lots.");
	elseif(e.message:findi("big plan")) then
		e.self:Emote("laughs. 'Me not tell you dat! Grimror keep secrets secret. You gonna help Grimror or no?'");
	elseif(e.message:findi("help Grimror")) then
		e.self:Say("Dat good!");
		e.self:Say("Grimror been getting compon ents for dayz now and Grimror still not finushed. You gonna get dem tings fur me?");
	elseif(e.message:findi("dem tings")) then
		e.self:Say("Grimror need bile, dat stuff es strong here! But Grimror keent seem to git eet all. Bile comz from da leetle bugs. Keel little bugs, and geeve Grimror dere leetel bodiez and Grimror give yuuz anyting dat yuuz want. Dere on four leetel buggiez dat Grimror still neez, two uf dem come from da fliez, one comez from da wurmiez, and one comez from the moss-skeeterz. Yuuz bring Grimror dere lavas and Grimror geeve yuuz, and yuuz freends, anyting yuuz want");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Grimror not thupeed! Dis not four!";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9290,item2 = 9291,item3 = 9292,item4 = 9293},1,text)) then
		e.self:Say("Yuuz dun guud! But Grimror keent geeve you anyting, but Grimror have dis. Grimror also have seekret information. Krypt of Deekay in in here. Dunt tink yuuz wanna go in dere. Dere be mean old rotten keengs in dere, yuuz dunt want ta mess wif dem, dere also be udder sortz uf baddies in dere, be carefuul if yuuz goin dat way. I hurd stories dat Bertoshulus es in dere too, Grimror even saw him in here one time. In dis place yuuz only gots ta worry about Grummus, him fatter dan Grimror, got theek skin too. Him have key ta get inna de Krypt,but Grimror knew da seekret way een. Dat bracer keen make da portil into de Krypt tink dat yuuz belongz dere. Guud barshin!");
		-- if(not e.other:KeyRingCheck(9294)) then
			-- e.other:KeyRingAdd(9294);
			-- Confirmed Live Experience
		e.other:QuestReward(e.self,{itemid = 9294,exp = 1});
			--if(e.other:HasZoneFlag(200) == false) then
			--	e.other:SetZoneFlag(200);
			--end
		-- end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
