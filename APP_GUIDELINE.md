Possible name: Bookmate?
Model set up(basic level)
##WENG
***Dj has_many sets, and has_many festivals through sets
***A dj has a name, genre, and rate
***A Dj can be created and attached to a new user
***A Dj can book sets at festivals only if ~> The festival has room in budget, The festival doesnt happen same time as a festival the Dj is perfomring at, 

##JEREMY
***A Festival has_many sets, and has_many Dj's through available sets
***A festival can search through available Dj's and hire them for sets during their festival
***A festival can not book a Dj they can not afford according to the rate vs available budget of Festival

--MAIN MENU
--ARE YOU A DJ? [X] DONE
--ARE YOU A PROMOTER FOR A FESTIVAL? [X] DONE
--EXIT [X] DONE

--DJ MENU
--ARE YOU A RETURNING DJ?[X] DONE -user_return method
--ARE YOU A NEW DJ? [X] DONE -new_user method
--RETURN TO MAIN MENU [X] DONE -App.main_menu

--RETURNING DJ
--PLEASE ENTER YOUR NAME [X] DONE
--SUB MENU
--CURRENT SETS [WIP]
--BOOK A SET [WIP]
--CANCEL ACCOUNT [WIP]
--EXIT/MAIN MENU

--NEW DJ
---WELCOME TO <NAME>---
---WE'LL WALK YOU ON HOW TO REGISTER AND BOOK A NEW SET---
--WHAT IS YOUR NAME?--[X] DONE
--WHAT GENRE OF EDM DO YOU PLAY?--
--WHAT IS YOUR RATE?-- [X] DONE
--THANKS FOR REGISTERING--
--> GO TO RETURNING DJ




--PROMOTER MENU
--ARE YOU A RETURNING PROMOTER?
--ARE YOU A NEW PROMOTER?
--EXIT

--RETURNING PROMOTER--
--WHAT IS YOUR NAME?--
--LIST OF FESTIVALS--
--PROMOTE A NEW FESTIVAL--
--CANCEL A FESTIVAL--
--EXIT--

--PROMOTE A NEW FESTIVAL--
--WHAT IS THE NAME OF YOUR FESTIVAL?--
--WHERE IS YOUR FESTIVAL LOCATED?--
--WHAT IS YOUR BUDGET?--
--WHEN IS YOUR FESTIVAL HAPPENING?--
--RETURN TO PROMOTER MENU--

--NEW PROMOTER--
--WHAT IS YOUR NAME?--
--GO TO RETURNING PROMOTER--
--EXIT--




