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
sceneName = "level3_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )


-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

    -- The local variables for this scene
    local bkg_image

    -- lives 
    local lives = 3
    
    -- aidkits
    local aidKit1
    local aidKit2
    local aidKit3

    -- points
    local points = 0
    local correct
    local incorrect

    -- answer Images
    local hug
    local yell
    local ignore
    local tissue
    local happy
    local rude
    local help
    local laugh
    local comfort
    local talk
    local listen 
    local sleep
    local kind
    local care
    local annoying

    -- question Images
    local question1
    local question2
    local question3
    local question4
    local question5
    local question6
    local question7
    local question8
    local question9
    local question10
    local question11
    local question12
    local question13
    local question14
    local question15

    --randomOperator variable
    local randomOperator
------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------

    -- sounds for getting answer wrong and right
    local correctSound = audio.loadSound("Sounds/CorrectSound.wav")
    local correctSoundChannel
    local wrongSound = audio.loadSound("Sounds/IncorrectSound.mp3")
    local wrongSoundChannel

    -- sounds for losing and winnig
    local youLoseSound = audio.loadSound("Sounds/loseGameSound.mp3")
    local youLoseSoundChannel
    local youWinSound = audio.loadSound("Sounds/youWonSound.mp3")
    local youWinSoundChannel

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- hiding all images 
local function HideImages()
    question1.isVisible = false
    hug.isVisible = false
    question2.isVisible = false
    question3.isVisible = false
    question4.isVisible = false
    question5.isVisible = false
    question6.isVisible = false
    question7.isVisible = false
    question8.isVisible = false
    question9.isVisible = false
    question10.isVisible = false
    question11.isVisible = false
    question12.isVisible = false
    question13.isVisible = false
    question14.isVisible = false
    question15.isVisible = false
    yell.isVisible = false
    ignore.isVisible = false
    tissue.isVisible = false
    laugh.isVisible = false
    help.isVisible = false
    happy.isVisible = false
    rude.isVisible = false
    comfort.isVisible = false
    talk.isVisible = false
    listen.isVisible = false 
    sleep.isVisible = false
    kind.isVisible = false
    care.isVisible = false
    annoying.isVisible = false
end 

-- function showing lives/aidkits
local function ShowAidKits()
    aidKit1.isVisible = true
    aidKit2.isVisible = true
    aidKit3.isVisible = true
end

-- Functions that checks if the buttons have been clicked for the right answer.
local function TouchListenerAnswer(event)
    -- get the object name that was clicked
    local object = event.target

    -- get the user answer from the text object that was clicked on    

    if (event.phase == "ended") then

        --correct text is visible
        print("correct")
        correct.isVisible = true

        --print (points)
        points = points + 1

        --plays sound
        correctSoundChannel = audio.play(correctSound)

        --calling functions
        RemoveAllTouchListenersL3()
        HideImages()

        --if you win the, game sound plays and changes to you win screen
        if (points == 5) then
            composer.gotoScene( "YouWin_screen" )
            youWinSoundChannel = audio.play(youWinSound)
        else
            --otherwise ask a new question
            timer.performWithDelay( 1000, AskQuestionLevel3 )
        end        

    end
end

--Functions that checks if the buttons have been clicked for the wrong answers.
local function TouchListenerWrongAnswer1(event)
    local object = event.target
    -- get the user answer from the text object that was clicked on
    if (event.phase == "ended") then

        --take away a life
        lives = lives - 1
        print("***object.name = " .. object.name)

        --call functions
        RemoveAllTouchListenersL3()
        HideImages()

        --display incorrect and hide correct
        incorrect.isVisible = true
        correct.isVisible = false

        print("wronganswer1")

        -- if you lose a life, a aidkit disappears
        if (lives == 2) then
            aidKit1.isVisible = false
            wrongSoundChannel = audio.play(wrongSound)
        elseif (lives == 1) then
            aidKit2.isVisible = false
            wrongSoundChannel = audio.play(wrongSound)
        elseif (lives == 0) then
            aidKit3.isVisible = false
        end
        
        -- if you lose, it plays the you lose sound and goes to you lose screen
        if (lives == 0) then
            composer.gotoScene( "YouLose_screen" )
            youLoseSoundChannel = audio.play(youLoseSound)

        else
            --otherwise it asks another question
            timer.performWithDelay( 1000, AskQuestionLevel3 )
        end        

    end
