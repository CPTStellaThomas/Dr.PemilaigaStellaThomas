-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the level 1 screen of the game.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )


-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

    -- The local variables for this scene
    local bkg_image

    local questionObject
    local nameObject
    local nameObject2
    -- lives 
    local lives = 3
    
    local drop1
    local drop2
    local drop3

    local points = 0
    local correct
    local incorrect

    -- answer Images
    local ice
    local bandaid
    local tweezers
    local polysporin
    local tums
    local advil
    local stitches
    local tissue
    local heat
    local eyeDrops
    local earDrops
    local epiPen
    local lipChap
    local afterBite


    -- question Images
    local bruises
    local cuts
    local splinters
    local beeSting
    local rugBurn
    local stomachAche
    local headAche
    local noiseBleed
    local blackEye
    local largeCut
    local pinkEye
    local earInfection
    local dryLips
    local allergicReaction
    local mosquitoBite


    local randomOperator

-----------------------------------------------------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------

    -- sound
    local correctSound = audio.loadSound("Sounds/CorrectSound.wav")
    local correctSoundChannel
    local wrongSound = audio.loadSound("Sounds/IncorrectSound.mp3")
    local wrongSoundChannel

    local youLoseSound = audio.loadSound("Sounds/loseGameSound.mp3")
    local youLoseSoundChannel
    local youWinSound = audio.loadSound("Sounds/youWonSound.mp3")
    local youWinSoundChannel

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function HideImages()
    bruises.isVisible = false
    cuts.isVisible = false
    ice.isVisible = false
    splinters.isVisible = false
    beeSting.isVisible = false
    bandaid.isVisible = false
    tweezers.isVisible = false
    polysporin.isVisible = false
    rugBurn.isVisible = false
    headAche.isVisible = false
    stomachAche.isVisible = false
    noiseBleed.isVisible = false
    blackEye.isVisible = false
    largeCut.isVisible = false
    advil.isVisible = false
    tums.isVisible = false
    stitches.isVisible = false
    tissue.isVisible = false
    heat.isVisible = false
    earInfection.isVisible = false
    earDrops.isVisible = false
    pinkEye.isVisible = false
    eyeDrops.isVisible = false
    dryLips.isVisible = false
    allergicReaction.isVisible = false
    lipChap.isVisible = false
    epiPen.isVisible = false
    mosquitoBite.isVisible = false
    afterBite.isVisible = false
end 

local function ShowDrops()
    drop1.isVisible = true
    drop2.isVisible = true
    drop3.isVisible = true
end

-- Functions that checks if the buttons have been clicked.
local function TouchListenerAnswer(event)
    -- get the object name that was clicked
    local object = event.target

    -- get the user answer from the text object that was clicked on    

    if (event.phase == "ended") then

        print("correct")
        correct.isVisible = true

        timer.performWithDelay(1000, HideCorrect)

        --print (points)
        points = points + 1

        correctSoundChannel = audio.play(correctSound)

        RemoveAllTouchListeners()
        HideImages()

    
        if (points == 5) then
            composer.gotoScene( "YouWin_screen" )
            youWinSoundChannel = audio.play(youWinSound)

        else
            timer.performWithDelay( 1000, AskQuestionLevel1 )
        end        

    end
end

local function TouchListenerWrongAnswer1(event)
    local object = event.target
    -- get the user answer from the text object that was clicked on
    if (event.phase == "ended") then

        lives = lives - 1
        print("***object.name = " .. object.name)

        --object:removeEventListener("touch", TouchListenerWrongAnswer1)
        RemoveAllTouchListeners()
        HideImages()

        incorrect.isVisible = true
        correct.isVisible = false

        wrongSoundChannel = audio.play(wrongSound)

        print("wronganswer1")

        if (lives == 3) then
            drop1.isVisible = false
        elseif (lives == 2) then
            drop2.isVisible = false
        elseif (lives == 1) then
            drop3.isVisible = false
        end
        
        if (lives == 0) then
            composer.gotoScene( "YouLose_screen" )
            youLoseSoundChannel = audio.play(youLoseSound)

        else
            timer.performWithDelay( 1000, AskQuestionLevel1 )
            --AskQuestionLevel1()
        end        

    end
