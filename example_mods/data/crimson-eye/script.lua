function onCreate()
    makeAnimatedLuaSprite('HerobreenBG', 'BG/HerobreenBG', 200, 300); -- Change to characters idle in XML
	addAnimationByPrefix('HerobreenBG', 'Idle', 'hero Idle', 24, false); -- Change to characters idle in XML	
	objectPlayAnimation('HerobreenBG', 'Idle'); 
	addLuaSprite('HerobreenBG', false);
end
local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', '');
	end
end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0 then
		objectPlayAnimation('HerobreenBG', 'Idle');
	end
end

function onUpdate(elapsed)
    if curStep >= 735 and curStep < 990 then
        
		setProperty('defaultCamZoom',1);
	end
	
	if curStep > 990 then
	     setProperty('defaultCamZoom',0.9);
    end
end	