end

-- removing all touch listeners from each question 
function RemoveTouchListenersQ1L3()
    tissue:removeEventListener("touch", TouchListenerAnswer)
    yell:removeEventListener("touch", TouchListenerWrongAnswer1)       
    rude:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ2L3()
    hug:removeEventListener("touch", TouchListenerAnswer)
    yell:removeEventListener("touch", TouchListenerWrongAnswer1)       
    ignore:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ3L3()
    happy:removeEventListener("touch", TouchListenerAnswer)
    tissue:removeEventListener("touch", TouchListenerWrongAnswer1)       
    rude:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ4L3()
    help:removeEventListener("touch", TouchListenerAnswer)
    yell:removeEventListener("touch", TouchListenerWrongAnswer1)       
    ignore:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ5L3()
    help:removeEventListener("touch", TouchListenerAnswer)
    yell:removeEventListener("touch", TouchListenerWrongAnswer1)       
    laugh:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ6L3()
    comfort:removeEventListener("touch", TouchListenerAnswer)
    annoying:removeEventListener("touch", TouchListenerWrongAnswer1)       
    laugh:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ7L3()
    talk:removeEventListener("touch", TouchListenerAnswer)
    rude:removeEventListener("touch", TouchListenerWrongAnswer1)       
    sleep:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ8L3()
    listen:removeEventListener("touch", TouchListenerAnswer)
    yell:removeEventListener("touch", TouchListenerWrongAnswer1)       
    rude:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ9L3()
    help:removeEventListener("touch", TouchListenerAnswer)
    annoying:removeEventListener("touch", TouchListenerWrongAnswer1)       
    ignore:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ10L3()
    happy:removeEventListener("touch", TouchListenerAnswer)
    rude:removeEventListener("touch", TouchListenerWrongAnswer1)       
    laugh:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ11L3()
    talk:removeEventListener("touch", TouchListenerAnswer)
    rude:removeEventListener("touch", TouchListenerWrongAnswer1)       
    ignore:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ12L3()
    listen:removeEventListener("touch", TouchListenerAnswer)
    rude:removeEventListener("touch", TouchListenerWrongAnswer1)       
    yell:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ13L3()
    kind:removeEventListener("touch", TouchListenerAnswer)
    rude:removeEventListener("touch", TouchListenerWrongAnswer1)       
    laugh:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ14L3()
    sleep:removeEventListener("touch", TouchListenerAnswer)
    annoying:removeEventListener("touch", TouchListenerWrongAnswer1)       
    rude:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ15L3()
    care:removeEventListener("touch", TouchListenerAnswer)
    ignore:removeEventListener("touch", TouchListenerWrongAnswer1)       
    annoying:removeEventListener("touch", TouchListenerWrongAnswer1)
end

-- removing every touch listener
function RemoveAllTouchListenersL3()
    if (randomOperator == 1) then
        RemoveTouchListenersQ1L3()
    elseif (randomOperator == 2) then
        RemoveTouchListenersQ2L3()
    elseif (randomOperator == 3) then
        RemoveTouchListenersQ3L3()
    elseif (randomOperator == 4) then
        RemoveTouchListenersQ4L3()
    elseif (randomOperator == 5) then
        RemoveTouchListenersQ5L3()
    elseif (randomOperator == 6) then
        RemoveTouchListenersQ6L3()
    elseif (randomOperator == 7) then
        RemoveTouchListenersQ7L3()
    elseif (randomOperator == 8) then
        RemoveTouchListenersQ8L3()
    elseif (randomOperator == 9) then
        RemoveTouchListenersQ9L3()
    elseif (randomOperator == 10) then
        RemoveTouchListenersQ10L3()
    elseif (randomOperator == 11) then
        RemoveTouchListenersQ11L3()
    elseif (randomOperator == 12) then
        RemoveTouchListenersQ12L3()
    elseif (randomOperator == 13) then
        RemoveTouchListenersQ13L3()
    elseif (randomOperator == 14) then
        RemoveTouchListenersQ14L3()
    elseif (randomOperator == 15) then
        RemoveTouchListenersQ15L3()
    end
end

