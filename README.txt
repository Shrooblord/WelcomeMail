Welcome Mail - v1.0

====

This causes a welcome e-mail to show up to players who are new to the server.
http://i.imgur.com/Kspu1m4.png

====

MODIFYING THE E-MAIL (SERVER OWNERS):

You can change the contents of the e-mail, including the amount of resources the joining player will receive, by modifying the appropriate lines of code in the file /mods/WelcomeMail/scripts/player/welcomeMail.lua :

[code]
invokeServerFunction("setTranslatedMailText",
                     "Some Assets to Help You Get Rolling"%_t,  --message header
                     WelcomeMail.generateWelcomeMailText(Player().index),
                     "Shrooblord /* The owner of this galaxy. Wait, what? */"%_t)   --sender
invokeServerFunction("generateWelcomeMailAttachments",
                      50,  --money
                      100,  --iron
                      200,  --titanium
                      300,  --naonite
                      400,  --trinium
                      500,  --xanion
                      600,  --ogonite
                      700)  --avorion

local welcome_text = [[Welcome, ${player},

We see you are new here. Good to have you on board!
Included in this e-mail is a bit of a start-up capital for you to work with.
We hope this will help you get going more easily, and give you a little bit
of a leg-up in this dangerous Galaxy... good luck out there!
    
May our paths once cross. Until then!

Best wishes,


Your Galactic Overlords
]]%_t
[/code]

====

INSTALLATION INSTRUCTIONS:

This mod needs to be installed on both client and server.

Unzip the contents of this .ZIP file into your (...)/Avorion/ installation directory.

Modify (...)/Avorion/data/scripts/server/server.lua in the following way:

Insert this code inside the onPlayerLogIn call.
    
    player:addScriptOnce("mods/WelcomeMail/scripts/player/welcomeMail.lua")                                   --WelcomeMail

If you had a vanilla server.lua file, that function will now look like this:

    function onPlayerLogIn(playerIndex)
        local player = Player(playerIndex)
        Server():broadcastChatMessage("Server", 0, "Player %s joined the galaxy"%_t, player.name)

        player:addScriptOnce("headhunter.lua")
        player:addScriptOnce("eventscheduler.lua")
        player:addScriptOnce("story/spawnswoks.lua")
        player:addScriptOnce("story/spawnai.lua")
        player:addScriptOnce("story/spawnguardian.lua")
        player:addScriptOnce("story/spawnadventurer.lua")
        player:addScriptOnce("mods/WelcomeMail/scripts/player/welcomeMail.lua")                                   --WelcomeMail

        matchResources(player)
    end

You're done! Have fun playing. :)

**NOTE**: A side effect of having to install this mod on both client and server means that new Galaxies created in singleplayer will also trigger the Welcome Mail. I'm looking into how to prevent this from happening.
