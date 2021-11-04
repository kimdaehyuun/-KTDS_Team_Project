<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/main.css"/>
    <title>안전결제 페이지</title>
    <style>
    </style>
</head>
<body>
    <!-- 제일 큰 div 박스 -->
    <div class = "safePurchase_container">
        <!-- 가장 상단 박스 -->
        <div class = "safe_btn_container">
            <button type="button" class="image_btn" onclick="location.href = '#'"><img src="resources/img/2.jpg"></button>
        </div>
        <div class = "safe_info_container">
            <div>
                <h1 id = "safe_into_text">안전결제로 거래를 진행합니다.</h1>
            </div>
            <div class="safe_item_line">
                <div>
                    <img class="safe_item_image" src = resources/img/2.jpg>
                </div>
                <div>
                    <p><b>30,000원</b><br>맥북 케이스</p>
                </div>
            </div>
        </div>
        <div class = "safe_address_container">
            <h3>배송지</h3>
            <div id = "safe_address_box">
                <div>
                    <b>김대현</b>
                </div>
                <div>
                    <a href="#">변경</a>
                </div>
            </div>
            <div id = "safe_address_box2">
                <p>(10486) 경기도 고양시 덕양구 서정마을2로6<br>
                01041920136</p>
            </div>
            <div>
                <select class="deliver_location">
                    <option value='' selected="selected" disabled = "disabled">배송 요청사항</option>
                    <option value=''>문앞</option>
                    <option value=''>경비실</option>
                    <option value=''>우편함</option>
                    <option value=''>직접 수령 부재시 문 앞</option>
                </select>
            </div>
        </div>
        <div class = "safe_money_container">
            <h3>결제금액</h3>
            <div>
                <div class="safe_money_line">
                    <div>
                        상품금액
                    </div>
                    <div>
                        4,000원
                    </div>
                </div>
                <div class="safe_money_line">
                    <div>
                        안심 수수료
                    </div>
                    <div>
                        +140원
                    </div>
                </div>
                <div class="safe_money_line">
                    <div>
                        결제금액
                    </div>
                    <div>
                        4,140원
                    </div>
                </div>
                <div class="safe_money_line">
                    <div>
                        배송비
                    </div>
                    <div>
                        배송비별도
                    </div>
                </div>
                <hr>
                <div class="safe_money_line">
                    <div>
                        총 결제금액
                    </div>
                    <div>
                        4,140원
                    </div>
                </div>
            </div>
        </div>
        <div class = "safe_purchase_way_container">
            <h3>결제수단</h3>
            <div>
                <select class="deliver_location">
                    <option value=' '>신용/체크카드</option>
                    <option value=''>카카오페이</option>
                    <option value=''>토스</option>
                    <option value=''>간편계좌결제</option>
                    <option value=''>휴대폰결제</option>
                    <option value=''>무통장(가상계좌)</option>
                </select>
            </div>
        </div>
        <div class = "safe_agree_container">
            <input type="checkbox" class="checkbox_agree_check">
            <label class="checkbox_agree_label">개인정보 제 3자 제공동의와 결제대행 서비스 이용약관에 동의합니다.</label>
            <a href = "#">자세히 보기</a>
        </div>
        <div class = "safe_purchase_container">
            <button type="button" class="btn btn-danger" onclick="location.href = '#'">결제하기</button>
        </div>
    </div>
</body>
</html>