--if you lose a life it calls these functions
function NewQuestionTimerL3()
    if (lives == 3) then
        HideImages()
        RemoveAllTouchListenersL3()
        AskQuestionLevel3()
    elseif (lives == 2) then
        HideImages()
        RemoveAllTouchListenersL3()
        AskQuestionLevel3()
    elseif (lives == 1) then
        HideImages()
        RemoveAllTouchListenersL3()
        AskQuestionLevel3()
    elseif (lives == 0) then
        HideImages()
        RemoveAllTouchListenersL3()
        composer.gotoScene( "YouLose_screen" )
    end
end

--asking a question
function AskQuestionLevel3()
    randomOperator = math.random (1, 15)

    --incorrect and correct are set to invisible
    incorrect.isVisible = false
    correct.isVisible = false
    HideImages()

    if (randomOperator == 1) then
        -- question
        question1.isVisible = true

        -- correct answer
        tissue.isVisible = true
        tissue:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        yell.isVisible = true
        yell:addEventListener("touch", TouchListenerWrongAnswer1)

        rude.isVisible = true
        rude:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 2) then
        
        -- question
        question2.isVisible = true

        -- correct answer
        hug.isVisible = true
        hug:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        yell.isVisible = true
        yell:addEventListener("touch", TouchListenerWrongAnswer1)

        ignore.isVisible = true
        ignore:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 3) then
        
        -- question
        question3.isVisible = true

        -- correct answer
        happy.isVisible = true
        happy:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        tissue.isVisible = true
        tissue:addEventListener("touch", TouchListenerWrongAnswer1)

        rude.isVisible = true
        rude:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 4) then
        
        -- question
        question4.isVisible = true

        -- correct answer
        help.isVisible = true
        help:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        yell.isVisible = true
        yell:addEventListener("touch", TouchListenerWrongAnswer1)

        ignore.isVisible = true
        ignore:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 5) then
        
        -- question
        question5.isVisible = true

        -- correct answer
        help.isVisible = true
        help:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        yell.isVisible = true
        yell:addEventListener("touch", TouchListenerWrongAnswer1)

        laugh.isVisible = true
        laugh:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 6) then
        
        -- question
        question6.isVisible = true

        -- correct answer
        comfort.isVisible = true
        comfort:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        annoying.isVisible = true
        annoying:addEventListener("touch", TouchListenerWrongAnswer1)

        laugh.isVisible = true
        laugh:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 7) then
        
        -- question
        question7.isVisible = true

        -- correct answer
        talk.isVisible = true
        talk:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        rude.isVisible = true
        rude:addEventListener("touch", TouchListenerWrongAnswer1)

        sleep.isVisible = true
        sleep:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 8) then
        
        -- question
        question8.isVisible = true

        -- correct answer
        listen.isVisible = true
        listen:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        yell.isVisible = true
        yell:addEventListener("touch", TouchListenerWrongAnswer1)

        rude.isVisible = true
        rude:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 9) then
        
        -- question
        question9.isVisible = true

        -- correct answer
        help.isVisible = true
        help:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        annoying.isVisible = true
        annoying:addEventListener("touch", TouchListenerWrongAnswer1)

        ignore.isVisible = true
        ignore:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 10) then
        
        -- question
        question10.isVisible = true

        -- correct answer
        happy.isVisible = true
        happy:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        rude.isVisible = true
        rude:addEventListener("touch", TouchListenerWrongAnswer1)

        laugh.isVisible = true
        laugh:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 11) then
        
        -- question
        question11.isVisible = true

        -- correct answer
        talk.isVisible = true
        talk:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        rude.isVisible = true
        rude:addEventListener("touch", TouchListenerWrongAnswer1)

        ignore.isVisible = true
        ignore:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 12) then
        
        -- question
        question12.isVisible = true

        -- correct answer
        listen.isVisible = true
        listen:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        rude.isVisible = true
        rude:addEventListener("touch", TouchListenerWrongAnswer1)

        yell.isVisible = true
        yell:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 13) then
        
        -- question
        question13.isVisible = true

        -- correct answer
        kind.isVisible = true
        kind:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        rude.isVisible = true
        rude:addEventListener("touch", TouchListenerWrongAnswer1)

        laugh.isVisible = true
        laugh:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 14) then
        
        -- question
        question14.isVisible = true

        -- correct answer
        sleep.isVisible = true
        sleep:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        annoying.isVisible = true
        annoying:addEventListener("touch", TouchListenerWrongAnswer1)

        rude.isVisible = true
        rude:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 15) then
        
        -- question
        question15.isVisible = true

        -- correct answer
        care.isVisible = true
        care:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        ignore.isVisible = true
        ignore:addEventListener("touch", TouchListenerWrongAnswer1)

        annoying.isVisible = true
        annoying:addEventListener("touch", TouchListenerWrongAnswer1)

    end
