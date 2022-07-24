function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'FIRE Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'FIRENOTE_assets'); --Change texture
			


		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'FIRE Note' then
		characterPlayAnim('boyfriend', 'dodge', true);
		setProperty('boyfriend.specialAnim', true);
		characterPlayAnim('dad', 'hey', true);
		setProperty('dad.specialAnim', true);
		playSound('fire', 0.8);
    end
end



function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'FIRE Note' then
	        characterPlayAnim('boyfriend', 'hurt', true);
		    setProperty('boyfriend.specialAnim', true);
			playSound('fire', 0.8);
		    setProperty('health', getProperty('health') - 0.2);
	end
end