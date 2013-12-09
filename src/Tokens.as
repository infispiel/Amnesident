package
{

    public class Tokens {
		public static var tokenList:Array;
		public static var ordinaryItems:Array;
		public static var itemList:Array;
		
		public function Tokens() {
			var moldyYogurtWeek:Item = new Item(AssetsRegistry.table_m_moldPic, AssetsRegistry.table_w_moldPic,125, 200, "It's covered in mold! I'm going to have a word with room service....");
			var freshYogurt:Item = new Item(AssetsRegistry.table_m_yogurtPic, AssetsRegistry.table_w_yogurtPic,125, 200, "Whoever put this here must have known how much I love cucumber yogurt. How kind!");
			var bed:Item = new Item(AssetsRegistry.bedPic, AssetsRegistry.bedWoodPic,307, 115, "I only woke up a few minutes ago, I'm not going back to sleep already!");
			var mrCatPic:Item = new Item(AssetsRegistry.mrCatPic, AssetsRegistry.mrCatPic,127, 459, "Truly a magnificent work of art. It captures the beauty and feline grace of the animal perfectly.");
			var presPic:Item = new Item(AssetsRegistry.mrPresidentPic, AssetsRegistry.mrPresidentPic,127, 459, "What a handsome fellow! No wonder the public voted for him....");
			var bedNewsPres:Item = new Item(AssetsRegistry.bedWithnewsPic, AssetsRegistry.bedWoodWithnewsPic,307, 115, "The headline reads: 'Is Craine Insane? President's erratic behavior mystifies family, staff.'");
			var mirror:Item = new Item(AssetsRegistry.table_m_mirrorPic, AssetsRegistry.table_w_mirrorPic,125, 200, "Now at least I know one thing about myself: I am ridiculously good-looking!");
			var catRazor:Item = new Item(AssetsRegistry.table_m_razorPic, AssetsRegistry.table_w_razorPic,125, 200, "A razor? I never saw the point in these. I prefer to keep my hair flowing and soft.");
			var grayCatFood:Item = new Item(AssetsRegistry.grayboxCatPic, AssetsRegistry.grayboxCatPic,171, 171, "It's a package of Graybox cat food, filled with the bland-looking parallelopipeds cats love! What a stroke of luck!");
			var cloneTvNews:Item = new Item(AssetsRegistry.tvPic, AssetsRegistry.tvPic,335, 468, "The reporter is saying: 'President Craine has just authorized the distribution of free fedoras to all children under the age of 6. Truly, a great day for America!'");
			var moldyYogurtJanitor:Item = new Item(AssetsRegistry.table_m_moldPic, AssetsRegistry.table_w_moldPic,125, 200, "They left this here for me to clean up? Just who do they think I am, anyway?");
			var presPicJanitor:Item = new Item(AssetsRegistry.mrPresidentPic, AssetsRegistry.mrPresidentPic,127, 459, "Now there's a familiar face! I'm starting to piece things together already!");
			var bedNewsJanitor:Item = new Item(AssetsRegistry.bedWithnewsPic, AssetsRegistry.bedWoodWithnewsPic,307, 115, "The headline reads: 'White House Turning Gray: Disappearance of cleaning staff leads to dirt accumulation on famous building.'");
			var mrCatRulesPic:Item = new Item(AssetsRegistry.mrCatPic, AssetsRegistry.mrCatPic,127, 459, "My wonderful pet, Mr. Cat! I wonder why he has his own presidential-style portrait...");
			var windowCatBad:Item = new Item(AssetsRegistry.windowPic, AssetsRegistry.woodWindowPic,200, 459, "It's probably a nice day outside, I'll open the window...Are those puppies? Why are those terrible soldiers kicking them? WHY IS EVERYTHING ON FIRE?!");
			var windowCatGood:Item = new Item(AssetsRegistry.windowPic, AssetsRegistry.woodWindowPic,200, 459, "That's odd. It seems like there are a lot more cats outside than normal. Wait a second, is that one running for Mayor?");
			var vpLetter:Item = new Item(AssetsRegistry.table_m_chargerPic, AssetsRegistry.table_w_chargerPic,125, 200, "It's a letter from the Vice President. She's talking about seizing power from someone. Who could that possibly be?");
			var vpTvNews:Item = new Item(AssetsRegistry.tvPic, AssetsRegistry.tvPic,335, 468,"Huh. They're reporting about the UN as if it rules the world. And as if it's a dictatorship. And the Vice President is in a throne at the head of the meeting.");
			var grayboxHouse:Item = new Item(AssetsRegistry.grayboxHousingPic, AssetsRegistry.grayboxHousingPic,171, 171, "It's marked 'Graybox Corp. Official Housing'. It looks cozy, but what's the point of putting a house inside another building?");
			var grayboxRulesTvNews:Item = new Item(AssetsRegistry.tvPic, AssetsRegistry.tvPic,335, 468, "It's playing a commercial for Graybox Turkey Substitute with Gray-vy. I'd take moldy yogurt over this any day.");
			var grayboxBooks:Item = new Item(AssetsRegistry.bookshelf1Pic, AssetsRegistry.bookshelf1Pic,200, 382, "'Fox in Box'...'The Box and the Hound'...these books seem pretty boring.");
			var youRuleTvNews:Item = new Item(AssetsRegistry.tvPic, AssetsRegistry.tvPic,335, 468, "The reporter says: 'During the time our glorious leader has been incapacitated, 376 bills have been submitted for his approval. Will Turkey Substitute become the official bird of the United States? We'll just have to wait for his return to find out.'");
			var youRuleWindow:Item = new Item(AssetsRegistry.windowPic, AssetsRegistry.woodWindowPic,200, 459, "Someone outside the window spots me and starts cheering. I'm pretty sure I wasn't this popular before I wound up here...I should get amnesia more often!");
			var tenMinDesk:Item = new Item(AssetsRegistry.table_m_chargerPic, AssetsRegistry.table_w_chargerPic,125, 200, "My hospital chart is on the desk. Apparently, I arrived here at 9:50 PM on July 4, 2013.");
			var tenMinNews:Item = new Item(AssetsRegistry.tvPic, AssetsRegistry.tvPic,335, 468, "They're showing fireworks on the 10 o'clock news. It's so pretty!");
			var weekRazor:Item = new Item(AssetsRegistry.table_m_razorPic, AssetsRegistry.table_w_razorPic,125, 200, "Come to think of it, I could use a shave.");
			var weekNews:Item = new Item(AssetsRegistry.bedWithnewsPic, AssetsRegistry.bedWoodWithnewsPic,307, 115, "Nothing much of interest: the comics are already missing. It's dated July 20, 2013.");
			var hundredYearYogurt:Item = new Item(AssetsRegistry.table_m_moldPic, AssetsRegistry.table_w_moldPic,125, 200, "It looks like a cup of mold to me, but it's marked 'Yogurt'. Maybe it's a new flavor?");
			var hundredYearWindow:Item = new Item(AssetsRegistry.windowPic, AssetsRegistry.woodWindowPic,200, 459, "A car is flying around outside. Its wings are truly majestic.");
			var hundredYearGraybox:Item = new Item(AssetsRegistry.grayboxBeardPic, AssetsRegistry.grayboxBeardPic,171, 171, "It's marked 'Graybox Corp. Beard Annihilator'...my hair may have grown while I was asleep, but I'd rather not try this out.");
			var amnesiaSelfTvNews:Item = new Item(AssetsRegistry.tvPic, AssetsRegistry.tvPic,335, 468,"The world is half lava, half cat hair? Hiding in boxes is our only hope of survival? Who could have been so irresponsible?");
			var amnesiaSelfNote:Item = new Item(AssetsRegistry.table_m_chargerPic, AssetsRegistry.table_w_chargerPic,125, 200, "This note...it's in my handwriting and seems familiar...too bad my handwriting is so terrible. I can't read a word of this.");
			var amnesiaVpNote:Item = new Item(AssetsRegistry.table_m_chargerPic, AssetsRegistry.table_w_chargerPic,125, 200, "It's a note from the Vice President: 'He's so annoying! If only I could get him out of the way for a while...'");
			var amnesiaVpJournal:Item = new Item(AssetsRegistry.table_m_redbookPic, AssetsRegistry.table_w_redbookPic,125, 200, "The Vice President's diary. 'Dear Diary, I finally bought the amnesia medicine. It comes in a giant needle marked 'Amnesia'. Not subtle at all.'...only one entry? Really?");
			var amnesiaGrayboxTvNews:Item = new Item(AssetsRegistry.tvPic, AssetsRegistry.tvPic,335, 468, "It's a commercial. 'Feeling like the world's not going your way? Graybox Forget-O-Matic! Restart your life today!'");
			var amnesiaGrayboxNews:Item = new Item(AssetsRegistry.bedWithnewsPic, AssetsRegistry.bedWoodWithnewsPic,307, 115, "The headline reads: 'Graybox in the Red: Side effects of new product push stock prices down.'");
			var amnesiaGrayboxBook:Item = new Item(AssetsRegistry.table_m_yellowbookPic, AssetsRegistry.table_w_yellowbookPic, 125, 200, "Some notes from Graybox Corporation's R&D department. I thought they were kicked out of this hospital, but I guess they're still hanging around.");
			var allergyCatPic:Item = new Item(AssetsRegistry.mrCatPic, AssetsRegistry.mrCatPic,127, 459, "My eyes are watering, but whether from the beauty of this portrait or from allergies I cannot tell.");
			var allergyBook:Item = new Item(AssetsRegistry.table_m_bluebookPic, AssetsRegistry.table_w_bluebookPic,125, 200, "It's the National Journal of Amphigory. Let's see...'Autoimmune response to Fel d 4 linked to memory lapses'...this makes no sense!");
			var allergyDesk:Item = new Item(AssetsRegistry.desk2BasicPic, AssetsRegistry.desk1BasicPic,306, 150, "A note from the Vice President: 'Don't you think you spend too much time with Mr. Cat?' How dare she?");
			var windowOrdinary:Item = new Item(AssetsRegistry.windowPic,AssetsRegistry.woodWindowPic, 200, 459, "This window really needs to be washed. I can't even see out of it!");
			var tvOrdinary:Item = new Item(AssetsRegistry.tvPic, AssetsRegistry.tvPic,335, 468, "All it has are kids channels, and those gave me a headache the moment they started.");
			var tableBigOrdinary:Item = new Item(AssetsRegistry.desk2BasicPic, AssetsRegistry.desk1BasicPic,306, 150, "Just a bunch of really boring paperwork. I think I'm breaking some confidentiality agreements just by breathing on them.");
			var tableBigOrdinaryLamp:Item = new Item(AssetsRegistry.desk2LampPic,AssetsRegistry.desk1LampPic, 306, 272, "It's a Desk.");

			// Add items which don't have a connection to tokens here.
			ordinaryItems = new Array(windowOrdinary, tvOrdinary, tableBigOrdinary, tableBigOrdinaryLamp);

			// Add items which are used in story tokens here.
			itemList = new Array(moldyYogurtWeek, freshYogurt, bed, mrCatPic, presPic, bedNewsPres, mirror, catRazor, grayCatFood, cloneTvNews, moldyYogurtJanitor, presPicJanitor, bedNewsJanitor, mrCatRulesPic, windowCatBad, windowCatGood, vpLetter, vpTvNews, grayboxHouse, grayboxRulesTvNews, grayboxBooks, youRuleTvNews, youRuleWindow, tenMinDesk, tenMinNews, weekRazor, weekNews, hundredYearYogurt, hundredYearWindow, hundredYearGraybox, amnesiaSelfTvNews, amnesiaSelfNote, amnesiaVpNote, amnesiaVpJournal, amnesiaGrayboxTvNews, amnesiaGrayboxNews, amnesiaGrayboxBook, allergyCatPic, allergyBook, allergyDesk);

			// TOKENS
			var youArePres:Token = new Token("Hey, I've seen that face before! I must be the President!", "You are", "the President", new Array(mirror, bedNewsPres));
			var youAreClone:Token = new Token("I look just like the president, but he was just on TV...I must be a president with the power to create projections of myself! No, that makes no sense. I must be a clone!", "You are", "a clone of the President", new Array(mirror, presPic, cloneTvNews));
			var youAreCat:Token = new Token("Now that I remember my elegantly-coiffed fur and impeccable culinary preferences, it's clear to me who I am. How could I be anyone other than Mr. Cat himself?", "You are", "Mr. Cat", new Array(catRazor, mrCatPic, grayCatFood));
			var youAreJanitor:Token = new Token("No! I...I'm the president! I must be! I'm not some lousy janitor! That's what they WANT you to think! It's all a conspiracy!", "You are", "a deluded janitor", new Array(moldyYogurtJanitor, presPicJanitor, bedNewsJanitor));

			var rulerCatBad:Token = new Token("How...how could he? Mr. Cat, my beloved pet, must have taken over the world. It's the only logical conclusion. He's made such a mess of it, too. Odd, he always gave me the best advice...", "The world", "is ruled poorly by Mr. Cat", new Array(mrCatRulesPic, windowCatBad));
			var rulerCatGood:Token = new Token("The cat portrait...cats and people acting as equal citizens...oh no! My pet kitty has taken over the world!", "The world", "is ruled well by Mr. Cat", new Array(mrCatRulesPic, windowCatGood));
			var rulerVp:Token = new Token("My VP is in command...of the whole world?! I'm impressed!", "The world", "is ruled by the former VP", new Array(vpLetter, vpTvNews));
			var rulerYou:Token = new Token("Looks like I'm in charge! It doesn't get much better than this!", "The world", "is ruled by you", new Array(youRuleTvNews, youRuleWindow));
			var rulerGraybox:Token = new Token("So many boxes everywhere...this must be the doing of the nefarious Graybox Corporation! They've been trying to gain control of government assets for a while...looks like they finally succeeded.", "The world", "is ruled by Graybox Corp.", new Array(grayboxHouse, grayboxRulesTvNews, grayboxBooks));
			
			var timeTenMin:Token = new Token("Wait, it's still the Fourth of July! I've barely been here for ten minutes!", "It has been", "ten minutes", new Array(tenMinDesk, tenMinNews));
			var timeWeek:Token = new Token("I'd guess I've been here for around a week.", "It has been", "a week", new Array(weekRazor, weekNews, moldyYogurtWeek));
			var timeHundredYears:Token = new Token("Oh no, someone must have transported me into the future! ...or I was just asleep for a hundred years. Not sure which makes more sense, really!", "It has been", "a hundred years", new Array(hundredYearYogurt, hundredYearWindow, hundredYearGraybox));
			
			var amnesiaSelf:Token = new Token("The state of the world, that note I wrote...I caused all of it! No wonder I gave myself amnesia. I wonder if I could do it again...", "Your amnesia was caused by", "yourself", new Array(amnesiaSelfNote, amnesiaSelfTvNews));
			var amnesiaVp:Token = new Token("So, the VP was scheming against me to make a grab for power...come to think of it, I do remember that giant 'Amnesia' needle now...", "Your amnesia was caused by", "the VP", new Array(amnesiaVpNote, amnesiaVpJournal));
			var amnesiaGraybox:Token = new Token("Oh, that's right, I signed up to test Graybox's new amnesia product. Hey, they offered me $50 for it!", "Your amnesia was caused by", "Graybox Corp.", new Array(amnesiaGrayboxTvNews, amnesiaGrayboxNews, amnesiaGrayboxBook));
			var amnesiaAllergies:Token = new Token("I always was allergic to cats...could that be the cause of my amnesia?", "Your amnesia was caused by", "your cat allergies", new Array(allergyCatPic, allergyBook, allergyDesk));
			var amnesiaMrCatAllergies:Token = new Token("Me, a cat, allergic to my own kin? No wonder I'm in the hospital.", "Your amnesia was caused by", "your cat allergies", new Array(allergyCatPic, allergyBook));

			// PREREQS AND ANTIREQS
			youAreJanitor.addIncompatible(timeTenMin);
			rulerCatBad.addIncompatible(youAreCat);
			rulerCatGood.addIncompatible(youAreCat);
			rulerVp.addPrereq(youArePres);
			rulerYou.addIncompatible(youAreJanitor);
			timeWeek.addIncompatible(youAreCat);
			amnesiaAllergies.addIncompatible(youAreCat);
			amnesiaMrCatAllergies.addPrereq(youAreCat);
			
			rulerCatBad.addIncompatible(rulerCatGood);
			rulerCatBad.addIncompatible(rulerVp);
			rulerCatBad.addIncompatible(rulerYou);
			rulerCatBad.addIncompatible(rulerGraybox);
			rulerCatGood.addIncompatible(rulerVp);
			rulerCatGood.addIncompatible(rulerYou);
			rulerCatGood.addIncompatible(rulerGraybox);
			rulerVp.addIncompatible(rulerYou);
			rulerVp.addIncompatible(rulerGraybox);
			rulerYou.addIncompatible(rulerGraybox);

			youArePres.addIncompatible(youAreClone);
			youArePres.addIncompatible(youAreCat);
			youArePres.addIncompatible(youAreJanitor);
			youAreClone.addIncompatible(youAreCat);
			youAreClone.addIncompatible(youAreJanitor);
			youAreCat.addIncompatible(youAreJanitor);

			timeTenMin.addIncompatible(timeWeek);
			timeTenMin.addIncompatible(timeHundredYears);
			timeWeek.addIncompatible(timeHundredYears);
			
			amnesiaSelf.addIncompatible(amnesiaVp);
			amnesiaSelf.addIncompatible(amnesiaGraybox);
			amnesiaSelf.addIncompatible(amnesiaAllergies);
			amnesiaSelf.addIncompatible(amnesiaMrCatAllergies);
			amnesiaVp.addIncompatible(amnesiaGraybox);
			amnesiaVp.addIncompatible(amnesiaAllergies);
			amnesiaVp.addIncompatible(amnesiaMrCatAllergies);
			amnesiaGraybox.addIncompatible(amnesiaAllergies);
			amnesiaGraybox.addIncompatible(amnesiaMrCatAllergies);
			amnesiaAllergies.addIncompatible(amnesiaMrCatAllergies);
			
			tokenList = new Array(youArePres, youAreClone, youAreCat, youAreJanitor, rulerCatBad, rulerCatGood, rulerVp, rulerYou, rulerGraybox, timeTenMin, timeWeek, timeHundredYears, amnesiaSelf, amnesiaVp, amnesiaGraybox, amnesiaAllergies, amnesiaMrCatAllergies);
		}
		
		public function getItemList():Array {
			return itemList;
		}
		public function getTokenList():Array {
			return tokenList;
		}
		
    }
}
