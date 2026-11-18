import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// The name of the application
  ///
  /// In en, this message translates to:
  /// **'Starter'**
  String get appName;

  /// Title for the no internet overlay
  ///
  /// In en, this message translates to:
  /// **'Whoops!!'**
  String get noInternetTitle;

  /// Sub-message for the no internet overlay
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection and try again.'**
  String get noInternetSubMessage;

  /// Label for the go to settings button
  ///
  /// In en, this message translates to:
  /// **'Go to settings'**
  String get goToSettings;

  /// Label for sign in button or title
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// Label for sign up button or title
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// Label for the intro page log in button
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get logIn;

  /// Welcome text on the intro page
  ///
  /// In en, this message translates to:
  /// **'Welcome to Rehabwise'**
  String get introWelcome;

  /// Main headline on the intro page
  ///
  /// In en, this message translates to:
  /// **'Every session is a milestone'**
  String get introHeadline;

  /// Supporting description on the intro page
  ///
  /// In en, this message translates to:
  /// **'Years of Rehab expertise, all in one powerful app, guided phase by phase.'**
  String get introDescription;

  /// Label for email input
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Label for password input
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Text for forgot password link
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// Prompt for users who already have an account
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// Prompt for users who don't have an account
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// Label for first name input
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// Validation error when the first name is empty
  ///
  /// In en, this message translates to:
  /// **'Please enter your first name'**
  String get firstNameRequired;

  /// Label for last name input
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// Validation error when the last name is empty
  ///
  /// In en, this message translates to:
  /// **'Please enter your last name'**
  String get lastNameRequired;

  /// Fallback label for a profile detail value that is missing
  ///
  /// In en, this message translates to:
  /// **'Not provided'**
  String get notProvided;

  /// Title for home page
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Welcome message on the home page
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get homeWelcomeBack;

  /// Greeting shown below the welcome message on the home page
  ///
  /// In en, this message translates to:
  /// **'Hello, Sarah!'**
  String get homeGreeting;

  /// Supporting text below the home page greeting
  ///
  /// In en, this message translates to:
  /// **'Your recovery journey continues.'**
  String get homeRecoveryJourney;

  /// Title for the recovery progress card
  ///
  /// In en, this message translates to:
  /// **'Pick up where you left off'**
  String get homeResumeProgress;

  /// Empty-state title shown when there is no active rehabilitation program
  ///
  /// In en, this message translates to:
  /// **'No Active Programs'**
  String get homeNoActivePrograms;

  /// Empty-state message shown when there is no active rehabilitation program
  ///
  /// In en, this message translates to:
  /// **'Start a rehabilitation program to begin tracking your progress'**
  String get homeStartProgramPrompt;

  /// Injury name shown in the recovery progress card
  ///
  /// In en, this message translates to:
  /// **'Hamstring Strain Grade 3'**
  String get homeInjuryName;

  /// Progress completion label shown in the recovery progress card
  ///
  /// In en, this message translates to:
  /// **'40% Completed'**
  String get homeProgressCompleted;

  /// Current rehabilitation phase shown in the recovery progress card
  ///
  /// In en, this message translates to:
  /// **'Phase 2 - Strength'**
  String get homePhase;

  /// Label for the next-session button
  ///
  /// In en, this message translates to:
  /// **'Next Session'**
  String get homeNextSession;

  /// Label for the diagnose injury action card
  ///
  /// In en, this message translates to:
  /// **'Diagnose My Injury'**
  String get homeDiagnoseInjury;

  /// Label for the all programs action card
  ///
  /// In en, this message translates to:
  /// **'All Programs'**
  String get homeAllPrograms;

  /// Label for the chat with experts action card
  ///
  /// In en, this message translates to:
  /// **'Chat With Experts'**
  String get homeChatExperts;

  /// Current step and total step count in the injury diagnosis flow
  ///
  /// In en, this message translates to:
  /// **'{current} / {total}'**
  String diagnoseStepProgress(int current, int total);

  /// Title of the first diagnosis question
  ///
  /// In en, this message translates to:
  /// **'First Steps Pain Rating'**
  String get diagnosePainRatingTitle;

  /// Description of the first diagnosis question
  ///
  /// In en, this message translates to:
  /// **'Rate your pain level during your first steps in the morning or after a period of rest.'**
  String get diagnosePainRatingDescription;

  /// Heading for the injury safety checklist
  ///
  /// In en, this message translates to:
  /// **'Safety Screen'**
  String get diagnoseSafetyScreen;

  /// Safety checklist item about unexplained weight loss
  ///
  /// In en, this message translates to:
  /// **'Unexplained weight loss alongside this pain'**
  String get diagnoseSafetyWeightLoss;

  /// Safety checklist item about fever or feeling unwell
  ///
  /// In en, this message translates to:
  /// **'Fever, chills, or feeling generally unwell around the time of injury'**
  String get diagnoseSafetyFever;

  /// Safety checklist item about worsening numbness or weakness
  ///
  /// In en, this message translates to:
  /// **'Numbness, tingling, or weakness that is spreading or getting worse'**
  String get diagnoseSafetyNumbness;

  /// Safety checklist item about bladder or bowel control changes
  ///
  /// In en, this message translates to:
  /// **'Any change in bladder or bowel control since the injury'**
  String get diagnoseSafetyBladderBowel;

  /// Safety checklist item about chest pain or shortness of breath
  ///
  /// In en, this message translates to:
  /// **'Chest pain or shortness of breath connected to this injury'**
  String get diagnoseSafetyChestPain;

  /// Safety checklist item about visible deformity
  ///
  /// In en, this message translates to:
  /// **'Visible deformity, or a joint that looks obviously out of place'**
  String get diagnoseSafetyDeformity;

  /// Safety checklist item about inability to bear weight
  ///
  /// In en, this message translates to:
  /// **'Complete inability to bear any weight on the injured area'**
  String get diagnoseSafetyWeightBearing;

  /// Safety checklist item about severe night pain
  ///
  /// In en, this message translates to:
  /// **'Night pain that is severe and does not ease with rest or position change'**
  String get diagnoseSafetyNightPain;

  /// Safety checklist item about a history of cancer
  ///
  /// In en, this message translates to:
  /// **'A personal history of cancer'**
  String get diagnoseSafetyCancer;

  /// Safety checklist item about a high-force injury event
  ///
  /// In en, this message translates to:
  /// **'This followed a high-force event (e.g. car accident, fall from height)'**
  String get diagnoseSafetyHighForce;

  /// Title of the second diagnosis step
  ///
  /// In en, this message translates to:
  /// **'Injury Identification'**
  String get diagnoseStepTwoTitle;

  /// Description of the second diagnosis step
  ///
  /// In en, this message translates to:
  /// **'Where is the problem, as specifically as you can describe it.'**
  String get diagnoseStepTwoDescription;

  /// Label for the body region dropdown
  ///
  /// In en, this message translates to:
  /// **'Body Region'**
  String get diagnoseBodyRegionLabel;

  /// Hint for the body region dropdown
  ///
  /// In en, this message translates to:
  /// **'Select a region'**
  String get diagnoseSelectRegion;

  /// Head body region option
  ///
  /// In en, this message translates to:
  /// **'Head'**
  String get diagnoseRegionHead;

  /// Neck body region option
  ///
  /// In en, this message translates to:
  /// **'Neck'**
  String get diagnoseRegionNeck;

  /// Shoulder body region option
  ///
  /// In en, this message translates to:
  /// **'Shoulder'**
  String get diagnoseRegionShoulder;

  /// Upper arm body region option
  ///
  /// In en, this message translates to:
  /// **'Upper arm'**
  String get diagnoseRegionUpperArm;

  /// Elbow body region option
  ///
  /// In en, this message translates to:
  /// **'Elbow'**
  String get diagnoseRegionElbow;

  /// Forearm body region option
  ///
  /// In en, this message translates to:
  /// **'Forearm'**
  String get diagnoseRegionForearm;

  /// Wrist body region option
  ///
  /// In en, this message translates to:
  /// **'Wrist'**
  String get diagnoseRegionWrist;

  /// Hand body region option
  ///
  /// In en, this message translates to:
  /// **'Hand'**
  String get diagnoseRegionHand;

  /// Chest body region option
  ///
  /// In en, this message translates to:
  /// **'Chest'**
  String get diagnoseRegionChest;

  /// Upper back body region option
  ///
  /// In en, this message translates to:
  /// **'Upper back'**
  String get diagnoseRegionUpperBack;

  /// Lower back body region option
  ///
  /// In en, this message translates to:
  /// **'Lower back'**
  String get diagnoseRegionLowerBack;

  /// Hip body region option
  ///
  /// In en, this message translates to:
  /// **'Hip'**
  String get diagnoseRegionHip;

  /// Thigh body region option
  ///
  /// In en, this message translates to:
  /// **'Thigh'**
  String get diagnoseRegionThigh;

  /// Knee body region option
  ///
  /// In en, this message translates to:
  /// **'Knee'**
  String get diagnoseRegionKnee;

  /// Lower leg body region option
  ///
  /// In en, this message translates to:
  /// **'Lower leg'**
  String get diagnoseRegionLowerLeg;

  /// Ankle body region option
  ///
  /// In en, this message translates to:
  /// **'Ankle'**
  String get diagnoseRegionAnkle;

  /// Foot body region option
  ///
  /// In en, this message translates to:
  /// **'Foot'**
  String get diagnoseRegionFoot;

  /// Label for the side radio group
  ///
  /// In en, this message translates to:
  /// **'Side'**
  String get diagnoseSideLabel;

  /// Left side option
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get diagnoseSideLeft;

  /// Right side option
  ///
  /// In en, this message translates to:
  /// **'Right'**
  String get diagnoseSideRight;

  /// Both sides option
  ///
  /// In en, this message translates to:
  /// **'Both Sides'**
  String get diagnoseSideBoth;

  /// Not applicable side option
  ///
  /// In en, this message translates to:
  /// **'Not Applicable'**
  String get diagnoseSideNotApplicable;

  /// Label for the injury location field
  ///
  /// In en, this message translates to:
  /// **'Describe the specific location'**
  String get diagnoseSpecificLocationLabel;

  /// Help text for the injury location field
  ///
  /// In en, this message translates to:
  /// **'E.g. “outside of the knee, just below the joint line” or “front of shoulder, worse when reaching overhead”'**
  String get diagnoseSpecificLocationDescription;

  /// Hint for the injury location field
  ///
  /// In en, this message translates to:
  /// **'type here'**
  String get diagnoseSpecificLocationHint;

  /// Label for the main sport or activity field
  ///
  /// In en, this message translates to:
  /// **'Main sport or activity'**
  String get diagnoseMainSportLabel;

  /// Help text for the main sport or activity field
  ///
  /// In en, this message translates to:
  /// **'What do you do most regularly - this shapes what “recovery” needs to mean for you.'**
  String get diagnoseMainSportDescription;

  /// Hint for the main sport or activity field
  ///
  /// In en, this message translates to:
  /// **'e.g. Running, weightlifting, netball, no regular sport.'**
  String get diagnoseMainSportHint;

  /// Label for the physical demands radio group
  ///
  /// In en, this message translates to:
  /// **'Physical Demands'**
  String get diagnosePhysicalDemandsLabel;

  /// Sedentary physical demand option
  ///
  /// In en, this message translates to:
  /// **'Sedentary / Desk-based'**
  String get diagnoseDemandSedentary;

  /// Rehabilitation physical demand option
  ///
  /// In en, this message translates to:
  /// **'Plantar Fascia Tear Rehabilitation'**
  String get diagnoseDemandRehabilitation;

  /// Light daily activities physical demand option
  ///
  /// In en, this message translates to:
  /// **'Light daily activities'**
  String get diagnoseDemandLightDaily;

  /// Recreational sport physical demand option
  ///
  /// In en, this message translates to:
  /// **'Recreational sport'**
  String get diagnoseDemandRecreational;

  /// Competitive sport physical demand option
  ///
  /// In en, this message translates to:
  /// **'Competitive / high-level sport'**
  String get diagnoseDemandCompetitive;

  /// Manual work physical demand option
  ///
  /// In en, this message translates to:
  /// **'Manual / physically demanding job'**
  String get diagnoseDemandManual;

  /// Label for the training frequency dropdown
  ///
  /// In en, this message translates to:
  /// **'How often do you currently train or play?'**
  String get diagnoseTrainingFrequencyLabel;

  /// Generic select dropdown hint
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get diagnoseSelect;

  /// No training frequency option
  ///
  /// In en, this message translates to:
  /// **'I do not currently train or play'**
  String get diagnoseFrequencyNone;

  /// One to two training sessions per week option
  ///
  /// In en, this message translates to:
  /// **'1-2 times per week'**
  String get diagnoseFrequencyOneToTwo;

  /// Three to four training sessions per week option
  ///
  /// In en, this message translates to:
  /// **'3-4 times per week'**
  String get diagnoseFrequencyThreeToFour;

  /// Five or more training sessions per week option
  ///
  /// In en, this message translates to:
  /// **'5 or more times per week'**
  String get diagnoseFrequencyFiveOrMore;

  /// Title of diagnosis step three
  ///
  /// In en, this message translates to:
  /// **'Onset & Mechanism'**
  String get diagnoseStepThreeTitle;

  /// Question about how the symptoms started
  ///
  /// In en, this message translates to:
  /// **'Did this come on suddenly from a specific moment, or gradually over time?'**
  String get diagnoseOnsetQuestion;

  /// Sudden onset option
  ///
  /// In en, this message translates to:
  /// **'Sudden / traumatic'**
  String get diagnoseOnsetSudden;

  /// Description of sudden onset
  ///
  /// In en, this message translates to:
  /// **'A specific fall, twist, lift, or impact you can point to'**
  String get diagnoseOnsetSuddenDescription;

  /// Gradual onset option
  ///
  /// In en, this message translates to:
  /// **'Gradual / insidious'**
  String get diagnoseOnsetGradual;

  /// Description of gradual onset
  ///
  /// In en, this message translates to:
  /// **'Crept in over days or weeks, no single moment'**
  String get diagnoseOnsetGradualDescription;

  /// Uncertain or mixed onset option
  ///
  /// In en, this message translates to:
  /// **'Not sure / mixed'**
  String get diagnoseOnsetUnsure;

  /// Label for the date of injury field
  ///
  /// In en, this message translates to:
  /// **'Date of injury'**
  String get diagnoseDateOfInjury;

  /// Date format hint
  ///
  /// In en, this message translates to:
  /// **'DD/MM/YYYY'**
  String get diagnoseDateHint;

  /// Label for the injury mechanism dropdown
  ///
  /// In en, this message translates to:
  /// **'How did it happen?'**
  String get diagnoseHowHappened;

  /// Sport or exercise injury mechanism
  ///
  /// In en, this message translates to:
  /// **'During sport or exercise'**
  String get diagnoseMechanismSport;

  /// Fall injury mechanism
  ///
  /// In en, this message translates to:
  /// **'Fall'**
  String get diagnoseMechanismFall;

  /// Twisting injury mechanism
  ///
  /// In en, this message translates to:
  /// **'Twist or turn'**
  String get diagnoseMechanismTwist;

  /// Direct impact injury mechanism
  ///
  /// In en, this message translates to:
  /// **'Direct impact'**
  String get diagnoseMechanismImpact;

  /// Lifting injury mechanism
  ///
  /// In en, this message translates to:
  /// **'Lifting'**
  String get diagnoseMechanismLifting;

  /// Overuse injury mechanism
  ///
  /// In en, this message translates to:
  /// **'Gradual overuse'**
  String get diagnoseMechanismOveruse;

  /// Other or unknown injury mechanism
  ///
  /// In en, this message translates to:
  /// **'Other / not sure'**
  String get diagnoseMechanismOther;

  /// Question about popping or tearing sensation
  ///
  /// In en, this message translates to:
  /// **'Did you feel or hear a pop, snap or tear?'**
  String get diagnosePopQuestion;

  /// Question about continuing activity after injury
  ///
  /// In en, this message translates to:
  /// **'Were you able to keep moving / continue the activity right after?'**
  String get diagnoseContinueActivityQuestion;

  /// Question about swelling after injury
  ///
  /// In en, this message translates to:
  /// **'Did it swell within 24 hours?'**
  String get diagnoseSwellingQuestion;

  /// Question about when symptoms were first noticed
  ///
  /// In en, this message translates to:
  /// **'When did you first notice it?'**
  String get diagnoseFirstNoticeQuestion;

  /// Days time unit option
  ///
  /// In en, this message translates to:
  /// **'days ago'**
  String get diagnoseTimeDays;

  /// Weeks time unit option
  ///
  /// In en, this message translates to:
  /// **'weeks ago'**
  String get diagnoseTimeWeeks;

  /// Months time unit option
  ///
  /// In en, this message translates to:
  /// **'months ago'**
  String get diagnoseTimeMonths;

  /// Question about recent changes in activity
  ///
  /// In en, this message translates to:
  /// **'Has there been a recent change in your training, workload or activity levels?'**
  String get diagnoseRecentActivityQuestion;

  /// Question about symptom progression
  ///
  /// In en, this message translates to:
  /// **'How has it progressed?'**
  String get diagnoseProgressionQuestion;

  /// Worsening symptom progression option
  ///
  /// In en, this message translates to:
  /// **'Slowly getting worse'**
  String get diagnoseProgressionWorse;

  /// Intermittent symptom progression option
  ///
  /// In en, this message translates to:
  /// **'Come and goes'**
  String get diagnoseProgressionComesGoes;

  /// Intermittent then constant symptom progression option
  ///
  /// In en, this message translates to:
  /// **'Was intermittent, now constant'**
  String get diagnoseProgressionIntermittentConstant;

  /// Unchanged symptom progression option
  ///
  /// In en, this message translates to:
  /// **'Stayed about the same'**
  String get diagnoseProgressionSame;

  /// Question about previous similar injuries
  ///
  /// In en, this message translates to:
  /// **'Have you had similar problems in this same area before?'**
  String get diagnoseSimilarProblemsQuestion;

  /// Heading for the estimated injury stage summary
  ///
  /// In en, this message translates to:
  /// **'Estimated Stage'**
  String get diagnoseEstimatedStage;

  /// Estimated subacute injury stage
  ///
  /// In en, this message translates to:
  /// **'Subacute 1 - 6 weeks'**
  String get diagnoseStageSubacute;

  /// Title of diagnosis step four
  ///
  /// In en, this message translates to:
  /// **'Pain Profile'**
  String get diagnosePainProfile;

  /// Instructions for the pain rating sliders
  ///
  /// In en, this message translates to:
  /// **'Rate your pain on a scale of 0 (no pain) to 10 (worst imaginable pain).'**
  String get diagnosePainScaleDescription;

  /// Current pain rating label
  ///
  /// In en, this message translates to:
  /// **'Pain right now'**
  String get diagnosePainNow;

  /// Worst pain rating label
  ///
  /// In en, this message translates to:
  /// **'Pain at its worst'**
  String get diagnosePainWorst;

  /// Average pain rating label
  ///
  /// In en, this message translates to:
  /// **'Average pain'**
  String get diagnosePainAverage;

  /// Pain pattern question label
  ///
  /// In en, this message translates to:
  /// **'Pattern'**
  String get diagnosePainPattern;

  /// Constant pain pattern option
  ///
  /// In en, this message translates to:
  /// **'Constant'**
  String get diagnosePainConstant;

  /// Intermittent pain pattern option
  ///
  /// In en, this message translates to:
  /// **'Intermittent'**
  String get diagnosePainIntermittent;

  /// Night pain question label
  ///
  /// In en, this message translates to:
  /// **'Night pain'**
  String get diagnoseNightPain;

  /// No night pain option
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get diagnoseNightPainNone;

  /// Mild night pain option
  ///
  /// In en, this message translates to:
  /// **'Mild, doesn\'t wake me'**
  String get diagnoseNightPainMild;

  /// Sleep-disrupting night pain option
  ///
  /// In en, this message translates to:
  /// **'Wakes me from sleep'**
  String get diagnoseNightPainWakes;

  /// Pain sensations question label
  ///
  /// In en, this message translates to:
  /// **'What does the pain feel like?'**
  String get diagnosePainSensation;

  /// Instruction for a multiple-selection question
  ///
  /// In en, this message translates to:
  /// **'Select all that apply'**
  String get diagnoseSelectAllThatApply;

  /// Sharp pain option
  ///
  /// In en, this message translates to:
  /// **'Sharp'**
  String get diagnosePainSharp;

  /// Dull or aching pain option
  ///
  /// In en, this message translates to:
  /// **'Dull / aching'**
  String get diagnosePainAching;

  /// Burning pain option
  ///
  /// In en, this message translates to:
  /// **'Burning'**
  String get diagnosePainBurning;

  /// Throbbing pain option
  ///
  /// In en, this message translates to:
  /// **'Throbbing'**
  String get diagnosePainThrobbing;

  /// Stiffness sensation option
  ///
  /// In en, this message translates to:
  /// **'Stiffness'**
  String get diagnosePainStiffness;

  /// Numbness sensation option
  ///
  /// In en, this message translates to:
  /// **'Numbness'**
  String get diagnosePainNumbness;

  /// Weakness sensation option
  ///
  /// In en, this message translates to:
  /// **'Weakness'**
  String get diagnosePainWeakness;

  /// Pain aggravating factors question
  ///
  /// In en, this message translates to:
  /// **'What makes it worse?'**
  String get diagnosePainWorse;

  /// Pain relieving factors question
  ///
  /// In en, this message translates to:
  /// **'What makes it better?'**
  String get diagnosePainBetter;

  /// Hint for diagnosis free-text answers
  ///
  /// In en, this message translates to:
  /// **'Type here...'**
  String get diagnoseTypeHere;

  /// Question about spreading pain
  ///
  /// In en, this message translates to:
  /// **'Does the pain travel or spread anywhere else?'**
  String get diagnosePainSpreading;

  /// Title of diagnosis step five
  ///
  /// In en, this message translates to:
  /// **'Function & History'**
  String get diagnoseFunctionHistory;

  /// Question about the area of daily life affected by the injury
  ///
  /// In en, this message translates to:
  /// **'How this is affecting daily life, and what\'s been tried so far'**
  String get diagnoseDailyLifeQuestion;

  /// Work daily life impact option
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get diagnoseDailyLifeWork;

  /// Sport or exercise daily life impact option
  ///
  /// In en, this message translates to:
  /// **'Sport / Exercise'**
  String get diagnoseDailyLifeSport;

  /// Sleep daily life impact option
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get diagnoseDailyLifeSleep;

  /// Household tasks daily life impact option
  ///
  /// In en, this message translates to:
  /// **'Household Tasks'**
  String get diagnoseDailyLifeHousehold;

  /// Driving daily life impact option
  ///
  /// In en, this message translates to:
  /// **'Driving'**
  String get diagnoseDailyLifeDriving;

  /// Question about the user's recovery goal and target date
  ///
  /// In en, this message translates to:
  /// **'What\'s your goal?\nWhat do you want to be able to do again, and by when if you have a target?'**
  String get diagnoseGoalQuestion;

  /// Placeholder for recovery goals and additional context
  ///
  /// In en, this message translates to:
  /// **'Anything relevant to mention'**
  String get diagnoseRelevantHint;

  /// Question about previous injury episodes
  ///
  /// In en, this message translates to:
  /// **'Have you injured this same area before (a different episode)?'**
  String get diagnosePreviousInjuryQuestion;

  /// Question about treatment already tried
  ///
  /// In en, this message translates to:
  /// **'What have you tried so far?'**
  String get diagnoseTreatmentQuestion;

  /// No treatment tried option
  ///
  /// In en, this message translates to:
  /// **'None Yet'**
  String get diagnoseTreatmentNone;

  /// Rest treatment option
  ///
  /// In en, this message translates to:
  /// **'Rest'**
  String get diagnoseTreatmentRest;

  /// Ice or heat treatment option
  ///
  /// In en, this message translates to:
  /// **'Ice / heat'**
  String get diagnoseTreatmentIceHeat;

  /// Physiotherapy treatment option
  ///
  /// In en, this message translates to:
  /// **'Physiotherapy'**
  String get diagnoseTreatmentPhysiotherapy;

  /// General practitioner consultation option
  ///
  /// In en, this message translates to:
  /// **'Seen a GP'**
  String get diagnoseTreatmentGp;

  /// Diagnostic imaging option
  ///
  /// In en, this message translates to:
  /// **'Imaging (X-ray, MRI, ultrasound)'**
  String get diagnoseTreatmentImaging;

  /// Medication treatment option
  ///
  /// In en, this message translates to:
  /// **'Medication'**
  String get diagnoseTreatmentMedication;

  /// Question about additional relevant context
  ///
  /// In en, this message translates to:
  /// **'Anything else relevant?'**
  String get diagnoseOtherContext;

  /// Supporting text for the optional additional context field
  ///
  /// In en, this message translates to:
  /// **'Optional - other conditions, medications or context worth knowing'**
  String get diagnoseOtherContextDescription;

  /// Title of the final diagnosis step
  ///
  /// In en, this message translates to:
  /// **'Review Your Answers'**
  String get diagnoseReviewTitle;

  /// Supporting text on the diagnosis review screen
  ///
  /// In en, this message translates to:
  /// **'Check everything looks right before we match you to a program'**
  String get diagnoseReviewDescription;

  /// Title of the injury review card
  ///
  /// In en, this message translates to:
  /// **'Injury'**
  String get diagnoseReviewInjury;

  /// Title of the activity review card
  ///
  /// In en, this message translates to:
  /// **'Baseline Activity'**
  String get diagnoseReviewActivity;

  /// Region label in the injury review card
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get diagnoseReviewRegion;

  /// Location label in the injury review card
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get diagnoseReviewLocation;

  /// Main activity label in the activity review card
  ///
  /// In en, this message translates to:
  /// **'Main activity'**
  String get diagnoseReviewMainActivity;

  /// Physical demands label in the activity review card
  ///
  /// In en, this message translates to:
  /// **'Demands'**
  String get diagnoseReviewDemands;

  /// Frequency label in the activity review card
  ///
  /// In en, this message translates to:
  /// **'Frequency'**
  String get diagnoseReviewFrequency;

  /// Onset label in the onset review card
  ///
  /// In en, this message translates to:
  /// **'Onset'**
  String get diagnoseReviewOnset;

  /// Button label to finish the diagnosis questionnaire
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get diagnoseFinish;

  /// Label for the Programs tab in the home navigation bar
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get homePrograms;

  /// Label for the My Progress tab in the home navigation bar
  ///
  /// In en, this message translates to:
  /// **'My Progress'**
  String get homeMyProgress;

  /// Label for the More tab in the home navigation bar
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get homeMore;

  /// Title for explore page
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// Label for the Programs bottom navigation tab
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get programs;

  /// Label for the My Progress bottom navigation tab
  ///
  /// In en, this message translates to:
  /// **'My Progress'**
  String get myProgress;

  /// Active program statistic label
  ///
  /// In en, this message translates to:
  /// **'Active Programs'**
  String get progressActivePrograms;

  /// Completed exercise statistic label
  ///
  /// In en, this message translates to:
  /// **'Exercises Done'**
  String get progressExercisesDone;

  /// Completed assessment statistic label
  ///
  /// In en, this message translates to:
  /// **'Assessments Completed'**
  String get progressAssessmentsCompleted;

  /// Completed program statistic label
  ///
  /// In en, this message translates to:
  /// **'Completed Programs'**
  String get progressCompletedPrograms;

  /// Sample rehabilitation program name on My Progress
  ///
  /// In en, this message translates to:
  /// **'Hamstring Strain Grade 03'**
  String get progressProgramName;

  /// Completed phases and total phases for a program
  ///
  /// In en, this message translates to:
  /// **'{completed}/{total} phases completed'**
  String progressPhasesCompleted(int completed, int total);

  /// Program start date label
  ///
  /// In en, this message translates to:
  /// **'Started {date}'**
  String progressStarted(String date);

  /// Title for settings page
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Menu label for account settings
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get accountSettings;

  /// Menu label for notifications
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Introduction on the Contact Us screen
  ///
  /// In en, this message translates to:
  /// **'Have a question?\nGet in touch and we\'ll get back to you.'**
  String get contactIntroduction;

  /// Label for the contact message field
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get contactMessage;

  /// Placeholder for the contact message field
  ///
  /// In en, this message translates to:
  /// **'Type your message here'**
  String get contactMessageHint;

  /// Validation error for an empty contact message
  ///
  /// In en, this message translates to:
  /// **'Please enter your message'**
  String get contactMessageRequired;

  /// Label for the contact phone action
  ///
  /// In en, this message translates to:
  /// **'Call Us'**
  String get contactCallUs;

  /// Label for the contact website action
  ///
  /// In en, this message translates to:
  /// **'Visit Our Website'**
  String get contactVisitWebsite;

  /// Feedback when contact actions have not been configured
  ///
  /// In en, this message translates to:
  /// **'Contact actions are not available yet.'**
  String get contactActionsUnavailable;

  /// Menu label for contacting support
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// Menu label for terms and conditions
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsAndConditions;

  /// Menu label for app settings
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get appSettings;

  /// Title for profile page
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Title for more page
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// Label for logout action
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Label for OK action
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Generic error title
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Label for yes action
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// Label for no action
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// Error message when sign in fails
  ///
  /// In en, this message translates to:
  /// **'Sign In Failed'**
  String get signInFailed;

  /// Error message when sign up fails
  ///
  /// In en, this message translates to:
  /// **'Sign Up Failed'**
  String get signUpFailed;

  /// Error message for invalid email format
  ///
  /// In en, this message translates to:
  /// **'Invalid Email'**
  String get invalidEmail;

  /// Title for help and support page
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpSupport;

  /// Title for about page
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// Title for account page
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// Label for edit profile button
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// Label for change password button
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// Supporting text for the change password screen
  ///
  /// In en, this message translates to:
  /// **'Stay secure and change your password'**
  String get changePasswordSubtitle;

  /// Label for the current password field
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// Label for the new password field
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// Label for the password confirmation field
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Validation error when password confirmation does not match
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// Label for the reset password button
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// Message when the forgot password feature is unavailable
  ///
  /// In en, this message translates to:
  /// **'Forgot password is not available yet'**
  String get forgotPasswordUnavailable;

  /// Message when password reset actions have not been connected
  ///
  /// In en, this message translates to:
  /// **'Password reset is not available yet'**
  String get passwordResetUnavailable;

  /// Error title when request fails
  ///
  /// In en, this message translates to:
  /// **'Request Failed'**
  String get requestFailed;

  /// Title for email check instruction
  ///
  /// In en, this message translates to:
  /// **'Please Check Your Email'**
  String get checkEmail;

  /// Message confirming password reset link sent
  ///
  /// In en, this message translates to:
  /// **'A password reset link has been sent to your dedicated email'**
  String get passwordResetSent;

  /// Question for missing email
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the email?'**
  String get didntReceiveEmail;

  /// characters
  ///
  /// In en, this message translates to:
  /// **'characters'**
  String get characters;

  /// Hint text for password field
  ///
  /// In en, this message translates to:
  /// **'Enter your password here'**
  String get enterPassword;

  /// Validation error when the input exceeds the maximum allowed characters
  ///
  /// In en, this message translates to:
  /// **'Maximum {maxLength} characters allowed'**
  String passwordMaxLengthError(int maxLength);

  /// Error message when the password field is empty
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordIsRequired;

  /// Error message for short passwords
  ///
  /// In en, this message translates to:
  /// **'Password must be at least {minLength} characters'**
  String passwordMinLengthError(int minLength);

  /// Error message for empty password
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get pleaseEnterPassword;

  /// Error message when password doesn't contain both letters and digits
  ///
  /// In en, this message translates to:
  /// **'Password must contain letters and digits'**
  String get passwordMustContainLettersAndDigits;

  /// Validation error when non-numeric characters are entered
  ///
  /// In en, this message translates to:
  /// **'Enter digits only'**
  String get enterDigitsOnly;

  /// Validation error for incomplete phone numbers
  ///
  /// In en, this message translates to:
  /// **'Phone number is too short'**
  String get phoneNumberTooShort;

  /// Label for resend action
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// Search Country
  ///
  /// In en, this message translates to:
  /// **'Search Country'**
  String get searchCountry;

  /// Search Country
  ///
  /// In en, this message translates to:
  /// **'Enter your contact number'**
  String get enterContactNumber;

  /// Instruction for password reset
  ///
  /// In en, this message translates to:
  /// **'Enter your registered email address below and we\'ll send you a password reset email'**
  String get enterEmailReset;

  /// Label for submit action
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// Title for verification page
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// Label for logout action
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOut;

  /// Instruction to enter code
  ///
  /// In en, this message translates to:
  /// **'Please enter your verification code'**
  String get enterVerificationCode;

  /// Message confirming code sent
  ///
  /// In en, this message translates to:
  /// **'The verification code has been sent to '**
  String get verificationCodeSent;

  /// Label for resend code action
  ///
  /// In en, this message translates to:
  /// **'Resend the Code'**
  String get resendCode;

  /// Divider text
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// Question to send code to mobile
  ///
  /// In en, this message translates to:
  /// **'Send the verification code to your mobile number?'**
  String get sendCodeMobile;

  /// Label for send code action
  ///
  /// In en, this message translates to:
  /// **'Send the code'**
  String get sendCode;

  /// Question for missing code
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the verification code?'**
  String get didntReceiveCode;

  /// Terms agreement prefix
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to our '**
  String get agreeTo;

  /// Link text for terms
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get termsOfService;

  /// Link text for privacy policy
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Label for explore app action
  ///
  /// In en, this message translates to:
  /// **'Explore The App'**
  String get exploreApp;

  /// Label for continue action
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// Error message for disposable email
  ///
  /// In en, this message translates to:
  /// **'Please use a valid email address. Disposable emails are not allowed.'**
  String get disposableEmailError;

  /// Text between auth separators
  ///
  /// In en, this message translates to:
  /// **'Or continue with'**
  String get orContinueWith;

  /// Hint text for email input
  ///
  /// In en, this message translates to:
  /// **'Enter your email here'**
  String get enterEmailHint;

  /// Error when email is empty
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get errorEnterEmail;

  /// Error when email format is invalid
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get errorInvalidEmailAddress;

  /// Text connecting terms and privacy policy
  ///
  /// In en, this message translates to:
  /// **' and confirm you have read our '**
  String get termsAndPrivacyConfirm;

  /// Label for verification button
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// Label for account verification button
  ///
  /// In en, this message translates to:
  /// **'Verify Account'**
  String get verifyAccount;

  /// Title for settings page content
  ///
  /// In en, this message translates to:
  /// **'Settings Page'**
  String get settingsPage;

  /// Error message when resending code fails
  ///
  /// In en, this message translates to:
  /// **'Code Resend Failed'**
  String get codeResendFailed;

  /// Label for mobile number input
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumber;

  /// Error when mobile number is empty
  ///
  /// In en, this message translates to:
  /// **'Please enter your mobile number'**
  String get errorEnterMobile;

  /// Label for get started action
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// Label for skip action
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// Label for cancel and logout action
  ///
  /// In en, this message translates to:
  /// **'Cancel & Logout'**
  String get cancelLogout;

  /// Message for retrying later
  ///
  /// In en, this message translates to:
  /// **'Try again later or contact support if the issue persists.'**
  String get retryLater;

  /// Label for chat navigation item
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// Label for step 1 placeholder
  ///
  /// In en, this message translates to:
  /// **'Step 1'**
  String get step1;

  /// Label for step 2 placeholder
  ///
  /// In en, this message translates to:
  /// **'Step 2'**
  String get step2;

  /// Label for step 3 placeholder
  ///
  /// In en, this message translates to:
  /// **'Step 3'**
  String get step3;

  /// Label for weak password strength
  ///
  /// In en, this message translates to:
  /// **'Weak password'**
  String get passwordStrengthWeak;

  /// Label for medium password strength
  ///
  /// In en, this message translates to:
  /// **'Medium strength'**
  String get passwordStrengthMedium;

  /// Label for strong password strength
  ///
  /// In en, this message translates to:
  /// **'Strong password'**
  String get passwordStrengthStrong;

  /// Error message when password contains whitespace
  ///
  /// In en, this message translates to:
  /// **'Password cannot contain spaces'**
  String get passwordNoSpacesError;

  /// Hint text for description input
  ///
  /// In en, this message translates to:
  /// **'Enter description'**
  String get enterDescription;

  /// Validation error when the input exceeds the maximum allowed characters
  ///
  /// In en, this message translates to:
  /// **'Maximum {maxLength} characters allowed'**
  String maxLengthError(int maxLength);

  /// Error message when the device has no network connectivity
  ///
  /// In en, this message translates to:
  /// **'No internet. Please check your network  connection.'**
  String get noInternetConnection;

  /// Error message when the auth token is invalid or expired
  ///
  /// In en, this message translates to:
  /// **'Session expired. Please log in again.'**
  String get sessionExpired;

  /// Label for retry action button
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Error message when the server is unreachable after retries
  ///
  /// In en, this message translates to:
  /// **'Unable to connect to server. Please try again.'**
  String get serverConnectionError;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError('AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
