$(document).ready(function() {
	var pageNum = 1;
	var totalResults = 0; // 총 검색 결과 갯수를 저장할 변수
    var displayedResults = 0; // 현재까지 화면에 표시한 결과 갯수를 저장할 변수
    
	$("#search_form").submit(function(event) {
		event.preventDefault();
		$("#searchResults").html("");
		pageNum = 1;
		performSearch();
	});

	$(window).scroll(function() {
		if (Math.ceil($(window).scrollTop()) + $(window).height() >= $(document).height()) {
			pageNum++;
			performSearch();
		}
	});


	function performSearch() {
		$("#search_message").hide();
		$("#search_result_message").show();
		$.ajax({
			method: "GET",
			url: "https://dapi.kakao.com/v3/search/book?target=title",
			data: { query: $("#search_q").val(), page: pageNum },
			headers: { Authorization: "KakaoAK bbae09f5a8da933575c4d6689b7ddb2a" }
		})
			.done(function(msg) {
				console.log(msg);

				if (msg.documents.length <= 4) {
					// 서적이 4개 이하면 스크롤 이벤트 중지
					$(window).off("scroll");
				}
				
				for (var i = 0; i < 10 && i < msg.documents.length; i++) {
					var book = msg.documents[i];
					var isbn = book.isbn.replace(/\s/g, '');
					var isbn_13 = isbn.slice(-13);
					
					var card = "<div class='card'>";
					card += "<h2><a href='bookdetail.jsp?title=" + encodeURIComponent(book.title) + "&author=" 
					+ encodeURIComponent(book.authors.join(', ')) + "&publisher=" + encodeURIComponent(book.publisher) 
					+ "&thumbnail=" + encodeURIComponent(book.thumbnail) + "&isbn=" + encodeURIComponent(isbn_13) + "'>" + book.title + "</a></h2>";
					card += "<div class='card-content'>";
					card += "<img src='" + book.thumbnail + "'/>";
					card += "<div>";
					card += "<br><strong>저자</strong> " + book.authors.join(', ') + "<br><br>";
					card += "<strong>출판사</strong> " + book.publisher;
					card += "</div>";
					card += "</div>";
					card += "</div>";
					$("#searchResults").append(card);
				}
				
					
			});
	}

		
});