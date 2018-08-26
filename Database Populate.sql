-- Delete and create database

DROP DATABASE IF EXISTS tarotdata;
CREATE DATABASE IF NOT EXISTS tarotdata;
USE tarotdata;

-- Lets define an order of cards

DROP TABLE IF EXISTS cardorder;
CREATE TABLE cardorder (
	id INT NOT NULL PRIMARY KEY,
	cardname VARCHAR(255) NOT NULL,
    cardsuit VARCHAR(255) NOT NULL,
    imagefile VARCHAR(255) NOT NULL,
	cardsummary VARCHAR(255) NOT NULL,
	carddescription VARCHAR(255),
    cardsummaryreversed VARCHAR(255) NOT NULL,
    carddescriptionreversed VARCHAR(255),
	cardnotes VARCHAR(255)
);

-- Just some boilerplate

SELECT 'Entering information into database' as 'NOW';

-- Table seeding

-- Major Arcana

INSERT INTO cardorder VALUES ( 1, 'The Magician', 'Major Arcana', 'The_Magician.jpg', 'Skill, Self Confidence, The Querent, Male', 'Often represents the person doing the casting.', 'May signify mental illness or distress.', NULL, NULL );
INSERT INTO cardorder VALUES ( 2, 'The High Priestess', 'Major Arcana', 'The_High_Priestess.jpg', 'Secrets, The Future, Female', 'Represents the future as not yet revealed.', 'Passion, Conceit, Superficial Wisdom', NULL, NULL );
INSERT INTO cardorder VALUES ( 3, 'The Empress', 'Major Arcana', 'The_Empress.jpg', 'Plenty, Fruitfullness, Action, Female', 'Inititiative and action, also something not yet known.', 'The Truth, Unravelling Lies, Hesitation', NULL, NULL );
INSERT INTO cardorder VALUES ( 4, 'The Emperor', 'Major Arcana', 'The_Emperor.jpg', 'Power, Sternness, Male', 'A good card, respresents reason, and order, also a male.', 'Compassion, Benevolence', NULL, NULL );
INSERT INTO cardorder VALUES ( 5, 'The Hierophant', 'Major Arcana', 'The_Hierophant.jpg', 'Captitivy, Service, Mercy', 'A card symbolising duty and goodness', 'Over-kindness, Pathological Altruism.', NULL, NULL );
INSERT INTO cardorder VALUES ( 6, 'The Lovers', 'Major Arcana', 'The_Lovers.jpg', 'Love, Companionship, Attraction', 'A good card, respresents companionship and happiness.', 'A foolish endeavour', NULL, NULL );
INSERT INTO cardorder VALUES ( 7, 'The VARCHARiot', 'Major Arcana', 'The_VARCHARiot.jpg', 'Challenge, Struggle, Triumph', 'This card indicates you will struggle to achieve your goals, but ultimately be successful.', 'Dispute, Defeat', NULL, NULL );
INSERT INTO cardorder VALUES (8 , 'Strength', 'Major Arcana', 'Strength.jpg', 'Power, Will, Magnanimity', 'This card represents a will to overcome adversity and is generally positive.', 'Abuse of Power, Discord', NULL, NULL );
INSERT INTO cardorder VALUES (9, 'The Hermit', 'Major Arcana', 'The_Hermit.jpg', 'Solitude, Caution, Prudence', 'This card represents prudence, but also may signify treason or underhandedness.', 'Conceealment, Fear, Unwarranted Caution', NULL, NULL );
INSERT INTO cardorder VALUES (10, 'Wheel of Fortune', 'Major Arcana', 'Wheel_of_Fortune.jpg', 'Fate, Fortune, Destiny', 'A good card, represents reaching the end of a journey and good luck.', 'Abundance, Plenty', NULL, NULL );
INSERT INTO cardorder VALUES (11, 'Justice', 'Major Arcana', 'Justice.jpg', 'Justice, Righteousness, Fairness', 'Rightness and equality before the law, the law in all its forms.', 'Severity, Bias', NULL, NULL );
INSERT INTO cardorder VALUES (12, 'The Hanged Man', 'Major Arcana', 'The_Hanged_Man.jpg', 'Suffering, Sacrifice, Wisdom', 'A bad card, indicates a trial or a negative experience the querent has to go through.', 'Selfishness, Cruelty, Weakness', NULL, NULL );
INSERT INTO cardorder VALUES (13, 'Death', 'Major Arcana', 'Death.jpg', 'Death, Loss, Destruction', 'A bad card, indicates a loss or an unfortunate end of a situation.', 'Stagnation, Depression', NULL, NULL );
INSERT INTO cardorder VALUES (14, 'Temperance', 'Major Arcana', 'Temperance.jpg', 'Moderation, Frugality, Hard Work', 'Advises against excessive pleasure seeking, implies prophecy and foresight.', 'Religion, Disunion, Compelling Interests', NULL, NULL );
INSERT INTO cardorder VALUES (15, 'The Devil', 'Major Arcana', 'The_Devil.jpg', 'Temptation, Wickeness, Violence', 'Symbolises something which is predestined, but not necessarily evil. Temptation. Male.', 'Weakness, Pettiness, Shortsightedness', NULL, NULL );
INSERT INTO cardorder VALUES (16, 'The Tower', 'Major Arcana', 'The_Tower.jpg', 'Calamity, Disgrace, Ruin', 'The worst card, indicates a major problem on the horizon.', 'Opression, Tyranny, Loss of Freedom', NULL, NULL );
INSERT INTO cardorder VALUES (17, 'The Star', 'Major Arcana', 'The_Star.jpg', 'Hope, Possible Loss, Destiny', 'The Star is a final destiny, but to get there you will need to lose something or some part of yourself.', 'Arrogance, Conceit, Ignorance', NULL, NULL );
INSERT INTO cardorder VALUES (18, 'The Moon', 'Major Arcana', 'The_Moon.jpg', 'Mystery, Danger, Deception', 'The Moon indicates something you are not yet fully aware of.', 'Silence, Error, Disorientation', NULL, NULL );
INSERT INTO cardorder VALUES (19, 'The Sun', 'Major Arcana', 'The_Sun.jpg', 'Material Success, Happiness, Contentment', 'The Sun represents a summer in life, a period when things will be good and problems will be diminished.', 'Success, Good Fortune, Contentment', NULL, NULL );
INSERT INTO cardorder VALUES (20, 'Judgement', 'Major Arcana', 'Judgement.jpg', 'Renewal, Change, Outcome', 'Judgement brings change, and is not necessarily a good or bad card itself.', 'Cowardice, Reluctant Decision, Weakness', NULL, NULL );
INSERT INTO cardorder VALUES (0, 'The Fool', 'Major Arcana', 'The_Fool.jpg', 'Mania, Folly, Stupidity', 'This card indicates that you are stumbling into trouble you do not percieve.', 'Absence, Apathy, Vanity', NULL, NULL );
INSERT INTO cardorder VALUES (21, 'The World', 'Major Arcana', 'The_World.jpg', 'Success, Journey, Change in Place', 'The World brings travel and also adventure. It is a card of exploration and learning.', 'Stagnation, Inertia', NULL, NULL );

