---------------------------------------------------------------- level1_screen.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the level 1 screen of the game.
---------------------------------------------------------------
-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "LevelSelect"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )


-----------------------------------------------------------------------------------------
-- FORWARD REFERENCES
-----------------------------------------------------------------------------------------

-- local variables for the scene
local bkg
local level1Button
local level2Button
local level3Button
local level4Button

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transitioning Function back to level1
local function Level1Transition( )
    composer.gotoScene( "level1_screen", {effect = "zoomOutIn", time = 500})
end

-- Creating Transitioning Function back to level2
local function Level2Transition( )
    composer.gotoScene( "level2_screen", {effect = "zoomOutIn", time = 500})
end

-- Creating Transitioning Function back to level3
local function Level3Transition( )
    composer.gotoScene( "level3_screen", {effect = "zoomOutIn", time = 500})
end

-- Creating Transitioning Function back to level4
local function Level4Transition( )
    composer.gotoScene( "level4_screen", {effect = "zoomOutIn", time = 500})
end
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND AND DISPLAY OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg = display.newImage("Images for level three/BKG.png")
    bkg.x = display.contentCenterX
    bkg.y = display.contentCenterY
    bkg.width = display.contentWidth
    bkg.height = display.contentHeight
   
    -- Associating display objects with this scene 
    sceneGroup:insert( bkg )

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------

    -- Creating Back Button
    level1Button = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth/2,
        y = display.contentHeight*.7/6,

        -- Setting Dimensions
        width = 400,
        height = 150,

        -- Setting Visual Properties
        defaultFile = "Images for level three/Level1.png",
        overFile = "Images for level three/Level1Pressed.png",

        -- Setting Functional Properties
        onRelease = Level1Transition

    } )
-------------------------------------------------------------------------------
        -- Creating Back Button
    level2Button = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth/2,
        y = display.contentHeight*2.3/6,

        -- Setting Dimensions
        width = 400,
        height = 150,

        -- Setting Visual Properties
        defaultFile = "Images for level three/Level2.png",
        overFile = "Images for level three/Level2Pressed.png",

        -- Setting Functional Properties
        onRelease = Level2Transition

    } )
-------------------------------------------------------------------------------------
        -- Creating Back Button
    level3Button = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth/2,
        y = display.contentHeight*3.8/6,

        -- Setting Dimensions
        width = 400,
        height = 150,

        -- Setting Visual Properties
        defaultFile = "Images for level three/Level3.png",
        overFile = "Images for level three/Level3Pressed.png",

        -- Setting Functional Properties
        onRelease = Level3Transition

    } )

    -----------------------------------------------------------------------------------------
        -- Creating Back Button
    level4Button = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth/2,
        y = display.contentHeight*5.3/6,

        -- Setting Dimensions
        width = 400,
        height = 150,

        -- Setting Visual Properties
        defaultFile = "Images for level three/Level4.png",
        overFile = "Images for level three/Level4Pressed.png",

        -- Setting Functional Properties
        onRelease = Level4Transition

    } )

    -- Associating Buttons with this scene
    sceneGroup:insert( level1Button )
    sceneGroup:insert( level2Button )
    sceneGroup:insert( level3Button )
    sceneGroup:insert( level4Button )
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end

end

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

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end

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