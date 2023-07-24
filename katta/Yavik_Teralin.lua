function event_spawn(e)
	eq.set_timer("tree", 1800000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings friend! Pull up a stool and order some of the finest ale in all of Luclin. If it's a [tale or two] you're lookin to hear as well I would suggest staying away from those two fools Arbogast and Miller. They're full of more hot air than a red dragon!");
	elseif(e.message:findi("tale or two")) then
		e.self:Say("I could tell you some interesting stories. I spent many years serving as a scout in the Validus Custodus. I've seen places and things that'll cause you to loose sleep for many days. One of the most facinating things I've seen however was while I was out on patrol near the [Acrylia Caverns].");
	elseif(e.message:findi("acrylia caverns")) then
		e.self:Say("The Acrylia Caverns are teeming with grimlings that tend to be a bit more evolved than your run of the mill dirtballs you find living in villages elsewhere on luclin. I was with a small patrol of scouts watching for any indication of the Acrylia Caverns Grimlings sending aid to the grimlings in Tenebrous Mountains during one of the Validus Custodus campains to rid the tenebrous mines of the little buggers. What we [discovered] was something quite different.");
	elseif(e.message:findi("discovered")) then
		e.self:Say("We spotted a small group of grimlings leaving the caverns hauling a cart full of acrylia ore. The strange thing was. this acrylia was darker than normal and instead of the normal golden hued veins it was covered with veins blacker than any darkness I've ever seen. I shadowed these grimlings to a grimling village some distance from the caverns where they exchanged some of this [black acrylia] with others of their kind.");
	elseif(e.message:findi("black acrylia")) then
		e.self:Say("Seems the grimlings use this rare acrylia ore to craft fierce weapons that not only cut or bash but strangle the spirits of those they harm. I observed some of their [method for crafting] the black acrylia but not being knowledgeable of the smithing arts myself and the distance at which I had to observe made the details a bit obscure.");
	elseif(e.message:findi("method for crafting")) then
		e.self:Say("I explained my observations to one of our master smiths here in Katta Castellum and he has since successfully worked the ore. The difficulty of obtaining the [necessary supplies] for crafting the black acrylia however prevents the Validus Custodus and Magus Conlegium from doing extensive research of the strange ore.");
	elseif(e.message:findi("necessary supplies")) then
		e.self:Say("We have discovered that the grimlings use a special Black Acrylia Temper when crafting sheets of black acrylia and then again when crafting those sheets into weapons with the appropriate weapon molds. I saw this substance during my observations and after many attempts we seem to have discovered its [ingredients].");
	elseif(e.message:findi("ingredients")) then
		e.self:Say("We believe the grimlings brew a mixture of Essence of Darkness. Akheva Blood. and Distilled Mana to create the temper. We have attempted this formulae and it does indeed seem to enhance the innate magical powers of the black acrylia ore. allowing it to be crafted into weapons of terrible devastation. Be careful what you do with this knowledge friend. I would hate for the Inquisition to find the means of equipping their legions with weapons the likes of which I have described."); 
	end
end

function event_timer(e)
	if(e.timer == "tree") then
		e.self:Say("You ever communed with a tree?  Most people just walk right past them and don't take the time to stop and really appreciate what that tree means.");
		eq.set_timer("Danika", 150000);
	elseif(e.timer == "Danika") then
		eq.stop_timer("Danika");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(160225)) then
			eq.get_entity_list():GetMobByNpcTypeID(160225):Say("I think you should take it easy with that ale there, Yavik.");
		end
	end
end