-- Minor Arcana
-- Wands

INSERT INTO cardorder VALUES (22, 'The King of Wands', 'Wands', 'King_of_Wands.jpg', 'Dark Man, Friendly, Conscientious', 'Generally positive, may signify a positive relationship', 'Severe, Austere, Tolerant', NULL, NULL );
INSERT INTO cardorder VALUES (23, 'The Queen of Wands', 'Wands', 'Queen_of_Wands.jpg', 'Dark Woman, Friendly, Honourable', 'A friendly woman, also love of money, a good harvest', 'Obliging, Opposition, Goodness', NULL, NULL );
INSERT INTO cardorder VALUES (24, 'The Knight of Wands', 'Wands', 'Knight_of_Wands.jpg', 'Departure, Emigration, Alienation', 'Dark young man. A bad card according to some readings.', 'Interruption, Division, Frustration', NULL, NULL );
INSERT INTO cardorder VALUES (25, 'The Page of Wands', 'Wands', 'Page_of_Wands.jpg', 'Dark Young Man, Faithful, Envoy', 'Young man in search of young lady. Favourable.', 'Announcements, Bad News, Instability', NULL, NULL );
INSERT INTO cardorder VALUES (26, 'The Ten of Wands', 'Wands', 'X_of_Wands.jpg', 'Opression, Honour, Perfidy', 'Complex card. A certain loss and difficulties are signified.', 'Difficulties, Intrigues, Disguises', NULL, NULL );
INSERT INTO cardorder VALUES (27, 'The Nine of Wands', 'Wands', 'IX_of_Wands.jpg', 'Strength, Boldness, Delay', 'Ability to withstand opposition. Generally a bad outlook.', 'Obstacles, Austerity, Adversity', NULL, NULL );
INSERT INTO cardorder VALUES (28, 'The Eight of Wands', 'Wands', 'VIII_of_Wands.jpg', 'Activity, Swiftness, Hope', 'A card of movement, arrows of love, domestic change.', 'Jealousy, Dispute, Conscience', NULL, NULL );
INSERT INTO cardorder VALUES (29, 'The Seven of Wands', 'Wands', 'VII_of_Wands.jpg', 'Valour, Strife, Competition', 'Success against overwhelming odds', 'Anxiety, Perplexity, Embarassment', NULL, NULL );
INSERT INTO cardorder VALUES (30, 'The Six of Wands', 'Wands', 'VI_of_Wands.jpg', 'Victory, Good News, Betrayal', 'Several meanings, on the surface winning, below loss of confidence in another', 'Apprehension, Disunity, Fulfillment of Hope', NULL, NULL );
INSERT INTO cardorder VALUES (31, 'The Five of Wands', 'Wands', 'V_of_Wands.jpg', 'Success, Imitation, Competition', 'Represents success, also imitation, as in a sham fight.', 'Disputes, Trickery, Quarrels', NULL, NULL );
INSERT INTO cardorder VALUES (32, 'The Four of Wands', 'Wands', 'IV_of_Wands.jpg', 'Repose, Harmony, Peace', 'Unexpected good fortune, a simple card', 'Prosperity, Harmony, Repose', NULL, NULL );
INSERT INTO cardorder VALUES (33, 'The Three of Wands', 'Wands', 'III_of_Wands.jpg', 'Enterprise, Commerce, Discovery', 'Enterprise and collaboration will favour great rewards', 'End of Troubles, Peace, Ending', NULL, NULL );
INSERT INTO cardorder VALUES (34, 'The Two of Wands', 'Wands', 'II_of_Wands.jpg', 'Fortune, Riches, Suffering', 'Two meanings, on one hand magnificience, on the other mortification', 'Surprise, Enchantment, Fear', NULL, NULL );
INSERT INTO cardorder VALUES (35, 'The Ace of Wands', 'Wands', 'Ace_of_Wands.jpg', 'Creation, Invention, Birth', 'The beginning of enterprise, birth, generation, inheritance', 'Fall, Decadence, Joy', NULL, NULL );