end

local function TouchListenerWrongAnswer2(event)
    local object = event.target
    -- get the user answer from the text object that was clicked on
    if (event.phase == "ended") then

        lives = lives - 1
        print("***object.name = " .. object.name)

        --object:removeEventListener("touch", TouchListenerWrongAnswer2)
        RemoveAllTouchListeners()
        HideImages()
        
        incorrect.isVisible = true
        correct.isVisible = false

        wrongSoundChannel = audio.play(wrongSound)
        
        print("wronganswer2")

        if (lives == 3) then
            drop1.isVisible = false
        elseif (lives == 2) then
            drop2.isVisible = false
        elseif (lives == 1) then
            drop3.isVisible = false
        end
        
        if (lives == 0) then
            composer.gotoScene( "YouLose_screen" )
            youLoseSoundChannel = audio.play(youLoseSound)

            incorrect.isVisible = false

        else
            --AskQuestionLevel1()
            timer.performWithDelay( 1000, AskQuestionLevel1 )
            --incorrect.isVisible = false
        end        

    end
end

function RemoveTouchListenersQ1()
    ice:removeEventListener("touch", TouchListenerAnswer)
    bandaid:removeEventListener("touch", TouchListenerWrongAnswer1)       
    stitches:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ2()
    ice:removeEventListener("touch", TouchListenerAnswer)
    bandaid:removeEventListener("touch", TouchListenerWrongAnswer1)       
    stitches:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ3()
    tweezers:removeEventListener("touch", TouchListenerAnswer)
    ice:removeEventListener("touch", TouchListenerWrongAnswer1)       
    bandaid:removeEventListener("touch", TouchListenerWrongAnswer2)   
end

function RemoveTouchListenersQ4()
    bandaid:removeEventListener("touch", TouchListenerAnswer)
    heat:removeEventListener("touch", TouchListenerWrongAnswer1)       
    tweezers:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ5()
    polysporin:removeEventListener("touch", TouchListenerAnswer)
    tums:removeEventListener("touch", TouchListenerWrongAnswer1)       
    stitches:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ6()
    advil:removeEventListener("touch", TouchListenerAnswer)
    polysporin:removeEventListener("touch", TouchListenerWrongAnswer1)       
    bandaid:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ7()
    tums:removeEventListener("touch", TouchListenerAnswer)
    ice:removeEventListener("touch", TouchListenerWrongAnswer1)       
    tweezers:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ8()
    ice:removeEventListener("touch", TouchListenerAnswer)
    tissue:removeEventListener("touch", TouchListenerWrongAnswer1)       
    advil:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ9()
    tissue:removeEventListener("touch", TouchListenerAnswer)
    tweezers:removeEventListener("touch", TouchListenerWrongAnswer1)       
    polysporin:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ10()
    stitches:removeEventListener("touch", TouchListenerAnswer)
    ice:removeEventListener("touch", TouchListenerWrongAnswer1)       
    tums:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ11()
    eyeDrops:removeEventListener("touch", TouchListenerAnswer)
    earDrops:removeEventListener("touch", TouchListenerWrongAnswer1)       
    polysporin:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ12()
    earDrops:removeEventListener("touch", TouchListenerAnswer)
    heat:removeEventListener("touch", TouchListenerWrongAnswer1)       
    stitches:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ13()
    lipChap:removeEventListener("touch", TouchListenerAnswer)
    tissue:removeEventListener("touch", TouchListenerWrongAnswer1)       
    ice:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ14()
    afterBite:removeEventListener("touch", TouchListenerAnswer)
    stitches:removeEventListener("touch", TouchListenerWrongAnswer1)       
    heat:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ15()
    epiPen:removeEventListener("touch", TouchListenerAnswer)
    bandaid:removeEventListener("touch", TouchListenerWrongAnswer1)       
    lipChap:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveAllTouchListeners()
    if (randomOperator == 1) then
        RemoveTouchListenersQ1()
    elseif (randomOperator == 2) then
        RemoveTouchListenersQ2()
    elseif (randomOperator == 3) then
        RemoveTouchListenersQ3()
    elseif (randomOperator == 4) then
        RemoveTouchListenersQ4()
    elseif (randomOperator == 5) then
        RemoveTouchListenersQ5()
    elseif (randomOperator == 6) then
        RemoveTouchListenersQ6()
    elseif (randomOperator == 7) then
        RemoveTouchListenersQ7()
    elseif (randomOperator == 8) then
        RemoveTouchListenersQ8()
    elseif (randomOperator == 9) then
        RemoveTouchListenersQ9()
    elseif (randomOperator == 10) then
        RemoveTouchListenersQ10()
    elseif (randomOperator == 11) then
        RemoveTouchListenersQ11()
    elseif (randomOperator == 12) then
        RemoveTouchListenersQ12()
    elseif (randomOperator == 13) then
        RemoveTouchListenersQ13()
    elseif (randomOperator == 14) then
        RemoveTouchListenersQ14()
    elseif (randomOperator == 15) then
        RemoveTouchListenersQ15()
    end
