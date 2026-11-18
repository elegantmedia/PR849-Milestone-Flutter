// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Starter';

  @override
  String get noInternetTitle => 'Whoops!!';

  @override
  String get noInternetSubMessage => 'Please check your internet connection and try again.';

  @override
  String get goToSettings => 'Go to settings';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get logIn => 'Log In';

  @override
  String get introWelcome => 'Welcome to Rehabwise';

  @override
  String get introHeadline => 'Every session is a milestone';

  @override
  String get introDescription => 'Years of Rehab expertise, all in one powerful app, guided phase by phase.';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get firstName => 'First Name';

  @override
  String get firstNameRequired => 'Please enter your first name';

  @override
  String get lastName => 'Last Name';

  @override
  String get lastNameRequired => 'Please enter your last name';

  @override
  String get notProvided => 'Not provided';

  @override
  String get home => 'Home';

  @override
  String get homeWelcomeBack => 'Welcome back';

  @override
  String get homeGreeting => 'Hello, Sarah!';

  @override
  String get homeRecoveryJourney => 'Your recovery journey continues.';

  @override
  String get homeResumeProgress => 'Pick up where you left off';

  @override
  String get homeNoActivePrograms => 'No Active Programs';

  @override
  String get homeStartProgramPrompt => 'Start a rehabilitation program to begin tracking your progress';

  @override
  String get homeInjuryName => 'Hamstring Strain Grade 3';

  @override
  String get homeProgressCompleted => '40% Completed';

  @override
  String get homePhase => 'Phase 2 - Strength';

  @override
  String get homeNextSession => 'Next Session';

  @override
  String get homeDiagnoseInjury => 'Diagnose My Injury';

  @override
  String get homeAllPrograms => 'All Programs';

  @override
  String get homeChatExperts => 'Chat With Experts';

  @override
  String diagnoseStepProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get diagnosePainRatingTitle => 'First Steps Pain Rating';

  @override
  String get diagnosePainRatingDescription => 'Rate your pain level during your first steps in the morning or after a period of rest.';

  @override
  String get diagnoseSafetyScreen => 'Safety Screen';

  @override
  String get diagnoseSafetyWeightLoss => 'Unexplained weight loss alongside this pain';

  @override
  String get diagnoseSafetyFever => 'Fever, chills, or feeling generally unwell around the time of injury';

  @override
  String get diagnoseSafetyNumbness => 'Numbness, tingling, or weakness that is spreading or getting worse';

  @override
  String get diagnoseSafetyBladderBowel => 'Any change in bladder or bowel control since the injury';

  @override
  String get diagnoseSafetyChestPain => 'Chest pain or shortness of breath connected to this injury';

  @override
  String get diagnoseSafetyDeformity => 'Visible deformity, or a joint that looks obviously out of place';

  @override
  String get diagnoseSafetyWeightBearing => 'Complete inability to bear any weight on the injured area';

  @override
  String get diagnoseSafetyNightPain => 'Night pain that is severe and does not ease with rest or position change';

  @override
  String get diagnoseSafetyCancer => 'A personal history of cancer';

  @override
  String get diagnoseSafetyHighForce => 'This followed a high-force event (e.g. car accident, fall from height)';

  @override
  String get diagnoseStepTwoTitle => 'Injury Identification';

  @override
  String get diagnoseStepTwoDescription => 'Where is the problem, as specifically as you can describe it.';

  @override
  String get diagnoseBodyRegionLabel => 'Body Region';

  @override
  String get diagnoseSelectRegion => 'Select a region';

  @override
  String get diagnoseRegionHead => 'Head';

  @override
  String get diagnoseRegionNeck => 'Neck';

  @override
  String get diagnoseRegionShoulder => 'Shoulder';

  @override
  String get diagnoseRegionUpperArm => 'Upper arm';

  @override
  String get diagnoseRegionElbow => 'Elbow';

  @override
  String get diagnoseRegionForearm => 'Forearm';

  @override
  String get diagnoseRegionWrist => 'Wrist';

  @override
  String get diagnoseRegionHand => 'Hand';

  @override
  String get diagnoseRegionChest => 'Chest';

  @override
  String get diagnoseRegionUpperBack => 'Upper back';

  @override
  String get diagnoseRegionLowerBack => 'Lower back';

  @override
  String get diagnoseRegionHip => 'Hip';

  @override
  String get diagnoseRegionThigh => 'Thigh';

  @override
  String get diagnoseRegionKnee => 'Knee';

  @override
  String get diagnoseRegionLowerLeg => 'Lower leg';

  @override
  String get diagnoseRegionAnkle => 'Ankle';

  @override
  String get diagnoseRegionFoot => 'Foot';

  @override
  String get diagnoseSideLabel => 'Side';

  @override
  String get diagnoseSideLeft => 'Left';

  @override
  String get diagnoseSideRight => 'Right';

  @override
  String get diagnoseSideBoth => 'Both Sides';

  @override
  String get diagnoseSideNotApplicable => 'Not Applicable';

  @override
  String get diagnoseSpecificLocationLabel => 'Describe the specific location';

  @override
  String get diagnoseSpecificLocationDescription =>
      'E.g. “outside of the knee, just below the joint line” or “front of shoulder, worse when reaching overhead”';

  @override
  String get diagnoseSpecificLocationHint => 'type here';

  @override
  String get diagnoseMainSportLabel => 'Main sport or activity';

  @override
  String get diagnoseMainSportDescription => 'What do you do most regularly - this shapes what “recovery” needs to mean for you.';

  @override
  String get diagnoseMainSportHint => 'e.g. Running, weightlifting, netball, no regular sport.';

  @override
  String get diagnosePhysicalDemandsLabel => 'Physical Demands';

  @override
  String get diagnoseDemandSedentary => 'Sedentary / Desk-based';

  @override
  String get diagnoseDemandRehabilitation => 'Plantar Fascia Tear Rehabilitation';

  @override
  String get diagnoseDemandLightDaily => 'Light daily activities';

  @override
  String get diagnoseDemandRecreational => 'Recreational sport';

  @override
  String get diagnoseDemandCompetitive => 'Competitive / high-level sport';

  @override
  String get diagnoseDemandManual => 'Manual / physically demanding job';

  @override
  String get diagnoseTrainingFrequencyLabel => 'How often do you currently train or play?';

  @override
  String get diagnoseSelect => 'Select';

  @override
  String get diagnoseFrequencyNone => 'I do not currently train or play';

  @override
  String get diagnoseFrequencyOneToTwo => '1-2 times per week';

  @override
  String get diagnoseFrequencyThreeToFour => '3-4 times per week';

  @override
  String get diagnoseFrequencyFiveOrMore => '5 or more times per week';

  @override
  String get diagnoseStepThreeTitle => 'Onset & Mechanism';

  @override
  String get diagnoseOnsetQuestion => 'Did this come on suddenly from a specific moment, or gradually over time?';

  @override
  String get diagnoseOnsetSudden => 'Sudden / traumatic';

  @override
  String get diagnoseOnsetSuddenDescription => 'A specific fall, twist, lift, or impact you can point to';

  @override
  String get diagnoseOnsetGradual => 'Gradual / insidious';

  @override
  String get diagnoseOnsetGradualDescription => 'Crept in over days or weeks, no single moment';

  @override
  String get diagnoseOnsetUnsure => 'Not sure / mixed';

  @override
  String get diagnoseDateOfInjury => 'Date of injury';

  @override
  String get diagnoseDateHint => 'DD/MM/YYYY';

  @override
  String get diagnoseHowHappened => 'How did it happen?';

  @override
  String get diagnoseMechanismSport => 'During sport or exercise';

  @override
  String get diagnoseMechanismFall => 'Fall';

  @override
  String get diagnoseMechanismTwist => 'Twist or turn';

  @override
  String get diagnoseMechanismImpact => 'Direct impact';

  @override
  String get diagnoseMechanismLifting => 'Lifting';

  @override
  String get diagnoseMechanismOveruse => 'Gradual overuse';

  @override
  String get diagnoseMechanismOther => 'Other / not sure';

  @override
  String get diagnosePopQuestion => 'Did you feel or hear a pop, snap or tear?';

  @override
  String get diagnoseContinueActivityQuestion => 'Were you able to keep moving / continue the activity right after?';

  @override
  String get diagnoseSwellingQuestion => 'Did it swell within 24 hours?';

  @override
  String get diagnoseFirstNoticeQuestion => 'When did you first notice it?';

  @override
  String get diagnoseTimeDays => 'days ago';

  @override
  String get diagnoseTimeWeeks => 'weeks ago';

  @override
  String get diagnoseTimeMonths => 'months ago';

  @override
  String get diagnoseRecentActivityQuestion => 'Has there been a recent change in your training, workload or activity levels?';

  @override
  String get diagnoseProgressionQuestion => 'How has it progressed?';

  @override
  String get diagnoseProgressionWorse => 'Slowly getting worse';

  @override
  String get diagnoseProgressionComesGoes => 'Come and goes';

  @override
  String get diagnoseProgressionIntermittentConstant => 'Was intermittent, now constant';

  @override
  String get diagnoseProgressionSame => 'Stayed about the same';

  @override
  String get diagnoseSimilarProblemsQuestion => 'Have you had similar problems in this same area before?';

  @override
  String get diagnoseEstimatedStage => 'Estimated Stage';

  @override
  String get diagnoseStageSubacute => 'Subacute 1 - 6 weeks';

  @override
  String get diagnosePainProfile => 'Pain Profile';

  @override
  String get diagnosePainScaleDescription => 'Rate your pain on a scale of 0 (no pain) to 10 (worst imaginable pain).';

  @override
  String get diagnosePainNow => 'Pain right now';

  @override
  String get diagnosePainWorst => 'Pain at its worst';

  @override
  String get diagnosePainAverage => 'Average pain';

  @override
  String get diagnosePainPattern => 'Pattern';

  @override
  String get diagnosePainConstant => 'Constant';

  @override
  String get diagnosePainIntermittent => 'Intermittent';

  @override
  String get diagnoseNightPain => 'Night pain';

  @override
  String get diagnoseNightPainNone => 'None';

  @override
  String get diagnoseNightPainMild => 'Mild, doesn\'t wake me';

  @override
  String get diagnoseNightPainWakes => 'Wakes me from sleep';

  @override
  String get diagnosePainSensation => 'What does the pain feel like?';

  @override
  String get diagnoseSelectAllThatApply => 'Select all that apply';

  @override
  String get diagnosePainSharp => 'Sharp';

  @override
  String get diagnosePainAching => 'Dull / aching';

  @override
  String get diagnosePainBurning => 'Burning';

  @override
  String get diagnosePainThrobbing => 'Throbbing';

  @override
  String get diagnosePainStiffness => 'Stiffness';

  @override
  String get diagnosePainNumbness => 'Numbness';

  @override
  String get diagnosePainWeakness => 'Weakness';

  @override
  String get diagnosePainWorse => 'What makes it worse?';

  @override
  String get diagnosePainBetter => 'What makes it better?';

  @override
  String get diagnoseTypeHere => 'Type here...';

  @override
  String get diagnosePainSpreading => 'Does the pain travel or spread anywhere else?';

  @override
  String get diagnoseFunctionHistory => 'Function & History';

  @override
  String get diagnoseDailyLifeQuestion => 'How this is affecting daily life, and what\'s been tried so far';

  @override
  String get diagnoseDailyLifeWork => 'Work';

  @override
  String get diagnoseDailyLifeSport => 'Sport / Exercise';

  @override
  String get diagnoseDailyLifeSleep => 'Sleep';

  @override
  String get diagnoseDailyLifeHousehold => 'Household Tasks';

  @override
  String get diagnoseDailyLifeDriving => 'Driving';

  @override
  String get diagnoseGoalQuestion => 'What\'s your goal?\nWhat do you want to be able to do again, and by when if you have a target?';

  @override
  String get diagnoseRelevantHint => 'Anything relevant to mention';

  @override
  String get diagnosePreviousInjuryQuestion => 'Have you injured this same area before (a different episode)?';

  @override
  String get diagnoseTreatmentQuestion => 'What have you tried so far?';

  @override
  String get diagnoseTreatmentNone => 'None Yet';

  @override
  String get diagnoseTreatmentRest => 'Rest';

  @override
  String get diagnoseTreatmentIceHeat => 'Ice / heat';

  @override
  String get diagnoseTreatmentPhysiotherapy => 'Physiotherapy';

  @override
  String get diagnoseTreatmentGp => 'Seen a GP';

  @override
  String get diagnoseTreatmentImaging => 'Imaging (X-ray, MRI, ultrasound)';

  @override
  String get diagnoseTreatmentMedication => 'Medication';

  @override
  String get diagnoseOtherContext => 'Anything else relevant?';

  @override
  String get diagnoseOtherContextDescription => 'Optional - other conditions, medications or context worth knowing';

  @override
  String get diagnoseReviewTitle => 'Review Your Answers';

  @override
  String get diagnoseReviewDescription => 'Check everything looks right before we match you to a program';

  @override
  String get diagnoseReviewInjury => 'Injury';

  @override
  String get diagnoseReviewActivity => 'Baseline Activity';

  @override
  String get diagnoseReviewRegion => 'Region';

  @override
  String get diagnoseReviewLocation => 'Location';

  @override
  String get diagnoseReviewMainActivity => 'Main activity';

  @override
  String get diagnoseReviewDemands => 'Demands';

  @override
  String get diagnoseReviewFrequency => 'Frequency';

  @override
  String get diagnoseReviewOnset => 'Onset';

  @override
  String get diagnoseFinish => 'Finish';

  @override
  String get homePrograms => 'Programs';

  @override
  String get homeMyProgress => 'My Progress';

  @override
  String get homeMore => 'More';

  @override
  String get explore => 'Explore';

  @override
  String get programs => 'Programs';

  @override
  String get myProgress => 'My Progress';

  @override
  String get progressActivePrograms => 'Active Programs';

  @override
  String get progressExercisesDone => 'Exercises Done';

  @override
  String get progressAssessmentsCompleted => 'Assessments Completed';

  @override
  String get progressCompletedPrograms => 'Completed Programs';

  @override
  String get progressProgramName => 'Hamstring Strain Grade 03';

  @override
  String progressPhasesCompleted(int completed, int total) {
    return '$completed/$total phases completed';
  }

  @override
  String progressStarted(String date) {
    return 'Started $date';
  }

  @override
  String get settings => 'Settings';

  @override
  String get accountSettings => 'Account Settings';

  @override
  String get notifications => 'Notifications';

  @override
  String get contactIntroduction => 'Have a question?\nGet in touch and we\'ll get back to you.';

  @override
  String get contactMessage => 'Message';

  @override
  String get contactMessageHint => 'Type your message here';

  @override
  String get contactMessageRequired => 'Please enter your message';

  @override
  String get contactCallUs => 'Call Us';

  @override
  String get contactVisitWebsite => 'Visit Our Website';

  @override
  String get contactActionsUnavailable => 'Contact actions are not available yet.';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get termsAndConditions => 'Terms & Conditions';

  @override
  String get appSettings => 'App Settings';

  @override
  String get profile => 'Profile';

  @override
  String get more => 'More';

  @override
  String get logout => 'Logout';

  @override
  String get ok => 'OK';

  @override
  String get error => 'Error';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get signInFailed => 'Sign In Failed';

  @override
  String get signUpFailed => 'Sign Up Failed';

  @override
  String get invalidEmail => 'Invalid Email';

  @override
  String get helpSupport => 'Help & Support';

  @override
  String get about => 'About';

  @override
  String get account => 'Account';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get changePassword => 'Change Password';

  @override
  String get changePasswordSubtitle => 'Stay secure and change your password';

  @override
  String get currentPassword => 'Current Password';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get forgotPasswordUnavailable => 'Forgot password is not available yet';

  @override
  String get passwordResetUnavailable => 'Password reset is not available yet';

  @override
  String get requestFailed => 'Request Failed';

  @override
  String get checkEmail => 'Please Check Your Email';

  @override
  String get passwordResetSent => 'A password reset link has been sent to your dedicated email';

  @override
  String get didntReceiveEmail => 'Didn\'t receive the email?';

  @override
  String get characters => 'characters';

  @override
  String get enterPassword => 'Enter your password here';

  @override
  String passwordMaxLengthError(int maxLength) {
    return 'Maximum $maxLength characters allowed';
  }

  @override
  String get passwordIsRequired => 'Password is required';

  @override
  String passwordMinLengthError(int minLength) {
    return 'Password must be at least $minLength characters';
  }

  @override
  String get pleaseEnterPassword => 'Please enter your password';

  @override
  String get passwordMustContainLettersAndDigits => 'Password must contain letters and digits';

  @override
  String get enterDigitsOnly => 'Enter digits only';

  @override
  String get phoneNumberTooShort => 'Phone number is too short';

  @override
  String get resend => 'Resend';

  @override
  String get searchCountry => 'Search Country';

  @override
  String get enterContactNumber => 'Enter your contact number';

  @override
  String get enterEmailReset => 'Enter your registered email address below and we\'ll send you a password reset email';

  @override
  String get submit => 'Submit';

  @override
  String get verification => 'Verification';

  @override
  String get logOut => 'Log Out';

  @override
  String get enterVerificationCode => 'Please enter your verification code';

  @override
  String get verificationCodeSent => 'The verification code has been sent to ';

  @override
  String get resendCode => 'Resend the Code';

  @override
  String get or => 'Or';

  @override
  String get sendCodeMobile => 'Send the verification code to your mobile number?';

  @override
  String get sendCode => 'Send the code';

  @override
  String get didntReceiveCode => 'Didn\'t receive the verification code?';

  @override
  String get agreeTo => 'By continuing, you agree to our ';

  @override
  String get termsOfService => 'Terms and Conditions';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get exploreApp => 'Explore The App';

  @override
  String get continueAction => 'Continue';

  @override
  String get disposableEmailError => 'Please use a valid email address. Disposable emails are not allowed.';

  @override
  String get orContinueWith => 'Or continue with';

  @override
  String get enterEmailHint => 'Enter your email here';

  @override
  String get errorEnterEmail => 'Please enter your email';

  @override
  String get errorInvalidEmailAddress => 'Please enter a valid email';

  @override
  String get termsAndPrivacyConfirm => ' and confirm you have read our ';

  @override
  String get verify => 'Verify';

  @override
  String get verifyAccount => 'Verify Account';

  @override
  String get settingsPage => 'Settings Page';

  @override
  String get codeResendFailed => 'Code Resend Failed';

  @override
  String get mobileNumber => 'Mobile Number';

  @override
  String get errorEnterMobile => 'Please enter your mobile number';

  @override
  String get getStarted => 'Get Started';

  @override
  String get skip => 'Skip';

  @override
  String get cancelLogout => 'Cancel & Logout';

  @override
  String get retryLater => 'Try again later or contact support if the issue persists.';

  @override
  String get chat => 'Chat';

  @override
  String get step1 => 'Step 1';

  @override
  String get step2 => 'Step 2';

  @override
  String get step3 => 'Step 3';

  @override
  String get passwordStrengthWeak => 'Weak password';

  @override
  String get passwordStrengthMedium => 'Medium strength';

  @override
  String get passwordStrengthStrong => 'Strong password';

  @override
  String get passwordNoSpacesError => 'Password cannot contain spaces';

  @override
  String get enterDescription => 'Enter description';

  @override
  String maxLengthError(int maxLength) {
    return 'Maximum $maxLength characters allowed';
  }

  @override
  String get noInternetConnection => 'No internet. Please check your network  connection.';

  @override
  String get sessionExpired => 'Session expired. Please log in again.';

  @override
  String get retry => 'Retry';

  @override
  String get serverConnectionError => 'Unable to connect to server. Please try again.';
}