-- Cups

INSERT INTO cardorder VALUES (36, 'The King of Cups', 'Cups', 'King_of_Cups.jpg', 'Fair man, Business, Law', 'Generally a fair haired man of intelligence. Beware of his ill will.', 'Dishonesty, Double Dealing, Scandal', NULL, NULL );
INSERT INTO cardorder VALUES (37, 'The Queen of Cups', 'Cups', 'Queen_of_Cups.jpg', 'Fair woman, Honest, Devoted', 'Often a fair haired woman. Usually a good person, the gift of vision and happiness.', 'Vice, Dishonour, A Rich Marriage', NULL, NULL );
INSERT INTO cardorder VALUES (38, 'The Knight of Cups', 'Cups', 'Knight_of_Cups.jpg', 'A Messenger, Arrival, A Visit', 'Signifies an approach, as of a visitor, a position, or a friend', 'Trickery, Duplicity, Fraud', NULL, NULL );
INSERT INTO cardorder VALUES (39, 'The Page of Cups', 'Cups', 'Page_of_Cups.jpg', 'Young Man, Helpfulness, Meditiation', 'A young man who will render good service. Also as applied to business', 'Seduction, Deception, Attachment', NULL, NULL );
INSERT INTO cardorder VALUES (40, 'Ten of Cups', 'Cups', 'X_of_Cups.jpg', 'Contentment, Perfection, The Locality', 'Generally a good card, signifying happiness beyond expectations', 'Indignation, Sorrow, Quarrels', NULL, NULL );
INSERT INTO cardorder VALUES (41, 'Nine of Cups', 'Cups', 'IX_of_Cups.jpg', 'Concord, Contentment, Well Being', 'Satisfaction and good outcomes. Victory and positive augury.', 'Truth, Liberty, Imperfections', NULL, NULL );
INSERT INTO cardorder VALUES (42, 'Eight of Cups', 'Cups', 'VIII_of_Cups.jpg', 'Anbandonment, Withdrawal, Modesty', 'Change and transition, solitude.', 'Joy, Drifting, Happiness', NULL, NULL );
INSERT INTO cardorder VALUES (43, 'Seven of Cups', 'Cups', 'VII_of_Cups.jpg', 'Options, Choices, Imagination', 'Nothing permanent or substantial, an idea, a movement. A fair child.', 'Desire, Will, Drive', NULL, NULL );
INSERT INTO cardorder VALUES (44, 'Six of Cups', 'Cups', 'VI_of_Cups.jpg', 'Memory, Nostalgia, Childhood', 'A card representing growing up, and the forces that shaped you.', 'Your Future, Changes, New Things', NULL, NULL );
INSERT INTO cardorder VALUES (45, 'Five of Cups', 'Cups', 'V_of_Cups.jpg', 'Loss, Recovery, Bitterness', 'A loss, but something remains to be thankful for.', 'Affinity, Ancestry, Return', NULL, NULL );
INSERT INTO cardorder VALUES (46, 'Four of Cups', 'Cups', 'IV_of_Cups.jpg', 'Depression, Regret, Disgust', 'Not taking advantage of the great things offered.', 'Novelty, Activity, Joy of Life', NULL, NULL );
INSERT INTO cardorder VALUES (47, 'Three of Cups', 'Cups', 'III_of_Cups.jpg', 'Gatherings, Parties, A Reunion', 'A matter ending happily, a celebration, return of positive feelings.', 'Over-indulgence, A Cancellation, Loneliness', NULL, NULL );
INSERT INTO cardorder VALUES (48, 'Two of Cups', 'Cups', 'II_of_Cups.jpg', 'Partnership, Unity, Respect', 'A positive relationship or love affair.', 'Abuse, Dominance, Bullying', NULL, NULL );
INSERT INTO cardorder VALUES (49, 'Ace of Cups', 'Cups', 'Ace_of_Cups.jpg', 'Joy, New Friends, Opportunity', 'Now is an auspicious time for new undertakings, and to make friends and socialise.', 'Sadness, Missed Opportunities, Infertility', NULL, NULL );

