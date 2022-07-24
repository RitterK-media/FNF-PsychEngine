function onCreate()
	-- background shit
	makeLuaSprite('parkback', 'parkback', -200, 0);
	setLuaSpriteScrollFactor('parkback', 0.7, 0.7);
	scaleObject('parkback', 0.7, 0.7);
	
	makeLuaSprite('parkfront', 'parkfront', -650, 600);
	setLuaSpriteScrollFactor('parkfront', 0.9, 0.9);
	scaleObject('parkfront', 1.1, 1.1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then


		makeLuaSprite('parktree', 'parktree', -500, -300);
		setLuaSpriteScrollFactor('parktree', 1.3, 1.3);
		scaleObject('parktree', 1, 1);
	end

	addLuaSprite('parkback', false);
	addLuaSprite('parkfront', false);

	addLuaSprite('parktree', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end