-- second part of the arch lich rhag`zadune cycle

function event_death_complete(e)
	eq.delete_global("Rhag");
	eq.set_global("Lich","1",7,"F");
	eq.unique_spawn(162030, 0, 0, 420, -144, 270.1, 0); -- Arch_Lich_Rhag`Zadune
	eq.unique_spawn(162498, 0, 0, 449, -163, 268, 224); -- Rhag`Reshkazh
	eq.unique_spawn(162495, 0, 0, 377, -71, 261, 64); -- Rath`Zihold
	eq.unique_spawn(162496, 0, 0, 465, -71, 261, 192); -- Rath`Giloth
	eq.unique_spawn(162497, 0, 0, 389, -163, 268, 32); -- Rhag`Vezozh
end
