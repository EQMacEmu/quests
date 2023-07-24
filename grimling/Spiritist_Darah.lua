function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ", welcome to the war zone. I probably don't have to mention that these are dangerous times here. I pray to the spirits that they might reveal to me the path to victory over our enemy. Recently, I have begun to feel that the answer to my pleas will present itself in the near future.");
	elseif(e.message:findi("answer")) then
		e.self:Say("I have been blessed with a recurring vision lately, one in which a hero will overcome our enemy. He then discovers the answer to a question that has plagued our people for a generation.");
	elseif(e.message:findi("question")) then
		e.self:Say("The vision gets very cloudy and I have yet to interpret that portion of it. I hesitate to speculate as there are many questions that remain unanswered since our displacement to this world.");
	end
end
