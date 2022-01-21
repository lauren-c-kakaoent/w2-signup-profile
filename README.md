# w2-signup-profile

## Task1
- Edit 버튼 클릭 시 Label의 backgroundColor, textColor, alpha, text content가 변경됩니다.
<img src="https://user-images.githubusercontent.com/95681572/149738907-ea5e3002-4323-41f9-9013-29f3747de79d.png" width=35%><img src="https://user-images.githubusercontent.com/95681572/149738942-de6b4469-d42a-454f-a88c-f8571d8dc17c.png" width=35%>

### 학습거리
- **action** → function that triggers when a specific event occurs in your app
- **outlet** → a reference from an object in a stroryboard to a source file
- 버튼에 IBAction을 추가할 때의 이벤트 종류 https://developer.apple.com/documentation/uikit/uicontrol/event
- 버튼이 여러개일 때 하나의 액션에 추가할 수 있을까? 가능하다.
- 버튼 하나에 여러개의 액션을 추가할 수 있을까? 가능하다.
- (open) → viewDidLoad → viewWillAppear → viewDidAppear → (cancel) → viewWillDisappear → viewDidDisappear
- IBAction과 Segue 중 IBAction이 먼저 작동하고, Segue가 작동한다.
- type of segue : https://stackoverflow.com/questions/25966215/whats-the-difference-between-all-the-selection-segues

## Task2
- Edit 버튼 클릭 시 프로필 편집 창이 뜹니다.
- 카메라 버튼을 클릭하여 갤러리에서 이미지를 등록할 수 있습니다.
- done 버튼을 누르면 입력한 name, description, image가 delegate를 통해 프로필 창(이전 창)으로 전달됩니다.
- cancel 버튼을 누르면 변화 없이 프로필 창으로 이동합니다. 
 
<img src="https://images.velog.io/images/lauren-c/post/1eb09965-4752-4d9d-bd0e-53e8fd9edc40/image.png" width=35%><img src="https://images.velog.io/images/lauren-c/post/1936a588-1c26-42eb-8410-44c6da098138/image.png" width=35%>
<img src = "https://images.velog.io/images/lauren-c/post/c9347bcf-72da-449c-8d06-7cde083606c5/image.png" width=35%><img src="https://images.velog.io/images/lauren-c/post/e3dfe568-6b64-4674-b49a-fc6ebae74930/image.png" width=35%>

## Task3
- 입력 중일 때 TextField가 파란색으로, 에러가 생긴 경우에는 빨간색으로 표시됩니다.
- 잘못된 입력인 경우 관련된 메시지가 TextField 하단에 표시됩니다.
- 모든 입력이 완료되면 다음 버튼을 통해 로그인 화면으로 이동합니다.
<img src="https://images.velog.io/images/lauren-c/post/aa864acd-6056-49eb-8c7d-8e5c28572698/Simulator%20Screen%20Shot%20-%20iPhone%2012%20-%202022-01-21%20at%2011.26.11.png" width=35%>
<img src="https://images.velog.io/images/lauren-c/post/85795462-3ebe-42df-ba88-91248193d795/Simulator%20Screen%20Shot%20-%20iPhone%2012%20-%202022-01-21%20at%2011.26.38.png" width=35%>
