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
document.addEventListener('DOMContentLoaded', function () {
	calForm.addEventListener('submit',function(event){
		event.preventDefault();
		let url = calForm.action;
		let method=calForm.method;
		let contentType="application/json";
		let accept="text/html";
		let formData=new FormData(calForm);
		let nativeData = {
			leftOp:parseFloat(formData.get("left")),
			rightOp:parseFloat(formData.get("right")),
			operatorType:formData.get("operator")
		};
		let jsonStr = JSON.stringify(nativeData);
		let promfetch=fetch(url,
			{method:method,headers:{"Content-Type":contentType,"Accept":accept},body:jsonStr}
		)
		promfetch.then(resp=>{
			if(resp.ok){
				return resp.text()
			}else {
				throw new Error(`상태코드 ${resp.status}에러`,{cause:resp})
			}
		}).then(html=>{
			calArea.innerHTML=html;
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