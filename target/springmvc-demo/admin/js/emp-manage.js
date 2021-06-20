//删除按钮的处理函数
$(".delete").click(function() {
	var no = $(this).parents("tr").children("td").eq(0).text();//员工编号
	var name = $(this).parents("tr").children("td").eq(1).text();//员工姓名
	var f = window.confirm("确认要删除员工："+name+" 吗?");
	if(f==true) {
		location.href = $(this).attr("href");//确定删除则提交href
	}
});
//编辑按钮的处理程序
$(".edit").click(function() {
	$(this).addClass("hide");
	$(this).next().removeClass("hide");
	$(this).parents("tr").children("td").eq(1).prop("contenteditable", true);
//	$(this).parents("tr").children("td").eq(2).prop("contenteditable", true);
	var old_job = $(this).parents("tr").children("td").eq(2).text();
	var job_sel = $("#form-add select[name=job]").clone();//克隆一个职务下拉框
	job_sel.children("option[value=" + old_job + "]").prop("selected", true);
	$(this).parents("tr").children("td").eq(2).html(job_sel);
	$(this).parents("tr").children("td").eq(3).prop("contenteditable", true);
	$(this).parents("tr").children("td").eq(5).prop("contenteditable", true);
	$(this).parents("tr").children("td").eq(6).prop("contenteditable", true);
//	$(this).parents("tr").children("td").eq(1).prop("contenteditable", true);
	var old_dept = $(this).parents("tr").children("td").eq(7).text();
	var dept_sel = $("#form-add select[name=dept]").clone();
	/*var option_arr = dept_sel.children("option");
	for(var i=0; i<option_arr.length; i++) {
		console.log(option_arr.eq(i).text());
		if(option_arr.eq(i).text()==old_dept) {
			option_arr.eq(i).prop("selected", true);
		}
	}*/
	dept_sel.children("option:contains(" + old_dept + ")").prop("selected", true);
	$(this).parents("tr").children("td").eq(7).html(dept_sel);
});
//修改提交按钮的处理程序
$(".submit").click(function() {
	var tdArr = $(this).parents("tr").children("td");
	var params = "";
	params += "empno=" + tdArr.eq(0).text();
	params += "&ename=" + tdArr.eq(1).text();
	params += "&mgr=" + tdArr.eq(3).text();
	params += "&hiredate=" + tdArr.eq(4).text();
	params += "&sal=" + tdArr.eq(5).text();
	params += "&comm=" + tdArr.eq(6).text();
	params += "&job=" + tdArr.eq(2).children("select").val();
	params += "&dept=" + tdArr.eq(7).children("select").val();
//	alert(params);
	location.href = $(this).attr("href")+"?"+params;
});














