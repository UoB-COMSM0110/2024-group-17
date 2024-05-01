<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->


# Space Survivors – Team 17

![spacegamelogo](https://github.com/UoB-COMSM0110/2024-group-17/assets/145852911/01ad03bd-76e4-4197-b228-c6468f39c393)
### Table of Contents
   * [Introduction](#introduction-250-words)
   * [Requirements](#requirements-750-words)
   * [Design](#design-750-words)
   * [Behavioural diagram](#behavioural-diagram)
   * [Class Diagram](#class-diagram)
   * [Implementation](#implementation-750-words)
   * [Evaluation](#evaluation-750-words)
   * [Process](#process-750-words)
   * [Conclusion](#conclusion-500-words)

<!-- TOC end -->

<!-- TOC --><a name="space-survivors-team-17"></a>

<a style="align: center" href="https://youtu.be/TMsvhL6CfG0">Click here to see our promotional video!</a>

![TeamPhoto](https://github.com/UoB-COMSM0110/2024-group-17/assets/145852911/615dc998-de39-4980-b73a-0b89b2777f09)

<!-- TOC --><a name="team-roles-and-responsibilities-left-to-right"></a>
### Team roles and responsibilities (Left to Right)
Our team was composed of four members, each with distinct roles that were crucial for the successful development of game. 

<!-- TOC --><a name="freya-lead-developer"></a>
### Freya: Lead developer

As Lead Developer, Freya was responsible for writing the core skeleton of our game. Her role was pivotal in implementing most of the game features, turning our ideas into actual code and functional gameplay elements. Her technical skills were important in addressing the technical problems during the development process. she also features in the promotional video.

<!-- TOC --><a name="isaac-team-manager-and-asset-designer"></a>
### Isaac: Team Manager and Asset Designer

Isaac, serving as Team Manager, was tasked with collecting and refining the game concepts. He developed the project plan and timelines, ensuring that all of us kept engaged with the task. In addition, Isaac took on the role of Asset Designer, hand-making most of the assets in the game. He created and edited the promotional video for our project.

<!-- TOC --><a name="haoyu-analyst"></a>
### Haoyu: Analyst

Haoyu acted as Analyst during the development process. His role was crucial in evaluating our game, using targeted techniques to ensure game quality and performance met our standards. He used analytical skills to interpret the data from our questionnaires. 

<!-- TOC --><a name="daolin-content-developer"></a>
### Daolin: Content Developer

Daolin was responsible for creating the game repo and he featured in the promotional game video. His role focused on articulating the features to potential users and stakeholders. Additionally, the asset inside the game was found by Daolin.

<!-- TOC --><a name="introduction-250-words"></a>
## Introduction

Our game is a single player arcade style game with advanced enemy AI systems. The main inspiration for our game was the idle game Vampire Survivors, which is played from a top-down perspective and features the player being attacked by relentless waves of enemies. While Vampire Survivors is idle, requiring no input from the player for attacks, we decided to make gameplay more engaging by allowing the player to use quick responsive movement and limited weaponry to try and survive the horde. By taking advantage of the individual skills of the members of our team using agile development techniques, we were able to get a minimum viable product working very quickly, so we could put more emphasis on polishing the game and upgrading our prototype to include advanced features such as Boid flocking AI, computationally efficient graphics and dynamic backgrounds to make movement feel extremely satisfying, and the game more immersive.

<!-- TOC --><a name="requirements-750-words"></a>
## Requirements
	
At the start of the development process, we had an in-person meeting where we each pitched several games on which we could base our project, from a variety of genres. Our first idea for a game was going to be an action-packed shoot-em-up like Hotline Miami, except with destructible terrain and furniture. While this would have been exciting, we felt that there was not enough potential to add a twist to the game, as any changes we added would not provide the individuality we desired. One member of our team was playing Vampire Survivors during our meeting, which immediately intrigued us. The game was simple enough that it would be easy to recreate, and provided enormous potential for expansion. To this end, we decided a space theme would be ideal for our game, as it had greater potential for exciting features in a zero-gravity environment. To ascertain the requirements of our new game Space Survivors, we created a paper prototype as pictured below, and set to work on preparing a use-case diagram and specification for our new project.

![](https://github.com/UoB-COMSM0110/2024-group-17/blob/main/Ideas_Phase/spacegame.gif)

<!-- TOC --><a name="use-case-specification"></a>
### Use Case Specification

<!-- TOC --><a name="use-case-diagram"></a>
### Use Case Diagram

![SpaceUseCaseDiagram](https://github.com/UoB-COMSM0110/2024-group-17/assets/145852911/34966264-9622-4e63-b96e-904f9d99bee5)

<!-- TOC --><a name="user-stories"></a>
#### User Stories

As the developers of the game, we want to make a game that is genuinely good, with elements that are cohesive and engaging to implement. We want to use tech which interests us and we haven’t used before, to make us better developers.

As a player, I want the game to be as intuitive as possible, so I can see as much of the game as possible to give a fair mark for it. I want the game to be enjoyable, pretty, and with technically impressive aspects. I want a clear indication of three challenges, and a clear twist that separates this game out from other projects and the game used for inspiration.

As a non-gamer, I need the game to have an extensive tutorial, and the game to have a casual mode that I can enjoy. It should be easy to learn, hard to master, and I should be able to restart quickly for the next attempt. I'd quite like a story, so I can enjoy the game in short bursts on the bus etc.

As a competitive gamer, I want depth of mechanics, with lots of potential for me to show my skills. I want there to be a high skill ceiling that makes my run engaging to watch and perform. Maybe an infinite mode that just gets unfairly hard so I can impress people.

As a normal gamer, I want a game that is easy to learn. I want nice graphics, and a game I can just enjoy with immersive gameplay with satisfying physics. I do not want a scoring system, because I just want to enjoy it and not have a competition with anyone but myself.

<!-- TOC --><a name="use-case-reflection"></a>
#### Use Case Reflection

After identifying our stakeholders, we found a number of issues which would mould our development process. The first of which relates to how we can make our game cater to people who have limited experience playing computer games, and those who have a limited time to experience them (i.e. those marking our work). It became clear that the most important characteristic our game should have is it should be very intuitive. Having analysed the use cases, I found the main way to do this was to have as much instruction as possible for the player, and provide multiple difficulty options for the user to choose from. Instructions could just be added to the main menu for players to read, but in this case, we have decided to provide tips to the player as they play the game to guide them through their first playthrough, so they can get the hang of it. We also thought it would be a good idea to provide explicit hints to the player relating to the objective of the game, such as drawing attention to the timer, and warnings about the enemies about to come onto the screen. We realised that while it would be nice to make the game as aesthetically pleasing as possible, it will be more important to make it obvious to players what each icon represents, and the objective of the game at the same time.

<!-- TOC --><a name="design-750-words"></a>
## Design	

<!-- TOC --><a name="system-architecture"></a>
### System architecture

In the realm of video game development, architecture is not merely a framework—it is the foundation that supports every aspect of the game's creation and execution. Our game was built on a carefully planned architecture that balances complexity with performance. This architecture was designed to facilitate smooth gameplay experiences while accommodating future expansions and updates.

<!-- TOC --><a name="game-engine"></a>
### Game Engine

Our game was designed using Processing as required. Processing's architecture enabled us to seamlessly integrate visual elements and game logic, ensuring that creative and technical components coexist harmoniously. Based on this framework, we were able to build the program effectively, allowing each team member to seamlessly accommodate and implement complex game mechanics.

<!-- TOC --><a name="game-component"></a>
#### Game Component

There are several core components and supportive components in our game.

<!-- TOC --><a name="core-component"></a>
#### Core Component

Our 'Main' class serves as the central hub of our game, functioning as the game manager. It is pivotal in facilitating player interaction and managing core gameplay mechanics. This class includes essential methods such as ‘keyPressed’ and ‘keyReleased’ to handle player inputs, enabling responsive gameplay. Additionally, it contains methods specifically designed to manage camera movements, enhancing the player's visual experience during the game. These methods ensure smooth transitions and adjustments of the camera's perspective, crucial for maintaining engagement and providing a dynamic viewing angle.

Another fundamental component of our game architecture is the 'Screen' abstract class. It encapsulates a crucial method, ‘justDrawLoop’, which is continuously executed to redraw the screen during gameplay. This method ensures that the game's visual elements are updated in real-time, maintaining fluidity and responsiveness. Building upon this abstract class, various specific screen states extend 'Screen' to display different types of information to the player. These derived classes tailor the user interface to reflect diverse game scenarios and feedback, enhancing the player's interaction and experience with the game.

The 'Collideable' abstract class is also a core component of our architecture. Though this class primarily contains a set of variables and a single method, 'dealDamage', its importance cannot be overstated. It serves as the foundation for collision detection in our game. We implement collisions by defining each game object as a circle and detecting overlaps in their radii to determine a collision. Classes that extend 'Collideable', such as 'Enemy' and 'Asteroid', inherit this collision detection capability, allowing these objects to interact dynamically within the game environment. This feature is crucial for enhancing gameplay realism and interaction, providing a more engaging and challenging experience for players.

The 'Player' class is a crucial component of our game architecture, encapsulating all player-related states such as health, speed, and the weapons system. This class serves as the central interface for player interactions, connecting seamlessly with other game elements like the Map and Weapons. By managing these interactions, the 'Player' class ensures that player actions are effectively translated into game responses, providing a cohesive and responsive gaming experience. This integration is essential for maintaining game dynamics and enabling players to navigate and interact with the game world smoothly.

<!-- TOC --><a name="supportive-components"></a>
#### Supportive Components

There are some components that support some features of our game, such as Spawner, Colour and Replicator. These elements have been meticulously designed to be visually engaging and challenging, ensuring a fun and captivating gaming experience.

<!-- TOC --><a name="user-interface"></a>
### User Interface

The User Interface (UI) in our game is thoughtfully crafted to be both user-friendly and visually appealing, enhancing the overall player experience. On the playing screen, all available player abilities are conveniently displayed in the bottom right corner, each accompanied by a gradient cooldown bar that visually represents the readiness of each ability. Additionally, mission objectives are prominently displayed in eye-catching text on the upper right side of the screen. This strategic placement ensures that players can easily access and understand their goals without distraction, facilitating a smooth and engaging gameplay experience.

<!-- TOC --><a name="behavioural-diagram"></a>
## Behavioural diagram

One of our game mechanics is the collision. This diagram shows how the 'Player' class interacts with the 'Enemy' and 'Asteroid' class to determine the outcome of the collision.

![communcation](https://github.com/UoB-COMSM0110/2024-group-17/blob/main/communication.png)

<!-- TOC --><a name="class-diagram"></a>
## Class Diagram

![spaceSurvivorsUML](https://github.com/UoB-COMSM0110/2024-group-17/assets/145852911/f8d427c6-dab1-4b3d-bca8-b38d252cfbc6)


<!-- TOC --><a name="implementation-750-words"></a>
## Implementation

The first challenge we faced was how to make the enemies’ AI more advanced. While in Vampire Survivors, the enemies are relatively sparse and the AI just seems to home in on the player, we wanted to take a more advanced approach, creating enemies that felt more organic, with a depth of AI that made them seem more intelligent and strategic, which was implemented using a flocking boid system.

The main objective of the game changed drastically over time, starting with a rhythm-based game where the player’s movement and damage would be enhanced if the player performed actions in sync with the music. We abandoned this idea as it was less immersive and challenging than an AI approach and we decided that space offered us the best theatre for our creation. We reused the base mechanics from the original game, such as the movement and weapons, while updating the AI systems. This resulted in a product that was much more polished than the first example, but players noted that the game still did not have a clear objective.

Next, we adjusted our game to evolve beyond the rhythm game concept, using the flocking AI to to make a space survival game. We reused the base mechanics from the original game, such as the movement and weapons, while updating the AI systems. This resulted in a final product that was much more polished than the first example, but players noted that the game still did not seem to have a clear objective; the gameplay itself was fun, but there was little incentive to play more.

In our final implementation of the game, we focussed on this feedback, and made the goal to destroy three ‘Boid Replicators’ around the play area, under a strict time limit. These replicators would continuously create new enemies that would chase the player when in line of sight, and obstruct the player’s path and intercept their bullets, making the game harder. We found through user testing that the new UI elements and objective made the game much more enjoyable, as well as more intuitive.

Our main three challenges are:

- How do we convey a satisfying sense of movement when the player is fixed at the centre of the screen?
- How do we make the enemies feel intelligent and organic?
- How do we handle large quantities of collisions in a computationally efficient manner?

We addressed these challenges in the following ways:

<!-- TOC --><a name="movement"></a>
### Movement

![reactivetrailsandparallax](https://github.com/UoB-COMSM0110/2024-group-17/assets/145852911/49fac5eb-a0f7-4125-98a1-96ad2ff52040)

With the player at the centre of the screen, with our original background effects, it was difficult for players to get their bearings, making the game less intuitive. We addressed this problem in two ways:

<!-- TOC --><a name="dynamic-backgrounds"></a>
#### Dynamic Backgrounds

We wanted to convey movement in space in an intuitive way that would not break immersion and would ensure that the system made sense in the context of the universe we were creating. This was done by simulating parallax in the stars in the background, so different stars seem to be further away than others, and as such translate at different speeds. We achieved this in a computationally efficient way that had minimal effect on performance, as the starfield is only generated once during the startup of the game. It is randomly generated, meaning no two players have the same experience.

<!-- TOC --><a name="reactive-trails"></a>
#### Reactive Trails

When the player moves, a trail is left behind them, which we found to be the most intuitive way to let the player experience flight. The trail reacts to both direction and velocity, so the boost mechanic of the game, a large part of the overall movement system, was made much more apparent after its implementation. Like the starfield effect, the initialisation of the trail is only executed once per playthrough, meaning this feature also has a minimal impact on performance, saving as much processing power as possible for advanced AI systems.

<!-- TOC --><a name="artificial-intelligence"></a>
### Artificial Intelligence:

![swarmingboidspassive](https://github.com/UoB-COMSM0110/2024-group-17/assets/145852911/dc2ca9b6-803d-4a32-b382-b9b7e249a801)

To make the AI in our game more immersive and ‘organic’ we decided to use a boid flocking AI system. This is where we found the name for our alien enemies! This was a major undertaking, as boid AI systems have multiple advanced states of behaviour.

<!-- TOC --><a name="flocks-herds-and-schools"></a>
#### Flocks, Herds and Schools

All boids start in a passive state at the beginning of the game. If the player moves within 500 on-screen pixels of any boid in a group, or attacks any member of the group, all boids in the ‘flock’ will change to an attacking state. This provides a great effect where the enemies seem to be ‘minding their own business’ when the player is around them, unless they are attacked.

Furthermore, if the player is being chased by any boids and manages to escape (by moving over 1000 pixels away from them), individual boids will return to a passive state. If the player manages to destroy all boids of a group, new spawns of boids in that group will also be passive.

Another layer of complexity arises when determining the spawn rates of new boids. We feel that the inherent biological nature and behaviour of our boid spawning system makes the game much more immersive. It gives the feeling that the player is intruding on the natural life-cycle of indigenous creatures, which only adds to the intrigue of the universe we’ve created.

#### Optimised Collisions

The challenge was to create mathematically correct and multiple collisions without draining computational resources. We did this by simplifying and optimising our existing collision model so that almost every entity in the game was circular. These circles made it much easier to perform the calculations required when checking if objects would collide with each other. This is because if the distance between two circular object centres is less than the sum of their radii they are colliding. Once this was detected, we applied an impulse to the incoming object that is equal and opposite to their approach momentum, propelling it away from the object it collided with.

<!-- TOC --><a name="evaluation-750-words"></a>
## Evaluation

From our user stories, we knew we wanted our game to appeal to casual and competitive gamers, so we introduced two difficulty levels: ‘Normal’ and ‘Insane’. We conducted qualitative and quantitative analyses to find out if these two modes were at the right level for the target audiences. 

We conducted these analyses at multiple stages of development; before the Easter break, and after. Over the Easter break, we assessed the results of the first analyses we did and used them to inform our game design decisions during our sprints. The methodology of these evaluations is shown below:

<!-- TOC --><a name="qualitative-analysis"></a>
### Qualitative Analysis

<!-- TOC --><a name="think-aloud-evaluation"></a>
#### Think Aloud Evaluation

When we created our first prototype, we conducted a think aloud evaluation where users would play our game, and explain their thought processes throughout. Afterwards, we asked users about their general thoughts about their gameplay experience, and what they felt could be improved upon.

<em>Overall Feedback from Think Aloud Evaluation:</em>

<strong>Negatives</strong> - people seemed to think the game’s controls were unintuitive. The objective of the game was not adequately explained to the player, and the players were not made aware of weaponry and the movement options at their disposal. Many felt that the UI elements were not clear, and frequently asked what different parts of the UI represented.

<strong>Positives</strong> - people seemed to think the concept of the game was interesting, and once they understood the controls, the game was engaging and fun.

![wordcloud_1](https://github.com/UoB-COMSM0110/2024-group-17/assets/63943203/c0ae4883-abf6-4809-8a44-aa948104c334)

This early feedback for our game was immensely useful for us. It helped us realise that while the concept and gameplay of our game was interesting and engaging, there was a lot more we could do to make the users feel more comfortable playing.

<!-- TOC --><a name="heuristic-evaluation"></a>
#### Heuristic Evaluation

In our Heuristic Analysis, which focussed greatly on the accessibility of our project from the perspective of software design best practices, we learned even more useful information which would help develop our game moving forward.

![HCI_1](https://github.com/UoB-COMSM0110/2024-group-17/assets/63943203/2d306001-c755-49e3-9aa8-cf3005fed263)

After the Heuristic Analysis, we focussed on improving the most common complaints about our game; namely, that the game was extremely difficult in ‘Insane’ mode, the objective of the game was not obvious, and the UI was unintuitive.

![changes](https://github.com/UoB-COMSM0110/2024-group-17/assets/63943203/8bc8d2e9-af4e-4a8a-b4c4-759fc75e8756)


<!-- TOC --><a name="quantitative-analysis"></a>
### Quantitative analysis

We had used two questionnaires in the workshop and invited people to answer the questionnaires after they had played our game in two different levels.

<!-- TOC --><a name="system-usability-scale-sus"></a>
#### System Usability Scale (SUS)

Our first method of quantitative analysis was the System Usability Scale (SUS). After playing the game, we asked users to fill in the SUS questionnaire, by selecting to what extent they agreed with the statements presented to them. The statements were: I think I would like to use this system frequently; I found the system unnecessarily complex; I thought the system was easy to use; I think I would need the support of a technical person to be able to use this system; I found the various functions in this system were well integrated; I thought there was too much inconsistency in this system; I would imagine that most people would learn to use this system very quickly; I found the system very cumbersome to use; I felt very confident using this system; I needed to learn a lot of things before I could get going with this system.

The results show a significant difference between ‘Normal’ and ‘Insane’ mode ( Z(9)=2.209, <em>p</em><0.05 ) ( M<sub>Normal</sub>=68.25, M<sub>Insane</sub>=63.75 ).  The ‘Insane’ mode score was lower than we were expecting, but helped us understand the changes we needed to make, when we made comparisons between the ‘Normal’ and ‘Insane’ modes. The ‘Insane’ mode score was lower than we were expecting, but also guided the changes we need to make. We were excited to see that the overall SUS scores were quite similar to the average( M=68 ), meaning we had created a consistent experience across difficulties. This meant that our UI redesign had been effective, much more than if we had not gathered feedback before implementing new features.

<!-- TOC --><a name="nasa-task-load-index-nasa-tlx"></a>
#### NASA Task Load Index (NASA-TLX)

The second method of quantitative analysis was the NASA Task Load Index (NASA-TLX) which was used to assess workloads. The total workload was divided into six subjective subscales:

Mental Demand: How much mental and perceptual activity was required? Was the task easy or demanding, simple or complex?

Physical Demand: How much physical activity was required? Was the task easy or demanding, slack or strenuous?

Temporal Demand: How much time pressure did you feel due to the pace at which the tasks or task elements occurred? Was the pace slow or rapid?

Performance: How successful were you in performing the task? How satisfied were you with your performance?

Effort: How hard did you have to work (mentally and physically) to accomplish your level of performance?

The result (the mean average of the NASA-TLX total workload scores for the individual members) of the related w-test shows that there was not a significant difference between ‘Normal’ and ‘Insane’ mode ( Z(3)=1.604, <em>p</em>>0.05 ) ( M<sub>Normal</sub>=22.0, M<sub>Insane</sub>=52.50 ). These results might have been caused by a small sample size. At least, the mean scores of the two different levels suggest that our difficulty design may be effective on workload, although it didn't have a statistical conclusion.

<!-- TOC --><a name="how-code-was-tested"></a>
### How code was tested

We used two different testing models to test our code, the first being White-box testing. Once we finished a function block of the game, we tried to run every line of the code, and make sure it was working correctly.

Next, we did some Black-box testing; we tested all possible processes that a user might do in the game. Also, we tested some common problems in the program, like keyboard conflict and illegal input.

<!-- TOC --><a name="process-750-words"></a>
## Process

Our project followed an agile development approach, which enabled us to swiftly establish a minimum viable product. This rapid progress allowed us to shift our focus towards enhancing the game's quality and refining our prototype further. We broke down the whole development process into different tasks, which allowed each team member to focus on a specific part of game while still maintaining a cohesive vision for the final product.

<!-- TOC --><a name="tools-and-technologies-used"></a>
### Tools and Technologies Used

Once our main ideas were confirmed, we completed the initial phase of the development process and moved to the iterative development part. In this phase, we started to work on the major features of the game. During this phase, serval tools were used to develop the game.

<!-- TOC --><a name="version-control-system"></a>
#### Version Control System

We chose GitHub as our version control system due to its powerful features that facilitate collaborative work. This platform enabled seamless integration and coordination across our development team.

The branching and merging features of GitHub allowed us to manage different versions of the game effectively. Each team member was allocated their own branch, enabling us to work independently without altering the main project code. This approach facilitated the simultaneous development of various features. Once these features were thoroughly tested, we merged them into the main project code, ensuring smooth and efficient integration of new functionalities.

<!-- TOC --><a name="project-management-tools"></a>
### Project Management Tools

![20240420_165651](https://github.com/UoB-COMSM0110/2024-group-17/assets/145852911/db111455-fd74-4f2b-b7c3-c288222e987a)

To manage our game development, we choose to use a Kanban board.

As mentioned above, we split the development process into several different tasks. These tasks were posted onto a Kanban board and each team member selected one. After the task was completed, team members drew a line to the 'Completed' column. In addition, the flexibility of the Kanban allowed us to add and remove tasks easily for dynamic development. 

![20240420_151030](https://github.com/UoB-COMSM0110/2024-group-17/assets/145852911/960dac4c-a3a5-469b-a722-2a082972b719)

<!-- TOC --><a name="reflection-on-teamwork"></a>
### Reflection on Teamwork

Due to the effective distribution of roles, our team was able to develop the game efficiently. During the development process, team members maintained clear communication channels in person and on Microsoft Teams. This openness reduced misunderstanding and meant we could react quickly when needed, enabling us to quickly resolve minor merge conflicts which can arise when several people are working on the same project. 

In conclusion, communication can always be improved, this project taught us how to run a game develop project as a team and create a game we can be proud of.

<!-- TOC --><a name="conclusion-500-words"></a>
## Conclusion

Our game, 'Space Survivors', embodies a 2D isometric world, drawing inspiration from 'Vampire Survivors'. During the development process, we faced and overcame various challenges, constantly refining the game's design to heighten player engagement and satisfaction. Initially pursuing a rhythm-based gameplay concept, we found it challenging to implement and lacklustre in engaging players due to vague objectives and minimal immersive elements. Recognizing these shortcomings, we pivoted to develop a more captivating experience by incorporating advanced AI and a more dynamic gameplay model.

The integration of a boid AI system introduced a new level of complexity to enemy behaviours, significantly amplifying the game's sense of urgency. This strategic enhancement, coupled with a time limit, sharply focuses the player on the primary goal of destroying the 'Boid Replicator,' thereby deepening their engagement and enriching the overall gameplay experience.

After our qualitative analysis, we had much to change. We began by creating a tutorial to talk the players through the controls, which drastically decreased confusion. We also added a warning for leaving the combat zone, much more recognizable replicator sprites, and we restyled the objective text in the top right of the screen to make it much clearer. When it came to the final demonstration day we found that nearly every player was able to figure out the controls and objectives with no input from our facilitator. Most were able to complete the tutorial first try, and the normal mode after a few attempts, and only 2 people were able to beat the insane mode. This represents a massive increase in the viability of both the difficulty system, and the onboarding, which we as a team are very proud of.

Incorporating agile development methodologies enhanced our team collaboration and operational efficiency. This approach allowed for rapid iterations based on user feedback, facilitating continual improvements and adaptation throughout the development cycle.

The journey of creating 'Space Survivors' was very educational, teaching us valuable lessons in teamwork, problem-solving, and decision-making. As we celebrated the completion of a highly polished demo—free of bugs, and enriched with complete music, sound effects, and sophisticated gameplay—we also recognized the potential for future enhancements. While the current version has exceeded our expectations, aspirations for expanding the game with additional weapons, a narrative-driven progression, and more intricate levels remain. Given the limited timeframe, our accomplishments with 'Space Survivors' leave us immensely proud, and we look forward to future opportunities to expand and refine our creation.

## Contribution

Freya: 1.0

Isaac: 1.0

Daolin: 1.0

Haoyu: 1.0
