local	RWolven00 = nil;
local	RWolven01 = nil;
local	RWolven02 = nil;
local	RWolven03 = nil;
local	RArcher00 = nil;
local	RArcher01 = nil;
local	RArcher02 = nil;
local	RArcher03 = nil;
local	RArcher04 = nil;
local	RArcher05 = nil;
local	RArcher06 = nil;
local	RArcher07 = nil;
local	RPaladin00 = nil;
local	RPaladin01 = nil;
local	RPaladin02 = nil;
local	RPaladin03 = nil;
local	RPriest00 = nil;
local	RPriest01 = nil;
local	RPriest02 = nil;
local	RPriest03 = nil;
local	RChipper00 = nil;
local	RChipper01 = nil;
local	RChipper02 = nil;
local	RChipper03 = nil;
local	RDain00 = nil;
local	RDain01 = nil;
local	RDain02 = nil;
local	RDain03 = nil;

function GaradainWaypoint(e)
	if(e.wp == 1) then
		e.self:Say("Follow me closely, friend, time is of the essence. I will describe our situation as we walk.");
		ArcherWolvenSpawn(e);
	elseif(e.wp == 3) then
		e.self:Say("The Dain's own royal troops will be at our disposal for the battle. This is good news, they are hardened, experienced soldiers. The bad news is that our sources indicate that the Ry`gorr have been alerted to our presence and will be ready for an attack. This is most unfortunate... They will not go down without a fierce fight.");
		RoyalBrellSpawn(e);
		GiantOrcSpawns1(e);
	elseif(e.wp == 5) then
		e.self:Say("It is of utmost importance that you stay with me throughout the fight. Your focus must be on killing Chief Rygorr and keeping me alive, mind that you do not become distracted. If I fall the Dain's men will retreat and you'll definitely be cut down.");
		GiantOrcSpawn2(e);
	elseif(e.wp == 7) then
		e.self:Say("It is worse than I thought. Not only are they prepared for an attack, but they have the Kromrif here to help them. Our steel will be tested today. Be sure not to show the troops any fear.");
	elseif(e.wp == 9) then
		e.self:Say("TROOPS! FALL IN!");
		FirstMove(e);
		eq.spawn2(116067,23,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop();
	end
end

function Garadain2Waypoint(e)
	if(e.wp == 1) then
		e.self:Say("Listen up men!");
		FaceHeading(e);
	elseif(e.wp == 2) then
		e.self:Say("You all know why we're here. For decades these savages have menaced our people. Recent events have been too much to bear and the Dain has declared war! We will stop at nothing short of the Ry`gorr's annihilation!");
	elseif(e.wp == 3) then
		e.self:Say("No longer will we tolerate their heathen presence in our lands! Never again will we mourn the loss of a Coldain to these pawns of the Kromrif! Our deeds here today shall make this land safe for Coldain for all time!");
	elseif(e.wp == 4) then
		e.self:Say("Today the Ry`gorr fall! Tomorrow the Kromrif!");
		DoAnimation(e);
	elseif(e.wp == 5) then
		e.self:Say("Fall out men!");
		SecondMove(e);
	elseif(e.wp == 6) then
		e.self:Say("Stay back from the initial charge, my friend. We will go directly for the chief once the troops are engaged. Follow me closely!");
	elseif(e.wp == 8) then
		e.self:Shout("For the Glory of Thurgadin! CHARGE!");
		ThirdMove(e);
	elseif(e.wp == 9) then
		eq.depop_all(116042);
		SecondArcherSpawn(e);
	end
end

function GiantOrcSpawns1(e)
	eq.depop_with_timer(116165);
	eq.depop_with_timer(116006);
	eq.spawn2(116057,0,0,440,-3630,147,0); -- Firbrand the Black
	eq.spawn2(116066,0,0,420,-3630,147,0); -- Oracle of Ry'Gorr
	eq.spawn2(116056,0,0,430,-3640,147,0); -- Chief Ry'Gorr
	eq.spawn2(116054,0,0,450,-3640,155,0); -- Kromrif Commander
	eq.spawn2(116054,0,0,410,-3640,155,0); -- Kromrif Commander
	eq.spawn2(116050,0,0,275,-3476,155,0); -- Kromrif Soldier
	eq.spawn2(116050,0,0,255,-3476,155,0); -- Kromrif Soldier
	eq.spawn2(116050,0,0,275,-3496,155,0); -- Kromrif Soldier
end

function GiantOrcSpawn2(e)
	eq.spawn2(116050,0,0,595,-3476,155,0); -- Kromrif Soldier
	eq.spawn2(116050,0,0,575,-3496,155,0); -- Kromrif Soldier
	eq.spawn2(116050,0,0,595,-3496,155,0); -- Kromrif Soldier
	eq.spawn2(116050,0,0,575,-3476,155,0); -- Kromrif Soldier
	eq.spawn2(116053,0,0,515,-3496,147,0); -- Ry'Gorr Oracle
	eq.spawn2(116053,0,0,495,-3496,147,0); -- Ry'Gorr Oracle
	eq.spawn2(116053,0,0,475,-3496,147,0); -- Ry'Gorr Oracle
	eq.spawn2(116053,0,0,455,-3496,147,0); -- Ry'Gorr Oracle
	eq.spawn2(116053,0,0,395,-3496,147,0); -- Ry'Gorr Oracle
	eq.spawn2(116053,0,0,375,-3496,147,0); -- Ry'Gorr Oracle
	eq.spawn2(116053,0,0,355,-3496,147,0); -- Ry'Gorr Oracle
	eq.spawn2(116053,0,0,315,-3496,147,0); -- Ry'Gorr Oracle
	eq.spawn2(116051,0,0,315,-3476,147,0); -- Ry'Gorr Elite
	eq.spawn2(116051,0,0,355,-3476,147,0); -- Ry'Gorr Elite
	eq.spawn2(116051,0,0,375,-3476,147,0); -- Ry'Gorr Elite
	eq.spawn2(116051,0,0,395,-3476,147,0); -- Ry'Gorr Elite
	eq.spawn2(116051,0,0,455,-3476,147,0); -- Ry'Gorr Elite
	eq.spawn2(116051,0,0,475,-3476,147,0); -- Ry'Gorr Elite
	eq.spawn2(116051,0,0,495,-3476,147,0); -- Ry'Gorr Elite
	eq.spawn2(116051,0,0,515,-3476,147,0); -- Ry'Gorr Elite
	eq.spawn2(116051,0,0,535,-3476,147,0); -- Ry'Gorr Elite
end

function ArcherWolvenSpawn(e)
	RArcher00 = eq.spawn2(116042,0,0,776,-2953,188,0); -- Royal Archer00
	RArcher01 = eq.spawn2(116042,0,0,876,-2711,191,0); -- Royal Archer01
	RArcher02 = eq.spawn2(116042,0,0,497,-2905,163,0); -- Royal Archer02
	RArcher03 = eq.spawn2(116042,0,0,1305,-2775,172,0); -- Royal Archer03
	RArcher04 = eq.spawn2(116042,0,0,1180,-3069,226,0); -- Royal Archer04
	RArcher05 = eq.spawn2(116042,0,0,875,-2687,187,0); -- Royal Archer05
	RArcher06 = eq.spawn2(116042,0,0,539,-2861,157,0); -- Royal Archer06
	RArcher07 = eq.spawn2(116042,0,0,1287,-2753,170,0); -- Royal Archer07
	RWolven00 = eq.spawn2(116043,0,0,1157,-3009,222,0); -- Royal Wolven Guard00
	RWolven01 = eq.spawn2(116043,0,0,793,-2947,188,0); -- Royal Wolven Guard01
	RWolven02 = eq.spawn2(116043,0,0,887,-2730,195,0); -- Royal Wolven Guard03
	RWolven03 = eq.spawn2(116043,0,0,887,-2730,195,0); -- Royal Wolven Guard04
end

function RoyalBrellSpawn(e)
	RDain00 = eq.spawn2(116045,0,0,844,-2727,190,0); -- Royal Guard of the Dain00
	RDain01 = eq.spawn2(116045,0,0,762,-2915,182,0); -- Royal Guard of the Dain01
	RDain02 = eq.spawn2(116045,0,0,524,-2895,161,0); -- Royal Guard of the Dain02
	RDain03 = eq.spawn2(116045,0,0,1287,-2795,177,0); -- Royal Guard of the Dain03
	RChipper00 = eq.spawn2(116046,0,0,848,-2699,187,0); -- Coldain_Icechipper00
	RChipper01 = eq.spawn2(116046,0,0,1199,-3089,227,0); -- Coldain_Icechipper01
	RChipper02 = eq.spawn2(116046,0,0,1197,-2974,223,0); -- Coldain_Icechipper02
	RChipper03 = eq.spawn2(116046,0,0,758,-2940,183,0); -- Coldain_Icechipper03
	RPriest00 = eq.spawn2(116047,0,0,520,-2870,158,0); -- Priest_of_Brell00
	RPriest01 = eq.spawn2(116047,0,0,780,-2927,186,0); -- Priest_of_Brell01
	RPriest02 = eq.spawn2(116047,0,0,1173,-2986,222,0); -- Priest_of_Brell02
	RPriest03 = eq.spawn2(116047,0,0,495,-2872,158,0); -- Priest_of_Brell03
	RPaladin00 = eq.spawn2(116049,0,0,1333,-2783,172,0); -- Paladin_of_Brell00
	RPaladin01 = eq.spawn2(116049,0,0,1330,-2755,167,0); -- Paladin_of_Brell01
	RPaladin02 = eq.spawn2(116049,0,0,1214,-3074,227,0); -- Paladin_of_Brell02
	RPaladin03 = eq.spawn2(116049,0,0,1178,-2965,222,0); -- Paladin_of_Brell03
end

function FirstMove(e)
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RWolven00:GetID())) then
		RWolven00:CastToNPC():MoveTo(695,-2440,162,0,true); --
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RWolven01:GetID())) then
		RWolven01:CastToNPC():MoveTo(710,-2440,163,0,true); --
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RWolven02:GetID())) then
		RWolven02:CastToNPC():MoveTo(725,-2440,164,0,true); --
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RWolven03:GetID())) then
		RWolven03:CastToNPC():MoveTo(740,-2440,165,0,true); --
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher00:GetID())) then
		RArcher00:CastToNPC():MoveTo(695,-2455,162,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher01:GetID())) then
		RArcher01:CastToNPC():MoveTo(710,-2455,163,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher02:GetID())) then
		RArcher02:CastToNPC():MoveTo(725,-2455,164,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher03:GetID())) then
		RArcher03:CastToNPC():MoveTo(740,-2455,165,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher04:GetID())) then
		RArcher04:CastToNPC():MoveTo(695,-2470,162,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher05:GetID())) then
		RArcher05:CastToNPC():MoveTo(725,-2470,164,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher06:GetID())) then
		RArcher06:CastToNPC():MoveTo(740,-2470,165,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher07:GetID())) then
		RArcher07:CastToNPC():MoveTo(710,-2470,163,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPaladin00:GetID())) then
		RPaladin00:CastToNPC():MoveTo(740,-2485,165,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPaladin01:GetID())) then
		RPaladin01:CastToNPC():MoveTo(725,-2485,164,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPaladin02:GetID())) then
		RPaladin02:CastToNPC():MoveTo(695,-2485,162,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPaladin03:GetID())) then
		RPaladin03:CastToNPC():MoveTo(710,-2485,163,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPriest00:GetID())) then
		RPriest00:CastToNPC():MoveTo(695,-2500,162,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPriest01:GetID())) then
		RPriest01:CastToNPC():MoveTo(710,-2500,163,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPriest02:GetID())) then
		RPriest02:CastToNPC():MoveTo(725,-2500,164,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPriest03:GetID())) then
		RPriest03:CastToNPC():MoveTo(740,-2500,165,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RChipper00:GetID())) then
		RChipper00:CastToNPC():MoveTo(695,-2515,162,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RChipper01:GetID())) then
		RChipper01:CastToNPC():MoveTo(710,-2515,163,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RChipper02:GetID())) then
		RChipper02:CastToNPC():MoveTo(725,-2515,164,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RChipper03:GetID())) then
		RChipper03:CastToNPC():MoveTo(740,-2515,165,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RDain00:GetID())) then
		RDain00:CastToNPC():MoveTo(710,-2530,163,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RDain01:GetID())) then
		RDain01:CastToNPC():MoveTo(740,-2530,165,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RDain02:GetID())) then
		RDain02:CastToNPC():MoveTo(725,-2530,164,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RDain03:GetID())) then
		RDain03:CastToNPC():MoveTo(695,-2530,162,0,true);
	end
