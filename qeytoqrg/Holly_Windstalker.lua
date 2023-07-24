function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met, " .. e.other:GetCleanName() .. ".  I am Holly Windstalker, Protector of the Pine.  What brings you out to the Qeynos Hills?  Not hunting, I hope. These stains on my blade are all that is left of the last adventurer I caught harming my bear and wolf friends.");
	elseif(e.message:findi("Protector.* Pine")) then
		e.self:Say("The Protectors of the Pine are a group of rangers who, along with the [Jaggedpine Treefolk], protect the wild bears and wolves of Surefall Glade and its surroundings.");
	elseif(e.message:findi("jaggedpine") or e.message:findi("treefolk")) then
		e.self:Say("The Jaggedpine Treefolk are our druid allies from Surefall Glade.  They are loyal to the ways of [Tunare], the Mother of All.  My partner Cros was one of them. He gave his life in service to the Great Mother and has since left this world to join her.");
	elseif(e.message:findi("baobob") or e.message:findi("chanda") or e.message:findi("miller")) then
		e.self:Say("Oh, don't you mention that name!  Baobob Miller and his sister Chanda have been nothing but trouble since they moved here from the Plains of Karana!  They only encourage people to poach out here in the hills where we can't see them.  Some even have the nerve to defy the will of Tunare and kill bears in Surefall Glade!");
	elseif(e.message:findi("tunare")) then
		e.self:Say("Tunare is the Mother of All.  It was she who cultivated the seed of humanity in the ancient soil of Norrath.");
	end
end
