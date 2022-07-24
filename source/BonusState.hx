package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
//import Achievements;

using StringTools;

class BonusState extends MusicBeatState
{
	#if ACHIEVEMENTS_ALLOWED
	var options:Array<String> = [];
	private var grpOptions:FlxTypedGroup<Alphabet>;
	private static var curSelected:Int = 0;
	private var bonusArray:Array<Dynamic> = [];
	//private var bonusIndex:Array<Int> = [];
	private var descText:FlxText;
	private var languageText:FlxText;
	private var bonusLanguage:Int = 0;
    var bonusimage:FlxSprite;

	


	public static var BonusStuff:Array<Dynamic> = [ // English text , Japanese text , English image , Japanese image
		["Thank you for downloading!", "ダウンロードありがとうございます！", "bonus_thankyou!", "bonus_thankyou!"],
		["Check the Freeplay for a bonus song!", "フリープレイをチェックしよう！", "bonus_checkfreeplay", "bonus_checkfreeplay-J"],
		["Minus skins", "マイナススキンについて", "bonus_minus", "bonus_minus-J"],
		["Minus skins", "マイナススキンについて", "bonus_minus"],
		["Minus skins", "マイナススキンについて", "bonus_minus"]
	];

	// public static var BonusImages:Array<Dynamic> = [
	// 	['icon-bf'],
	// 	['icon-dad'],
	// 	['menu_image2']
	// ];


	override function create() {
		#if desktop
		DiscordClient.changePresence("Bonus Menu", null);
		#end

		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuBGBlue'));
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = ClientPrefs.globalAntialiasing;
		add(menuBG);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		var arrowUP:FlxSprite = new FlxSprite(1165,0).loadGraphic(Paths.image('ui/butt_graph0002'));
		var arrowDOWN:FlxSprite = new FlxSprite(1165,60).loadGraphic(Paths.image('ui/butt_graph0001'));
		arrowUP.antialiasing = ClientPrefs.globalAntialiasing;
		arrowDOWN.antialiasing = ClientPrefs.globalAntialiasing;

        add(arrowUP);
        add(arrowDOWN);
		
		//bonusimage = new FlxSprite(730,125).loadGraphic(Paths.image('menu_image4'));
		//add(bonusimage);

		

		descText = new FlxText(150, 660, 980, "", 32);
		descText.setFormat(Paths.font("Mplus1-Bold.otf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		descText.antialiasing = ClientPrefs.globalAntialiasing;
		add(descText);

		languageText = new FlxText(700, 30, 980, "", 32);
		languageText.setFormat(Paths.font("PhantomMuff Empty Letters 1.1.5.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		languageText.scrollFactor.set();
		languageText.borderSize = 2.4;
		languageText.antialiasing = ClientPrefs.globalAntialiasing;
		add(languageText);

		changeSelection();

		super.create();
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (controls.UI_LEFT_P) {
			changeSelection(-1);
			
		}
		if (controls.UI_RIGHT_P) {
			changeSelection(1);
		}
		
		if (controls.UI_UP_P) {
			if (bonusLanguage == 0) {
			    bonusLanguage = 1;
				changeSelection();
				}

			else{
				bonusLanguage = 0;
				changeSelection();    
			}
		}

		if (controls.UI_DOWN_P) {
			if (bonusLanguage == 0) {
			    bonusLanguage = 1;
				changeSelection();
				}
			else{
				bonusLanguage = 0;
			changeSelection();
			}
		}

		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
	}

	function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = 2;
		if (curSelected >= 3)
			
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpOptions.members) {
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			if (item.targetY == 0) {
				item.alpha = 1;
			}
		}

		 for (i in 0...bonusArray.length) {
		 	bonusArray[i].alpha = 0.6;
		 	if(i == curSelected) {
		 		bonusArray[i].alpha = 1;
		 	}
		 }
		if (bonusLanguage == 0){
			descText.text = BonusStuff[curSelected][0];
			languageText.text = "English";
			}
		else{
			descText.text = BonusStuff[curSelected][1];
			languageText.text = "Japanese";
			}

		  
		remove(bonusimage);
		bonusimage = new FlxSprite().loadGraphic(Paths.image("bonus/" + (BonusStuff[curSelected][bonusLanguage + 2])));
		bonusimage.screenCenter();
		bonusimage.antialiasing = ClientPrefs.globalAntialiasing;

		
		add(bonusimage);
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		

	}

	
	#end
}
