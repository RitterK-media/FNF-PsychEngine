function onCreate()
	-- background shit
	makeLuaSprite('shrinesky', 'shrinesky', -500, -400);
	setLuaSpriteScrollFactor('shrinesky', 0.6, 0.6);
	
	makeLuaSprite('shrine-mt', 'shrine-mt', -500, -100);
	setLuaSpriteScrollFactor('shrine-mt', 0.4, 0.4);
	scaleObject('shrine-mt', 0.9, 0.9);
	
	makeLuaSprite('shrineback', 'shrineback', -500, -650);
	setLuaSpriteScrollFactor('shrineback', 0.9, 0.9);
	
	
	makeLuaSprite('shrinefront', 'shrinefront', -650, 700);
	setLuaSpriteScrollFactor('shrinefront', 1, 1);
	scaleObject('shrinefront', 1.1, 1.1);


	-- sprites that only load if Low Quality is turned off
	if not lowQuality then


		makeLuaSprite('shrinegate-r', 'shrinegate-r', -1100, -900);
		setLuaSpriteScrollFactor('shrinegate-r', 1.3, 1.3);
		scaleObject('shrinegate-r', 1.5, 1.5);
	end

    addLuaSprite('shrinesky', false);
	addLuaSprite('shrine-mt', false);
	addLuaSprite('shrineback', false);
	addLuaSprite('shrinefront', false);


	addLuaSprite('shrinegate-r', true);
	

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end