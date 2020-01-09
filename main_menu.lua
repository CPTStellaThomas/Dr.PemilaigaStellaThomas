-----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the main menu, displaying the credits, instructions & play buttons.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "main_menu"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-------------------------------------------------------------------------------------------
-- SOUNDS 
---------------------------------------------------------------------------------------------
-- bkg sound
local bkgMusic = audio.loadStream("Sounds/GameSound.mp3")
local bkgMusicChannel = audio.play(bkgMusic, {channel=6, loops= -1})

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local bkg_image
local playButton
local creditsButton
local instructionsButton
local muteButton
local unmuteButton

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "slideDown", time = 500})
end 

-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "level1_screen", {effect = "slideUp", time = 1000})
end    

local function LevelSelectTransition( )
    composer.gotoScene( "LevelSelect", {effect = "slideUp", time = 1000})
end    
----------------------------------------------------------------------------------------

-- Creating Transition Function to Instructions Page
local function InstructionsTransition( )       
    composer.gotoScene( "instructions_screen", {effect = "zoomOutInFadeRotate", time = 500})
end 

-- INSERT LOCAL FUNCTION DEFINITION THAT GOES TO INSTRUCTIONS SCREEN 

local function Mute(touch)
   if (touch.phase == "ended") then
        print("clicked on unmute")
        -- pause the sound
        audio.resume(bkgMusicChannel)
        -- set the boolean variable to be false. (Sound is now muted)
        soundOn = true
        -- hide mute button
        muteButton.isVisible = false
        -- make the unmute button visible
        unmuteButton.isVisible = true
    end
end

local function UnMute(touch)
   if (touch.phase == "ended") then
    print("Clicked on mute")
        -- pause the sound
        audio.pause(bkgMusicChannel)
        -- set the boolean variable to be false. (Sound is now muted)
        soundOn = false

        -- hide mute button
        muteButton.isVisible = true
        -- make the unmute button visible
        unmuteButton.isVisible = false
    end
end


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/MainMenu.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight


    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )


    -- Creating mute Button
    muteButton = display.newImageRect("Images/muteButton.png", 200, 200)
    muteButton.x = display.contentWidth*1.5/10
    muteButton.y = display.contentHeight*1.3/10
   

    -- Creating unmute Button
    unmuteButton = display.newImageRect("Images/unmuteButton.png", 200, 200)
    unmuteButton.x = display.contentWidth*1.5/10
    unmuteButton.y = display.contentHeight*1.3/10
   


    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight*2/4.7,
            height = 200, 
            width = 200,
           
            -- Insert the images here
            defaultFile = "Images/PlayButtonUnPressed.png",
            overFile = "Images/PlayButtonPressed.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = LevelSelectTransition          
        } )

    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*6/8,
            y = display.contentHeight*6.5/8,

            -- Insert the images here
            defaultFile = "Images/CreditsButtonUnPressed.png",
            overFile = "Images/CreditsButtonPressed.png",
            height = 150,
            width = 300,

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 
    
    -----------------------------------------------------------------------------------------

    -- Creating Instructions Button
    instructionsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*2/8,
            y = display.contentHeight*6.5/8,
            height = 150,
            width = 300,

            -- Insert the images here
            defaultFile = "Images/InstructionsButtonUnPressed.png",
            overFile = "Images/InstructionsButtonPressed.png",

            -- When the button is released, call the Credits transition function
            onRelease = InstructionsTransition
        } ) 
    -- ADD INSTRUCTIONS BUTTON WIDGET

    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
    sceneGroup:insert( playButton )
    sceneGroup:insert( creditsButton )
    sceneGroup:insert( instructionsButton )
    sceneGroup:insert( muteButton )
    sceneGroup:insert( unmuteButton )
    
    
    -- INSERT INSTRUCTIONS BUTTON INTO SCENE GROUP

end -- function scene:create( event )   



-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then 
        muteButton:addEventListener("touch", Mute)
        unmuteButton:addEventListener("touch", UnMute)

        --print("DAVID")

        if (soundOn == true) then
            --print("SoundOn")
            muteButton.isVisible = false
            unmuteButton.isVisible = true   
            audio.resume(bkgMusicChannel)

        else
            muteButton.isVisible = true
            unmuteButton.isVisible = false
            audio.pause(bkgMusicChannel)
        end
        
    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        --audio.stop(bkgMusicChannel)

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        audio.pause(bkgMusicChannel)
        muteButton:removeEventListener("touch", Mute)
        unmuteButton:removeEventListener("touch", UnMute)
    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

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