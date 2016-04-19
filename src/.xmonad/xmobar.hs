Config {
    font = "xft:Migu 1M:size=13",
    bgColor = "black",
    fgColor = "white",
    position = TopSize C 100 20,
    lowerOnStart = False,
    overrideRedirect = False,
    border = NoBorder,
    borderColor = "#26a69a",
    commands = [
        Run DynNetwork [
            "--template" , "<dev>: <icon=/home/ytet5uy4/.xmonad/icons/up.xbm/><tx>kB/s <icon=/home/ytet5uy4/.xmonad/icons/down.xbm/><rx>kB/s ",
            "--Low"      , "1000",
            "--High"     , "5000",
            "--low"      , "white",
            "--normal"   , "white",
            "--high"     , "darkred"
        ] 10,
        Run Memory [
            "-t", " <icon=/home/ytet5uy4/.xmonad/icons/mem.xbm/> <usedratio>% ",
            "-L", "40",
            "-H", "90",
            "-m", "2",
            "--normal", "#ffffff",
            "--high" , "#f44336"
        ] 10,
        Run Battery [
            "-t" , " <icon=/home/ytet5uy4/.xmonad/icons/battery.xbm/> <acstatus> ",
            "-L", "20",
            "-H", "80",
            "--low", "#f44336",
            "--normal", "#ffffff",
            "--",
            "-o", "<left>% (<timeleft>)",
            "-O", "Charging <left>%",
            "-i", "<left>%"
        ] 10,
        Run Date " %a %m/%d %T" "date" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = " %StdinReader% }{ %dynnetwork%|%memory%|%battery%|%date% "
}