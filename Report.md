# Space Survivors – Team 17

## Introduction (250 Words)
	
(Describe the game, what it is based on, and what makes it novel) 

Our game is a single player arcade style game with advanced enemy AI systems. The main inspiration for our game was the idle game Vampire Survivors, which is played from a top-down perspective and features the player being attacked by relentless waves of enemies. While Vampire Survivors is idle, requiring no input from the player for attacks, we decided to make gameplay more engaging by allowing the player to use quick responsive movement and limited weaponry to try and survive the horde. By taking advantage of the individual skills of the members of our team using agile development techniques, we were able to get a minimum viable product working very quickly, so we could put more emphasis on polishing the game and upgrading our prototype to include advanced features such as boid flocking AI, computationally efficient graphics and dynamic backgrounds to make movement feel extremely satisfying, and the game more immersive.

## Requirements (750 Words)
	
(Use case diagrams, user stories, early stage design, ideation process, how did we decide what to develop?) 

At the start of the development process, we had an in-person meeting where we each pitched several games on which we could base our project, from a variety of genres. Our first idea for a game was going to be an action-packed shoot-em-up like Hotline Miami, except with destructible terrain and furniture. While this would have been exciting, we felt that there was not enough potential to add a twist to the game, as any changes we added would not provide the individuality we desired. One member of our team was playing Vampire Survivors during our meeting, which immediately intrigued us. The game was simple enough that it would be easy to recreate, and provided enormous potential for expansion. To this end, we decided a space theme would be ideal for our game, as it had greater potential for exciting features in a zero-gravity environment. To ascertain the requirements of our new game Space Survivors, we created a paper prototype as pictured below, and set to work on preparing a use-case diagram and specification for our new project.

### Use Case Specification:

#### User Stories:

As the developers of the game, we want to make a game that is actually good, with elements that are cohesive and engaging to implement. We want to use tech which interests us and we haven’t used before, to make us better developers.

As a player, I want the game to be as intuitive as possible, so I can see as much of the game as possible to give a fair mark for it. I want the game to be enjoyable, pretty, and with technically impressive aspects. I want a clear indication of three challenges, and a clear twist that separates this game out from other projects and the game used for inspiration.

As a non-gamer, I need the game to have an extensive tutorial, and the game to have a casual mode that I can enjoy. It should be easy to learn hard to master, and I should be able to restart quickly for the next attempt. I'd quite like a story, so I can enjoy the game in short bursts on the bus etc. 

As a competitive gamer, I want depth of mechanics, with lots of potential for me to show my skills. I want there to be a high skill ceiling that makes my run engaging to watch and perform. Maybe an infinite mode that just gets unfairly hard so I can impress people.

As a normal gamer, I want a game that is easy to learn. I want nice graphics, and a game I can just enjoy with immersive gameplay with satisfying physics. I do not want a scoring system, because I just want to enjoy it and not have a competition with anyone but myself.

#### Use Case Reflection:

After identifying our stakeholders, we found a number of issues which would mold our development process. The first of which relates to how we can make our game cater to people who have limited experience playing computer games, and those who have a limited time to experience them (i.e. those marking our work). It became clear that the most important characteristic our game should have is it should be very intuitive. Having analysed the use cases, I found the main way to do this was to have as much instruction as possible for the player, and provide multiple difficulty options for the user to choose from. Instructions could just be added to the main menu for players to read, but in this case, we have decided to provide tips to the player as they play the game to guide them through their first playthrough, so they can get the hang of it. We also thought it would be a good idea to provide explicit hints to the player relating to the objective of the game, such as drawing attention to the timer, and warnings about the enemies about to come onto the screen. We realised that while it would be nice to make the game as aesthetically pleasing as possible, it will be more important to make it obvious to players what each icon represents, and the objective of the game at the same time.

## Design (750 Words)
	
(system architecture, class diagrams, behavioural diagrams)

