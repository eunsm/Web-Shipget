document.write("<script src='dist/sweetalert.min.js'></script>");
document.write("<link rel='stylesheet' type='text/css' href='dist/sweetalert.css'>");
function fileClear(obj){
	obj.select();
	document.selection.clear();
	obj.blur();
}
function getFileExtension( filePath )
{
    var lastIndex = -1;
    lastIndex = filePath.lastIndexOf('.');
    var extension = "";

	if ( lastIndex != -1 )
	{
		extension = filePath.substring( lastIndex+1, filePath.len );
	} else {
		extension = "";
	}
    return extension;
}

//파일을 선택 후 포커스 이동시 호출
function uploadImg_Change( obj, iwidth, iheight )
{
	alert(obj.value);
	var value = obj.value;
	maxImageHeight=iheight;
	maxImageWidth=iwidth;
    var src = getFileExtension(value);
    if (src == "") {
//        alert('올바른 파일을 입력하세요');
		fileClear(obj);
        return;
    } else if ( !((src.toLowerCase() == "gif") || (src.toLowerCase() == "jpg")||(src.toLowerCase() == "png") || (src.toLowerCase() == "jpeg")) ) {
    	swal({
    		  title : "",
			  text: 'gif,jpg,png,jpeg 파일만 지원합니다.',
    		  confirmButtonText: "확인",
    		  type : "error"
    		  });
    	//alert('gif,jpg,png,jpeg 파일만 지원합니다.');
		fileClear(obj);
        return;
    }

    LoadImg(obj);

}
function LoadImg(obj)
{
	var img = document.getElementById('imageid'); 
	alert("^^"+img.width);
	var value = obj.value;
	var filevalue = value.split("\\");
	var name = filevalue[filevalue.length-1];
	alert("%%"+name);
	alert("&&&");
    var imgInfo = new Image();
    alert("##"+imgInfo);
   // imgInfo.onload = img_Load;
    alert("**"+imgInfo.src);
    //imgInfo.src = value;
	var imgWidth = imgInfo.width;
	var imgHeight = imgInfo.height;
    
	alert(imgInfo.width+"x"+imgInfo.height);
	if(imgWidth != maxImageWidth || imgHeight != maxImageHeight){
		swal({
  		  title : maxImageWidth+'x'+maxImageHeight+'파일만 지원합니다.',
			  text: '첨부한 이미지의 사이즈는'+imgWidth+'x'+imgHeight+'입니다.',
  		  confirmButtonText: "확인",
  		  type : "error"
  		  });
		//alert(maxImageWidth+"*"+maxImageHeight+"파일만 지원합니다");
		fileClear(obj);
		return false;
	}
}