end

function SecondMove(e)
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RWolven00:GetID())) then
		RWolven00:CastToNPC():MoveTo(305,-3140,189,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RWolven01:GetID())) then
		RWolven01:CastToNPC():MoveTo(325,-3140,189,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RWolven02:GetID())) then
		RWolven02:CastToNPC():MoveTo(525,-3140,194,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RWolven03:GetID())) then
		RWolven03:CastToNPC():MoveTo(545,-3140,196,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher00:GetID())) then
		RArcher00:CastToNPC():MoveTo(315,-3160,185,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher01:GetID())) then
		RArcher01:CastToNPC():MoveTo(335,-3160,185,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher02:GetID())) then
		RArcher02:CastToNPC():MoveTo(355,-3160,185,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher03:GetID())) then
		RArcher03:CastToNPC():MoveTo(375,-3160,185,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher04:GetID())) then
		RArcher04:CastToNPC():MoveTo(475,-3160,188,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher05:GetID())) then
		RArcher05:CastToNPC():MoveTo(515,-3160,190,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher06:GetID())) then
		RArcher06:CastToNPC():MoveTo(535,-3160,192,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher07:GetID())) then
		RArcher07:CastToNPC():MoveTo(495,-3160,188,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPaladin00:GetID())) then
		RPaladin00:CastToNPC():MoveTo(505,-3140,193,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPaladin01:GetID())) then
		RPaladin01:CastToNPC():MoveTo(345,-3140,190,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPaladin02:GetID())) then
		RPaladin02:CastToNPC():MoveTo(325,-3125,190,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPaladin03:GetID())) then
		RPaladin03:CastToNPC():MoveTo(545,-3125,194,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPriest00:GetID())) then
		RPriest00:CastToNPC():MoveTo(305,-3125,162,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPriest01:GetID())) then
		RPriest01:CastToNPC():MoveTo(365,-3125,189,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPriest02:GetID())) then
		RPriest02:CastToNPC():MoveTo(485,-3125,190,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPriest03:GetID())) then
		RPriest03:CastToNPC():MoveTo(525,-3125,192,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RChipper00:GetID())) then
		RChipper00:CastToNPC():MoveTo(345,-3125,189,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RChipper01:GetID())) then
		RChipper01:CastToNPC():MoveTo(465,-3125,189,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RChipper02:GetID())) then
		RChipper02:CastToNPC():MoveTo(465,-3125,189,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RChipper03:GetID())) then
		RChipper03:CastToNPC():MoveTo(505,-3125,191,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RDain00:GetID())) then
		RDain00:CastToNPC():MoveTo(385,-3140,189,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RDain01:GetID())) then
		RDain01:CastToNPC():MoveTo(485,-3140,192,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RDain02:GetID())) then
		RDain02:CastToNPC():MoveTo(465,-3140,191,128,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RDain03:GetID())) then
		RDain03:CastToNPC():MoveTo(365,-3140,189,128,true);
	end
