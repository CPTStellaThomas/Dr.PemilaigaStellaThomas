-- test
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the splash screen of the game. It displays the 
-- company logo that...
-----------------------------------------------------------------------------------------

-- sets the background colour
--display.setDefault("background", 255/255, 255/255, 204/255)

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local companyLogo
local topLeft
local topRight
local bottomLeft
local bottomRight
local scrollSpeed = 6

-------------------------------------------------------------------------------------------
-- SOUNDS 
---------------------------------------------------------------------------------------------
-- intro sound / background
local introSound = audio.loadSound("Sounds/IntroSound.mp3")
local introSoundChannel

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- The function that moves the beetleship across the screen
local function moveTopLeft()
	topLeft.x = topLeft.x + scrollSpeed
	topLeft.y = topLeft.y + scrollSpeed

	-- make top left peice come to center from top left corner
	if(topLeft.x == 300) then 
		scrollSpeed = 0
		topLeft.isVisible = false
	end

	if(topLeft.y == 300) then 
		scrollSpeed = 0
		topLeft.isVisible = false
	end
end

local function moveTopRight()
    topRight.x = topRight.x - scrollSpeed
    topRight.y = topRight.y + scrollSpeed

    -- make top right peice come to center from top right corner
	if(topRight.x == 300) then 
		scrollSpeed = 0
		topRight.isVisible = false
	end

	if(topRight.y == 300) then 
		scrollSpeed = 0
		topRight.isVisible = false
	end
end

local function moveBottomLeft()
    bottomLeft.x = bottomLeft.x + scrollSpeed
    bottomLeft.y = bottomLeft.y - scrollSpeed

    -- make bottom left peice come to center from bootom left corner
	if(bottomLeft.x == 300) then 
		scrollSpeed = 0
		bottomLeft.isVisible = false
	end
	if(bottomLeft.y == 300) then 
		scrollSpeed = 0
		bottomLeft.isVisible = false
	end
end

local function moveBottomRight()
    bottomRight.x = bottomRight.x - scrollSpeed
    bottomRight.y = bottomRight.y - scrollSpeed

    -- make bottom right peice come to center from bottom right corner
	if(bottomRight.x == 300) then 
		scrollSpeed = 0
		bottomRight.isVisible = false
	end

	if(bottomRight.y == 300) then 
		scrollSpeed = 0
		bottomRight.isVisible = false
	end
end

local function animation( event )
    -- make logo rotate
    companyLogo:rotate(5)

    -- make logo fade out
    companyLogo.alpha = companyLogo.alpha - 0.008
    companyLogo.xScale = companyLogo.xScale - 0.003
    companyLogo.yScale = companyLogo.yScale - 0.003
end

-- make function to show company logo once the four sections meet the center of the screen
local function showCompanyLogo()
    companyLogo.isVisible = true
    bottomRight.isVisible = false
    bottomLeft.isVisible = false
    topRight.isVisible = false
    topLeft.isVisible = false
end

-- timer for when it displays company logo and animation 
local function timerLogo()
    timer.performWithDelay(875, showCompanyLogo)
    timer.performWithDelay(1000, animation)
end

-- The function that will go to the main menu 
local function gotoMainMenu()
    composer.gotoScene( "main_menu" )
end
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    display.setDefault("background", 255/255, 255/255, 204/255)


 -- Insert the four peices / sections images and company logo
    topLeft = display.newImageRect("Images/TopLeft.png", 200, 200)
    topRight = display.newImageRect("Images/TopRight.png", 200, 200)
    bottomLeft = display.newImageRect("Images/BottomLeft.png", 200, 200)
    bottomRight = display.newImageRect("Images/BottomRight.png", 200, 200)
    companyLogo = display.newImageRect("Images/CompanyLogo.png", 450, 450)
    companyLogo.x = display.contentWidth/2
    companyLogo.y = display.contentHeight/2
    companyLogo.isVisible = false

    -- set the initial x and y position of the peices / sections
    topLeft.x = 110
    topLeft.y = 0

    topRight.x = display.contentWidth -110
    topRight.y = 0

    bottomLeft.x = 110
    bottomLeft.y = display.contentHeight

    bottomRight.x = display.contentWidth -110
    bottomRight.y = display.contentHeight

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( topLeft )
    sceneGroup:insert( topRight )
    sceneGroup:insert( bottomLeft )
    sceneGroup:insert( bottomRight )

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

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

    elseif ( phase == "did" ) then

        -- Call the peices / sections, timer logo and sound as soon as we enter the frame.
        Runtime:addEventListener("enterFrame", moveTopLeft)
		Runtime:addEventListener("enterFrame", moveTopRight)
		Runtime:addEventListener("enterFrame", moveBottomLeft)
        Runtime:addEventListener("enterFrame", moveBottomRight)
		Runtime:addEventListener("enterFrame", timerLogo)
        introSoundChannel = audio.play(introSound, {channel = 4}) 
        timer.performWithDelay ( 3000, gotoMainMenu)

    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        -- call sound to stop
        audio.stop(introSoundChannel)
        Runtime:removeEventListener("enterFrame", moveTopLeft)
        Runtime:removeEventListener("enterFrame", moveTopRight)
        Runtime:removeEventListener("enterFrame", moveBottomLeft)
        Runtime:removeEventListener("enterFrame", moveBottomRight)
        Runtime:removeEventListener("enterFrame", timerLogo)
        
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
-- return to scene 
return scene