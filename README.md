# Space Survivors – Team 17

![spacegamelogo](https://github.com/UoB-COMSM0110/2024-group-17/assets/145852911/01ad03bd-76e4-4197-b228-c6468f39c393)

![TeamPhoto](https://github.com/UoB-COMSM0110/2024-group-17/assets/145852911/615dc998-de39-4980-b73a-0b89b2777f09)


## Introduction (250 Words)
	
(Describe the game, what it is based on, and what makes it novel) 

Our game is a single player arcade style game with advanced enemy AI systems. The main inspiration for our game was the idle game Vampire Survivors, which is played from a top-down perspective and features the player being attacked by relentless waves of enemies. While Vampire Survivors is idle, requiring no input from the player for attacks, we decided to make gameplay more engaging by allowing the player to use quick responsive movement and limited weaponry to try and survive the horde. By taking advantage of the individual skills of the members of our team using agile development techniques, we were able to get a minimum viable product working very quickly, so we could put more emphasis on polishing the game and upgrading our prototype to include advanced features such as boid flocking AI, computationally efficient graphics and dynamic backgrounds to make movement feel extremely satisfying, and the game more immersive.

## Requirements (750 Words)
	
(Use case diagrams, user stories, early stage design, ideation process, how did we decide what to develop?) 

At the start of the development process, we had an in-person meeting where we each pitched several games on which we could base our project, from a variety of genres. Our first idea for a game was going to be an action-packed shoot-em-up like Hotline Miami, except with destructible terrain and furniture. While this would have been exciting, we felt that there was not enough potential to add a twist to the game, as any changes we added would not provide the individuality we desired. One member of our team was playing Vampire Survivors during our meeting, which immediately intrigued us. The game was simple enough that it would be easy to recreate, and provided enormous potential for expansion. To this end, we decided a space theme would be ideal for our game, as it had greater potential for exciting features in a zero-gravity environment. To ascertain the requirements of our new game Space Survivors, we created a paper prototype as pictured below, and set to work on preparing a use-case diagram and specification for our new project.

### Use Case Specification:

### Use Case Diagram:

![SpaceUseCaseDiagram](https://github.com/UoB-COMSM0110/2024-group-17/assets/145852911/34966264-9622-4e63-b96e-904f9d99bee5)

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

### System architecture
In the realm of video game development, architecture is not merely a framework—it is the foundation that supports every aspect of the game's creation and execution. Our game is built on a carefully planned architecture that balances complexity with performance. This architecture is designed to facilitate smooth gameplay experiences while accommodating future expansions and updates.

### Game Engine
Our game is designed by Processing as need. Processing's architecture enables us to seamlessly integrate visual elements and game logic, ensuring that creative and technical components coexist harmoniously. Based on this framework, we were able to build the program effectively, allowing each team member to seamlessly accommodate and implement complex game mechanics.

#### Game Component
There are several core components and supportive components in our game.

#### Core Component
Our 'main' class serves as the central hub of our game, functioning as the game manager. It is pivotal in facilitating player interaction and managing core gameplay mechanics. This class includes essential methods such as ‘keyPressed’ and ‘keyReleased’ to handle player inputs, enabling responsive gameplay. Additionally, it contains methods specifically designed to manage camera movements, enhancing the player's visual experience during the game. These methods ensure smooth transitions and adjustments of the camera's perspective, crucial for maintaining engagement and providing a dynamic viewing angle.

Another fundamental component of our game architecture is the 'Screen' abstract class. It encapsulates a crucial method, ‘justDrawLoop’, which is continuously executed to redraw the screen during gameplay. This method ensures that the game's visual elements are updated in real-time, maintaining fluidity and responsiveness. Building upon this abstract class, various specific screen states extend 'Screen' to display different types of information to the player. These derived classes tailor the user interface to reflect diverse game scenarios and feedback, enhancing the player's interaction and experience with the game.

'Collideable' abstract class is also a core component of our architecture. Though this class primarily contains a set of variables and a single method, dealDamage, its importance cannot be understated. It serves as the foundation for collision detection in our game. We implement collisions by defining each game object as a circle and detecting overlaps in their radii to determine a collision. Classes that extend 'Collideable', such as 'Enemy' and 'Asteroid', inherit this collision detection capability, allowing these objects to interact dynamically within the game environment. This feature is crucial for enhancing gameplay realism and interaction, providing a more engaging and challenging experience for players.

The 'Player' class is a crucial component of our game architecture, encapsulating all player-related states such as health, speed, and the weapons system. This class serves as the central interface for player interactions, connecting seamlessly with other game elements like the Map and Weapons. By managing these interactions, the 'Player' class ensures that player actions are effectively translated into game responses, providing a cohesive and responsive gaming experience. This integration is essential for maintaining game dynamics and enabling players to navigate and interact with the game world smoothly.

#### Supportive Components
There are some supportive components that support some features of our game, such as Spawner, Colour and Replicator. These elements have been meticulously designed to be visually engaging and challenging, ensuring a fun and captivating gaming experience.

### User Interface
The user interface (UI) in our game is meticulously crafted to be both user-friendly and visually appealing, enhancing the overall player experience. On the playing screen, all available player abilities are conveniently displayed at the bottom right corner, each accompanied by a gradient cooldown bar that visually represents the readiness of each ability. Additionally, mission objectives are prominently displayed in eye-catching text on the upper right side of the screen. This strategic placement ensures that players can easily access and understand their goals without distraction, facilitating a smooth and engaging gameplay experience.

## Class Diagram

![spaceSurvivorsUML](https://github.com/UoB-COMSM0110/2024-group-17/assets/145852911/f8d427c6-dab1-4b3d-bca8-b38d252cfbc6)


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

We addressed these challenges in the following ways:

### Movement:

![reactivetrailsandparallax](https://github.com/UoB-COMSM0110/2024-group-17/assets/145852911/49fac5eb-a0f7-4125-98a1-96ad2ff52040)

With the player at the centre of the screen, with our original background effects, it was difficult for players to get accustomed to controlling the player. While the player was moving around the play area, this was not communicated effectively to the user, making the game less intuitive. We addressed this problem in two ways:

#### Dynamic Backgrounds

We wanted to convey movement in space in an intuitive way that would not break immersion. Furthermore, it was important to us that the system made sense in the context of the game, and provide a sense that the actions of the player were part of a large universe. This was done by simulating parallax in the stars in the background, so different stars seem to be further away than others, and as such translate at different speeds. This was done in a computationally efficient way that had minimal effect on performance, as the starfield is only generated once during the startup of the game, and is randomly generated once each time.

#### Reactive Trails

When the player moves, a trail is left behind them, which we found to be the most intuitive way to let the player know what is going on. The trail reacts to both direction and velocity, so the boost mechanic of the game, a large part of the overall movement system, was made much more apparent after its implementation. Like the starfield effect, the initialisation of the trail is only executed once per playthrough, meaning this feature also has a minimal impact on performance, saving as much processing power as possible for advanced AI systems.

### Artificial Intelligence:

![swarmingboidspassive](https://github.com/UoB-COMSM0110/2024-group-17/assets/145852911/dc2ca9b6-803d-4a32-b382-b9b7e249a801)

To make the AI in our game more immersive and ‘organic’ we decided to use a boid flocking AI system. This is where we found the name for our alien enemies! This was a major undertaking, as boid AI systems have multiple advanced states of behaviour.

#### Flocks, Herds and Schools

All boids start in a passive state at the start of the game. If the player moves within 500 on-screen pixels of any boid in a group, or attacks any member of the group, all boids in the ‘flock’ will change to an attacking state. This provides a great effect where the enemies seem to be ‘minding their own business’ when the player is around them, unless they are attacked.

Furthermore, if the player is being chased by any boids and manages to escape (by moving over 1000 pixels away from them), individual boids will return to a passive state. If the player manages to destroy all boids of a group, new spaws of boids in that group will also be passive.

Another further layer of complexity arises when determining the spawn rates of new boids. 
We feel that the inherent biological nature and behaviour of our boid spawning system makes the game much more immersive. It gives the feeling that the player is intruding on the natural life-cycle of indigenous creatures, which only adds to the intrigue of the universe we’ve created.


## Evaluation (750 Words)

From our user stories, we knew we wanted our game to appeal to two categories of gamer: those who wanted to have a more casual experience, and those who wanted to really test their skills. We decided to implement these two levels through the introduction of two difficulty levels: ‘Normal’ and ‘Insane’. 

With these two difficulty levels in place, we decided to conduct qualitative and quantitative analyses. This would allow us to see whether the ‘Normal’ difficulty of the game was approachable to casual gamers, and whether the ‘Insane’ mode of the game was too much of a step up in difficulty or not.

We also conducted these analyses at multiple stages of development; before the Easter break, and after. Over the Easter break, we used the results of the first analyses we did and used them to inform our game design decisions during our sprints. The methodology of these evaluations is shown below:

### Qualitative Analysis

#### Think Aloud Evaluation
When we created our first prototype, we conducted a think aloud evaluation where users would play our game, and explain their thought processes throughout. Afterwards, we asked users about their general thoughts about their gameplay experience, and what they felt could be improved upon. 

<em>Overall Feedback from Think Aloud Evaluation:</em>

<strong>Negatives</strong> - people seemed to think the game’s controls were unintuitive. The objective of the game was not adequately explained to the player, and the players were not made aware of weaponry and the movement options at their disposal. Many felt that the UI elements were not clear, and frequently asked what different parts of the UI represented.

<strong>Positives</strong> - people seemed to think the concept of the game was interesting, and once they understood the controls, the game was engaging and fun.

This early feedback for our game was immensely useful for us. It helped us realise that while the concept and gameplay of our game was interesting and engaging, there was a lot more we could do to make the users feel more comfortable playing.

#### Heuristic Evaluation
In our Heuristic Analysis, which focussed greatly on the accessibility of our project from the perspective of software design best practices, we learned even more useful information which would help develop our game moving forward.

<strong>H1</strong>: Liked the menu with usefully highlighted buttons;The user felt elements of the UI needed some work; felt the purpose of some elements of the UI was unclear

<strong>H2</strong>: Liked the intuitive nature of the health bar

<strong>H3</strong>: This user felt the game was extremely difficult to begin with, and thought the games difficulty should start slower at first to let the user get a feel for the game before it gets more difficult

<strong>H10</strong>: No documentation or tooltips, which would make the game very difficult to get into for someone who does not game frequently.

After the heuristic analysis, we focussed on improving the most common complaints about our game; namely, that the game was extremely difficult in ‘Insane’ mode, the objective of the game was not obvious, and the UI was unintuitive. 

### Quantitative analysis

We had used two questionnaires in the workshop and invited people to answer the questionnaires after they had played our game in two different levels.

#### System Usability Scale (SUS)
Our first method of quantitative analysis was the System Usability Scale (SUS)(details see appendix). 

The results shows a significant difference between ‘Normal’ and ‘Insane’ mode ( Z(9)=2.209, <em>p</em><0.05 ) ( M<sub>Normal</sub>=68.25, M<sub>Insane</sub>=63.75 ).  The ‘Insane’ mode score was lower than we were expecting, but provided us with great insight of the changes that needed to be made, when we made comparisons between the ‘Normal’ and ‘Insane’ modes. We were excited to see that the overall SUS scores were quite similar to the average( M=68 ), meaning we had created a consistent experience across difficulties. This meant that our UI redesign had been effective, much more than if we had not gathered feedback before implementing new features.

#### NASA Task Load Index (NASA-TLX)
The second method of quantitative analysis was the NASA Task Load Index (NASA-TLX).

The result (the mean average of the NASA-TLX total workload scores for the individual members) of the related w-test shows that there was not a significant difference between ‘Normal’ and ‘Insane’ mode ( Z(3)=1.604, <em>p</em>>0.05 ) ( M<sub>Normal</sub>=22.0, M<sub>Insane</sub>=52.50 ). These result might be caused by small sample size. At least, the mean scores of two different level suggesting that our difficulty design may be effective on workload, though it didn't have a statistical conclusion.

### How code was tested
We use two different testing models to test our codes.

The first is the White-box testing, we have done this kind of testing by ourself. Once we finished a function block of the game, we tried to run every line of the code, and make sure they were working correctly. 

Next, we did some Black-box testing, we tested all possible processes that a user might do in the game. Also, we tested some common problems in the program, like keyboard conflict and illegal input.

## Process (750 Words)

Our project followed an agile development approach, which enabled us to swiftly establish a minimum viable product. This rapid progress allowed us to shift our focus towards enhancing the game's quality and refining our prototype further. We break down the hole development process into serval different tasks, which allow each team members to focus on part of game and still maintaining a cohesive vision for the final product.

### Tools and Technologies Used
Once our main ideas were confirmed, we completed the initial phase of the development process and move to the iterative development part. In this phase, we start to work on the major features of game. During this phase, serval tools are used to develop the game.

#### Version Control System:
We chose GitHub as our version control system due to its powerful features that facilitate collaborative work. This platform enabled seamless integration and coordination across our development team.

The branching and merging features of GitHub allowed us to manage different versions of the game effectively. Each team member was allocated their own branch, enabling us to work independently without altering the main project code. This approach facilitated the simultaneous development of various features. Once these features were thoroughly tested, we merged them into the main project code, ensuring smooth and efficient integration of new functionalities.

### Project Management Tools:
To manage our game development, we choose Kanban board as our management tool.

As mentioned above, we split the development process into serval different tasks. These tasks been posted onto Kanban board and each team members will sign their names with task to confirm which tasks they want to do. After the task is completed, team members will draw a line to the “Completed” column to act as workflow of the Kanban board. In addition, the flexibility of the Kanban allowed us to add and remove task easily. If any team members have a new idea during development, we can easily treat it to a new task and post it onto Kanban board.

### Team roles and responsibilities
Our team was composed of four members, each with distinct roles that were crucial for the successful development of game. 

Freya: Lead developer
As the main developer, Freya was responsible for writing the core skeleton of our game. Her role was pivotal in implementing most of the game features, turn our ideas into actual code and functional gameplay elements. Her technical skills were important in addressing the technical problems during the development process.

Isaac: Team Manager and UI Designer
Issac, serving as the team manager, was tasked with collecting and refining the game concepts. He developed the project plan and timelines, ensuring that all of us were keep engage with the task. In addition, Issac took on the role of UI designer, he designs most of the UI of our game.

Haoyu: Analyst
Haoyu’s role is to act as an analyst during the development process. His role was crucial in evaluating our game by using some techniques to make sure the quality of game and performance met our standards. His analytical skills helped us could quickly found something that we need from questionnaire.

Daolin: Content Developer
Daolin was responsible for creating the game repo and producing a promotional game video. His role focused on articulating the features to potential users and stakeholders. Additionally, the asset inside the game was found by Daolin.

### Reflection on Teamwork
During the hole development process, our team members keep a opening communication, which make us could react with feedback very quickly. This openness reduces misunderstanding about the game project among team members.

Due to the effective distribution of team roles, our team was able to develop the game efficiently. However, because the communication and workload problem, there were some overlapping during the development process.

One of the challenges was cause by communication. Daolin accidentally push a new version of game to Isaac’s branch and didn’t confirm with Isaac. Therefore, when Issac pushes his code to GitHub, there is a conflict on Isaac’s branch and ruin his branch. In the end, we solved this problem by reset the branch head into a early version of code.

In conclude, this project taught us how to run a game develop project as a team. Although we have a successful game project, but we still need to improve our teamwork skill. More structured working flow could accelerate our development process and make a better game project.


## Conclusion (500 Words)

## Appendix
### Difficulty levels design
The ‘Normal’ difficulty has reduced amounts of enemies which move at a lower speed, and the player also has more health. This makes the game more relaxing to play, while still posing enough of a challenge that the game feels satisfying and the player feels they are getting more skilled.

The ‘Insane’ difficulty, on the other hand, is where we intend for players to really test their skills, and it was a challenge to make the mode not feel ‘unfair’. This mode features extremely large numbers of enemies that move very quickly, while the player moves more slowly and movement options are more limited. We wanted this mode of the game to feel more satisfying and appear more engrossing to watch and play.

### System Usability Scale(SUS)
After playing the game, we asked the users to fill in the SUS questionnaire, which asks the following questions, to which the user would respond by selecting to what extent they agree with the statements presented to them:

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
### NASA-TLX 
The NASA-TLX was used to assess workloads, the total workload is divided into six subjective subscales:

Mental Demand:
How much mental and perceptual activity was required? Was the task easy or demanding, simple or complex?

Physical Demand:
How much physical activity was required? Was the task easy or demanding, slack or strenuous?

Temporal Demand:
How much time pressure did you feel due to the pace at which the tasks or task elements occurred? Was the pace slow or rapid?

Performance:
How successful were you in performing the task? How satisfied were you with your performance?

Effort:
How hard did you have to work (mentally and physically) to accomplish your level of performance?

Frustration:
How irritated, stressed, and annoyed versus content, relaxed, and complacent did you feel during the task?
Welcome to Team 17, comprised of:

# Daolin Zhang, ht23051@bristol.ac.uk, HankeXian
# Isaac Scott, du23937@bristol.ac.uk, ijgs02
# Freya Fewtrell, do20075@bristol.ac.uk, fewtz 
# Haoyu Zhu, cu23510@bristol.ac.uk, haidanorz


For full information of Game ideas, Paper prototyping and Team Photo - see the Ideas_Phase folder.

![](https://github.com/UoB-COMSM0110/2024-group-17/blob/main/Ideas_Phase/spacegame.gif)

Game One - Stealth Melee

Idea:
Top down stealth combat game, where our protagonist insists on not using guns. As such they have to find
creative and stealthy ways to close the distance to their enemies, where being caught out in the open means
certain death.

Game inspo:
Hotline Miami, Heat signature, Hitman

Art style inspo:
Dead cells, Hyper light drifter, Into the breach (pixel art with lighting engine)

Setting:
a. maybe a current day baddass, like john wick etc
b. super hero who doesnt want to kill (ie, batman)
c. baddass ww2 fightign nazis ! (in this case he doesnt use guns because he wasnts to feel the nazis bones break in his hands)
d. dystopian future overthrowing a fascist government (would be cool, but kinda undermines the joke of the idea)

Challenge #1 - Physics
It should feel intuitive to move around, responsive and clean. There should be a weight to combat, with a good lunge to close
that last bit of distance. Ray casting will be nessesary for the gunfire of the enemies. The movemenet of the camera is also 
incredibly important.

Challenge #2 - AI
The actual AI of the enemies is one of the biggest challenges of a stealth game. Making the enemies feel competant and real,
whilst not letting them have any information it feels like they shouldnt. There should also be a good system of control
over the sound, maybe a way of visualising where they enemy can see, and how far the sound you makes travels. 

Challenge #3 - Lighting engines, Particle effects, Map game and UI design
Actually making the game look good is incredibly important. I think pixel art is good for us to do as it is slightly easier and 
there are lots  of tools to help draw and animate it. I think a dynamic lighting engine would make it actually look good tho, 
this can be difficult in 2D, if we can figure it out it will make it look so much better with not huge performance impacts. 
We can pretty quickly put  a decent level and ui together, good enough for a demo. 

Game Two: Vampire Survivors, except its a rhythm game. 

A 2D isometric view world with the camera centred on the player.
Endless hordes of monstrosities from the far reaches of space are
attacking the player, a lone spaceman with little but a jetpack.

Can you survive the 3 and a half minutes it is going to take for
your automated life pod to come and rescue you?
