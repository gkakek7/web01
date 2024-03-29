$(function(){
	let $inputs=$(calForm).find(":input[name]")
	$inputs.each((idx, el)=>{
		let $el=$(el)
		let name=$el.attr("name");
		let initValue = $el.data("initValue");
		$el.val(initValue)
	}).on("change",function(event){
		$(this.form).submit();
	})
	
	$(document).on("click", ".control-a" ,function(event){
		let $el=$(this);
		$(calForm).find("[name=year]").val($el.data("year"));
		$(calForm).find("[name=month]").val($el.data("month"));
        $(calForm).submit();
	})
	
	let $calForm=$(calForm).on("submit",function(event){
	  event.preventDefault();
	  //$(this)==$calForm
      let url = this.action;
      let method = $(this).attr("method");
      let queryString=$(this).serialize();
      let settings={
      	url:url,
      	method:method,
      	data:queryString,
      	dataType:"html",
      	success:function(resp){
      		$(calArea).html(resp);
      	}, error:function(jqXHR,errStatus,textError){
      		console.log(jqXHR,errStatus,textError);
      	}, complete:function(){
      		console.log("최종 완료");
      	}
      }
      
      
      $.ajax(settings)
      
	}).submit();
	
})












/*document.addEventListener("DOMContentLoaded",()=>{
   
   
   function fn_xhr(){
      let xhr = new XMLHttpRequest();
      xhr.onreadystatechange = ()=>{
         if(xhr.status == 200){
            calArea.innerHTML = xhr.responseText;
         }
      }
      xhr.open(calForm.method, calForm.action);
      xhr.setRequestHeader("Content-Type", calForm);

   }

   function fn_ajax(){
      let body = $(calForm).serialize();
      let settings = {
         url:calForm.action,
         method:calForm.method,
         data:body,
         dataType:"html",
         success:function(html){
//             console.log("ajax success")
//             console.log("출력",html)
            calArea.innerHTML = html;
         }
      }
      $.ajax(settings)
      
   }

   
   calForm.addEventListener("submit", function(event){
      event.preventDefault();
      let url = event.target.action;
      let method = event.target.method;
      let formData = new FormData(calForm);
      let urlSearchParams = new URLSearchParams(formData);
      let fetchPromise = fetch(url,{
         
         method:method,
         headers:{
            "Content-Type":calForm.enctype,
         },
         body:urlSearchParams
      });
      
      
      fetchPromise.then(resp=>{
         if(resp.ok){
            return resp.text();
         }else{
            throw new Error(`상태코드 \${resp.status}이 응답으로 전송됨.`, {cause:resp});   
         }
      }).then(html=>{
         calArea.innerHTML = html;
      }).catch(err=>{
         console.log(err);
         console.log(err.cause);
      }).finally(()=>{
         
      });
      
      return false;
      
   });
   
   calForm.requestSubmit();
})*/