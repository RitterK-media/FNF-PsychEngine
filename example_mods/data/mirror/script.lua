function onCreate()
    makeAnimatedLuaSprite('HerobrineBG', 'BG/HerobrineBG', 200, 300); -- Change to characters idle in XML
	addAnimationByPrefix('HerobrineBG', 'Idle', 'hero Idle', 24, false); -- Change to characters idle in XML	
	objectPlayAnimation('HerobrineBG', 'Idle'); 
	addLuaSprite('HerobrineBG', false);
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
		objectPlayAnimation('HerobrineBG', 'Idle');
	end
end
-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end