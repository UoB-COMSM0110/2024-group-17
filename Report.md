# Space Survivors – Team 17

## Introduction (250 Words)
	
(Describe the game, what it is based on, and what makes it novel) 

Our game is a single player arcade style game with advanced enemy AI systems. The main inspiration for our game was the idle game Vampire Survivors, which is played from an isometric perspective, and features the player being attacked by relentless waves of enemies. While Vampire Survivors is idle, requiring no input from the player for attacks, we decided to make gameplay more engaging by allowing the player to use quick responsive movement and limited weaponry to try and survive the horde. By taking advantage of the individual skills of the members of our team using agile development techniques, we were able to get a minimum viable product working very quickly, so we could put more emphasis on polishing the game and upgrading our prototype to include advanced features such as boid flocking AI, computationally efficient graphics and dynamic backgrounds to make movement feel extremely satisfying, and the game more immersive.

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

After identifying our stakeholders, we found a number of issues which would mold our development process. The first of which relates to how we can make our game cater to people who have limited experience playing computer games, and those who have a limited time to experience them (i.e. those marking our work). It became clear that the most important characteristic our game should have is it should be very intuitive. Having analysed the use cases, we found the main way to do this was to have as much instruction as possible for the player, and provide multiple difficulty options for the user to choose from. Instructions could just be added to the main menu for players to read, but in this case, we have decided to provide tips to the player as they play the game to guide them through their first playthrough, so they can get the hang of it. We also thought it would be a good idea to provide explicit hints to the player relating to the objective of the game, such as drawing attention to the timer, a marked minimap, warnings for leaving the combat zone and a dynamic arrow guiding the player back to the extraction point. We realised that while it would be nice to make the game as aesthetically pleasing as possible, it will be more important to make it obvious to players what each icon represents, and the objective of the game at the same time.

## Design (750 Words)
	
(system architecture, class diagrams, behavioural diagrams)

The design of our game evolved many times. There were several prototypes (Figures x-y) before we arrived at our minimum viable product, and as such our code was very messy. This was also everyones first project in Java, and so the ideas of encapsulation and inheritance were more than foreign to us to begin with. 

Our MVP consisted of one main file with the majority of the game flow, with some extrenuous objects (the player, enemies etc), and dozens of global variables, and something had to change once we wanted to add in different game states- start screens and difficulty selections. 

Through an incredible refactor, freya managed to wrestle the code into many neat classes. All the main had to do was monitor keyPresses (which were communicated in a boolean array for the sake of reliability), and call menu.doThings(keyspressed) every frame. What insues is what Freya coined the "doThings cascade".

The code was set up in such a way that calling doThings on a given screen would call doThings on all relevent objects contained inside it. More than that - for example the map would only contain a weapon management system, which in turn would have a list of weapons, so calling doThings on the weapon system called doThings on each individual weapon, which eventually called doThings on each invdividual projectile. This allowed for almost perfect encapsulation (other than the tick counter and the soundfiles, which are very odd indeed), which allowed us to reach our zero bugs recorded on demo day state, and will also make it very easy to add new weapons in the future. You can see a full detail on the classes in the game and how they were broken up in the class diagram below. 

The implimentation of proper inheritance classes also greatly stream lined the code. Every collideable object inherited from the Abstract Class Collideable , which allowed the getting of both radius and position. Since every object in the game was set up as a circle, collision testing was as simple as comparing the distance between and the sum of the radii of the two objects. This allowed a full ArrayList<Collidealbe> allObjects to be passed around to the various collidors. 

It is also worth mentioning the other various tools that were developed to aid in our games development. The first was a map maker tool (figure z) which allowed the user to navigate with WASD and click to place down objects. The program could also read in files, and write to files which we could use in our main project. This was unfortunatley abandonned along with our stealth game idea by week 3. The other tool developed was a full Boid simulation. The movement of our enemies was very complex and required a lot of tiny parameter tweaking, as such it was easiest to make a whole piece of software for testing them (figure n). This by itself is very fun to play with, but it also allowed us to fine tune the enemies to the realistic and reliable point we ended up with· 

Class Diagram

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

This early feedback for our game was immensely useful for us. It helped us realise that while the concept and gameplay of our game was interesting and engaging, there was a lot more we could do to make the users feel more comfortable playing, especially in terms of picking up on what the game was all about with as little externa guidance as possible.

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
After our qualitative analysis, we had much to change. We began by creating a tutorial to talk the players through the controls, which drastically decreased confusion in our players. We also added a warning for leaving the combat zone, much  more recognisable "replicator" sprites, and we restyled the objective text in the top right of the screen to make it much clearer. When it came to the final demonstration day we found that nearly every player was able to figure out the controls and objectives with no input from our facilitator. Most were able to complete the tutorial first try, and the normal mode after a few attempts, and only 2 people were able to beat the insane mode. This represents a massive increase in the viability of both the difficulty system, and the onboarding, which we as a team are very proud of. 

We now have a very much polished demo with no bugs that we have been able to find, full music and sound effects, sprites and gameplay. There are of course many more features we would like to add to the game, including more/a choice of weapons (we already have the code infrastructure to cope with this), a story and progression, and much more complex levels - but for the small amount of time we had we are immensly proud of our finished game. 

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