-- Swords

INSERT INTO cardorder VALUES (50, 'The King of Swords', 'Swords', 'King_of_Swords.jpg', 'Judgement, Clarity, Good Planning', 'Clarity, new plans, inititiative and insight. An auspicious card.', 'Lack of ideas, lack of judgement, lack of initiative', NULL, NULL );
INSERT INTO cardorder VALUES (51, 'The Queen of Swords', 'Swords', 'Queen_of_Swords.jpg', 'Honesty, Sophistication, Realism', 'May represent an older woman. Sharp wit, honest, candid', 'Lack of ideas, lack of judgement, lack of initiative', NULL, NULL );
INSERT INTO cardorder VALUES (52, 'The Knight of Swords', 'Swords', 'Knight_of_Swords.jpg', 'Opportunities, Assertiveness, Rebellion', 'It is important to seize the moment, and not be put off by rudeness or obstacles', 'Missed Opportunities, Victimhood, Criminal', NULL, NULL );
INSERT INTO cardorder VALUES (53, 'The Page of Swords', 'Swords', 'Page_of_Swords.jpg', 'Inspiration, Vivilance, Delay', 'Be guarded, patient, and think before you speak.', 'Coldness, Not Being Heard, Paranoia', NULL, NULL );
INSERT INTO cardorder VALUES (54, 'Ten of Swords', 'Swords', 'X_of_Swords.jpg', 'Betrayal, Failure, Curses', 'Anothers ill will, or a lack of self confidence. May denote a victim complex. A bad card.', 'Survival, Winning over Hatred, Ruin', NULL, NULL );
INSERT INTO cardorder VALUES (55, 'Nine of Swords', 'Swords', 'IX_of_Swords.jpg', 'Anxiety, Stress, Inability to Cope', 'Mental anguish and an inability to rise above it. May denote nightmares, self-loathing, negativity.', 'Opening Up, Getting Help, Depression', NULL, NULL );
INSERT INTO cardorder VALUES (56, 'Eight of Swords', 'Swords', 'VIII_of_Swords.jpg', 'Trapped, Restricted, Psychological Issues', 'This card may denote feeling stuck in a rut or trapped in a career or relationship. A punishment.', 'Release, Changes, Depression', NULL, NULL );
INSERT INTO cardorder VALUES (57, 'Seven of Swords', 'Swords', 'VII_of_Swords.jpg', 'Theft, Lies, Lack of Conscience', 'Deceitful, risky, or self destructive behaviour. Dishonesty and disregard for others.', 'Confession, Getting Caught, Authority', NULL, NULL );
INSERT INTO cardorder VALUES (58, 'Six of Swords', 'Swords', 'VI_of_Swords.jpg', 'Healing, Relief, Spiritual Guidance', 'Progress, intuition, and listening to your spiritual guides.', 'Lack of Progress, Slow Healing, Delay', NULL, NULL );
INSERT INTO cardorder VALUES (59, 'Five of Swords', 'Swords', 'V_of_Swords.jpg', 'Surrender, Defeat, Lack of Communication', 'A conflict that requires communication and cooperation to solve.', 'Resolution, Moving On, Regret', NULL, NULL );
INSERT INTO cardorder VALUES (60, 'Four of Swords', 'Swords', 'IV_of_Swords.jpg', 'Mental Overload, Regrouping, Counseling', 'A matter is causing mental anguish, but is not as bad as it appears. Worrying may be making matters worse.', 'Awakening, Lack of Self-Protection, Burn-Out', NULL, NULL );
INSERT INTO cardorder VALUES (61, 'Three of Swords', 'Swords', 'III_of_Swords.jpg', 'Trauma, Heartache, Grief', 'A period of emotional pain, often associated with a loss. Need for time to heal.', 'Grieving Process, Optimism, Forgiveness', NULL, NULL );
INSERT INTO cardorder VALUES (62, 'Two of Swords', 'Swords', 'II_of_Swords.jpg', 'A Tough Decision, Dual Loyalties, Unexpressed Emotions', 'Choices need to be made, but the choice will be a difficult one.', 'Procrastination, Over-Caution, Lies', NULL, NULL );
INSERT INTO cardorder VALUES (63, 'Ace of Swords', 'Swords', 'Ace_of_Swords.jpg', 'Communication, New Ideas, The Right Decision', 'Intellectual ability as it relates to the situation.', 'Lack of Ability, Creative Blocks, The Wrong Decision', NULL, NULL );

