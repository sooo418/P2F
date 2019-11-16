## P2F 소개

### DB 구조

![1573895605616](C:\Users\ehdwn\AppData\Roaming\Typora\typora-user-images\1573895605616.png)



### 시스템 구조

![1573895728722](C:\Users\ehdwn\AppData\Roaming\Typora\typora-user-images\1573895728722.png)



### 화면 설게(Flow Chart)

![1573895754121](C:\Users\ehdwn\AppData\Roaming\Typora\typora-user-images\1573895754121.png)





### 실행 화면

![image](https://user-images.githubusercontent.com/50854729/68991199-7a209780-089f-11ea-85d2-5ad6baa1c0f5.png)

인덱스 화면



#### User 소개

![image](https://user-images.githubusercontent.com/50854729/68991200-8278d280-089f-11ea-89c8-e7724f9f68c0.png)

회원가입 폼으로 ID, PW, 이름, 별명, 핸드폰 번호, 성별, 비밀번호 찾기 질문, 프로필 사진을 정하여 회원가입 할 수 있습니다.



![image](https://user-images.githubusercontent.com/50854729/68991206-8e649480-089f-11ea-9b9d-af6b1b5ac3f2.png)

등록된 ID를 입력하여야 진행할 수 있습니다.



![image](https://user-images.githubusercontent.com/50854729/68991207-8f95c180-089f-11ea-826c-93ca4a5b5689.png)



![image](https://user-images.githubusercontent.com/50854729/68991208-93294880-089f-11ea-94da-569ae435eb6e.png)



![image](https://user-images.githubusercontent.com/50854729/68991209-94f30c00-089f-11ea-9a51-bdbff21acbdf.png)

 자신의 프로필 사진을 클릭 시 메인 화면으로 이동합니다.



![image](https://user-images.githubusercontent.com/50854729/68991211-97edfc80-089f-11ea-9863-a9df2cf781f8.png)

정보 확인 폼으로 "수정" 버튼을 클릭 시 정보 수정 폼으로 이동



![image](https://user-images.githubusercontent.com/50854729/68991212-99b7c000-089f-11ea-9ce1-9fe183049cee.png)

정보 수정 폼으로 정보 수정이 마치고 "저장" 버튼을 클릭 시 정보가 업데이트 된다.



#### 일정 기록 소개 (board)



#### <로그인 후 홈 화면>

![image](https://user-images.githubusercontent.com/50854729/68991232-c66bd780-089f-11ea-844c-a71cd63249b5.png)

로그인한 뒤의 홈 화면이다. 홈 화면을 띄울 때 Controller에서 board들이 담긴 리스트를 보내주고 이를 jsp파일에서 받아 게시해 준다.



#### <게시글 등록 화면>

![image](https://user-images.githubusercontent.com/50854729/68991233-c8ce3180-089f-11ea-8960-b10edb1f26dd.png)

홈 화면에서의 글 쓰기 버튼을 통해 넘어오는 화면이다.

form형식으로 사용자의 입력값을 받는다. 사용자가 입력한 값들은 최종적으로 글 등록 버튼을 통해 제출된다.

\1. 게시글에 등록할 이미지파일을 등록한다. 이미지 파일은 multipath형으로 등록되며 서버에 업로드, DB에는 파일명을 저장한다.

\2. 마우스로 지도 좌표를 찍어 위도, 경도 정보를 남길 수 있다. Daum Map API를 사용했다.

\3. form안에 담긴 정보로 Board 객체를 만들어서 DB에 저장하여 글을 등록 한다.



#### <게시글 등록 완료 화면>

![image](https://user-images.githubusercontent.com/50854729/68991235-cbc92200-089f-11ea-86d5-d3a9be0d006c.png)

게시글 등록완료 후 다시 redirect를 통해 메인화면으로 돌아온다. 입력한 사진, 작성자, 날짜, 내용이 게재된다.

\1.     화살표가 향하는 + 버튼을 클릭하면 해당 게시글을 상세히 조회할 수 있다.



#### <해당 게시글 상세보기 화면>

![image](https://user-images.githubusercontent.com/50854729/68991236-cd92e580-089f-11ea-9fdb-9c5379ff519d.png)

Index에서 “+” 버튼을 누르게 되면 그 게시글에 대한 Sequence 번호가 view 페이지로 넘어오게 되며 해당 번호에 대한 게시글만 띄워준다.

\1.     게시글 목록으로 돌아간다.

\2.     해당 게시글을 수정할 수 있다.

\3.     해당 게시글을 삭제할 수 있다.

 

#### <게시글 수정 화면>

![image](https://user-images.githubusercontent.com/50854729/68991237-cf5ca900-089f-11ea-8449-d8b42b0b5d66.png)

Sequence 번호를 넘겨 받고 그 게시글에 대한 정보들이 각 input 태그의 value값에 들어간다. 사용자는 원하는 부분만 수정이 가능하다.

\1.     게시글 추가와 마찬가지로 form에 담긴 정보들로 특정 sequence 번호에 해당하는 게시글을 수정할 수 있다.

\2.     메인 페이지로 돌아가는 버튼이다.



#### <나의 발자취화면>

![image](https://user-images.githubusercontent.com/50854729/68991239-d1266c80-089f-11ea-8d41-3375573c055b.png)

\1.     유저(ehgus)의 게시글로 등록된 모든 위치정보를 가져와 해당 위치정보에 같이 등록된 이미지를 지도 좌표에 찍어줍니다. 좌표 간 서로 연결되어 유저(ehgus)의 행동경로를 나타낼 수 있습니다.

\2.     게시글 목록으로 다시 되돌아 갈 수 있습니다.



#### 할 일 소개(Todo)



#### <캘린더를 이용한 일정 표시>

![image](https://user-images.githubusercontent.com/50854729/68991215-9d4b4700-089f-11ea-8cc2-6cde1a44539d.png)

캘린더를 이용하여 해당 날짜의 등록한 일정을 확인할 수 있습니다.



#### <할 일 추가>

![image](https://user-images.githubusercontent.com/50854729/68991220-b5bb6180-089f-11ea-9852-51f11832e800.png)

 "Write Schedule"버튼을 클릭하여 일정을 등록할 수 있습니다.



![image](https://user-images.githubusercontent.com/50854729/68991221-b81dbb80-089f-11ea-9fe2-26ab2dffdc4b.png)

할 일 추가 폼으로 언제 몇 시 몇 분에 어떤 걸 할건지 누구와 일정을 잡을건지 정해줄 수 있고 어디서 할건지 지도에 마우스로 클릭하여 정해줄 수 있습니다.



#### <할 일 보기 및 수정>

![image](https://user-images.githubusercontent.com/50854729/68991223-ba801580-089f-11ea-9df9-210a58378cef.png)

노락 박스의 할 일 리스트에서 일정을 클릭하여 자세히 볼 수 있습니다.



![image](https://user-images.githubusercontent.com/50854729/68991225-beac3300-089f-11ea-8a9c-e65699465cb4.png)

할 일 수정 폼으로 수정이 끝나면 "update Schedule" 버튼을 클릭하여 업데이트 할 수 있다.



![image](https://user-images.githubusercontent.com/50854729/68991227-c075f680-089f-11ea-8ede-56e2f90cb7b8.png)

할 일 삭제 폼



#### <할 일 글로 작성하여 기록하기>

![image](https://user-images.githubusercontent.com/50854729/68991228-c2d85080-089f-11ea-9b98-e2bcb14afc12.png)

등록할 일정을 마친 후 "일기로 등록" 버튼을 클릭하여 바로 일정을 기록할 수 있습니다.



![image](https://user-images.githubusercontent.com/50854729/68991231-c4097d80-089f-11ea-9b20-8854996da084.png)

일정 기록 폼