end

function ThirdMove(e)
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher00:GetID())) then
		RArcher00:CastToNPC():MoveTo(315,-3400,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher01:GetID())) then
		RArcher01:CastToNPC():MoveTo(315,-3400,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher02:GetID())) then
		RArcher02:CastToNPC():MoveTo(355,-3400,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher03:GetID())) then
		RArcher03:CastToNPC():MoveTo(375,-3400,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher04:GetID())) then
		RArcher04:CastToNPC():MoveTo(475,-3400,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher05:GetID())) then
		RArcher05:CastToNPC():MoveTo(515,-3400,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher06:GetID())) then
		RArcher06:CastToNPC():MoveTo(535,-3400,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher07:GetID())) then
		RArcher07:CastToNPC():MoveTo(495,-3400,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPaladin00:GetID())) then
		RPaladin00:CastToNPC():MoveTo(505,-3465,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPaladin01:GetID())) then
		RPaladin01:CastToNPC():MoveTo(345,-3465,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPriest01:GetID())) then
		RPriest01:CastToNPC():MoveTo(365,-3465,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPriest02:GetID())) then
		RPriest02:CastToNPC():MoveTo(485,-3465,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RChipper00:GetID())) then
		RChipper00:CastToNPC():MoveTo(345,-3465,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RChipper01:GetID())) then
		RChipper01:CastToNPC():MoveTo(465,-3465,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RChipper02:GetID())) then
		RChipper02:CastToNPC():MoveTo(465,-3465,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RChipper03:GetID())) then
		RChipper03:CastToNPC():MoveTo(505,-3465,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RDain00:GetID())) then
		RDain00:CastToNPC():MoveTo(385,-3465,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RDain01:GetID())) then
		RDain01:CastToNPC():MoveTo(485,-3465,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RDain02:GetID())) then
		RDain02:CastToNPC():MoveTo(465,-3465,145,0,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RDain03:GetID())) then
		RDain03:CastToNPC():MoveTo(365,-3465,145,0,true);
	end
