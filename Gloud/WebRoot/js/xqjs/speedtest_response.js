/**
 * Created by MyPC on 2015/12/24.
 */
//  选区测速,结果返回,单个测速结果接受
speed_test_client.onSpeedtest = function (msg) {

    $('#DivLocker').css("z-index", 10000);
    close_all_layer("test_speed_locker", 1);
    console.log(msg);
    var delay_time = parseInt(msg.delayTime);
    $('#delay_time_' + select_region_id).text(delay_time);
    $('#test_speed_div_id_' + select_region_id).hide();
    $('#mbps_region_div_id_' + select_region_id).show();
    $('#mbps_region_' + select_region_id).html(msg.mbps + "Mbps");
    modify_class_by_speed(select_region_id, delay_time, msg.mbps);
    //测速结果存储到本地
    var region_data = store.get('region_data');
    var is_exist = false;
    if (region_data != undefined) {
        var myobj = eval(region_data);
        for (var i = 0; i < myobj.length; i++) {
            if (myobj[i].region_id == select_region_id) {
                is_exist = true;
                myobj[i].delay_time = delay_time;
                myobj[i].mbps = msg.mbps;
               // var jsonText = JSON.stringify(myobj);
               // store.set('region_data', jsonText);
            }
        }
        if (is_exist == true) {
            var jsonText = JSON.stringify(myobj);
            store.set('region_data', jsonText);
        }
        if (is_exist == false) {
            var ss = new Object();
            ss.region_id = select_region_id;
            ss.delay_time = delay_time;
            ss.mbps = msg.mbps;
            myobj.push(ss);
            var jsonText = JSON.stringify(myobj);
            store.set('region_data', jsonText);
        }

    } else {
        var cc = [{"region_id": select_region_id, "delay_time": delay_time, "mbps": msg.mbps}];
        store.set('region_data', cc);
    }
    $('#enqueue').show();
    //汇报测速结果到服务器
    notice_speed_result(select_region_id, delay_time, msg.mbps * 1000);
    if (gls_client.sock == null) {
        gls_client.start();
        gls_login_success_next_step=3;
    }
}
//链接socketerror
speed_test_client.onError = function () {
    $('#DivLocker').css("z-index", 10000);
    close_all_layer("test_speed_locker", 1);
}
