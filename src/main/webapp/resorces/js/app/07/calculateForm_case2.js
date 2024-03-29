/**
 * 
 */
/*
1. DOM(body를 포함) 트리쿠조가 완성된 이후 실행되는 코드 : DOMContentLoaded
2. calForm submit 이벤트 중단
3. 비동기 요청 전송
	line : action, method
	header : accept, content-type
	body : form's inputs, (parameter : queryString)
*/
/*
	case1 : parameter 전송 후 HTML 응답 수신
	case2 : parameter 전송 후 JSON 응답 수신
*/
document.addEventListener('DOMContentLoaded', function () {
	calForm.addEventListener('submit',function(event){
		event.preventDefault();
		let url = calForm.action;
		let method=calForm.method;
		let enctype=calForm.enctype;
		let accept="application/json";
		let formdata=new FormData(calForm);
		let queryString=new URLSearchParams(formdata);
		let promfetch=fetch(url,
			{method:method,headers:{"Content-Type":enctype,"Accept":accept},body:queryString}
		)
		promfetch.then(resp=>{
			if(resp.ok){
				return resp.json()
			}else {
				throw new Error(`상태코드 ${resp.status}에러`,{cause:resp})
			}
		}).then(jsonObj=>{
			calArea.innerHTML=jsonObj.expression;
		}).catch(err=>{
			console.log(err.message);
			if(err.cause){
				let resp=err.cause;
				resp.text().then(ep=>calArea.innerHTML=ep)
			}
		})
		return false;
	})

})