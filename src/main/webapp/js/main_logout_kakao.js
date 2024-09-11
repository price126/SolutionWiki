Kakao.init('cac097ff5546a87064ca8513bcb065a9');

function requestUserInfo() {
	Kakao.API.request({
		url: '/v2/user/me',
	})
		.then(function(res) {
			alert(JSON.stringify(res));
		})
		.catch(function(err) {
			alert(
				'failed to request user information: ' + JSON.stringify(err)
			);
		});
}

function getCookie(name) {
	var parts = document.cookie.split(name + '=');
	if (parts.length === 2) { return parts[1].split(';')[0]; }
}

function loginWithKakao() {
	Kakao.Auth.authorize({
		redirectUri: 'http://localhost:8083/12_17_new/main_logout.jsp',
	});
}

function requestUserInfo() {
	Kakao.API.request({
		url: '/v2/user/me',
	})
		.then(function(res) {
			alert(JSON.stringify(res));
		})
		.catch(function(err) {
			alert(
				'failed to request user information: ' + JSON.stringify(err)
			);
		});
}

displayToken()
function displayToken() {
	var token = getCookie('authorize-access-token');

	if (token) {
		Kakao.Auth.setAccessToken(token);
		Kakao.Auth.getStatusInfo()
			.then(function(res) {
				if (res.status === 'connected') {
					document.getElementById('token-result').innerText
						= 'login success, token: ' + Kakao.Auth.getAccessToken();
				}
			})
			.catch(function(err) {
				Kakao.Auth.setAccessToken(null);
			});
	}
}
Kakao.Auth.login({
	success: function(authObj) {
		Kakao.API.request({
			url: '/v2/user/me',
			success: function(res) {
				document.cookie = 'nickname=' + res.properties.nickname;
				window.location.href = 'http://localhost:8083/12_17_new/main_login.jsp';
			},
			fail: function(error) {
				alert(JSON.stringify(error));
			}
		});
	},
	fail: function(err) {
		alert(JSON.stringify(err));
	}
});