end

-------------------------------------------------------------------------------------------------------------------------
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
    bkg_image = display.newImageRect("Images for level three/LevelThreeScreen.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- create the lives to display on the screen 
    aidKit1 = display.newImageRect("Images for level three/AidKit.png", 130, 100)
    aidKit1.x = display.contentWidth /1.3
    aidKit1.y = display.contentHeight/1.75
    aidKit1.isVisible = true

    aidKit2 = display.newImageRect("Images for level three/AidKit.png", 130, 100)
    aidKit2.x = display.contentWidth /4
    aidKit2.y = display.contentHeight/1.75
    aidKit2.isVisible = true

    aidKit3 = display.newImageRect("Images for level three/AidKit.png", 130, 100)
    aidKit3.x = display.contentWidth /2
    aidKit3.y = display.contentHeight/1.75
    aidKit3.isVisible = true

    --correct and incorrect text objects
    correct = display.newText("Good Job!", display.contentWidth/2, display.contentHeight*3/4, nil, 75 )
    correct:setTextColor(153/255, 76/255, 0)
    correct.isVisible = false

    incorrect = display.newText("Oops wrong answer!", display.contentWidth/2, display.contentHeight*3/4, nil, 75 )
    incorrect:setTextColor(153/255, 76/255, 0)
    incorrect.isVisible = false

    -- questions 
    question1 = display.newText("someone is crying?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question1:setTextColor(153/255, 76/255, 0)
    question1.isVisible = false

    question2 = display.newText("someone is feeling sad?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question2:setTextColor(153/255, 76/255, 0)
    question2.isVisible = false

    question3 = display.newText("someone is happy?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question3:setTextColor(153/255, 76/255, 0)
    question3.isVisible = false

    question4 = display.newText("someone is confused?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question4:setTextColor(153/255, 76/255, 0)
    question4.isVisible = false

    question5 = display.newText("someone is embarrased?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question5:setTextColor(153/255, 76/255, 0)
    question5.isVisible = false

    question6 = display.newText("someone is scared?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question6:setTextColor(153/255, 76/255, 0)
    question6.isVisible = false

    question7 = display.newText("someone is worried?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question7:setTextColor(153/255, 76/255, 0)
    question7.isVisible = false

    question8 = display.newText("someone is angry?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question8:setTextColor(153/255, 76/255, 0)
    question8.isVisible = false

    question9 = display.newText("someone is shy?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question9:setTextColor(153/255, 76/255, 0)
    question9.isVisible = false

    question10 = display.newText("someone is very excited?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question10:setTextColor(153/255, 76/255, 0)
    question10.isVisible = false

    question11 = display.newText("someone is left out?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question11:setTextColor(153/255, 76/255, 0)
    question11.isVisible = false

    question12 = display.newText("someone is annoyed with you?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question12:setTextColor(153/255, 76/255, 0)
    question12.isVisible = false

    question13 = display.newText("someone is acting grouchy?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question13:setTextColor(153/255, 76/255, 0)
    question13.isVisible = false

    question14 = display.newText("someone is tired?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question14:setTextColor(153/255, 76/255, 0)
    question14.isVisible = false

    question15 = display.newText("someone is feeling sick?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question15:setTextColor(153/255, 76/255, 0)
    question15.isVisible = false


    --answers
    hug = display.newImageRect("Images for level three/Hug.png", 180, 170)
    hug.x = display.contentWidth /1.3
    hug.y = display.contentHeight/1.2
    hug.isVisible = false
    hug.name = "hug"

    yell = display.newImageRect("Images for level three/Yell.png", 180, 190)
    yell.x = display.contentWidth /1.95
    yell.y = display.contentHeight/1.2
    yell.isVisible = false
    yell.name = "yell"

    ignore = display.newImageRect("Images for level three/Ignore.png", 200, 180)
    ignore.x = display.contentWidth /4
    ignore.y = display.contentHeight/1.2
    ignore.isVisible = false
    ignore.name = "ignore"

    tissue = display.newImageRect("Images for level three/GiveTissue.png", 200, 180)
    tissue.x = display.contentWidth /4
    tissue.y = display.contentHeight/1.18
    tissue.isVisible = false
    tissue.name = "tissue"

    happy = display.newImageRect("Images for level three/Happy.png", 200, 180)
    happy.x = display.contentWidth /1.95
    happy.y = display.contentHeight/1.2
    happy.isVisible = false
    happy.name = "happy"

    rude = display.newImageRect("Images for level three/Berude.png", 200, 180)
    rude.x = display.contentWidth /1.3
    rude.y = display.contentHeight/1.21
    rude.isVisible = false
    rude.name = "rude"

    help = display.newImageRect("Images for level three/Helpthem.png", 200, 180)
    help.x = display.contentWidth /1.3
    help.y = display.contentHeight/1.2
    help.isVisible = false
    help.name = "help"

    laugh = display.newImageRect("Images for level three/Laughatthem.png", 230, 190)
    laugh.x = display.contentWidth /4
    laugh.y = display.contentHeight/1.2
    laugh.isVisible = false
    laugh.name = "laugh"

    talk = display.newImageRect("Images for level three/Talktothem.png", 250, 200)
    talk.x = display.contentWidth /1.95
    talk.y = display.contentHeight/1.2
    talk.isVisible = false
    talk.name = "talk"

    listen = display.newImageRect("Images for level three/Listentothem.png", 230, 190)
    listen.x = display.contentWidth /4
    listen.y = display.contentHeight/1.2
    listen.isVisible = false
    listen.name = "listen"

    kind = display.newImageRect("Images for level three/Bekind.png", 230, 190)
    kind.x = display.contentWidth /1.95
    kind.y = display.contentHeight/1.2
    kind.isVisible = false
    kind.name = "kind"

    comfort = display.newImageRect("Images for level three/Comfortthem.png", 230, 190)
    comfort.x = display.contentWidth /1.3
    comfort.y = display.contentHeight/1.2
    comfort.isVisible = false
    comfort.name = "comfort"

    sleep = display.newImageRect("Images for level three/Letthemsleep.png", 230, 190)
    sleep.x = display.contentWidth /4
    sleep.y = display.contentHeight/1.18
    sleep.isVisible = false
    sleep.name = "sleep"

    annoying = display.newImageRect("Images for level three/Beannoying.png", 230, 190)
    annoying.x = display.contentWidth /1.95
    annoying.y = display.contentHeight/1.2
    annoying.isVisible = false
    annoying.name = "annoying"

    care = display.newImageRect("Images for level three/Helpthem.png", 230, 190)
    care.x = display.contentWidth /1.3
    care.y = display.contentHeight/1.2
    care.isVisible = false
    care.name = "care"


-----------------------------------------------------------------------------------------------------------------------------

    -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image ) 
    sceneGroup:insert( aidKit1 )
    sceneGroup:insert( aidKit2 )
    sceneGroup:insert( aidKit3 )
    sceneGroup:insert( correct )
    sceneGroup:insert( incorrect )
    sceneGroup:insert( question1 )
    sceneGroup:insert( question2 )
    sceneGroup:insert( question3 )
    sceneGroup:insert( question4 )
    sceneGroup:insert( question5 )
    sceneGroup:insert( question6 )
    sceneGroup:insert( question7 )
    sceneGroup:insert( question8 )
    sceneGroup:insert( question9 )
    sceneGroup:insert( question10 )
    sceneGroup:insert( question11 )
    sceneGroup:insert( question12 )
    sceneGroup:insert( question13 )
    sceneGroup:insert( question14 )
    sceneGroup:insert( question15 )
    sceneGroup:insert( hug )
    sceneGroup:insert( yell )
    sceneGroup:insert( ignore )
    sceneGroup:insert( tissue )
    sceneGroup:insert( help )
    sceneGroup:insert( rude )
    sceneGroup:insert( happy )
    sceneGroup:insert( laugh )
    sceneGroup:insert( listen )
    sceneGroup:insert( sleep )
    sceneGroup:insert( annoying )
    sceneGroup:insert( kind )
    sceneGroup:insert( talk )
    sceneGroup:insert( comfort )
    sceneGroup:insert( care )

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
        --reset lives and points 
        lives = 3
        points = 0        

        --re calls ShowAidKits and AskQuestionLevel3
        ShowAidKits()
        NewQuestionTimerL3()

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
