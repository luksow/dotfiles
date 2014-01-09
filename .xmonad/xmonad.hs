import System.IO
import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Layout.Fullscreen hiding (fullscreenEventHook)
import XMonad.Layout.Minimize
import XMonad.Layout.NoBorders
import XMonad.Layout.ToggleLayouts
import XMonad.Prompt
import XMonad.Prompt.RunOrRaise
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.Run (spawnPipe)

spawnStartupApps = do
  spawn "sudo ldm -g 100 -u 1000 &"
  spawn "wicd-gtk --tray &"
  spawn "while true; do ping google.com -c1; if [ $? == 0 ]; then break; fi; sleep 5; done; dropboxd &"

main = do
  spawn "/home/luke/scripts/vga-toggle &"
  spawn "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x000000 --height 20 --monitor primary &"
  spawn "(setxkbmap pl; xmodmap -e \"keycode 248 = 0x1008FF40\")&"
  xmpproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
  spawnStartupApps
  xmonad $ defaultConfig { startupHook = setWMName "LG3D"
                         , terminal = "gnome-terminal"
                         , manageHook = manageDocks <+> manageSpawn <+> manageHook defaultConfig
                         , layoutHook = (toggleLayouts $ noBorders (fullscreenFull Full)) $ smartBorders $ avoidStruts $ minimize $ layoutHook defaultConfig
                         , logHook = dynamicLogWithPP xmobarPP { ppOutput = hPutStrLn xmpproc
                                                               , ppTitle = xmobarColor "green" "" . shorten 120
                                                               }
                         , modMask = mod4Mask
                         , handleEventHook = fullscreenEventHook
                         } `additionalKeys`
             [ ((0, xK_Print), spawn "scrot")
             , ((0, xK_F2), runOrRaisePrompt defaultXPConfig)
             , ((mod4Mask, xK_m), withFocused minimizeWindow)
             , ((mod4Mask .|. shiftMask, xK_m), sendMessage RestoreNextMinimizedWin)
             , ((mod1Mask, xK_F4), withFocused killWindow)
             , ((mod4Mask, xK_F11), sendMessage ToggleLayout)
             , ((shiftMask .|. controlMask, xK_x), spawn "gnome-terminal")
             , ((0, 0x1008ff12), spawn "amixer -q set Master toggle")
             , ((0, 0x1008ff11), spawn "amixer -q set Master 5- unmute")
             , ((0, 0x1008ff13), spawn "amixer -q set Master 5+ unmute")
             , ((0, 0x1008ff06), spawn "~/scripts/kbd-backlight-down")
             , ((0, 0x1008ff05), spawn "~/scripts/kbd-backlight-up")
             , ((0, 0x1008FF40), spawn "chromium")
             ]
