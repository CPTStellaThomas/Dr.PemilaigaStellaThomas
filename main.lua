-----------------------------------------------------------------------------------------
-- Title: SampleVideoGame
-- Name: Stella Armstrong
-- Course: ICS2O
-- This program...
-----------------------------------------------------------------------------------------

-- Hiding Status Bar
-- HIDE THE STATUS BAR
soundOn = true
-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen
composer.gotoScene( "splash_screen" )