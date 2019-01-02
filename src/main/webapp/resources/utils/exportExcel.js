function exportNowPage(table,fileName,ignoreCol,ignoreColl){
	$(table).tableExport({
		fileName:fileName,
		ignoreCol : ignoreCol,
		ignoreColl:ignoreColl
	});
}
function exportAll(url,name,template,rowData,isAllPage){
	        var form = $("<form></form>").attr("action", url).attr("method", "post");
	        form.append($("<input></input>").attr("type", "hidden").attr("name", "name").attr("value", name));
	        form.append($("<input></input>").attr("type", "hidden").attr("name", "template").attr("value",template));
	        form.append($("<input></input>").attr("type", "hidden").attr("name", "isAllPage").attr("value",(isAllPage==null || isAllPage==true)?"true":"false"));
	        form.append($("<input></input>").attr("type", "hidden").attr("name", "queryParams").attr("value",JSON.stringify(rowData)));
	        form.appendTo('body').submit().remove();
}
