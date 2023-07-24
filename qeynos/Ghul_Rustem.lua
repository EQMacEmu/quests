function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("'Yes?  What?' Ghul fingers the hilt of the dagger that sits in his belt. 'I'm a very busy man. I have [thoughts] upon my mind.'");
	elseif(e.message:findi("thoughts")) then
		e.self:Say("'Fools, all of them.'  Ghul snarls and spits upon the floor.  'I used to be a master smith, long before cursed Ironforge became Antonius Bayle's favorite.  Well, I'll show them.  My new master has given me much [work] to do.'")		
	elseif(e.message:findi("work")) then
		e.self:Say("Nothing to concern you, little one. You'll see. When the day for war comes, my [armor] will be upon every man, mark my words.")
	elseif(e.message:findi("armor")) then
		e.self:Say("You are no doubt familiar with the traditional Qeynos... paper armor that everyone flaunts as if it were real steel. Real armor is made with a special [method], not that these fools would appreciate such things.")
	elseif(e.message:findi("method")) then
		e.self:Say("'You are a craftsman?  Interesting, my master may have use for you in the times to come.'  Ghul's eyes twinkle, his mouth twisted into an unsettling half-smile. 'Enchanted chain jointing, royal temper, a plate mold, leather padding and [infused rings] are used. It is in the rings that the real power lies. One can also mark the armor by [imbuing], as you will have guessed no doubt.'")											
	elseif(e.message:findi("infused rings")) then
		e.self:Say("Take velium rings - they are strong. Then, using a hammer, double their strength with an enchanted large brick of high quality ore. Of course, for this fusing to take place, you will require a... [special something].")
	elseif(e.message:findi("imbuing")) then
		e.self:Say("Ignorant cretin! Imbuing is the process of marking an armor touched by the Heavens, by inclusion of the appropriate blessed gem! I can even imbue with the mark of the [Dragonqueen]!")		
	elseif(e.message:findi("special something")) then
		e.self:Say("Hah! The secret of the master shall not be passed along to the likes of you, trustless one! You would turn tail and scurry off to Antonius with such information! Celestial Temper is not for the...' Ghul sneers, '...normal.'")
	elseif(e.message:findi("Dragonqueen")) then
		e.self:Say("She that rended the lands and split the sky! Veeshan herself! From the lands of her kin it is said that one can still find small crystals of her kind. Take four of these, one of each variety, and combine them within a kiln in order to produce Veeshan's imbued gem.")													
	elseif(e.message:findi("kane"))then
		e.self:Say("Commander Kane Bayle is the commander of all the Qeynos Guard.  He is second only to his brother, Antonius Bayle.  His post is in the guard house at the city gates.  Mind you, do not bother him, he has a bit of a temper.");
	elseif(e.message:findi("circle.* unseen hand"))then
		e.self:Say("The Circle of the Unseen Hand?  I have heard nothing of them.  Are they some sort of performing magic troupe?");
	end
end