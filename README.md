# ConnectIt

### Description

`ConnectIt - IT 메이커들을 위한 소셜 디스커버리 앱`은 "IT 메이커들의 네트워킹과 팀 매칭" 문제의 어려움에 대한 도움을 제공하는 서비스로, Flutter와 Firebase에 기반한 Serverless 아키텍처로 설계되었다.

본 애플리케이션은 사용자가 자신을 소개하는 포스트잇을 작성하여 포스트잇 보드에 등록하는 "포스트잇 작성 및 등록" 기능과 다른 사용자의 포스트잇을 때어와 연락을 시도할 수 있는 "포스트잇 열람 및 보관" 기능을 핵심 기능으로 가지고 있다.

이러한 기능은 경쟁 서비스 대비 매우 간단한 구조를 가지고 있는 것이 특징이며, 사용자는 단순히 상대방의 포스트잇을 열람하고 관심있는 포스트잇 보관하여 연락을 취할 수 있다는 점에서 쉽고 재미있네 Snack 처럼 사용할 수 있다.

<br>

### Development Environment

`Flutter SDK`: v3.10.*

`Dart`: v3.0.*

`Android`: Android 6.0 (minSDK 23) 이상

`iOS`: iOS 13.0 이상

<br>

### How to Build

본 빌드 방법은 Android 에뮬레이터에서 디버그 모드로 빌드하는 방법을 기준으로 설명되어 있다.

1. Flutter 공식 문서를 참고하여 Flutter SDK를 설치한다.
    
    > 공식문서: [https://flutter-ko.dev/docs/get-started/install](https://flutter-ko.dev/docs/get-started/install)
    > 
2. Flutter 공식 문서를 참고하여 Android Studio/IntelliJ 혹은 VS CODE 설치 후 Flutter와 Dart 플러그인을 설치한다.
    
    > 공식문서: [https://flutter-ko.dev/docs/get-started/editor](https://flutter-ko.dev/docs/get-started/editor)
    > 
3.  터미널에서 프로젝트 폴터(ConnectIt/connectit)으로 이동한 후
    
    > $ flutter pub get
    > 
    
    명령을 실행하여 패키지를 다운로드 한다.
    
4. 에디터에서 실행할 기기를 선택하여 'main.dart'를 Run한다.

환경에 따라 Firebase CLI 설정 및 Firebae 프로젝트 설정이 필요하며, Firebase 프로젝트에서 제공하는 Android/iOS 인증 파일을 프로젝트 폴더(ConnectIt/connectit)에 추가해야 한다.

iOS 에뮬레이터의 경우 Sign In with Apple과 Push Notifications 기능으로 인하여 별도의 Apple Developer 인증과정이 필요하며, 보안 문제로 외부 개발자는 빌드가 불가능하다.

<br>

### Contributors
---

**[송영범](https://github.com/GENYF)**

<br>

### Reference
---

[Flutter](https://flutter.dev/)

[pub.dev](https://pub.dev/)

<br>