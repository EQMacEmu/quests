function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Ironforge Jewelers. We are the finest jewelers this side of the Serpent's Spine.");
	elseif(e.message:findi("tayla")) then
		e.self:Say("Tayla is our poor, dear, sweet half-sister. She has run away to live with those closer to [her kind].");
	elseif(e.message:findi("her kind")) then
		e.self:Say("Her kind is elven. Tayla is a halfbreed. She could no longer take the torment by the human populace of Qeynos. Poor girl. I feel for her.");
	end
end
