<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<c:url value='/js/wysihtml5-0.3.0.js'/>"></script>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/bootstrap.js'/>"></script>
<script src="<c:url value='/js/bootstrap3-wysihtml5.js'/>"></script>
<script>
    $( document ).ready(function() {
    	$('.link').click(function () {
    		var sHref=$(this).attr("href");
    		var t = $(this);
    		$.ajax({
    	        url: sHref,
    	        type: "post",
    	        data: {},
    	        success: function(msg){
    	            t.text(msg);
    	            if(t.hasClass('like')) {
    	            	t.addClass('dislike');
    	            	t.removeClass('like');
    	            } else if (t.hasClass('dislike')) {
    	            	t.addClass('like');
    	            	t.removeClass('dislike');
	   	            } else if (t.hasClass('subscribe')) {
		            	t.addClass('unsubscribe');
		            	t.removeClass('subscribe');
	   	            } else if (t.hasClass('unsubscribe')) {
    	            	t.addClass('subscribe');
    	            	t.removeClass('unsubscribe');
	   	            }
    	        },
    	        error:function(){
    	            console.log("failure");
    	        }
    	    });
    	    return false;
    	   });
    	 $('#descr').wysihtml5({
    		 "image": false
    	 });
    	 $('#answ').wysihtml5({
    		 "image": false
    	 });
    });
</script>