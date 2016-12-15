/**
 * Created by MyPC on 2015/12/16.
 */
    //gmc 通信
gmc_client.onError = function () {
    gmc_client.is_open_status = false;
    gmc_connect_error_num++;
    console.log("连接gmc出错\n");
    console.log("连接gmc出错次数：" + gmc_connect_error_num + "\n");
    console.log("打开gmc次数：" + gmchelper_is_open_num + "\n");
    if (gmchelper_is_open_num == 0) {
        console.log("连接gmc\n");
        gmc_client.open_gmc_help_client();
        setTimeout(function () {
            gmc_client.start();
        }, 5000);    //  如果没有启动gmc*/
        gmchelper_is_open_num++;
    } else {
        if(navigator.platform.indexOf('Mac') == 0){
            write_tip_message('格来云游戏MAC版内测中，请加入测试QQ群277960170，获取开始游戏的必要程序。');
            return;
        }
        if (gmc_connect_error_num >= 10) {
            console.log('没有连接上GMC,认定GMC不存在,请下载GMC程序！');
            $("#constituency").hide();
            $("#close_gmc_helper").hide();
            $('#check_gmc_prompt').html("未检测到开始云游戏的必要小程序<br><span style='color:red;'>安装完成后请刷新界面</span>");
            $('#download_install').show();
            return;
        } else {
            gmc_client.start();
        }
    }
}
//  与gmc断开连接后的反馈
gmc_client.onClose = function () {
    gmc_client.is_open_status = false;
    if (gmc_is_install == true) {
        $("#close_gmc_helper").hide();//关闭关闭gmchelp的按钮
        $("#check_gmc_prompt").html("启动游戏必要小程序");
        setTimeout(function () {
            gmc_client.start();
        }, 3000);    //  如果没有启动gmc*/

    }

    /*    if (is_gmc_update != 1) {
     if (gmc_client.is_open_status == false) {
     console.log('没有连接上GMC,认定GMC不存在,请下载GMC程序！');
     $('#check_gmc_prompt').html("未检测到开始云游戏的必要小程序<br><span style='color:red;'>安装完成后请刷新界面</span>");
     $('#download_install').show();
     }
     } else {
     gmc_client.open_gmc_help_client();
     setTimeout(function () {
     gmc_client.start();
     }, 5000);    //启动gmc_client
     }*/
}
gmc_client.onOpen = function () {
    console.log("成功连接上gmc\n");
    gmc_client.is_open_status = true;
    if (gmc_is_install == true) {
        $("#DivLocker").hide();
        $('#j_check_gmc_f').hide();
        $("#region_queding").hide();
        //新增逻辑
        var select_region = store.get('selected_region_id');
        if (select_region != undefined) {
            gls_login_success_next_step = 1;//加入队列
            if (gls_client.sock == null) {
                gls_client.start();
            } else {
                //如果gls已经连接，直接加入队列
                //正在加入队列提示
                if (gls_user_is_login != 1) {
                    gls_client.login();
                } else {
                    gls_client.enqueue(select_region, game_id, game_mode, payment_type, save_id, serial_id);
                }
            }
        } else {
            $('#j_region_f').show();
            $("#join_enqueue").show();
        }
    } else {
        //连上gmc后发送查询当前版本信息
        gmc_client.update_query();
    }
}
gmc_client.onUpdateInfo = function (msg) {
    console.log("onUpdateInfo--new: json_data:" + JSON.stringify(msg) + "\n");
    //重置是否更新默认值
    gmc_is_update_over = false;
    if (typeof(msg) == 'undefined')
        return;
    if (msg.content.needupdate == '1') {   // 有更新
        if (msg.content.status == '0') {   // 无特殊动作,正常检测
            if (msg.content.force == "1") {   // 强制更新,
                $("#check_gmc_prompt").html("发现新版本,版本号:" + msg.content.newvername);
                $('#install_gmc_helper').show();
            } else if (msg.content.force == "0") { // 非强制更新
                $("#check_gmc_prompt").html("发现新版本,版本号:" + msg.content.newvername);
                $('#install_gmc_helper').show();
                //$("#close_gmc_helper").show();
                $("#constituency").show();
            }
        } else if (msg.content.status == '1') { // 获取更新信息中
            $("#check_gmc_prompt").html("获取更新信息中,请等待!");
            /* setTimeout(function () {
             if (is_check_update == false && is_close_gmc_helper == false) {
             $("#check_gmc_prompt").html("获取信息失败!");
             $("#close_gmc_helper").show();
             }
             }, 10000);   // 10秒超时.如果10秒还没发送新的数据.就中断连接*/
        } else if (msg.content.status == '2') {  // 下载中（此情况可能由其他网页触发）
            $("#check_gmc_prompt").html("客户端下载中,请等待!");
        } else if (msg.content.status == '3') { // 安装中（此情况可能由其他网页触发）
            $("#check_gmc_prompt").html("客户端安装中,请等待!");
        }
    } else {    //  没有更新,直接下一步
        gmc_is_update_over = true;
        //关闭有可能用户在下载客户端，以及更新客户端时，设置现实的按钮
        $('#install_gmc_helper').hide();//关闭更新客户端的按钮
        $("#constituency").hide();//关闭继续游戏的按钮
        $("#close_gmc_helper").hide();//关闭关闭gmchelp的按钮
        $('#download_install').hide();//关闭首次下载gmc按钮
        $("#check_gmc_prompt").html('开始云游戏的必要程序已是最新版本');
        //新增逻辑
        var select_region = store.get('selected_region_id');
        if (select_region != undefined) {
            gls_login_success_next_step = 1;//加入队列
            if (gls_client.sock == null) {
                gls_client.start();
            } else {
                //如果gls已经连接，直接加入队列
                //正在加入队列提示
                gls_client.login();
                $("#check_gmc_prompt").html('请稍等，正在登录服务器');
            }
        } else {
            //首先选择线路
            $("#check_gmc_prompt").html("");
            $('#install_gmc_helper').hide();
            $("#close_gmc_helper").hide();
            $("#constituency").hide();
            $('#j_check_gmc_f').hide();
            $('#j_region_f').show();
            $("#region_queding").hide();
            $("#join_enqueue").show();
            //获取每个区域的上次测速信息
            get_region_data();
            if (gls_client.sock == null) {
                gls_login_success_next_step = 2;
                gls_client.start();
            } else {
                if (gls_user_is_login == 1) {
                    //获取所有区域排队信息
                    gls_client.allRegion();
                } else {
                    //登录gls
                    gls_login_success_next_step = 2;
                    gls_client.login();

                }
            }
        }
    }
}
gmc_client.onGameInfo = function (msg) {
    console.log('onGameInfo' + JSON.stringify(msg));
    if (msg.content.status != 0 && msg.content.status != 1 && gls_is_notify_gs_result == 0) {
        //通知gls gs连接状态
        var connect_gs_result = -1;
        if (msg.content.status == 2) {
            connect_gs_result = 0;
        } else if (msg.content.status == 3) {
            connect_gs_result = 2;
        } else if (msg.content.status == 4) {
            connect_gs_result = 3;
        }
        if (connect_gs_result != -1) {
            var select_region_id = store.get('selected_region_id');
            gls_client.sendConnectGSResult(connect_gs_result, "", select_region_id, game_gs_id);
            gls_is_notify_gs_result = 1;
        }
    }
    if (msg.content.userdata != '') {
        $('#j_start_game').html('正在游戏中');
        $('#j_start_game').css('background-color', '#b7b7b7');
        player_game = true;
        setTimeout(function () {
            gmc_client.gameinfo_query();
        }, 3000);    //  gmc窗体在运行时,每5秒检测一次是否存在
    } else {
        //清除计时
        clearInterval(countdown_timer);
        player_game = false;
        $("#DivLocker").hide();
        select_region_id = store.get('selected_region_id');
        $('#j_start_game').css('background-color', '#151515');
        gls_client.dequeue(select_region_id);//退出原来的排队
        modify_start_game_by_ajax(account_id, game_id)
    }
};
//  update-download
gmc_client.onDownload = function (msg) {
    is_check_update == true;
    var progress = Math.floor(msg.content.progress) + "%";
    if (msg.content.status == '0') {   // 即将开始下载
        $("#check_gmc_prompt").html("客户端即将开始下载,请等待!");
    } else if (msg.content.status == '1') { // 下载中
        $("#check_gmc_prompt").html("下载进度:" + progress);
        console.log("download progress:" + progress);
        is_close_gmc_helper = false;
    } else if (msg.content.status == '2') { // 下载成功
        $("#check_gmc_prompt").html('下载成功,正在安装客户端,请等待!');
    } else if (msg.content.status == '3') { // 下载失败
        $("#check_gmc_prompt").html('下载失败,进度:' + progress + '失败原因' + msg.content.reason);
        $('#install_gmc_helper').hide();
        $("#close_gmc_helper").show();
        $("#constituency").hide();
        // $('#j_check_gmc_f').show(); //   下载失败
        is_close_gmc_helper = true;
    }
}

// update-install
gmc_client.onInstall = function (msg) {
    console.log("onInstall: json_data:" + JSON.stringify(msg) + "\n");
    gmc_is_install = true;
    var progress = Math.floor(msg.content.progress) + "%";
    if (msg.content.status == '0') {   // 即将开始安装
        $("#check_gmc_prompt").html("客户端即将开始安装,请等待!");
    } else if (msg.content.status == '1') { // 安装中
        $("#check_gmc_prompt").html("最新客户端安装中");
        console.log("install progress:" + progress);
        is_gmc_update = 1;
    } else if (msg.content.status == '2') { // 安装成功
        $("#check_gmc_prompt").html('安装成功');
        //更新完后，设置状态值
        is_gmc_update = 1;
        $("#constituency").show();
        // $("#close_gmc_helper").show();
    } else if (msg.content.status == '3') { // 安装失败
        $("#check_gmc_prompt").html('安装失败,进度:' + progress + "失败原因" + msg.content.reason);
        $("#constituency").hide();
        $("#close_gmc_helper").show();
        is_close_gmc_helper = true;
    }
}
