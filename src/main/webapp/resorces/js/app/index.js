/**
 * 
 */
document.addEventListener("DOMContentLoaded",()=>{
	console.log(bootstrap);
	$("[data-log-out]").on("click",(event)=>{
		let $aTag=$(event.target);
		let formSelector=$aTag.data("logOut");
		$(formSelector).submit();
	})
})
	