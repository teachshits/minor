/* Javascript Document for site specific functions */

function onload_site_function() {
}

function get_top_navigation_bar() {
	loadXMLDoc(top_nav_url,top_nav_id);
}

function formatDate(input) {

    d = new Date(input);

    var day = d.getDate();

    var month = d.getMonth()+1; //starts at 0

    var year = d.getFullYear();

    var hour = d.getHours();

    var min = d.getMinutes();

    var output = year + "-" + month + "-" + day + " " + hour + ":" + min;

    console.log(output);

    return output;

}
