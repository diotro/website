module Essay exposing (Model, essays, getEssayBySlug, view, viewEssayLink, viewEssayPreview)

import Html exposing (..)
import Html.Attributes exposing (..)
import Route



{-
   This module has some problems.
   * Essays can only be plaintext, no formatting or even links.
   * The source of every essay has to be in code in this file. I want to store the text in plaintext files
     that I read at build time.
-}


type alias Model =
    { name : String
    , slug : Slug
    , content : List ContentItem
    }


type alias Slug =
    String


type alias QuoteItem =
    { author : String
    , maybeSource : Maybe String
    , quote : String
    }


type ContentItem
    = Plain String
    | Quote QuoteItem


essays : List Model
essays =
    -- written 2019-06-02
    List.reverse
        [ Model "Deliberate Practice for Software Engineering"
            "deliberate"
            [ Plain """Solving HackerRank-style programming challenges will not make you a better software developer. Day-to-day software engineering almost never requires implementation of algorithms, and when it does, it is important that your implementations are maintainable. Practicing how to write one-off algorithms then will not help you practice software engineering. It may give you skills that will be helpful in software engineering – learning the full API of the standard libraries of languages, practicing writing some types of code fast, and general debugging. But it won't help you as much as deliberate practice for software engineering."""
            , Plain """What would a programming challenge intended to be delibrate practice look like? I don't know exactly, and to figure it out we first have to define software engineering, so that we can see what it means to get better at it. Let's say software engineering is writing maintainable, correct code. If someone writes more maintainable code than they used to, we would say they're a better software engineer, and the same for writing code that is closer to correct. HackerRank-style challenges will help with correctness, as your code does have to pass a suite of unit tests. But it doesn't help you with _ensuring_ that your code is closer to correct, because you aren't writing your own unit tests. If you have someone else's test harness to lean on, you aren't practicing the skill of testing, which means a programming challenge where you have to write your own tests would be superior. HackerRank-style challenges also don't reward maintainability, in fact, by only judging competitors on speed to solve the problem, writing code that is maintainable will hurt your performance."""
            , Plain """How can we test programmer's on their ability to test? One way of doing this is asking programmers to write unit tests for a problem without writing code, and then seeing if their tests pass with correct implementations and fail on incorrect implementations. This has some issues, most notably that typos in the unit tests would have a huge effect on outcomes, and that the iterative write-test/write-code/debug cycle is the skill we really care about, not writing the tests correctly on the first try. Perhaps it would be better to get developers to write code and tests, or just make the code complex enough that automated unit tests are useful."""
            , Plain """We can test maintainability of programs by having programmers maintain the programs they write for the coding challenge. We can't simulate the experience of opening up a file you haven't touched in a year and having no clue what's happening in it unless we are willing to wait a year. But waiting a year gets rid of the tight feedback loops that you need for deliberate practice. So, we will have people maintain their programs immediately. First, give your programmers a small task, have them implement it, and run their code past your unit tests. Score their solution on correctness on the first challenge, and then have them update the code, adding some features and changing some functionality. Repeat a few more times. Now, you can see how quickly a programmer was able to write and modify their code to meet changing requirements, as well as the functionality along each step of the way."""
            , Plain """If you're using this tool for deliberate practice, you would be able to see which of your decisions lead to maintainable code and which were difficult to update. This would allow you to practice writing maintainable code, something which current programming challenges don't allow. I appreciate that Object-Oriented Design at Northeastern does something similar. For the final two months of the class, you iteratively design a model, view, and controller for an animation that users can dynamically interact with. They manually grade test coverage for each assignment, but without tests, I doubt people would be able to make the third or fourth set of changes without regressions on the first set of requirements. """
            , Plain """Modifying code, not writing code, is most of software engineering, so our classes, challenges, and practice tools should focus on modifying code."""
            ]

        -- written 2019-07-14
        , Model "Improving Your Tooling"
            "tools"
            [ Plain """Why did I swap to zsh? I believed some of the features in it would save me time in the future. Or at least, that's what I want to tell myself. In practice, I swapped to zsh and iterm2 because Danny told me to. I'm going to try and estimate how much time it will actually save me, and how much time investment it will require."""
            , Plain """Figuring out the time investment seems easy at first glance, all that I'll have to do is note that it took me two hours to install and configure the new set-up day of. But in the weeks following that, I've noticed little things bugging me about the current configuration, which prompts a thirty-minute or so dive into the docs to try and fix it. This post-install tuning will probably be the majority of the time that I spend on managing this terminal setup. My old terminal setup, which had major problems that are now resolved completely, did not provide room for tweaking, and so did not distract me with promises of a better future. For example, playing around with my prompt to include the git branch probably saves me time in the long run - now I won't accidentally commit to master and have to cherry-pick, etc. But playing around with the color, to make it a fun green instead of a plain black, will not noticeably affect my well-being in the future. Admittedly, I could have been playing around with prompts and so on with my old setup, but taking one step to improve the situation implicitly justified continuing to change it over time."""
            , Plain """There's a general lesson to be learned here. While I still should make the large changes that will give me most of the benefits (pareto's 20%), the smaller changes won't pay off as well. I think in general, in computer science/software engineering, large changes like using one shell over another, or one programming language over another, take the same amount of time as smaller changes, such as changing a minor misbehavior of your terminal or following a specific style guide in your language. Because the time investment is the same, the investment-to-payoff ratio is larger for larger changes. And so, in the future, I'll try to focus on picking the right tool for the job, and less on the color of that tool."""
            ]

        --    Written 2019-07-28
        , Model "Invariants for Everyday Life"
            "invariants"
            [ Plain """I learned about class invariants in my "Object Oriented Design" class. A class invariant is a property of a class that is always true. For example, a class that instantiates a static field at compile-time has the invariant that that field is never null. Classes with final fields have the invariant that the value in the field won't change (barring reflection-based shenanigans). You get the gist – properties of a class that are enforced by the code. There are also loop invariants, a notion from algorithms, which are invariants about the state of a program during a loop. For example, if you are building up a list one element at a time, an invariant might be that the list you are building has length one less than the loop index."""
            , Plain """Invariants make code easier to reason about. In object-oriented, mutation-filled code, it can be hard to keep track of which methods change what fields, what values a given method may return, and so on. There are many moving parts, and invariants let programmers interacting with these systems rule out some of the worlds. Knowing of an invariant reduces the number of possible states of the world, which simplifies the process of ensuring your code is correct. In the same way that enumeration values make explicit the limited scope of a piece of data, while strings allow infinite possibilities, invariant properties shrink the state space."""
            , Plain """In everyday life, you can also ensure that some properties are true. For example, properties about the locations of your keys. Some people lose their keys often, because there are nearly infinite places keys can be - in your fridge, in a potted plant, in a desk drawer, and so on forever. However, by enforcing the simple invariant "my keys are either in my pocket, or in the key bowl", you can cut down the space to only two possible states. Admittedly, this is a harder constraint to enforce than an invariant in code, but the benefits are worth it. And following this is only a matter of habit: when you take your keys out of your pocket, put them in the key bowl, and vice versa. Another invariant that was helpful to me is ensuring that my wallet is always full while it is in your pocket: when you take your credit card out to pay at a restaurant, I take my wallet out of my pocket, and don't put it back in until I have put the cards back in. This has helped me overcome my habit of attempting to leave restaurants after I have started to pay but before I have signed. Similarly, I kept bringing my computer glasses case, while leaving the glasses themselves on my desk. So, I started enforcing this invariant: I only close the glasses case when it has glasses in it. Then, if it is open, I can clearly see that there are no glasses. Now, I never bring an empty glasses case with me."""
            ]

        --  Written 2019-08-04
        -- TODO make that XKCD link a real link
        , Model "The GRE"
            "gre"
            [ Plain """The GRE is a silly way to evaluate PhD candidates. Let's think about the skills required for day-to-day  research, and contrast with the skills tested by the GRE."""
            , Plain """Research requires a lot of reading, a fair bit of applied statistics, and a lot of writing. The reading is obvious, as papers are the primary way for researchers to formally communicate their ideas. If you lack reading comprehension, you won't be able to keep up with the literature, as you won't understand what the experts in your field are saying. So you must be able to extract the core arguments from a text, evaluate arguments, and understand the vocabulary used in these papers. You have to  used to evaluate statistical arguments, particularly in the health and social sciences, where a lot of the research is based on RCTs and statistical experiments to show the efficacy of a drug or the power of some psychological effect. If you don't know how to evaluate study design, what a p-value means, and how to do Bayesian inference, you will fail to understand many of the arguments being made. And writing is important for the same reason as reading - papers are the primary way to package your ideas for general consumption, so you must be clear and accurate in your writing."""
            , Plain """At first glance, the GRE appears to be testing on those things, after all, the three sections are "Reading", "Quantitative", and "Writing". So surely the skills tested by the GRE are those that will be valuable in a PhD? No. The section headers line up with the abstract notions of the skills, but the details are all wrong. """
            , Plain """Starting with the reading section, there is a large portion that is simply vocabulary and multiple-choice-test-taking skills. One section, about 6 of the 25 questions on the practice exams I've taken, are called the "Section Equivalence" Questions. The question asks you to find a pair of answers that mean the same thing when plugged into the sentence, and lead to a coherent sentence. Let's leave aside the discussion of whether their desired vocabulary is relevant. (Did you know that phlegmatic means "sluggish, unemotional or apathetic"? I didn't, because no one says or writes "phlegmatic".) The question has six possible answers. Looking at the answers alone, avoiding the question, you can get a decent score on these questions. Typically, there are only one or two pairs that mean the same thing, allowing you to narrow down the selection of answers from 30 (picking 2 answers from 6 possible choices) to 2. A 50/50 shot is pretty good: On the GRE, getting 50% of the questions right is around 50th percentile [citation needed]. But notice that we haven't even examined the sentence – this question format is almost entirely a vocabulary question. Once you read the sentence, some mental effort is required to understand which of the two pairs would be coherent, but normally the two pairs are diametric opposites, as in "commonplace/everyday" and "opulent/expensive". Yeah, a quick glance at the sentence is going to immediately tell you which of the two pairs fits. The "text completion" section is similarly based entirely on knowledge of vocabulary, if you assume that people who want to get a PhD have some basic understanding of how sentences work. Maybe my undergraduate classes are atypical, but I had reading comprehension drilled into me by my philosophy professors (after a series of low grades and hanging around in office hours until I got it). Finally, I'll give the GRE some credit: the passage comprehension problems I have no problem with, as reading a passage, performing basic exegesis, and understanding the conclusions that the argument makes and how each point ties in to the whole are fundamentally useful skills. They're useful for PhD students, yes, but also for reading and comprehending news articles and political speeches, so I have no problem practicing my ability to understand arguments."""
            , Plain """ Moving to the math section, I question the usefulness of a majority of questions. As I said above, I am entirely in favor of statistical reasoning being tested. Researchers need this skill. However, beyond the statistics, which are fairly rudimentary, the majority of the questions are about basic algebra and geometry. Don't get me wrong, these skills are incredibly useful in day-to-day life. Algebra is required to budget effectively, understand which of two items in the grocery store is cheaper per unit (https://xkcd.com/309/), and other basic problems of optimization that pop up in your life. Geometry is useful for understanding how much surface area something has before you paint it, intuiting the amount of water in different-sized pots while cooking, and other operations on physical items. But these are not problems that are guaranteed to crop up in someone's research. In evolutinoary game theory, algebra (and calculus) are essential to manipulating the mathematical symbols we represent evolutionary processes with. It's a crucial skill – in the field I want to go into. Neuroscientists, moral philosophers, and historians don't need geometry. So why do we evaluate them on this? You could say that at least the philosophers and historians aren't being evaluated on their quantitative scores as much as the verbal portion of the test - but neuroscientists most definitely are judged on the scores on the mathy parts. I don't object to assessing the quantitative skills of applicants, but the test would be more effective if it tested the quantitative skills that will actually be used most often. Studying geometry for the sake of one test, instead of learning some principles of statistics that will help you forever, seems like a waste. """
            , Plain """The writing section gets at some of the same skills that are used in writing a full paper, but misses the mark in some keys ways. For example, the text editor they give you is crap. No find-and-replace, no spellchecker, nothing. You're given 30 minutes to respond to make an argument for or against a prompt on a random topic, and then 30 minutes to find the holes in an argument. These are both legitimate writing tasks - the argumentative essay is a great way to express your opinions on a subject, and argument analyses demonstrate not only effective writing skills but the ability to understand the flaws in arguments. But giving someone only thirty minutes, while more or less demanding that both essays fit the "intro/three body paragraphs/conclusion" structure, divorces this writing task from academic writing. Papers are written over weeks or months, with multiple rounds of revisions. And they tend to be much longer than the ~750 words I can bang out in a half-hour. This is more about writing to the test, than it is about overall writing ability, although the most egregious lacks will be apparent. For example, a heavy reliance on a spellchecker, a complete misunderstanding of sentence structure, or an inability to make valid arguments will show through in this thirty minute mini-essay. So this task is fine for weeding out terrible writers, who I guess PhD programs assume can't be trained. But do we really need that? If someone is a terrible writer, and particularly if they are bad in the thirty-minute rushed essay responding to a novel prompt with no research, you'll already know. Most of high school involved writing those types of essays, and you know that this applicant got into college. Surely, if their grasp on the English language were so bad as to prevent them from being able to fake it for thirty minutes, they wouldn't be where they are. I understand the purpose of this section for non-native English speakers, but that's what the TOEFL is for."""
            , Plain """I still studied for the test a bit, and had a low-grade fear of doing poorly on it until I took the first practice test. Now, armed with some level of confidence that my score will be good enough, I won't be spending any more of my time on skills that will be useful only in this context. I hope PhD programs use the GRE to reject bad candidates, but don't look at high GRE scores as indicative of anything more than test-taking ability."""
            ]
        , Model "Taking the outside view on technologies"
            "outside"
            [ Plain """I believe that watching Netflix, scrolling through Instagram, and swiping on Tinder is overall bad for other people, on average. So why do I do those things sometimes? In general, when I use these apps, I have reasons why my usage is atypical and so not as likely to be harmful as other people's usage of the apps. This is probably irrational. Without strong evidence pointing towards me begin special, it's much more reasonable to assume that the effect of technologies on my welfare is approximately average."""
            , Plain """"Taking the outside view" means looking at the statistics for people in your situation, and applying those statistics to your own position. Instead of asking whether you are being benefited by a particular app, ask whether people on average are benefited. This engages your critical thinking skills, instead of asking in essence whether you have a first-order desire to keep using some app. It may be addictive, and fun, and even enjoyable, but to ask yourself whether it is beneficial to others will reveal whether it is beneficial to you."""
            , Plain """So, if I think that deleting Instagram or Facebook would be good for everyone else, I ought to delete Instagram or Facebook myself. While I was always an atypical user of both, I think, the same reasons that apply to other people apply to me. My typical argument against Instagram is that the constant comparison of aethetics with other people is bad for your mental health and promotes shallow cravings, as well as being a distraction from what really matters in life. Even when I moved my own Instagram account to a "write-only" mode where I would download the app when I had an image I wanted to post, post the image and delete the app again, I still was influenced by the pressures of knowing other people were seeing the images I posted. When taking photos, wandering around the streets of Boston with my DSLR, I was capturing the photos that I thought others would like. And it wasn't the kind of other-related preference like when you take a photo specifically because you think one person you know will like it, which is almost a form of gift giving. "I took this photo, because I thought you'd like it" is quite different from "I took this photo, because I think it implies positive things about my lifestyle to people who glance at it". Because Instagram makes you care about the judgements of everyone, in aggregate, the niche aesthetic moments that appeal only to one friend aren't the highest value."""
            , Plain """It's worth noting that I did, in fact, delete my Facebook, Instagram, and Snapchat. (I'm still working on Netflix.) This is mostly because the Black Mirror episode "Smithereens" really got to me, not because of the rational deliberations presented here. I think that I benefited from these deletions, because I think that other people would have benefitted from them."""
            ]
        , Model "Good Self-Harm"
            "goodharm"
            [ Plain """While "Good Self-Harm" seems like an oxymoron, it's not. Look at vigorous exercise, cold showers, or fasting. These three activities all cause pain, and we choose to voluntarily inflict them upon ourselves, so we have the "self" and the "harm". Normally, when people talk about self-harm they mean something like cutting, which is not good for you long term. But these other three, despite being painful, are good for you, and in fact one of the three is even actively encouraged by society."""
            , Plain """I think that intentionally doing things that you know you won't enjoy in the moment is good for you in the time beyond that moment. I am more productive and maybe even happier on days I take cold showers, and other people seem to report similar effects. Getting into the shower, I still feel my muscles clench in anti-anticipation, knowing that the cold will hurt. But I step in anyways, and after a minute or so, I don't feel the cold anymore. More importantly, it gets me in the habit of forcing myself to do things that I don't want to do in the moment. The same brain muscles, I think, get used dragging yourself to the gym, into a cold shower after the gym, and off Netflix to do something you actually want to do."""
            , Plain """So why is only exercise encouraged by society, of the three above? Fasting is seen as weird, especially the three-day-long fasts where I work tirelessly, lift my old PRs effortlessly, and develop a deeper understanding of when I'm actually hungry and when I'm just bored. People don't like fasting, and I can totally understand why –\u{00A0}hunger pangs are painful, and missing out on some social opportunities because I can't eat sucks. But going to the gym also sucks, causes pain, and takes up time that could be used elsewhere. There's no important difference I can see here. There are health benefits to lifting, but there are health from fasting as well (autophagy). There are aesthetic/fitness benefits to going to the gym, but similarly to fasting. Fasting execissively can be dangerous, and a sign of a mental disorder, but so can excessive gym-going. And cold showers take very little time –\u{00A0}almost by design, as one of your first goals after you step into a cold shower is to get the hell out. Not only will you save maybe ten minutes by making your showers faster, but cold showers make you more productive and focused during the day. So, if you're going to the gym, I think you should consider the other two interventions, based on the same reasoning."""
            , Plain """Harming yourself with the aim of harming yourself is bad, as your end goal is to damage yourself, which is not good for your long-term prospects. "Harming yourself", like you do at the gym or in a cold shower, has the end goal is improving yourself, so it can be justified more. """
            , Quote (QuoteItem "William James" (Just "Principles of Psychology") """Keep the faculty of effort alive in you by a little gratuitous exercise every day. That is, be systematically ascetic or heroic in little unnecessary points, do every day or two something for no other reason than that you would rather not do it, so that when the hour of dire need draws nigh, it may find you not unnerved.""")
            ]
        , Model "Two Notebooks"
            "notebooks"
            [ Plain """It's weird enough in 2019 to have one notebook, so actively using two earns me some sideways glances. First, the backstory of my attempts to be productive and keep a list of the things I need to do. """
            , Plain """I started bullet-journaling on January 1, 2019, but not because of a New Year's resolution. I had heard the news that Google Inbox was getting shut down in March, and wanted to have a smooth transition from my Google-Inbox-based life organization scheme to a different one. I had heard about bullet journaling from Cal Newport, and I thought I'd give it a try."""
            , Plain """First, let me explain my old bookkeeping system. People would send me emails sometimes, and when they did, I would either archive it immediately after reading (if it didn't require action), or leave it read in my inbox (if and only if the email represented a task). If someone gave me a task in a non-email format, such as professors assigning homework in class, I would put that task as a "reminder" in Google Inbox, and it would show up inline, interwoven with the emails. So, the end result was a list of all my tasks, in reverse chronological order by assignation date. The snooze feature allowed me to keep my inbox free of tasks due far in the future, while not forgetting about them entirely. All was well and good."""
            , Plain """Without Google Inbox, though, you can't see your emails and reminders in one place. (Currently, there is only one place in google that you can snooze your reminders - even though there are about six places where you can add and remove and complete them.) So, I needed a new system. I experimented with other within-Google solutions, like Keep and Reminders and even the calendar. But nothing satisfied my aim of having all my tasks in one place."""
            , Plain """This lead me to bullet journaling. I could write down the immediate tasks for a day each day, and I used Google reminders still for longer-term aims. It seemed reasonable. Eventually, I realized that centralizing the task list was good, and that writing down your goals in a book helps you form the habit of checking that book and doing tasks out of it. So, I stopped, made a calendar assigning one page per week until the end of the year, and resumed the daily sections afterwards. Now, I can plan more than one day in advance, and I'm able to schedule tasks for far in the future. For example, whenever I swap out toothbrushes, I write a note to swap toothbrushes, assigned for three months in the future."""
            , Plain """Bullet Journaling™ wants you to use one notebook for everything – you write down your daily task list, then you doodle a bit, take some notes on math you're thinking about, jot down an idea for an essay, and then write down tomorrow's daily task list five pages of nonsense later. I couldn't quite deal with this, as I started getting into research, as having to flip through dozens of pages of arithmetic to find what I needed to do today and what I failed to do yesterday was difficult. Hence, the second notebook. This notebook allows me to have my math from yesterday next to my math from today, and frees up the other notebook to have one day's tasks next to the other. Even though there are more physical items involved, increasing the physical clutter on my counter, the decrease in intellectual and organizational clutter makes it worth it. """
            ]
        , Model "asdf"
            "unsure"
            [ Plain """Actualizing upon your second-order desires is easier than most people believe, and has a large positive impact on your life. To clarify, secord-order desires are the desires you have that are about the desires you have, for example, a desire to desire candy less and vegetables more, or a desire to desire learning more. These desires are about something entirely internal, your desires, and so should be easier to achieve than desires that require changing the external world. Unfortunately, people don't have that level of control over their brains."""
            , Plain """Or, perhaps, we do have a lot of control over the future state of our minds, but we don't know how to exert that control. This seems relatively implausible, because the default assumption in most matters of the mind is that each person knows their mind entirely. Looking at examples like walking, however, paints a different picture. Walking is widely known [citation needed] to increase subjective wellbeing and causes happier moods, but most people still walk very little. In fact, when I am in a bad mood, I know consciously that going for a walk will make me feel better, but it still requires mental fortitude to get my shoes on and get out the door. Other things which also would improve my mood, like seeing a friend or drinking good coffee, I don't resist in the slightest. I enjoy going for walks, and they are long-term good for me, and yet I still fail to take as many walks as would be subjective-wellbeing-maximizing. I have a second-order desire to desire to go for walks, but a first-order desire to avoid walks. Actualizing the second-order desire, changing my opinion of walking to be immediately and viscerally positive, would be good for me. But conventional wisdom says that you can't just up and decide to change your mind."""
            , Plain """I think that the conventional wisdom is mistaken. Positive and negative reinforcement work on humans, just as well as they do on other animals. Go for a walk, then eat a square of chocolate. Surely, your disposition towards walking will be better than if you bit a lemon immediately afterwards. If you keep up the habit of having chocolate after you go for a walk, your brain will start associating the walk with the pleasant feeling, and keep valuing the walk even once you discontinue the chocolate routine. Another possible way to change your desires is through cognitive behavioral therapy. If cognitive behavioral therapy can help some people with severe eating disorders, depression, or OCD change their thought patterns, it is clear that it has the power to change negative thought and action patterns to neutral ones. If it can change negative to neutral, why not neutral to positive? For the first three weeks I went to the gym, I told myself that I enjoyed the experience, even as I woke up at 6AM, sore, exhausted, and not seeing agny improvement. And after those three weeks, I started enjoying it. Now, correlation is not causation, and it's possible that I would have enjoyed getting back into working out regardless, but it can't hurt."""
            , Plain """The value of being able to change your habits at will (or with a little bit of work) is very high. So I believe it's definitely worth the time taken to at least explore whether you have power over your habits. Low cost, high reward, and trying really hard to change your habits for a few weeks isn't going to hurt anything. """
            ]
        ]


