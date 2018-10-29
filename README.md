# LexChatbotSample
Amazon Lex Chatbot for iOS using Amazon Cognito Identity Pool and AWSMobileClient from AWS Mobile SDK for iOS

# Get Started
1. Clone repo

2. pod install --repo-update

3. amplify init
4. amplify add analytics (to get Cognito Unauth)
5. amplify push

6. add the awsconfiguration.json file your Xcode project (one time deal)

7. Update the UNAuthenticated IAM Role associated with your Cognito Identity Pool by adding an access policy for the app users to call Amazon Lex.

8. update the AppDelegate with your bot name and bot alias

Build and run.
