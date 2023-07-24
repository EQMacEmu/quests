function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. ". Welcome my friend! Please sit and rest yourself. There are many [predators] around. I suggest you rest a bit before continuing your journey.");
	elseif(e.message:findi("predator")) then
		e.self:Say("Just take a look around and see what's around you. There's [galorians], [lightcrawlers], [zelniaks], and [rockhoppers] everywhere. They usually let us be, but I've seen 'em kill. It's not something you want to see.");
	elseif(e.message:findi("galorian")) then
		e.self:Say("It's been a while since I've seen the Tribal Council, but they have been known to show up unexpectedly. I'm sure if you find Glenda Melonfus, she'll be able to tell you more about them.");
	elseif(e.message:findi("lightcrawler")) then
		e.self:Say("Lightcrawlers are the biggest bugs I've ever seen. I've heard of bigger, but I've never seen 'em myself. If you're interested in getting some [armor] made out of their shells let me know and I'll see if we can work something out.");
	elseif(e.message:findi("zelniak")) then
		e.self:Say("Zelniaks don't tend to mess with the likes of others, unless provoked.");
	elseif(e.message:findi("rockhopper")) then
		e.self:Say("Rockhoppers took over the cave system near Maiden's Eye. They are a crazy bunch of lizards. I suggest stay out of their way. The galorians are even scared of them and they're not scared of much.");
	elseif(e.message:findi("armor")) then
		e.self:Say("My cousin can make you some armor, but it'll cost ya. What exactly are you looking for? You looking for a [breastplate], [greaves], [helm], [bracers], [arms]? You tell me and I'll see what I can do. The only problem is I only have enough material to make a small set. So you might not be able to fit in 'em.");
	elseif(e.message:findi("breastplate")) then
		e.self:Say("Faber Rugon can make a fine breastplate for you, but it'll require two Pristine Lightcrawler Shells.");
	elseif(e.message:findi("greave")) then
		e.self:Say("Give Faber Rugon back two sets of Lightcrawler Legs and two Shimmering Lightcrawler Shells.");
	elseif(e.message:findi("helm")) then
		e.self:Say("Interested in a new helm, eh? All right. Bring Faber Rugon two Ardent Lightcrawler Shells and he'll be able to help you out.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("Faber Rugon can only make one bracer for you, but one will be enough. Bring him back two Stripped Lightcrawler Shells and you'll be set.");
	elseif(e.message:findi("arm")) then
		e.self:Say("All right. Bring my cousin, Faber Rugon, back two Spotted Lightcrawler Shell and he'll be able fashion up a fine pair of arms for you.");
	end
end