end

function NewQuestionTimer()
    if (lives == 3) then
        HideImages()
        RemoveAllTouchListeners()
        AskQuestionLevel1()
    elseif (lives == 2) then
        HideImages()
        RemoveAllTouchListeners()
        AskQuestionLevel1()
    elseif (lives == 1) then
        HideImages()
        RemoveAllTouchListeners()
        AskQuestionLevel1()
    elseif (lives == 0) then
        HideImages()
        RemoveAllTouchListeners()
        composer.gotoScene( "YouLose_screen" )
    end
end


function AskQuestionLevel1()
    randomOperator = math.random (1, 15)

    incorrect.isVisible = false
    correct.isVisible = false
    HideImages()

    if (randomOperator == 1) then
        -- question
        bruises.isVisible = true

        -- correct answer
        ice.isVisible = true
        ice:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        bandaid.isVisible = true
        bandaid:addEventListener("touch", TouchListenerWrongAnswer1)

        stitches.isVisible = true
        stitches:addEventListener("touch", TouchListenerWrongAnswer2)

    elseif (randomOperator == 2) then
        
        -- question
        beeSting.isVisible = true

        -- correct answer
        ice.isVisible = true
        ice:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        bandaid.isVisible = true
        bandaid:addEventListener("touch", TouchListenerWrongAnswer1)

        stitches.isVisible = true
        stitches:addEventListener("touch", TouchListenerWrongAnswer2)

    elseif (randomOperator == 3) then

        --question
        splinters.isVisible = true

        -- correct answer
        tweezers.isVisible = true
        tweezers:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        ice.isVisible = true
        ice:addEventListener("touch", TouchListenerWrongAnswer1)

        bandaid.isVisible = true
        bandaid:addEventListener("touch", TouchListenerWrongAnswer2)
    
    elseif (randomOperator == 4) then

        -- question
        cuts.isVisible = true

        -- correct answer
        bandaid.isVisible = true
        bandaid:addEventListener("touch", TouchListenerAnswer)
        
        -- wrong answers
        heat.isVisible = true
        heat:addEventListener("touch", TouchListenerWrongAnswer1)

        tweezers.isVisible = true
        tweezers:addEventListener("touch", TouchListenerWrongAnswer2)

    elseif (randomOperator == 5) then
        -- question
        rugBurn.isVisible = true

        -- correct answer
        polysporin.isVisible = true
        polysporin:addEventListener("touch", TouchListenerAnswer)
        
        -- wrong answers
        tums.isVisible = true
        tums:addEventListener("touch", TouchListenerWrongAnswer1)

        stitches.isVisible = true
        stitches:addEventListener("touch", TouchListenerWrongAnswer2)

    elseif (randomOperator == 6) then

        -- question
        headAche.isVisible = true

        -- correct answer
        advil.isVisible = true
        advil:addEventListener("touch", TouchListenerAnswer)
        
        -- wrong answers
        polysporin.isVisible = true
        polysporin:addEventListener("touch", TouchListenerWrongAnswer1)

        bandaid.isVisible = true
        bandaid:addEventListener("touch", TouchListenerWrongAnswer2)

    elseif (randomOperator == 7) then

        -- question
        stomachAche.isVisible = true

        -- correct answer
        tums.isVisible = true
        tums:addEventListener("touch", TouchListenerAnswer)
        
        -- wrong answers
        ice.isVisible = true
        ice:addEventListener("touch", TouchListenerWrongAnswer1)

        tweezers.isVisible = true
        tweezers:addEventListener("touch", TouchListenerWrongAnswer2)

    elseif (randomOperator == 8) then

        -- question
        blackEye.isVisible = true

        -- correct answer
        ice.isVisible = true
        ice:addEventListener("touch", TouchListenerAnswer)
        
        -- wrong answers
        tissue.isVisible = true
        tissue:addEventListener("touch", TouchListenerWrongAnswer1)

        advil.isVisible = true
        advil:addEventListener("touch", TouchListenerWrongAnswer2)

    elseif (randomOperator == 9) then

        -- question
        noiseBleed.isVisible = true

        -- correct answer
        tissue.isVisible = true
        tissue:addEventListener("touch", TouchListenerAnswer)
        
        -- wrong answers
        tweezers.isVisible = true
        tweezers:addEventListener("touch", TouchListenerWrongAnswer1)

        polysporin.isVisible = true
        polysporin:addEventListener("touch", TouchListenerWrongAnswer2)

    elseif (randomOperator == 10) then

        -- question
        largeCut.isVisible = true

        -- correct answer
        stitches.isVisible = true
        stitches:addEventListener("touch", TouchListenerAnswer)
        
        -- wrong answers
        ice.isVisible = true
        ice:addEventListener("touch", TouchListenerWrongAnswer1)

        tums.isVisible = true
        tums:addEventListener("touch", TouchListenerWrongAnswer2)

    elseif (randomOperator == 11) then

        -- question
        pinkEye.isVisible = true

        -- correct answer
        eyeDrops.isVisible = true
        eyeDrops:addEventListener("touch", TouchListenerAnswer)
        
        -- wrong answers
        earDrops.isVisible = true
        earDrops:addEventListener("touch", TouchListenerWrongAnswer1)

        polysporin.isVisible = true
        polysporin:addEventListener("touch", TouchListenerWrongAnswer2)

    elseif (randomOperator == 12) then

        -- question
        earInfection.isVisible = true

        -- correct answer
        earDrops.isVisible = true
        earDrops:addEventListener("touch", TouchListenerAnswer)
        
        -- wrong answers
        heat.isVisible = true
        heat:addEventListener("touch", TouchListenerWrongAnswer1)

        stitches.isVisible = true
        stitches:addEventListener("touch", TouchListenerWrongAnswer2)

    elseif (randomOperator == 13) then

        -- question
        dryLips.isVisible = true

        -- correct answer
        lipChap.isVisible = true
        lipChap:addEventListener("touch", TouchListenerAnswer)
        
        -- wrong answers
        tissue.isVisible = true
        tissue:addEventListener("touch", TouchListenerWrongAnswer1)

        ice.isVisible = true
        ice:addEventListener("touch", TouchListenerWrongAnswer2)

    elseif (randomOperator == 14) then

        -- question
        mosquitoBite.isVisible = true

        -- correct answer
        afterBite.isVisible = true
        afterBite:addEventListener("touch", TouchListenerAnswer)
        
        -- wrong answers
        stitches.isVisible = true
        stitches:addEventListener("touch", TouchListenerWrongAnswer1)

        heat.isVisible = true
        heat:addEventListener("touch", TouchListenerWrongAnswer2)

    elseif (randomOperator == 15) then

        -- question
        allergicReaction.isVisible = true

        -- correct answer
        epiPen.isVisible = true
        epiPen:addEventListener("touch", TouchListenerAnswer)
        
        -- wrong answers
        bandaid.isVisible = true
        bandaid:addEventListener("touch", TouchListenerWrongAnswer1)

        lipChap.isVisible = true
        lipChap:addEventListener("touch", TouchListenerWrongAnswer2)

    end
