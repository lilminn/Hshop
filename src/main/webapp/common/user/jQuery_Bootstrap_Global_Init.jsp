<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jQuery -->
<script src="<c:url value='${pageContext.request.contextPath}/templates/user/js/jquery-2.1.0.min.js' />"></script>

<!-- Bootstrap -->
<script src="<c:url value='${pageContext.request.contextPath}/templates/user/js/popper.js' />"></script>
<script src="<c:url value='${pageContext.request.contextPath}/templates/user/js/bootstrap.min.js' />"></script>

<!-- Plugins -->
<script src="<c:url value='${pageContext.request.contextPath}/templates/user/js/owl-carousel.js' />"></script>
<script src="<c:url value='${pageContext.request.contextPath}/templates/user/js/accordions.js' />"></script>
<script src="<c:url value='${pageContext.request.contextPath}/templates/user/js/datepicker.js' />"></script>
<script src="<c:url value='${pageContext.request.contextPath}/templates/user/js/scrollreveal.min.js' />"></script>
<script src="<c:url value='${pageContext.request.contextPath}/templates/user/js/waypoints.min.js' />"></script>
<script
	src="<c:url value='${pageContext.request.contextPath}/templates/user/js/jquery.counterup.min.js' />"></script>
<script src="<c:url value='${pageContext.request.contextPath}/templates/user/js/imgfix.min.js' />"></script>
<script src="<c:url value='${pageContext.request.contextPath}/templates/user/js/slick.js' />"></script>
<script src="<c:url value='${pageContext.request.contextPath}/templates/user/js/lightbox.js' />"></script>
<script src="<c:url value='${pageContext.request.contextPath}/templates/user/js/isotope.js' />"></script>

<!-- MDB -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.js"></script>

<!-- Global Init -->
<script src="<c:url value='${pageContext.request.contextPath}/templates/user/js/custom.js' />"></script>

<script>
	$(function() {
		var selectedClass = "";
		$("p").click(function() {
			selectedClass = $(this).attr("data-rel");
			$("#portfolio").fadeTo(50, 0.1);
			$("#portfolio div").not("." + selectedClass).fadeOut();
			setTimeout(function() {
				$("." + selectedClass).fadeIn();
				$("#portfolio").fadeTo(50, 1);
			}, 500);

		});
	});
</script>