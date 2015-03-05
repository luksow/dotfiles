Config {
         bgColor = "black",
         fgColor = "grey",
         position = TopW L 90,
                    commands = [ Run MultiCpu ["-t CPUs: <total0>% <total1>% <total2>% <total3>% <total4>% <total5>% <total6>% <total7>%", "-p", "3", "-L","3","-H","50","--normal","grey","--high","red"] 10,
                                 Run Memory ["-t","Mem: <usedratio>%", "-p", "3", "-L","3","-H","50","--normal","grey","--high","red"] 10,
                                 Run Com "/home/luke/.xmonad/date.sh" [] "date" 10,
                                 Run Com "/home/luke/.xmonad/volume.sh" [] "volume" 10,
                                 Run Com "/home/luke/.xmonad/inet.sh" [] "inet" 50,
                                 Run BatteryP ["BAT0"] ["-t", "Bat: <acstatus> <left>% / <timeleft>", "-p", "3", "--", "-O", "AC", "-o", "<fc=red>Ex</fc>", "-f", "ADP1/online"] 30,
                                 Run ThermalZone 0 ["-t","<temp>C"] 30,
                                 Run ThermalZone 1 ["-t","<temp>C"] 30,
                                 Run StdinReader
                               ],
                    sepChar = "%",
                    alignSep = "}{",
                    template = "%StdinReader% }{ %multicpu% <fc=blue>|</fc> %memory% <fc=blue>|</fc> %battery% <fc=blue>|</fc> Therms: %thermal0% %thermal1% <fc=blue>|</fc> Vol: %volume% <fc=blue>|</fc> Inet: %inet% <fc=blue>|</fc> %date%"
       }
