#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir% 
#singleinstance force
#Persistent

;made with <3
;by amComma

ClipboardChangeFunction()
{
    website := RegExReplace(clipboard, "iS)(^https?\:\/\/)(www\.)?([\w\d\.]+\.[\w\d]{2,4})\/.+$", "$3")
    switch website
    {
        case "twitter.com":
            clipboard := RegExReplace(clipboard, "iS)(https?\:\/\/)(twitter\.com)(\/\w+\/status\/\d+)((\?.+)|\/photo.+)?", "$1twittpr.com$3")
            sleep 125
            return
        case "preview.redd.it":
            clipboard := RegExReplace(clipboard, "iS)(https?\:\/\/)(preview)(\.redd[!-~]+\.\w{3,4})([!-~]*)", "$1i$3")
            sleep 125
            Return
        case "pbs.twimg.com":
            clipboard := RegExReplace(clipboard, "iS)(^https?\:\/\/)(pbs\.twimg\.com\/media\/)(.+name\=)([\d\w]+)(\&[!-~]+)?", "$1$2$3orig$5")
            sleep 125
            Return
        case "reddit.com":
        ; ok so Reddit is kinda complicated, we can't just let it go like previous sites., 
            if InStr(clipboard,"/comment/")
            {
                clipboard := RegExReplace(clipboard, "iS)(^https?\:\/\/)(?:www\.)?(reddit\.com)(?:\/r\/)(?:[\w\d]+\/){2}([\w\d]+)(?:\/comment\/)([\w\d]+)(?:.+)?$", "$1reddit.com/comments/$3/-/$4")
            }
            else {
                clipboard := RegExReplace(clipboard, "iS)(^https?\:\/\/)(?:www\.)?(reddit\.com)(?:\/r\/)(?:[\w\d]+\/){2}([\w\d]+)(\/[!-~]+)?", "$1redd.it/$3")   
            }
            sleep 125
            Return
    }
}


OnClipboardChange("ClipboardChangeFunction")