end

-------------------------------------------------------------------------------------------------------------------------
-- hide correctObject
local function HideCorrect()
    correct.isVisible = false
    AskQuestionLevel()
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------------------------------------------
    -- OBJECT CREATION 
    -----------------------------------------------------------------------------------------------------------------------------

    -- Insert the background image
    bkg_image = display.newImageRect("Images/LevelOneScreen.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- create the lives to display on the screen 
    drop1 = display.newImageRect("Images/redDrop.png", 100, 100)
    drop1.x = display.contentWidth /7
    drop1.y = display.contentHeight/2.5
    drop1.isVisible = true

    drop2 = display.newImageRect("Images/redDrop.png", 100, 100)
    drop2.x = display.contentWidth /11
    drop2.y = display.contentHeight/3
    drop2.isVisible = true

    drop3 = display.newImageRect("Images/redDrop.png", 100, 100)
    drop3.x = display.contentWidth /5
    drop3.y = display.contentHeight/3
    drop3.isVisible = true

    correct = display.newText("CORRECT!", display.contentWidth/2, display.contentHeight*2.5/4, nil, 100 )
    correct:setTextColor(153/255, 76/255, 0)
    correct.isVisible = false

    incorrect = display.newText("INCORRECT!", display.contentWidth/2, display.contentHeight*2.5/4, nil, 100 )
    incorrect:setTextColor(153/255, 76/255, 0)
    incorrect.isVisible = false

    -- questions 
    bruises = display.newImageRect("Images for level one/Bruises.png", 250, 250)
    bruises.x = display.contentWidth /1.9
    bruises.y = display.contentHeight/2.1
    bruises.isVisible = false

    cuts = display.newImageRect("Images for level one/Cuts.png", 250, 250)
    cuts.x = display.contentWidth /1.9
    cuts.y = display.contentHeight/2.1
    cuts.isVisible = false
    cuts.name = "cuts"

    splinters = display.newImageRect("Images for level one/Splinters.png", 250, 250)
    splinters.x = display.contentWidth /1.9
    splinters.y = display.contentHeight/2.1
    splinters.isVisible = false
    splinters.name = "splinters"

    beeSting = display.newImageRect("Images for level one/Bee Sting.png", 250, 250)
    beeSting.x = display.contentWidth /1.9
    beeSting.y = display.contentHeight/2.1
    beeSting.isVisible = false
    beeSting.name = "beeSting"

    rugBurn = display.newImageRect("Images for level one/RugBurn.png", 250, 250)
    rugBurn.x = display.contentWidth /1.9
    rugBurn.y = display.contentHeight/2.1
    rugBurn.isVisible = false
    rugBurn.name = "rugBurn"

    stomachAche = display.newImageRect("Images for level one/StomachAche.png", 250, 250)
    stomachAche.x = display.contentWidth /1.9
    stomachAche.y = display.contentHeight/2.1
    stomachAche.isVisible = false
    stomachAche.name = "stomachAche"

    headAche = display.newImageRect("Images for level one/HeadAche.png", 250, 250)
    headAche.x = display.contentWidth /1.9
    headAche.y = display.contentHeight/2.1
    headAche.isVisible = false
    headAche.name = "headAche"

    largeCut = display.newImageRect("Images for level one/LargeCut.png", 250, 250)
    largeCut.x = display.contentWidth /1.9
    largeCut.y = display.contentHeight/2.1
    largeCut.isVisible = false
    largeCut.name = "largeCut"

    blackEye = display.newImageRect("Images for level one/BlackEye.png", 250, 250)
    blackEye.x = display.contentWidth /1.9
    blackEye.y = display.contentHeight/2.1
    blackEye.isVisible = false
    blackEye.name = "blackEye"

    noiseBleed = display.newImageRect("Images for level one/NoiseBleed.png", 250, 250)
    noiseBleed.x = display.contentWidth /1.9
    noiseBleed.y = display.contentHeight/2.1
    noiseBleed.isVisible = false
    noiseBleed.name = "noiseBleed"

    pinkEye = display.newImageRect("Images for level one/PinkEye.png", 230, 250)
    pinkEye.x = display.contentWidth /1.9
    pinkEye.y = display.contentHeight/2.1
    pinkEye.isVisible = false
    pinkEye.name = "pinkEye"

    earInfection = display.newImageRect("Images for level one/EarInfection.png", 250, 250)
    earInfection.x = display.contentWidth /1.9
    earInfection.y = display.contentHeight/2.1
    earInfection.isVisible = false
    earInfection.name = "earInfection"

    dryLips = display.newImageRect("Images for level one/DryLips.png", 250, 250)
    dryLips.x = display.contentWidth /1.9
    dryLips.y = display.contentHeight/2.1
    dryLips.isVisible = false
    dryLips.name = "earInfedryLipsction"

    mosquitoBite = display.newImageRect("Images for level one/MosquitoBite.png", 280, 270)
    mosquitoBite.x = display.contentWidth /1.9
    mosquitoBite.y = display.contentHeight/2.1
    mosquitoBite.isVisible = false
    mosquitoBite.name = "mosquitoBite"

    allergicReaction = display.newImageRect("Images for level one/AllergicReaction.png", 250, 250)
    allergicReaction.x = display.contentWidth /1.9
    allergicReaction.y = display.contentHeight/2.1
    allergicReaction.isVisible = false
    allergicReaction.name = "allergicReaction"


    --answers
    ice = display.newImageRect("Images for level one/IceBag1.png", 190, 190)
    ice.x = display.contentWidth /1.25
    ice.y = display.contentHeight/1.2
    ice.isVisible = false
    ice.name = "ice"

    polysporin = display.newImageRect("Images for level one/Polysporin.png", 190, 190)
    polysporin.x = display.contentWidth /1.25
    polysporin.y = display.contentHeight/1.2
    polysporin.isVisible = false
    polysporin.name = "polysporin"

    bandaid = display.newImageRect("Images for level one/Bandaid3.png", 220, 190)
    bandaid.x = display.contentWidth /1.9
    bandaid.y = display.contentHeight/1.17
    bandaid.isVisible = false
    bandaid.name = "bandaid"

    tweezers = display.newImageRect("Images for level one/Tweezers.png", 190, 190)
    tweezers.x = display.contentWidth /4.
    tweezers.y = display.contentHeight/1.2
    tweezers.isVisible = false
    tweezers.name = "tweezers"

    advil = display.newImageRect("Images for level one/Advil.png", 190, 190)
    advil.x = display.contentWidth /4.5
    advil.y = display.contentHeight/1.2
    advil.isVisible = false
    advil.name = "advil"

    tums = display.newImageRect("Images for level one/Tums2.png", 190, 190)
    tums.x = display.contentWidth /1.9
    tums.y = display.contentHeight/1.2
    tums.isVisible = false
    tums.name = "tums"

    tissue = display.newImageRect("Images for level one/Tissue.png", 190, 190)
    tissue.x = display.contentWidth /1.9
    tissue.y = display.contentHeight/1.2
    tissue.isVisible = false
    tissue.name = "tissue"

    stitches = display.newImageRect("Images for level one/Stitches11.png", 160, 200)
    stitches.x = display.contentWidth /4.5
    stitches.y = display.contentHeight/1.2
    stitches.isVisible = false
    stitches.name = "stitches"

    heat = display.newImageRect("Images for level one/Heat2.png", 190, 190)
    heat.x = display.contentWidth /1.25
    heat.y = display.contentHeight/1.2
    heat.isVisible = false
    heat.name = "heat"

    eyeDrops = display.newImageRect("Images for level one/EyeDrop.png", 160, 220)
    eyeDrops.x = display.contentWidth /4.5
    eyeDrops.y = display.contentHeight/1.2
    eyeDrops.isVisible = false
    eyeDrops.name = "eyeDrops"

    earDrops = display.newImageRect("Images for level one/EarDrop1.png", 160, 220)
    earDrops.x = display.contentWidth /1.9
    earDrops.y = display.contentHeight/1.2
    earDrops.isVisible = false
    earDrops.name = "earDrops"

    lipChap = display.newImageRect("Images for level one/LipChap.png", 160, 220)
    lipChap.x = display.contentWidth /4.5
    lipChap.y = display.contentHeight/1.2
    lipChap.isVisible = false
    lipChap.name = "lipChap"

    afterBite = display.newImageRect("Images for level one/AfterBite.png", 160, 220)
    afterBite.x = display.contentWidth /1.9
    afterBite.y = display.contentHeight/1.2
    afterBite.isVisible = false
    afterBite.name = "afterBite"

    epiPen = display.newImageRect("Images for level one/EpiPen.png", 160, 220)
    epiPen.x = display.contentWidth /1.25
    epiPen.y = display.contentHeight/1.2
    epiPen.isVisible = false
    epiPen.name = "epiPen"

    -- displays a question and sets the colour
    questionObject = display.newText( "What tool do you use to help your patient?", display.contentWidth/1.635, display.contentHeight/4.2, nil, 40)
    questionObject:setTextColor(0, 102/255, 102/255)

    nameObject2 = display.newText( "DR.PEMILIAGA :)", display.contentWidth/1.665, display.contentHeight/8, nil, 60)
    nameObject2:setTextColor(153/255, 153/255, 255)

    nameObject = display.newText( "DR.PEMILIAGA :)", display.contentWidth/1.68, display.contentHeight/8, nil, 60)
    nameObject:setTextColor(102/255, 102/255, 255)


-----------------------------------------------------------------------------------------------------------------------------

    -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image ) 
    sceneGroup:insert( drop1 )
    sceneGroup:insert( drop2 )
    sceneGroup:insert( drop3 )
    sceneGroup:insert( questionObject ) 
    sceneGroup:insert( nameObject )
    sceneGroup:insert( nameObject2 )
    sceneGroup:insert( correct )
    sceneGroup:insert( incorrect )
    sceneGroup:insert( bruises )
    sceneGroup:insert( beeSting )
    sceneGroup:insert( cuts )
    sceneGroup:insert( splinters )
    sceneGroup:insert( ice )
    sceneGroup:insert( bandaid )
    sceneGroup:insert( tweezers )
    sceneGroup:insert( polysporin )
    sceneGroup:insert( rugBurn )
    sceneGroup:insert( headAche )
    sceneGroup:insert( stomachAche )
    sceneGroup:insert( noiseBleed )
    sceneGroup:insert( blackEye )
    sceneGroup:insert( largeCut )
    sceneGroup:insert( advil )
    sceneGroup:insert( tissue )
    sceneGroup:insert( stitches )
    sceneGroup:insert( heat )
    sceneGroup:insert( tums )
    sceneGroup:insert( earInfection )
    sceneGroup:insert( earDrops )
    sceneGroup:insert( pinkEye )
    sceneGroup:insert( eyeDrops )
    sceneGroup:insert( dryLips )
    sceneGroup:insert( mosquitoBite )
    sceneGroup:insert( allergicReaction )
    sceneGroup:insert( epiPen )
    sceneGroup:insert( lipChap )
    sceneGroup:insert( afterBite )

end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene

    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        lives = 3
        points = 0        

        ShowDrops()
        AskQuestionLevel1()

    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )


-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
