local SPAWN_IDS = { 360957, 360956, 360930, 360929 }; -- spawn IDs for: Jared_Skies, Faern_Foom, Sylar_Rites, Teneb_Gresh

local SAY_TEXT = {
	"Welcome, members of Ducee Inston.",
	"The preparations have begun. Che Virtuson has already been dispatched to a remote region outside of our home plane, as many of you may already know. Che Decuson has been given the task of safeguarding the halls while our numbers are diminished.",
	"War is upon us. We've received reports that Che Virtuson has already engaged in battle. Che Decuson has already begun to deploy members of Alto Bellumon and Alto Roburon to destination Alphite Siegrun.",
	"As you can see many fellow members of Che Decuson are no longer with us. A few groups have been asked to stay behind to learn specialized tactics of warfare.",
	"All of you here have been chosen as the elite members of Ducee Inston. The next several weeks we'll all be involved in intense training. The Guardians of Honor will safeguard the Halls. This will allow us to keep focused with the tasks at hand.",
	"The mausoleums will remain heavily guarded. They will continue to function as usual. However, no members of Che Decuson or Che Virtuson will be allowed to take the Trials of Marr. The trials will resume once everyone has returned.",
	"Our lord has asked that we all meditate before we begin our intense training. At this time please hold all questions. Please be seated and think only of our mission, of our lord, and of our fellow brethren.",
};

local n;

function SetAnimations(anim, faceMob)
	local npc;
	local elist = eq.get_entity_list();
	
	for i, id in ipairs(SPAWN_IDS) do
	
		npc = elist:GetSpawnByID(id):GetNPC();
		
		if ( npc and npc.valid and npc:GetX() == npc:GetSpawnPointX() and npc:GetY() == npc:GetSpawnPointY() ) then
		
			npc:SetAppearance(anim);
			
			if ( faceMob ) then
				--npc:FaceTarget(faceMob); -- they are supposed to face the Sergeant here, but FaceTarget() makes them stand up when they shouldn't
			end			
		end
	end
end

function event_spawn(e)
	eq.set_timer("say1", 10000);
	n = 0;
end

function event_timer(e)

	if ( e.self:IsEngaged() or e.self:GetX() ~= e.self:GetSpawnPointX() or e.self:GetY() ~= e.self:GetSpawnPointY() ) then
		return;
	end
	
	n = n + 1;

	e.self:Say(SAY_TEXT[n]);
	
	if ( n == 1 ) then
		eq.set_timer(e.timer, 24000);
		SetAnimations(0);
		
	elseif ( n == #SAY_TEXT ) then
		eq.set_timer(e.timer, 60000);
		SetAnimations(1, e.self);
		n = 0;
	end
end
