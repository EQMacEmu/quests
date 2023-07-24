function event_spawn(e)
	eq.get_entity_list():GetSpawnByID(e.self:GetSpawnPointID()):SetRespawnTimer(150);
end

function event_waypoint_arrive(e)
	if(e.wp == 17) then
		e.self:Emote("stops skipping and looks around, 'Uh oh'");
	elseif(e.wp == 43) then
		e.self:Emote("glances about, looking a bit lost. 'Well this doesn't look like a place I belong in at all'");
	elseif(e.wp == 49) then
		e.self:Say("Uh oh? this looks dangerous, I don't think I am allowed to be here.");
	elseif(e.wp == 51) then
		e.self:Emote("notices the pile of bones next to her and shudders, 'Eeep! I wonder what happened to him.");
	elseif(e.wp == 57) then
		e.self:Say("Hi, how do I get outside, huh?");
	elseif(e.wp == 58) then
		e.self:Emote("smiles at the sight of daylight, 'Ahhh yes, this is the way!'");
	elseif(e.wp == 66) then
		e.self:Emote("squints around, thinking hard, 'Hrmmm, this does look familiar. I think i came from this-a-way.'");
	elseif(e.wp == 68) then
		e.self:Say("Oh look, there it is!");
	elseif(e.wp == 80) then
		e.self:Emote("Yawns tiredly and says, 'That was fun. Time for me to go to sleep though.' She crawls under the blanket and falls sound asleep.");
	end
end

function event_say(e)
	local a = 155339;
	if(e.message:findi("hail")) then
		if(e.self:GetWaypointID() < 17) then
			e.self:Say("Hello, my name is Shainai and I am on a very important mission for my Daddy. He ran out of buttons for the officers' clothes so I have to get him more. I am an excellent helper.");
		elseif(e.self:GetWaypointID() > 16 and e.self:GetWaypointID() < 59) then
			e.self:Say("Hi. I was getting some buttons for Daddy and I got a little lost. I know the way, I mean it...but if you wanted to [follow] me home to make sure I got there safe and all, you could.");
		elseif(e.self:GetWaypointID() > 58) then
			e.self:Say("Hi there, I am headed home before I get in trouble.  I got a little lost, but I am ok now.  I hope Daddy isn't too mad.  Bye bye!");
		end
	elseif(e.message:findi("follow")) then
		if(e.self:GetWaypointID() > 16 and e.self:GetWaypointID() < 59) then
			e.self:Say("You will?!? Oh good, now I won't be so lonesome. Here hold my bag of buttons if you please, my arms are tired. Ready? Follow me now, I know the way.  'Shainai pauses and looks around, ' Hmmmm...");
			e.other:QuestReward(e.self,0,0,0,0,4460);
		end
		if(e.self:GetWaypointID() > 16 and e.self:GetWaypointID() < 21) then
			eq.unique_spawn(a,31,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.get_entity_list():GetSpawnByID(e.self:GetSpawnPointID()):SetRespawnTimer(1800);
			eq.depop_with_timer();
		elseif(e.self:GetWaypointID() > 20 and e.self:GetWaypointID() < 24) then
			eq.unique_spawn(a,32,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.get_entity_list():GetSpawnByID(e.self:GetSpawnPointID()):SetRespawnTimer(1800);
			eq.depop_with_timer();
		elseif(e.self:GetWaypointID() > 23 and e.self:GetWaypointID() < 26) then
			eq.unique_spawn(a,33,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.get_entity_list():GetSpawnByID(e.self:GetSpawnPointID()):SetRespawnTimer(1800);
			eq.depop_with_timer();
		elseif(e.self:GetWaypointID() > 25 and e.self:GetWaypointID() < 28) then
			eq.unique_spawn(a,29,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.get_entity_list():GetSpawnByID(e.self:GetSpawnPointID()):SetRespawnTimer(1800);
			eq.depop_with_timer();
		elseif(e.self:GetWaypointID() > 27 and e.self:GetWaypointID() < 32) then
			eq.unique_spawn(a,27,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.get_entity_list():GetSpawnByID(e.self:GetSpawnPointID()):SetRespawnTimer(1800);
			eq.depop_with_timer();
		elseif(e.self:GetWaypointID() > 31 and e.self:GetWaypointID() < 36) then
			eq.unique_spawn(a,34,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.get_entity_list():GetSpawnByID(e.self:GetSpawnPointID()):SetRespawnTimer(1800);
			eq.depop_with_timer();
		elseif(e.self:GetWaypointID() > 35 and e.self:GetWaypointID() < 38) then
			eq.unique_spawn(a,28,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.get_entity_list():GetSpawnByID(e.self:GetSpawnPointID()):SetRespawnTimer(1800);
			eq.depop_with_timer();
		elseif(e.self:GetWaypointID() > 37 and e.self:GetWaypointID() < 45) then
			eq.unique_spawn(a,30,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.get_entity_list():GetSpawnByID(e.self:GetSpawnPointID()):SetRespawnTimer(1800);
			eq.depop_with_timer();
		elseif(e.self:GetWaypointID() > 44 and e.self:GetWaypointID() < 48) then
			eq.unique_spawn(a,35,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.get_entity_list():GetSpawnByID(e.self:GetSpawnPointID()):SetRespawnTimer(1800);
			eq.depop_with_timer();
		elseif(e.self:GetWaypointID() > 47 and e.self:GetWaypointID() < 59) then
			eq.unique_spawn(a,36,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.get_entity_list():GetSpawnByID(e.self:GetSpawnPointID()):SetRespawnTimer(1800);
			eq.depop_with_timer();
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