end

function SecondArcherSpawn(e)
	eq.spawn2(116068,0,0,315,-3400,145,128); -- Royal Archer00
	eq.spawn2(116068,0,0,335,-3400,145,128); -- Royal Archer01
	eq.spawn2(116068,0,0,355,-3400,145,128); -- Royal Archer02
	eq.spawn2(116068,0,0,375,-3400,145,128); -- Royal Archer03
	eq.spawn2(116068,0,0,495,-3400,146,128); -- Royal Archer04
	eq.spawn2(116068,0,0,515,-3400,146,128); -- Royal Archer05
	eq.spawn2(116068,0,0,535,-3400,146,128); -- Royal Archer06
end

function FaceHeading(e)
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher00:GetID())) then
		RArcher00:CastToNPC():MoveTo(695,-2456,162,155,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher01:GetID())) then
		RArcher01:CastToNPC():MoveTo(710,-2456,163,164,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher02:GetID())) then
		RArcher02:CastToNPC():MoveTo(725,-2456,164,172,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher03:GetID())) then
		RArcher03:CastToNPC():MoveTo(740,-2456,165,175,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher04:GetID())) then
		RArcher04:CastToNPC():MoveTo(695,-2471,162,168,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher05:GetID())) then
		RArcher05:CastToNPC():MoveTo(725,-2471,164,181,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher06:GetID())) then
		RArcher06:CastToNPC():MoveTo(740,-2471,165,182,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RArcher07:GetID())) then
		RArcher07:CastToNPC():MoveTo(710,-2471,163,176,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPaladin00:GetID())) then
		RPaladin00:CastToNPC():MoveTo(740,-2484,165,192,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPaladin01:GetID())) then
		RPaladin01:CastToNPC():MoveTo(725,-2484,164,192,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPaladin02:GetID())) then
		RPaladin02:CastToNPC():MoveTo(695,-2484,162,192,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPaladin03:GetID())) then
		RPaladin03:CastToNPC():MoveTo(710,-2484,163,192,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPriest00:GetID())) then
		RPriest00:CastToNPC():MoveTo(695,-2501,162,212,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPriest01:GetID())) then
		RPriest01:CastToNPC():MoveTo(710,-2501,163,206,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPriest02:GetID())) then
		RPriest02:CastToNPC():MoveTo(725,-2501,164,202,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RPriest03:GetID())) then
		RPriest03:CastToNPC():MoveTo(740,-2501,165,199,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RChipper00:GetID())) then
		RChipper00:CastToNPC():MoveTo(695,-2516,162,227,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RChipper01:GetID())) then
		RChipper01:CastToNPC():MoveTo(710,-2516,163,217,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RChipper02:GetID())) then
		RChipper02:CastToNPC():MoveTo(725,-2516,164,211,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RChipper03:GetID())) then
		RChipper03:CastToNPC():MoveTo(740,-2516,165,208,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RDain00:GetID())) then
		RDain00:CastToNPC():MoveTo(710,-2531,163,225,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RDain01:GetID())) then
		RDain01:CastToNPC():MoveTo(740,-2531,165,215,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RDain02:GetID())) then
		RDain02:CastToNPC():MoveTo(725,-2531,164,218,true);
	end
	if(eq.get_entity_list():IsMobSpawnedByEntityID(RDain03:GetID())) then
		RDain03:CastToNPC():MoveTo(695,-2531,162,235,true);
	end
