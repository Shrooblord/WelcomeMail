Welcome Mail - v1.1

====

This causes a welcome e-mail to show up to players who are new to the server.
http://i.imgur.com/Kspu1m4.png

====

MODIFYING THE E-MAIL (SERVER OWNERS):

You can change the contents of the e-mail, including the amount of resources the joining player will receive, by modifying the appropriate lines of code in the file /data/scripts/player/welcomeMail.lua :

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
