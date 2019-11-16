## P2F 소개

### DB 구조

![1573895605616](C:\Users\ehdwn\AppData\Roaming\Typora\typora-user-images\1573895605616.png)



### 시스템 구조

![1573895728722](C:\Users\ehdwn\AppData\Roaming\Typora\typora-user-images\1573895728722.png)



### 화면 설게(Flow Chart)

![1573895754121](C:\Users\ehdwn\AppData\Roaming\Typora\typora-user-images\1573895754121.png)





### 실행 화면



![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image002.gif)

인덱스 화면



![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image004.gif)
 

회원가입 폼으로 ID, PW, 이름, 별명, 핸드폰 번호, 성별, 비밀번호 찾기 질문, 프로필 사진을 정하여 회원가입 할 수 있습니다.



![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image006.gif)

등록된 ID를 입력하여야 진행할 수 있습니다.



![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image008.gif)



![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image010.gif)



![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image012.gif)
 자신의 프로필 사진을 클릭 시 메인 화면으로 이동합니다.



![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image014.gif)

정보확인 폼



![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image016.gif)
 

 



 

![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image018.gif)

캘린더를 이용하여 해당 날짜의 등록한 일정을 확인할 수 있습니다.



![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image020.gif)

 "Write Schedule"버튼을 클릭하여 일정을 등록할 수 있습니다.



![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image022.gif)

할 일 추가 폼으로 언제 몇 시 몇 분에 어떤 걸 할건지 누구와 일정을 잡을건지 정해줄 수 있고 어디서 할건지 지도에 마우스로 클릭하여 정해줄 수 있습니다.



![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image024.gif)

노락 박스의 할 일 리스트에서 일정을 클릭하여 자세히 볼 수 있습니다.

 

![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image026.gif)

할 일 수정 폼



![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image028.gif)

 

![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image030.gif)

등록할 일정을 마친 후 "일기로 등록" 버튼을 클릭하여 바로 일정을 기록할 수 있습니다.



![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image032.gif)

 일정 기록 폼

 



 

<로그인 후 홈 화면>

![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image034.gif)

로그인한 뒤의 홈 화면이다. 홈 화면을 띄울 때 Controller에서 board들이 담긴 리스트를 보내주고 이를 jsp파일에서 받아 게시해 준다.

 

<게시글 등록 화면>

![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image036.gif)

홈 화면에서의 글 쓰기 버튼을 통해 넘어오는 화면이다.

form형식으로 사용자의 입력값을 받는다. 사용자가 입력한 값들은 최종적으로 글 등록 버튼을 통해 제출된다.

\1. 게시글에 등록할 이미지파일을 등록한다. 이미지 파일은 multipath형으로 등록되며 서버에 업로드, DB에는 파일명을 저장한다.

\2. 마우스로 지도 좌표를 찍어 위도, 경도 정보를 남길 수 있다. Daum Map API를 사용했다.

\3. form안에 담긴 정보로 Board 객체를 만들어서 DB에 저장하여 글을 등록 한다.

 

<게시글 등록 완료 화면>

![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image038.gif)

게시글 등록완료 후 다시 redirect를 통해 메인화면으로 돌아온다. 입력한 사진, 작성자, 날짜, 내용이 게재된다.

\1.     화살표가 향하는 + 버튼을 클릭하면 해당 게시글을 상세히 조회할 수 있다.

 

 

 

 

 

 

 

 

 

<해당 게시글 상세보기 화면>

![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image040.gif)

Index에서 “+” 버튼을 누르게 되면 그 게시글에 대한 Sequence 번호가 view 페이지로 넘어오게 되며 해당 번호에 대한 게시글만 띄워준다.

\1.     게시글 목록으로 돌아간다.

\2.     해당 게시글을 수정할 수 있다.

\3.     해당 게시글을 삭제할 수 있다.

 

<게시글 수정 화면>

 ![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image042.gif)

Sequence 번호를 넘겨 받고 그 게시글에 대한 정보들이 각 input 태그의 value값에 들어간다. 사용자는 원하는 부분만 수정이 가능하다.

\1.     게시글 추가와 마찬가지로 form에 담긴 정보들로 특정 sequence 번호에 해당하는 게시글을 수정할 수 있다.

\2.     메인 페이지로 돌아가는 버튼이다.

 

<나의 발자취화면>

![img](file:///C:/Users/ehdwn/AppData/Local/Packages/oice_16_974fa576_32c1d314_2542/AC/Temp/msohtmlclip1/01/clip_image044.gif)

\1.     유저(ehgus)의 게시글로 등록된 모든 위치정보를 가져와 해당 위치정보에 같이 등록된 이미지를 지도 좌표에 찍어줍니다. 좌표 간 서로 연결되어 유저(ehgus)의 행동경로를 나타낼 수 있습니다.

\2.     게시글 목록으로 다시 되돌아 갈 수 있습니다.