-- Pentacles

INSERT INTO cardorder VALUES (64, 'King of Pentacles', 'Pentacles', 'King_of_Pentacles.jpg', 'A Mature Male, Dependable, Hard Work', 'Trying to better oneself, and a positive outcome.', 'A Disorganised Man, Corruption, Greed', NULL, NULL );
INSERT INTO cardorder VALUES (65, 'Queen of Pentacles', 'Pentacles', 'Queen_of_Pentacles.jpg', 'A Mature Female, Social, Grounded', 'Financial Success, healing and independence. A maternal card. Good fortune.', 'Ungrounded, A Social Striver, Manipulation', NULL, NULL );
INSERT INTO cardorder VALUES (66, 'Knight of Pentacles', 'Pentacles', 'Knight_of_Pentacles.jpg', 'Persistance, Ambition, Natural Gifts', 'Common sense, organisation, self-agency and following your plans through to completion.', 'Apathy, Impatience, A Gambler', NULL, NULL );
INSERT INTO cardorder VALUES (67, 'Page of Pentacles', 'Pentacles', 'Page_of_Pentacles.jpg', 'Grounded Youth, Loyalty, A Good Beginning', 'Good news in earthly matters, a firm foundation upon which to build.', 'Lack of Goals, Laziness, Lack of Agency', NULL, NULL );
INSERT INTO cardorder VALUES (68, 'Ten of Pentacles', 'Pentacles', 'X_of_Pentacles.jpg', 'Unexpected Good Fortune, Tradition, Family Issues', 'A card of family and others who are close to you. A positive omen.', 'Financial Dispute, Debt, Family Feuding', NULL, NULL );
INSERT INTO cardorder VALUES (69, 'Nine of Pentacles', 'Pentacles', 'IX_of_Pentacles.jpg', 'Freedom, Retirement, Holidays', 'Previous hard work has paid off and you can enjoy your reward. Also pregnancy or childbirth', 'Failure to Put Work In, Miscarriage, Property Damage', NULL, NULL );
INSERT INTO cardorder VALUES (70, 'Eight of Pentacles', 'Pentacles', 'VIII_of_Pentacles.jpg', 'Growth, Recognition, Self-Employment', 'A period of work, and digillence. Education, a new job, a new wisdom.', 'A Poor Employment, Over-Work, Over-Spending', NULL, NULL );
INSERT INTO cardorder VALUES (71, 'Seven of Pentacles', 'Pentacles', 'VII_of_Pentacles.jpg', 'Coming to Fruition, Nurturing, Maturity', 'Your hard work is paying off. This is a card of encouragement.', 'Lack of Returns, A Workaholic, Unrecognised Effort', NULL, NULL );
INSERT INTO cardorder VALUES (72, 'Six of Pentacles', 'Pentacles', 'VI_of_Pentacles.jpg', 'VARCHARity, Generosity, Gratitude', 'Help, Gifts and Equality of all types. Friendship and Loyalty.', 'Gullibility, Gift with Strings Attached, Lack of VARCHARity', NULL, NULL );
INSERT INTO cardorder VALUES (73, 'Five of Pentacles', 'Pentacles', 'V_of_Pentacles.jpg', 'Financial Struggle, Divorce, Hardship', 'Bad luck, unemployment, destitution. A bad card.', 'Change in Fortune, Recovery, Employment', NULL, NULL );
INSERT INTO cardorder VALUES (74, 'Four of Pentacles', 'Pentacles', 'IV_of_Pentacles.jpg', 'Hoarding, Miserliness, Materialism', 'Allowing yourself to be owned by material goods.', 'Letting Go, Decluttering, Large Purchases', NULL, NULL );
INSERT INTO cardorder VALUES (75, 'Three of Pentacles', 'Pentacles', 'III_of_Pentacles.jpg', 'Learning, Apprenticeship, Business Collaboration', 'A card of cooperation and learning from another in business.', 'Failure to Learn, Poor Quality, Lack of Growth', NULL, NULL );
INSERT INTO cardorder VALUES (76, 'Two of Pentacles', 'Pentacles', 'II_of_Pentacles.jpg', 'Work-Life Balance, Accounting, Financial Decisions', 'A material or financial decision to be made.', 'Lack of Balance, Overwork, Financial Over-Extension', NULL, NULL );
INSERT INTO cardorder VALUES (77, 'Ace of Pentacles', 'Pentacles', 'Ace_of_Pentacles.jpg', 'Opportunities, Financial Abundance, New Beginnings', 'Excitement, and an opportunity to manifest your goals into reality.', 'Stinginess, Lack of Opportunity, Shortage of Money', NULL, NULL );



