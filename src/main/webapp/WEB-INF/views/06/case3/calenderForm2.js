document.addEventListener("DOMContentLoaded",()=>{
	 
   calForm.querySelectorAll("[name]").forEach((el, idx)=>{
      /*console.log(el.dataset)*/ 
      /*el.value = el.dataset;*/
      //data-* 속성의 키값 규칙성, 카멜 표기법을 표현할 때 '-'으로 대체함
      // ex) data-role : key(role)
      // data-init-value : key(initValue)
      let name = el.name;
      calForm[name].value = el.dataset.initValue;
      
   });
   
   calForm.addEventListener("change", (event)=>{
//       console.log(event);
      event.target.form.requestSubmit();
      
   });
   
//    document.querySelectorAll(".control-a").forEach((el, i)=>{
      document.addEventListener("click", (event)=>{
         if(event.target.classList.contains("control-a")){            
            console.log(event.target);
            let el = event.target
            calForm.year.value = el.dataset.year;
            calForm.month.value = el.dataset.month;
            calForm.requestSubmit();
         }
      });
//    });
   
//    $(selector).on("click", function(){}) //정적인 방식, 이벤트가 발생한 객체에 직접 접근
//    $(parent).on("click",selector, function(){}) // 동적인 방식, 이벤트가 발생할 객체가 아직 없을 때 미리 이벤트 설정, 버블링 이용
   
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
})