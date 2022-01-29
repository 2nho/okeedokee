//페이지 공통함수
function ajaxPageFunction (i_type, i_url, i_params) {
    // $.ajax({
    //     type: i_type,
    //     url: i_url,
    //     success: function (data) {
    //         //document.open();
    //         //document.write(data);
    //         //document.close();
    //         window.location.href= i_url;
    //     }
    // });

    //아래 데이터 없을경우 예외처리
    var strParams = '';
    if (null == i_params
        || undefined == i_params) {
        ;
    } else {
        strParams = i_params;
    }

    $.ajax({
        headers: {
            'X-CSRF-Token': ''
        }
        , async: true
        , type: 'POST'
        , url: '/Announcement_detail'
        , data: {
            filter_cond: JSON.stringify([])
        }
        , dataType: "html"
        , success: function (data) {
            //$("#main_content").html(data);
            debugger;
            windows.location.href = windows.location.href + '/Announcement_detail';
        }
        , complete: function () {;}
    });

    // $.ajax({
    //     type: i_type,
    //     url: i_url,
	// 	data: strParams,
    //     async: false,
    //     success: function(result)
    //     {
	// 		window.location.href = i_url;
    //     },
    //     error: function(data)
    //     {
    //         alert('Page : ' + data);
    //     }
    // });

}

function ajaxJsonFunction (i_url, i_params, i_callbackFunction) {
    $.ajax({
        url: i_url,
        type: "POST",
        data: i_params,
        async: true, //false 동기야 != default : true (비동기)
        success: function(resultSet) {
            if (0 == resultSet.length) {
                console.log('NO DATA!');
            } else {;}
            
            i_callbackFunction(resultSet);
        },
        error: function(){
            alert('Ajax ' + i_url + ' Fail!');
        }
    });
}