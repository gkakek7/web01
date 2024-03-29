/**
 * 
 */
document.addEventListener("DOMContentLoaded", () => {
	setInterval(() => {
		fetch("serverTime.do", {
			headers: {
				"Accept": "application/json"
			}
		}).then(resp => {
			return resp.json();
		}).then(jsonOBJ => timeArea.innerHTML = jsonOBJ.now)
	}, 1000);
});