getEssayBySlug : String -> Maybe Model
getEssayBySlug essaySlug =
    List.head (List.filter (\p -> p.slug == essaySlug) essays)


view : Model -> ( String, List (Html msg) )
view { name, content } =
    ( name
    , [ div [ class "blog-content" ]
            [ div [ class "blog-text" ]
                (List.map viewContentItem content)
            ]
      ]
    )


viewContentItem : ContentItem -> Html msg
viewContentItem item =
    case item of
        Plain contents ->
            p [] [ text contents ]

        Quote quoteItem ->
            p [ style "width" "80%", style "padding-left" "8%" ]
                [ i [] [ text quoteItem.quote ]
                , br [] []
                , span [ style "padding-left" "15%" ]
                    [ text ("— " ++ quoteItem.author)
                    , i [] [ text (Maybe.withDefault "" (Maybe.map (\s -> ", " ++ s) quoteItem.maybeSource)) ]
                    ]
                ]


viewEssayPreview : Model -> Html msg
viewEssayPreview model =
    div []
        [ p [] [ viewEssayLink model ]
        , p [ class "essay-preview" ]
            [ text
                (String.left 160
                    (List.foldr (++) " " (List.map contentItemToString model.content))
                    ++ "…"
                )
            ]
        ]


contentItemToString : ContentItem -> String
contentItemToString item =
    case item of
        Plain string ->
            string

        Quote quoteItem ->
            "\"" ++ quoteItem.quote ++ "\""


viewEssayLink : Model -> Html msg
viewEssayLink model =
    span [ class "essay-link" ] [ a [ href (Route.toUrlString (Route.Essay model.slug)) ] [ text model.name ] ]