end

function DoAnimation(e)
	local Coldain_List = Set {116042,116049,116047,116046,116045}; -- Archer, Paladin, Priest, Chipper, Guard
	local npc_list = eq.get_entity_list():GetNPCList();
	
	if (npc_list ~= nil) then
		for npc in npc_list.entries do
			if (Coldain_List[npc:GetNPCTypeID()] ~= nil) then
				-- npc.valid will be true if the NPC is actually spawned
				if (npc.valid) then
					npc:CastToNPC():DoAnim(27);
				end
			end
		end
	end
end

-- Set function example from Programming In Lua
-- http://www.lua.org/pil/11.5.html
function Set (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

function RWolvenSpawn(e)
	e.self:SetRunning(true);
	eq.set_timer("depop",1200000);
end

function RArcherSpawn(e)
	e.self:SetRunning(true);
	eq.set_timer("depop",1200000);
end

function RPaladinSpawn(e)
	e.self:SetRunning(true);
	eq.set_timer("depop",1200000);
end

function RPriestSpawn(e)
	e.self:SetRunning(true);
	eq.set_timer("depop",1200000);
end

function RChipperSpawn(e)
	e.self:SetRunning(true);
	eq.set_timer("depop",1200000);
end

function RDainSpawn(e)
	e.self:SetRunning(true);
	eq.set_timer("depop",1200000);
end

function RArcher2Spawn(e)
	eq.set_timer("depop",900000);
end

function ChiefSpawn(e)
	eq.set_timer("depop",1200000);
end

function CommanderSpawn(e)
	eq.set_timer("depop",1200000);
end

function OracleSpawn(e)
	eq.set_timer("depop",1200000);
end

function FirbrandSpawn(e)
	eq.set_timer("depop",1200000);
end

function SoldierSpawn(e)
	eq.set_timer("depop",1200000);
end

function RyOracSpawn(e)
	eq.set_timer("depop",1200000);
end

function EliteSpawn(e)
	eq.set_timer("depop",1200000);
end

function RWolvenTimer(e)
	eq.depop();
end

function RArcherTimer(e)
	eq.depop();
end

function RPaladinTimer(e)
	eq.depop();
end

function RPriestTimer(e)
	eq.depop();
end

function RChipperTimer(e)
	eq.depop();
end

function RDainTimer(e)
	eq.depop();
end

function RArcher2Timer(e)
	eq.depop();
end

function ChiefTimer(e)
	eq.depop();
end

function CommanderTimer(e)
	eq.depop();
end

function OracleTimer(e)
	eq.depop();
end

function FirbrandTimer(e)
	eq.depop();
end

function SoldierTimer(e)
	eq.depop();
end

function RyOracTimer(e)
	eq.depop();
end

function EliteTimer(e)
	eq.depop();
end

function RWolvenCombat(e)
	combat(e);
end

function RArcherCombat(e)
	combat(e);
end

function RPaladinCombat(e)
	combat(e);
end

function RPriestCombat(e)
	combat(e);
end

function RChipperCombat(e)
	combat(e);
end

function RDainCombat(e)
	combat(e);
end

function RArcher2Combat(e)
	combat(e);
end

function ChiefCombat(e)
	combat(e);
end

function CommanderCombat(e)
	combat(e);
end

function OracleCombat(e)
	combat(e);
end

function FirbrandCombat(e)
	combat(e);
end

function SoldierCombat(e)
	combat(e);
end

function RyOracCombat(e)
	combat(e);
end

function EliteCombat(e)
	combat(e);
end

function combat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)
	eq.register_npc_event("ringeight", Event.waypoint_arrive, 116064, GaradainWaypoint);
	eq.register_npc_event("ringeight", Event.waypoint_arrive, 116067, Garadain2Waypoint);
	eq.register_npc_event("ringeight", Event.spawn, 116043, RWolvenSpawn);
	eq.register_npc_event("ringeight", Event.spawn, 116042, RArcherSpawn);
	eq.register_npc_event("ringeight", Event.spawn, 116049, RPaladinSpawn);
	eq.register_npc_event("ringeight", Event.spawn, 116047, RPriestSpawn);
	eq.register_npc_event("ringeight", Event.spawn, 116046, RChipperSpawn);
	eq.register_npc_event("ringeight", Event.spawn, 116045, RDainSpawn);
	eq.register_npc_event("ringeight", Event.spawn, 116068, RArcher2Spawn);
	eq.register_npc_event("ringeight", Event.spawn, 116056, ChiefSpawn);
	eq.register_npc_event("ringeight", Event.spawn, 116054, CommanderSpawn);
	eq.register_npc_event("ringeight", Event.spawn, 116066, OracleSpawn);
	eq.register_npc_event("ringeight", Event.spawn, 116057, FirbrandSpawn);
	eq.register_npc_event("ringeight", Event.spawn, 116050, SoldierSpawn);
	eq.register_npc_event("ringeight", Event.spawn, 116053, RyOracSpawn);
	eq.register_npc_event("ringeight", Event.spawn, 116051, EliteSpawn);
	eq.register_npc_event("ringeight", Event.timer, 116043, RWolvenTimer);
	eq.register_npc_event("ringeight", Event.timer, 116042, RArcherTimer);
	eq.register_npc_event("ringeight", Event.timer, 116049, RPaladinTimer);
	eq.register_npc_event("ringeight", Event.timer, 116047, RPriestTimer);
	eq.register_npc_event("ringeight", Event.timer, 116046, RChipperTimer);
	eq.register_npc_event("ringeight", Event.timer, 116045, RDainTimer);
	eq.register_npc_event("ringeight", Event.timer, 116068, RArcher2Timer);
	eq.register_npc_event("ringeight", Event.timer, 116056, ChiefTimer);
	eq.register_npc_event("ringeight", Event.timer, 116054, CommanderTimer);
	eq.register_npc_event("ringeight", Event.timer, 116066, OracleTimer);
	eq.register_npc_event("ringeight", Event.timer, 116057, FirbrandTimer);
	eq.register_npc_event("ringeight", Event.timer, 116050, SoldierTimer);
	eq.register_npc_event("ringeight", Event.timer, 116053, RyOracTimer);
	eq.register_npc_event("ringeight", Event.timer, 116051, EliteTimer);
	eq.register_npc_event("ringeight", Event.combat, 116043, RWolvenCombat);
	eq.register_npc_event("ringeight", Event.combat, 116042, RArcherCombat);
	eq.register_npc_event("ringeight", Event.combat, 116049, RPaladinCombat);
	eq.register_npc_event("ringeight", Event.combat, 116047, RPriestCombat);
	eq.register_npc_event("ringeight", Event.combat, 116046, RChipperCombat);
	eq.register_npc_event("ringeight", Event.combat, 116045, RDainCombat);
	eq.register_npc_event("ringeight", Event.combat, 116068, RArcher2Combat);
	eq.register_npc_event("ringeight", Event.combat, 116056, ChiefCombat);
	eq.register_npc_event("ringeight", Event.combat, 116054, CommanderCombat);
	eq.register_npc_event("ringeight", Event.combat, 116066, OracleCombat);
	eq.register_npc_event("ringeight", Event.combat, 116057, FirbrandCombat);
	eq.register_npc_event("ringeight", Event.combat, 116050, SoldierCombat);
	eq.register_npc_event("ringeight", Event.combat, 116053, RyOracCombat);
	eq.register_npc_event("ringeight", Event.combat, 116051, EliteCombat);
end
