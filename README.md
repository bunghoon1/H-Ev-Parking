# * 풀스택 개발자 포트폴리오*
김 병 훈 - ByungHoon Kim 포트폴리오  <br/>
Email: bunghoon1@naver.com

<br/>

## **😃소 개**

> 안녕하세요! "이왕 하는 거 재밌게 하자!" 재미있게 배우고 있는 신입 개발자 김병훈입니다.
>  
> 2023년 3월부터 6개월간 항공 풀스택 개발자 국비 교육을 듣고난 이후 3개월간 만든 개인 프로젝트 입니다.
>  
> 조금 늦긴 했지만 20대와 같은 열정으로 성장을 두려워하지 않고 능력 있는 개발자가 되기 위해 꾸준히 공부하고 있습니다.
>  
> 프로젝트 시연 영상은 마지막에 있습니다.(7분정도! 화질은 꼭 HD화질로 보세요!!)
> 
> 저에 대해 궁금하거나 같이 공부를 원하신다면 언제든지 제 개인 블로그에 놀러 와 주세요^^  <a href="https://bunghoon1.tistory.com/">🏠(클릭)</a>
>
<br/><br/><br/><br/>


## 📃 프로젝트 개요

> 프로젝트 명: H/Ev Parking 전기차/일반차 주차 통합 관리 시스템
>
> 기획/제작: 김병훈
>
> 분 류: 개인 프로젝트
>
> 제작 기간: 2023년 10월 11일 ~ 2024년 1월10일(3달)
>
> 주요 기능: 주차 예약 , 충전기 예약, 결제(카드결제/계좌이체), 전기차 충전소 검색

<br/><br/> 
<img src="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/assets/111756786/4d906c48-517f-4618-b9ae-d200795a573b" width="100%"/><br/>

<br/><br/><br/><br/>


## 📚 사용 기술
>
>
> **Front-End** <br/>
> <img src="https://img.shields.io/badge/javascript-dedede?style=for-the-badge&logo=javascript&logoColor=fff305">
> ,<img src="https://img.shields.io/badge/css3-dedede?style=for-the-badge&logo=css3&logoColor=blue">
> ,<img src="https://img.shields.io/badge/html5-dedede?style=for-the-badge&logo=html5&logoColor=red">
> ,<img src="https://img.shields.io/badge/jquery-dedede?style=for-the-badge&logo=jquery&logoColor=black">
> ,<img src="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/assets/111756786/e279b1ad-a3ab-4951-b759-455e47960d56" width="50px" height="30px">
>
> **프레임 워크** <br/>
> <img src="https://img.shields.io/badge/springboot-dedede?style=for-the-badge&logo=springboot&logoColor=25c43d">
>
>
> **Back-End** <br/>
> ,<img src="https://img.shields.io/badge/mariadb-dedede?style=for-the-badge&logo=mariadb&logoColor=173654">
> ,<img src="https://img.shields.io/badge/Gradle-dedede?style=for-the-badge&logo=Gradle&logoColor=292c47">
> ,<img src="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/assets/111756786/f7fd55f7-542f-401c-b5bd-2bb41874e6b4" width="50px" height="30px">
>
> <br/>
> 
> **API 및 기타** 
> <h6>Kakao Map API, Kakao 주소 API, 공공데이터 포털</h6>


<br/><br/><br/><br/>


## 📊 ERD
<img src="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/assets/111756786/9e79b3ed-d582-412f-b0e5-021df5e3b0c3" width="100%"/>


<br/><br/><br/><br/>

  
## **👨🏻‍💻 기능 구현**
📽시연 영상은 이미지를 클릭해 주세요!

### **🖼1. 메인 화면**
> <a href="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/blob/main/hevparking/src/main/resources/static/js/index.js"><Strong>js코드 확인</Strong></a>
> , <a href="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/blob/main/hevparking/src/main/resources/static/css/index.css"><Strong>css코드 확인</Strong></a>
> 
> <a href="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/assets/111756786/2c98e34a-109a-403c-a8f8-670ba3332da1">
> <img src="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/assets/111756786/4d906c48-517f-4618-b9ae-d200795a573b" width="50%" height="50%"/></a><br/>
- 로그인 후 보여지는 화면
- 내정보, 주차예약, 주차정보확인, 충전소 조회, 공지사항 이동
- 주차정보 확인시 예약 취소 및 남은시간 확인
 
## 
<br/><br/><br/><br/>

