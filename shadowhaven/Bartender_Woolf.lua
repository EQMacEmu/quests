function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Welcome to Grimthor's, how can I help you?  We have many of the local brews and some imports in stock. Take your time making a selection. If you have any questions about any of the drinks, just let me know- I can tell you about almost all of them.");
		else
			e.self:Say("Due to the problems we have had lately with dishonorable visitors to the Haven we require all newcomers to see Daloran and Mistala for some simple tasks to prove that your intentions are good. I hope to see you soon.");
		end
	elseif(e.message:findi("haven ale")) then
		e.self:Say("The Haven Ale is your standard ale- named after this very city.  Truth is, we didn't have an ale named after this city for the longest time, so I just started calling the house ale Haven Ale.");
	elseif(e.message:findi("deep cavern bourbon")) then
		e.self:Say("The Deep Cavern Bourbon is a favorite among the higher ups in the houses located here in the Haven. Most notably, the head mage guys over in the Midst, and the nobles here in Fordel.");
	elseif(e.message:findi("red")) then
		e.self:Say("The red line of brews each have their own touch of flavor. They were brewed with the recommendations of each house considered- quite nice and one of our more popular drinks.");
	elseif(e.message:findi("grimthor")) then
		e.self:Say("Ah yes... our house specials, named after the master brewer, Grimthor. Each brew contains ingredients from the farthest corners of Luclin, but Grimthor won't discuss how he comes by the stuff.");
	elseif(e.message:findi("porter")) then
		e.self:Say("Hmm...  while the porter is popular, I don't much care for it personally. I don't know, it just tastes strange to me you know?  Like how a wet Vah Shir smells.");
	elseif(e.message:findi("reserve")) then
		e.self:Say("Maybe it's the name, but it's odd how the boys over at the barracks prefer this drink over those in Midst. Could also be that it's cheap I suppose.");
	elseif(e.message:findi("house stout lager")) then
		e.self:Say("It is one of the best sellers we have here. I think the name alone is enough to make folks want to buy one.");
	end
end
