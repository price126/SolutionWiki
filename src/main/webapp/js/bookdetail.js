
// URL에서 쿼리 파라미터 추출
function getQueryParams() {
    var params = {};
    var search = window.location.search.substring(1);
    var queryParams = search.split("&");
    for (var i = 0; i < queryParams.length; i++) {
        var param = queryParams[i].split("=");
        var key = decodeURIComponent(param[0]);
        var value = decodeURIComponent(param[1]);
        params[key] = value;
    }
    return params;
}

// 쿼리 파라미터에서 책 정보 추출
function getBookInfo() {
    var queryParams = getQueryParams();
    var bookInfo = {
        title: queryParams.title,
        author: queryParams.author,
        publisher: queryParams.publisher,
        thumbnail: queryParams.thumbnail
    };
    return bookInfo;
}

// 책 정보 출력
function renderBookInfo() {
    var bookInfo = getBookInfo();
    var bookInfoElement = document.getElementById("bookInfo");
    bookInfoElement.innerHTML = "";

    var card = "<div class='card'>";
    card += "<img src='" + bookInfo.thumbnail + "'/>";
    card += "<div class='card-content'>";
    card += "<h2>" + bookInfo.title + "</h2>";
    card += "<div><strong>저자</strong>: " + bookInfo.author + "</div>";
    card += "<div><strong>출판사</strong>: " + bookInfo.publisher + "</div>";
    card += "</div>";
    card += "</div>";

    bookInfoElement.innerHTML = card;
}

// 페이지 로드 시 책 정보 출력
window.onload = function () {
    renderBookInfo();
    document.querySelector('input[name="log_out"]').addEventListener('click', function () {
        window.location.href = 'https://solution-wiki-logout.netlify.app/'; // 로그아웃 버튼 클릭하면 해당 링크로 이동
    });
};