### **🚘2. 주차 예약 및 충전기 사용 예약**
> <a href="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/blob/main/hevparking/src/main/webapp/WEB-INF/views/parkingRes.jsp">html</a>
> , <a href="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/blob/main/hevparking/src/main/resources/static/js/parkingRes.js">js</a>
> , <a href="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/blob/main/hevparking/src/main/resources/static/css/parkingRes.css">css</a>
> , <a href="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/blob/main/hevparking/src/main/java/com/example/demo/controller/ParkingResController.java">Controller</a>
> , <a href="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/blob/main/hevparking/src/main/java/com/example/demo/service/ParkingResService.java">Service</a>
> , <a href="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/blob/main/hevparking/src/main/java/com/example/demo/mapper/ParkingResMapper.java">mapper</a>
> , <a href="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/blob/main/hevparking/src/main/resources/mapper/ParkingResMapper.xml">myBatis</a>
> 
> <a href="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/assets/111756786/398c73da-03a4-4006-8ca4-f968be7fc814">
> <img src="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/assets/111756786/5f11113d-d2c4-4a10-afca-87c12bb83494" width="50%" height="50%"/></a>
>
- 전기차와 일반차 주차구역 분류
- 일반주차 기능
- 정기주차 기능(30일)
- 충전기 정보확인 및 충전 예약 기능
- 주차시작일 + 시간 , 주차종료일 + 시간 선택시 요금 자동 계산(실시간 확인가능)
- 예약중복방지 기능

## 
<br/><br/><br/><br/>

### **⌨3. 결제(카드결제/계좌이체)**
> <a href="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/blob/main/hevparking/src/main/resources/static/js/parkingResPayment.js"><Strong>js코드 확인</Strong></a>
> , <a href="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/blob/main/hevparking/src/main/resources/static/css/parkingResPayment.css"><Strong>css코드 확인</Strong></a>
> 
> <a href="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/assets/111756786/a496db5b-8b4a-47bb-b03c-2a79d53c460b">
> <img src="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/assets/111756786/03928a6a-1cb3-4273-a5f5-321ea323cb8f" width="50%" height="50%"/></a><br/>
- 주차정보 및 충전기 사용 정보 제공
- 카드 결제 및 계좌이체 결제
- 결제 카드 등록
- 쿠폰사용(미구현)

## 
<br/><br/><br/><br/>

### **⛽4. 전기차 충전소 조회**
> <a href="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/blob/main/hevparking/src/main/webapp/WEB-INF/views/searchMap.jsp"><Strong>jsp코드 확인</Strong></a>
> , <a href="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/blob/main/hevparking/src/main/resources/static/css/searchMap.css"><Strong>css코드 확인</Strong></a>
> 
> <a href="https://clipchamp.com/watch/IHgpXTF23Qv">
> <img src="https://github.com/bunghoon1/H-Ev_Parking_Web_portfolio/assets/111756786/68811358-c9d9-41ef-a09c-e3f2ca8f3202" width="50%" height="50%"/></a><br/>
- 주소 검색(키워드), 지역선택으로 이동가능
- 해당 위치의 주변 충전소 키워드로 검색가능
- 충전소 리스트 확인 가능
- 아이콘 클릭시 해당 충전소 정보 확인 가능(실시간 kW당 요금확인 가능)

## 
<br/><br/><br/><br/>

## **🎬 시연 영상**
<a href="https://www.youtube.com/watch?v=DL3BFUMvQAc">최종영상</a>

<br/><br/><br/><br/>

## 😎 프로젝트 후기
> H/Ev Parking 시스템 프로젝트를 마무리하며 3개월 동안 제 자신과의 싸움에서 잘 이겨냈다는 생각이 들었습니다. <br/>
> 프로젝트를 진행하는 중간중간에 많은 기능들을 혼자 다 만들어야 한다는 압박감이 들어 포기하고 싶은 생각도 들었습니다. <br/>
> 하지만 개인 프로젝트를 한다고 제가 스스로 선택한 것이기에 포기하지 않고 끝까지 잘 마무리할 수 있었던 것 같습니다. <br/>
> 그리고 프로젝트가 끝났지만 다시 한번 제가 그동안 사용했던 기술에 대해 더 자세히 알고 싶은 마음이 생겼습니다. <br/>
> 유지보수를 잘하기 위해 함수의 재사용성을 늦게 알게 되었는데, 그동안 같은 코드를 여러 번 쓰게 된 것에 대한 후회가 왔었습니다. <br/>
> 앞으로는 코드의 재사용성을 잘 활용해서 좀 더 간결한 코드를 만들어 보고 싶은 생각이 들었습니다. <br/>

<br/><br/><br/><br/>


## 🔥 향상된 기술
### java: 20% -> 40%
### html: 50% -> 80%
### JQuery/javaScript: 50% -> 70%
### CSS: 10% -> 60%
### SQL: 20% -> 50%
### Gradle: 10% -> 20%

## 