## Implementation (750 Words)

(describe implementation of the game, in particular the three challenges) 

The first challenge we faced during the development of Space Survivors was how to make the enemies’ AI more advanced. While in Vampire Survivors, the enemies are relatively sparse and the AI just seems to home in on the player, we wanted to take a more advanced approach. We felt more enemies were needed to improve immersion and provide a feeling that the player is overwhelmed, which increases the perception that the player is skilled at the game as opposed to simply exploiting the mechanics. We also felt that the enemies needed to feel more organic, with a depth of AI that made them seem more intelligent and strategic, which Freya implemented using a flocking boid system.

The main objective of the game changed drastically over time, starting with a rhythm-based game where the player’s movement and damage would be enhanced if the player performed actions in sync with the music. We eventually abandoned this idea, as we felt the music generated by the player’s actions was not immersive, and AI would be a much more engaging challenge to tackle. Feedback from players at this stage in development indicated that the game seemed to have no objective, and the rhythm elements were not intuitive. Ultimately, we decided to move away from this concept.

Next, we adjusted our game to evolve beyond the rhythm game concept, using the flocking AI to to make a space survival game. We reused the base mechanics from the original game, such as the movement and weapons, while updating the AI systems. This resulted in a final product that was much more polished than the first example, but players noted that the game still did not seem to have a clear objective; the gameplay itself was fun, but there was little incentive to play more.

In our final implementation of the game, we made adding an objective to the game a top priority, and changed the concept of the game again. We ended up making the objective of the game to destroy three ‘Boid Duplicators’ around the play area, under a strict time limit. These duplicators would continuously create new enemies that would chase the player when in line of sight, and obstruct the player’s path and intercept their bullets, making the game harder. We found through user testing that the new UI elements and objective made the game much more enjoyable, as well as more intuitive.

Our main three challenges are:

- How do we convey a satisfying sense of movement when the player is fixed at the centre of the screen?
- How do we make the enemies feel intelligent and organic?
- How do we handle large quantities of enemies in a computationally efficient manner?

## Evaluation (750 Words)

(1 quant, 1 qual, description of how code was tested)

We have made a questionnaire in the workshop and invited n(number of people) people to answer the questionnaire after they had played our game. They will give a mark from 1-5 to the 10 questions in the questionnaire. They questions is mainly about usability, easy of learning and system complexity. The statistical results shows that (sorry I don’t have the data so I cant write this part)(maybe like: the mean mark of question 1 is 5 and it shows a strong evidence of easy to use of our game ??) .

From our user stories, we knew we wanted our game to appeal to two categories of gamer: those who wanted to have a more casual experience (similar to Vampire Survivors, the game we used for inspiration), and those who wanted to really test their skills (such as competitive gamers). We decided to implement these two levels through the introduction of two difficulty levels: ‘Normal’ and ‘Insane’. There are relatively few differences between these modes, which we feel puts the game in the category of “easy to learn, hard to master”. The ‘Normal’ difficulty has reduced amounts of enemies which move at a lower speed, and the player also has more health. This makes the game more relaxing to play, while still posing enough of a challenge that the game feels satisfying and the player feels they are getting more skilled.

The ‘Insane’ difficulty, on the other hand, is where we intend for players to really test their skills, and it was a challenge to make the mode not feel ‘unfair’. This mode features extremely large numbers of enemies that move very quickly, while the player moves more slowly and movement options are more limited. We wanted this mode of the game to feel more satisfying and appear more engrossing to watch and play.

With these two difficulty levels in place, we decided to conduct qualitative and quantitative analyses. This would allow us to see whether the ‘Normal’ difficulty of the game was approachable to casual gamers, and whether the ‘Insane’ mode of the game was too much of a step up in difficulty or not.

