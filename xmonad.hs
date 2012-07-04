--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--
 
import XMonad
import XMonad.Actions.CycleWS

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops   -- fullscreenEventHook fixes chrome fullscreen
import XMonad.Hooks.FadeInactive

-- import XMonad.Layout.Reflect
import XMonad.Layout.Gaps -- necessary for toggleStruts
import XMonad.Layout.WindowNavigation
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders     -- smartBorders removes border when only one client or when client if FullScreen

import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP)

import System.IO

import qualified XMonad.StackSet as W

 
main = do
    xmproc <- spawnPipe "xmobar"	
    xmonad $ defaultConfig {
                 terminal           = "urxvt",
                 modMask            = mod4Mask,
                 normalBorderColor  = "#000000",
                 focusedBorderColor = "#dddddd",
                 layoutHook         = avoidStruts $ smartBorders myLayout,
		 handleEventHook    = fullscreenEventHook,
                 manageHook         = manageDocks <+> manageHook defaultConfig,
                 logHook            = dynamicLogWithPP $ xmobarPP
                                         { ppOutput = hPutStrLn xmproc
                                         , ppTitle  = xmobarColor "green" "" . shorten 100
                                         }
             } `additionalKeysP` [("C-M1-o", spawn "urxvtc")
                                 ,("C-M1-b", spawn "chromium")
                                 ,("C-S-l", spawn "xscreensaver-command -lock")
				 -- Workspace Switching
                                 ,("M4-<Left>", prevWS)
                                 ,("M4-<Right>", nextWS)
                                 ,("S-M4-<Left>", shiftToPrev)
                                 ,("S-M4-<Right>", shiftToNext)
				 -- Toggle xmobar with Mod-b
				 ,("M4-b", sendMessage ToggleStruts)
				 -- volume control.
				 , ("<XF86AudioMute>", spawn "amixer -q set Master toggle")
				 , ("<XF86AudioLowerVolume>", spawn "amixer -q set Master 5%- unmute")
				 , ("<XF86AudioRaiseVolume>", spawn "amixer -q set Master 5%+ unmute")
                                 ]

myManageHook :: ManageHook
myManageHook = composeAll . concat $
             [ [className =? c     --> doCenterFloat | c <- myFloats ]
             ]
             where                                  
             myFloats = ["feh", "wicd-client.py","wicd-gtk.py", "wicd","wicd-client","monitor","monitor.py"]
                                 
myLayout = tiled ||| Mirror tiled ||| Full  
 where  
      -- default tiling algorithm partitions the screen into two panes  
      tiled = Tall nmaster delta ratio  
   
      -- The default number of windows in the master pane  
      nmaster = 1  
   
      -- Default proportion of screen occupied by master pane  
      ratio = 2/3  
   
      -- Percent of screen to increment by when resizing panes  
      delta = 5/100  
   