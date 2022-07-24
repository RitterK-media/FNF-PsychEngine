function onCreate()
	-- background shit
	makeLuaSprite('roadsky', 'roadsky', -450, -200);
	setLuaSpriteScrollFactor('roadsky', 0.4, 0.4);
	scaleObject('roadsky',0.8, 0.8);
	
	makeLuaSprite('road-park', 'road-park', -450, -350);
	setLuaSpriteScrollFactor('road-park', 0.6, 0.6);
	scaleObject('road-park',0.9, 0.9);
	
	makeLuaSprite('roadback', 'roadback', -500, -100);
	setLuaSpriteScrollFactor('roadback', 0.8, 0.8);
	scaleObject('roadback', 1, 1);
	
	makeLuaSprite('roadmiddle', 'roadmiddle', -500, -120);
	setLuaSpriteScrollFactor('roadmiddle', 0.8, 0.8);
	
	makeLuaSprite('roadfront', 'roadfront', -300,50);
	setLuaSpriteScrollFactor('roadfront', 1, 1);
	scaleObject('roadfront', 0.8, 0.8);
	
	makeLuaSprite('streetlight','streetlight',0, 0)
    setScrollFactor('streetlight', 0.8, 0.8);
	scaleObject('streetlight', 0.35, 0.35);
	
	makeLuaSprite('streetlight2','streetlight',500, 0)
    setScrollFactor('streetlight2', 0.8, 0.8);
	scaleObject('streetlight2', 0.35, 0.35);
	
	makeLuaSprite('streetlight3','streetlight',1000, 0)
    setScrollFactor('streetlight3', 0.8, 0.8);
	scaleObject('streetlight3', 0.35, 0.35);
	
	makeLuaSprite('streetlight4','streetlight',1500, 0)
    setScrollFactor('streetlight4', 0.8, 0.8);
	scaleObject('streetlight4', 0.35, 0.35);
	
	makeLuaSprite('streetlight-f','streetlight',-200, -500)
    setScrollFactor('streetlight-f', 1.1, 1.1);
	scaleObject('streetlight-f', 2, 2);
	
	makeLuaSprite('streetlight-f2','streetlight',1500, -500)
    setScrollFactor('streetlight-f2', 1.1, 1.1);
	scaleObject('streetlight-f2', 2, 2);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
	addLuaSprite('streetlight-f', true);
    addLuaSprite('streetlight-f2', true);

	end

    addLuaSprite('roadsky', false);
	addLuaSprite('road-park', false);
	addLuaSprite('roadmiddle', false);
	addLuaSprite('roadback', false);
	addLuaSprite('streetlight', false);
	addLuaSprite('streetlight2', false);
	addLuaSprite('streetlight3', false);
	addLuaSprite('streetlight4', false);

	addLuaSprite('roadfront', false);

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end