We also conducted these analyses at multiple stages of development; before the Easter break, and after. Over the Easter break, we used the results of the first analyses we did and used them to inform our game design decisions during our sprints. The methodology of these evaluations is shown below:
### Qualitative Analysis
#### Think Aloud Evaluation
When we created our first prototype, we conducted a think aloud evaluation where users would play our game, and explain their thought processes throughout. Afterwards, we asked users about their general thoughts about their gameplay experience, and what they felt could be improved upon. 
Overall Feedback from Think Aloud Evaluation:
Negatives - people seemed to think the game’s controls were unintuitive. The objective of the game was not adequately explained to the player, and the players were not made aware of weaponry and the movement options at their disposal. Many felt that the UI elements were not clear, and frequently asked what different parts of the UI represented.
Positives - people seemed to think the concept of the game was interesting, and once they understood the controls, the game was engaging and fun.
This early feedback for our game was immensely useful for us. It helped us realise that while the concept and gameplay of our game was interesting and engaging, there was a lot more we could do to make the users feel more comfortable playing. In its early state, the game is mechanically sound but is not exactly “pick-up-and-play”, which we immediately sought to act upon in later revisions.
#### Heuristic Evaluation
In our Heuristic Analysis, which focussed greatly on the accessibility of our project from the perspective of software design best practices, we learned even more useful information which would help develop our game moving forward:
User #1:
H1: Liked the menu with usefully highlighted buttons
H2: Liked the intuitive nature of the health bar
H3: This user felt the game was extremely difficult to begin with, and thought the games difficulty should start slower at first to let the user get a feel for the game before it gets more difficult
H1: The user felt elements of the UI needed some work; felt the purpose of some elements of the UI was unclear
H10: No documentation or tooltips, which would make the game very difficult to get into for someone who does not game frequently.
User #2:

Our first method of quantitative analysis was the System Usability Scale (SUS). We asked ten users to play the game on two different difficulty levels: ‘Normal’ and ‘Insane’ (our low and high difficulties). After playing the game, we asked the users to fill in the SUS questionnaire, which asks the following questions, to which the user would respond by selecting to what extent they agree with the statements presented to them:

-I think I would like to use this system frequently

-I found the system unnecessarily complex

-I thought the system was easy to use

-I think I would need the support of a technical person to be able to use this system

-I found the various functions in this system were well integrated

-I thought there was too much inconsistency in this system

-I would imagine that most people would learn to use this system very quickly

-I found the system very cumbersome to use

-I felt very confident using this system

-I needed to learn a lot of things before I could get going with this system


The result (the mean average of the SUS scores for the individual members) for the ‘Normal’ mode of the system was 68.25, and the result for the ‘Insane’ difficulty option was 63.75. 
The result for the ‘Normal’ mode of the system was above the average score for a SUS evaluation, which means our product, at least in this mode, can be considered to be usable. 
The ‘Insane’ mode score was lower than we were expecting, but provided us with great insight of the changes that needed to be made, when we made comparisons between the ‘Normal’ and ‘Insane’ modes. Among the things we adjusted were:
Normal Mode:
Increased enemy and speed in lower difficulties
Insane Mode:
Lowered enemy frequency and speed in higher difficulties
System-Wide:
Added tooltips to help users learn the controls of the game from the start
Added documentation for the game as well as a tutorial to help players get to grips with the game’s mechanics before playing
Cleaned up the UI of the game to make it more intuitive
How code was tested
We use two different testing models to test our codes.
The first is the White-box testing, we have done this kind of testing by ourself. Once we finished a function block of the game, we tried to run every line of the code, and make sure they were working correctly. To make sure the program run as a complete whole, we also tested possible interactions between every block in the project by following the logical paths .
Next, we did some Black-box testing, we tested all possible processes that a user might do in the game. Also, we tested some common problems in the program, like keyboard conflict and illegal input. We invited people from other groups to play our game, told them to play our game in an irrational way and tried to find out bugs in our game.


## Process (750 Words)

(teamwork, how did we work together)

## Conclusion (500 Words)
