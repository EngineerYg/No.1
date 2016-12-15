/**
 * Created by MyPC on 2015/12/16.
 */
    //gls 通信
gls_client.onOpen = function () {
    //连接成功后，登录gls
    gls_client.login();
}
gls_client.onError = function () {
    write_tip_message("连接gls服务器失败，请重试");
    return;
}
gls_client.onLogin = function (msg) {
    console.log("onLogin: ret:" + msg.result + " msg:" + msg.result_msg + "\n");
    if (msg.result != 0) {
        if (is_display_logintoken_error < 2) {
            is_display_logintoken_error++;
            write_tip_message("登录令牌错误，请重新登录");
            return;
        }
    } else {
        if (user_vip_level == 2) {
            //超级vip 登录后先查询是否有游戏挂起
            gls_client.sendRunningGames(false);
        } else {
            //设置登录gls成功变量
            gls_user_is_login = 1;
            var select_region_id = store.get('selected_region_id');

            console.log("gls_login_success_next_step:" + gls_login_success_next_step);
            //登录成功后的操作
            if (gls_login_success_next_step == 1) {
                //加入队列操作
                gls_client.enqueue(select_region_id, game_id, game_mode, payment_type, save_id, serial_id);

            } else if (gls_login_success_next_step == 2) {
                //获取所有线路的排队信息
                gls_client.allRegion();
            } else if (gls_login_success_next_step == 3) {
                gls_client.oneRegion(select_region_id);
            }
            else {
                //加入队列操作
                gls_client.enqueue(select_region_id, game_id, game_mode, payment_type, save_id, serial_id);
            }
        }
    }
}
//查找是否有游戏挂起响应
gls_client.onRunningGames = function (msg) {
    console.log("onRunningGames: " + JSON.stringify(msg) + "\n");
    if (msg.result == 0 && msg.hasOwnProperty('running_game')) {
        var continue_game;
        continue_game = msg.running_game;
        console.log("onRunningGames: " + JSON.stringify(continue_game) + "\n");
        var sgame_id = continue_game.game_id;
        if (sgame_id) {
            //获取游戏的信息
            $.ajax({
                type: "POST",
                dataType: "json",
                url: '/index.php/Gameajax/get_game_info',
                data: "game_id=" + sgame_id,
                success: function (result) {
                    if (result.code == 0) {
                        var game_name = result.data.game_name;
                        var game_low_bitrate = result.data.low_bitrate;
                        var game_mid_bitrate = result.data.mid_bitrate;
                        var game_high_bitrate = result.data.high_bitrate;
                        //gameimggc = result.data.control_pic;
                        //gameimgkm = result.data.keyboard_control_pic;
                        var game_is_jianpan = result.data.is_jianpan;
                        var game_is_shoubing = result.data.is_shoubing;
                        var game_auth = result.data.action;
                        var gameimgkm;
                        var gameimggc;
                        var game_mode;
                        if (game_is_jianpan == 1) {
                            var gameimgkm = result.data.keyboard_control_pic;
                        } else {
                            gameimgkm = "";
                        }
                        if (game_is_shoubing == 1) {
                            gameimggc = result.data.control_pic;
                        } else {
                            gameimggc = "";
                        }
                        //开始处理继续游戏gmc参数
                        //继续游戏前设置参数
                        var videobitrate_local = store.get('videobitrate');
                        var videobitrate = 0;//默认为流畅
                        if (videobitrate_local != undefined) {
                            videobitrate = videobitrate_local;
                        }
                        //使用的协议设置
                        var xy = store.get('protocol');
                        if (xy != undefined) {
                            if (xy == 'UDP') {
                                if (continue_game.gs_udp_port) {
                                    gmc_client.gstcpport = continue_game.gs_udp_port;
                                    gmc_client.gsudpport = continue_game.gs_udp_port;
                                }
                            } else {
                                gmc_client.gstcpport = continue_game.gs_tcp_port;
                                gmc_client.gsudpport = continue_game.gs_udp_port;
                            }
                        } else {
                            gmc_client.gstcpport = continue_game.gs_tcp_port;
                            gmc_client.gsudpport = continue_game.gs_udp_port;
                        }
                        //所使用屏幕分辨率
                        var width = 848;
                        var height = 480;
                        var screen_resolution = store.get('screen_resolution');
                        if (screen_resolution != undefined) {
                            if (screen_resolution == '480') {
                                width = 848;
                                height = 480;
                            }
                            if (screen_resolution == '576') {
                                width = 1024;
                                height = 576;
                            }
                            if (screen_resolution == '720') {
                                width = 1280;
                                height = 720;
                            }
                        }
                        //输入设备判断
                        var input_device;
                        if (game_is_jianpan == 1 && game_is_shoubing == 1) {
                            input_device = store.get('inputdevice');
                            if (input_device == undefined) {
                                input_device = 1;
                            }
                        } else {
                            if (game_is_jianpan == 1) {
                                input_device = 1;
                            }
                            if (game_is_shoubing == 1) {
                                input_device = 0;
                            }
                        }
                        game_gs_id = continue_game.gs_id;
                        gmc_client.userdata = 'abc';
                        gmc_client.userid = account_id;
                        gmc_client.username = nickname;
                        gmc_client.level = user_level;
                        gmc_client.viplevel = user_vip_level;
                        gmc_client.reconnect = user_is_reconnect;
                        gmc_client.deviceuuid = device_uuid;
                        gmc_client.logintoken = login_token;
                        gmc_client.gsmid = continue_game.gsm_id;
                        gmc_client.gsip = continue_game.gs_ip;
                        gmc_client.gsmtoken = continue_game.gsm_token;
                        gmc_client.gameid = sgame_id;
                        gmc_client.gamemode = continue_game.game_mode;
                        gmc_client.gameimggc = gameimggc;
                        gmc_client.gameimgkm = gameimgkm;
                        gmc_client.width = width;
                        gmc_client.height = height;
                        gmc_client.payment = continue_game.payment_type;
                        gmc_client.saveid = continue_game.save_id;
                        gmc_client.serialid = continue_game.serial_id;
                        gmc_client.gamename = game_name;
                        gmc_client.inputdevice = input_device;
                        gmc_client.videobitratefluent = game_low_bitrate;
                        gmc_client.videobitratestandard = game_mid_bitrate;
                        gmc_client.videobitratehigh = game_high_bitrate;
                        gmc_client.videobitrate = videobitrate;
                        gmc_client.reconnect = 1;
                        //网页游戏参数赋值
                        web_userid=account_id;
                        web_device_uuid= device_uuid;
                        web_logintoken=login_token;
                        web_gsmid=continue_game.gsm_id;
                        web_gsip=continue_game.gs_ip;
                        web_gsmtoken=continue_game.gsm_token;
                        web_gameid=continue_game.game_id;
                        web_gamemode=continue_game.game_mode;
                        web_width=width;
                        web_height=height;
                        web_payment=continue_game.payment_type;
                        web_serialid=serial_id;
                        web_saveid= save_id;
                        web_inputdevice= input_device;
                        web_videobitratefluent= game_low_bitrate;
                        web_videobitratestandard= game_mid_bitrate;
                        web_videobitratehigh= game_high_bitrate;
                        web_videobitrate= videobitrate;
                        web_reconnect = 1;
                        web_gsudpport=gmc_client.gsudpport;
                        web_gstcpport=gmc_client.gstcpport;

                        web_start_game_url="index.php/Game/startgame/web_userid/"+
                        web_userid+"/web_device_uuid/"+web_device_uuid+"/web_logintoken/"+web_logintoken+
                        "/web_gsmid/"+web_gsmid+"/web_gsip/"+web_gsip+"/web_gsmtoken/"+web_gsmtoken+
                        "/web_gameid/"+web_gameid+"/web_gamemode/"+web_gamemode+"/web_width/"+web_width+
                        "/web_height/"+web_height+"/web_payment/"+web_payment+"/web_serialid/"+web_serialid+
                        "/web_saveid/"+web_saveid+"/web_inputdevice/"+web_inputdevice+
                        "/web_videobitratefluent/"+web_videobitratefluent+"/web_videobitratestandard/"+web_videobitratestandard+
                        "/web_videobitratehigh/"+web_videobitratehigh+"/web_videobitrate/"+web_videobitrate+
                        "/web_gsudpport/"+web_gsudpport+"/web_gstcpport/"+web_gstcpport;

                        $('#j_check_gmc_f').hide();
                        $("#j_continue_game_f").show();
                    }
                }
            });
        }
    } else {
        //设置登录gls成功变量
        gls_user_is_login = 1;
        var select_region_id = store.get('selected_region_id');

        console.log("gls_login_success_next_step:" + gls_login_success_next_step);
        //登录成功后的操作
        if (gls_login_success_next_step == 1) {
            //加入队列操作
            gls_client.enqueue(select_region_id, game_id, game_mode, payment_type, save_id, serial_id);

        } else if (gls_login_success_next_step == 2) {
            //获取所有线路的排队信息
            gls_client.allRegion();
        } else if (gls_login_success_next_step == 3) {
            gls_client.oneRegion(select_region_id);
        }
        else {
            //加入队列操作
            gls_client.enqueue(select_region_id, game_id, game_mode, payment_type, save_id, serial_id);
        }
    }
}
gls_client.onOneRegion = function (msg) {
    if (msg.result == 0) {
        var t = msg.status.queue_curr_num + '人排队'
        $("#queue_max_size_" + msg.status.select_region_id).text(t);
    }
}
gls_client.onAllRegion = function (msg) {
    console.log(msg.regions);
    if (msg.hasOwnProperty('regions') !== false) {
        var regions = JSON.stringify(msg.regions);
        msg.regions.forEach(function (region) {
            console.log(region.queue_curr_num + " times.\n");
            var t = region.queue_curr_num + '人排队'
            $("#queue_max_size_" + region.region_id).text(t);
            //  $(".region_id_" + region.region_id + " #queue_max_size").html(region.queue_curr_num + '人排队');
        });
    }
}
//  排队结果返回
gls_client.onEnqueue = function (msg) {
    console.log("onEnqueue: ret:" + msg.result + " msg:" + msg.result_msg + "\n");
    //重置状态值
    if (msg.result != 0) {
        write_tip_message("排队失败,原因为：" + msg.result_msg);
        return;
    } else {
        if (player_game == false) {
            join_queue_time = Date.parse(new Date());
            //显示排队信息
            $('#queue_list').show();
            $("#DivLocker").show();
            //退出队列按钮显示
            $('#dequeue').show();
            var videobitrate_local = store.get('videobitrate');
            if (videobitrate_local != undefined) {
                if (videobitrate_local == 0) {
                    $("#j_qingxidu").text("流畅");
                }
                if (videobitrate_local == 1) {
                    $("#j_qingxidu").text("标清");
                }
                if (videobitrate_local == 2) {
                    if (user_vip_level != 2) {
                        $("#j_qingxidu").text("标清");
                    } else {
                        $("#j_qingxidu").text("高清");
                    }
                }
            } else {
                $("#j_qingxidu").text("流畅");
            }
            //所使用屏幕分辨率
            var screen_resolution = store.get('screen_resolution');
            if (screen_resolution != undefined) {
                if (user_is_svip != 1 && user_is_vip != 1) {
                    if (screen_resolution == '720') {
                        $("#screen_resolution").text("576P");
                    } else {
                        if (screen_resolution == '480') {
                            $("#screen_resolution").text("480P");
                        }
                        if (screen_resolution == '576') {
                            $("#screen_resolution").text("576P");
                        }
                    }
                } else {
                    if (screen_resolution == '480') {
                        $("#screen_resolution").text("480P");
                    }
                    if (screen_resolution == '576') {
                        $("#screen_resolution").text("576P");
                    }
                    if (screen_resolution == '720') {
                        $("#screen_resolution").text("720P");
                    }
                }
            }
            var input_device = store.get('inputdevice');
            if (game_is_jianpan == 1 && game_is_shoubing == 1) {
                input_device = store.get('inputdevice');
                if (input_device == undefined) {
                    input_device = 1;
                }
                if (input_device == 1) {
                    $("#inputdevice").text("键鼠");
                } else if (input_device == 0) {
                    $("#inputdevice").text("手柄");
                }

            } else {
                if (game_is_jianpan == 1) {
                    $("#inputdevice").text("键鼠");
                    input_device = 1;
                }
                if (game_is_shoubing == 1) {
                    $("#inputdevice").text("手柄");
                    input_device = 0;
                }
            }
            //游戏启动方式
            var start_method = store.get('start_method');
            if (start_method != undefined) {
                $("#start_method").text(start_method);
            }
            //关闭线路浮窗，关闭检测jmc浮窗
            $('#j_region_f').hide();
            $('#j_check_gmc_f').hide();
        }
    }
}
//退出队列响应
gls_client.onDequeue = function (msg) {
    console.log("onDequeue: ret:" + msg.result + " msg:" + msg.result_msg + "\n");
    if (msg.result == 0) {
        is_open_game = 0;
        if (player_game == false) {
            $('#queue_list').hide();
        }
    }
}
//  获取队列的信息
gls_client.onQueueStatus = function (queueList) {
    console.log("onQueueStatus: " + JSON.stringify(queueList) + "\n");
    if (queueList.hasOwnProperty('queues') !== false) {
        if (player_game == false) {
            // TODO: 切换到排队界面，并显示排队状况
            /*$("#DivLocker").show();
            $('#queue_list').show();*/
            $('#region_name').html(queueList.queues[0].region_name);
            $('#queue_pop_nums').html(queueList.queues[0].pos);
            $('#queue_nums').html(queueList.queues[0].queue_curr_num);
            $('#queue_status').html(queueList.queues[0].queue_status);
        } else {
            $("#DivLocker").hide();
            $('#queue_list').hide();
        }
    }
}
// 服务器端
gls_client.onKick = function () {
    console.log('服务器已断开连接!');
    gls_client.auto_reconnect = false;  // gls 服务器主动断开连接...不进行重连
    gmc_client.auto_reconnect = false;  // 不重连GMC
    //location.reload();
}
// 当用户排队前面没有人的时候，gls自动 连接到GS.启动客户端
gls_client.onConnectGS = function (msg) {
    console.log('onConnectGS' + JSON.stringify(msg));
    var videobitrate_local = store.get('videobitrate');
    var videobitrate = 0;//默认为流畅
    if (videobitrate_local != undefined) {
        if (user_is_svip != 1 && user_is_vip != 1) {
            if (videobitrate_local == 2 || videobitrate_local == 3) {
                videobitrate = 0;//默认为流畅
            }
        } else {
            videobitrate = videobitrate_local;
        }
    }
    //使用的协议设置
    var xy = store.get('protocol');
    if (xy != undefined) {
        if (xy == 'UDP') {
            if (msg.gs_udp_port) {
                gmc_client.gstcpport = msg.gs_udp_port;
                gmc_client.gsudpport = msg.gs_udp_port;
            }
        } else {
            gmc_client.gstcpport = msg.gs_tcp_port;
            gmc_client.gsudpport = msg.gs_udp_port;
        }
    } else {
        gmc_client.gstcpport = msg.gs_tcp_port;
        gmc_client.gsudpport = msg.gs_udp_port;
    }
    //所使用屏幕分辨率
    var width = 848;
    var height = 480;
    var screen_resolution = store.get('screen_resolution');
    if (screen_resolution != undefined) {
        if (user_is_svip != 1 && user_is_vip != 1) {
            if (screen_resolution == '720') {
                width = 1024;
                height = 576;
            } else {
                if (screen_resolution == '480') {
                    width = 848;
                    height = 480;
                }
                if (screen_resolution == '576') {
                    width = 1024;
                    height = 576;
                }
            }
        } else {
            if (screen_resolution == '480') {
                width = 848;
                height = 480;
            }
            if (screen_resolution == '576') {
                width = 1024;
                height = 576;
            }
            if (screen_resolution == '720') {
                width = 1280;
                height = 720;
            }
        }
    }
    //输入设备判断
    var input_device;
    if (game_is_jianpan == 1 && game_is_shoubing == 1) {
        input_device = store.get('inputdevice');
        if (input_device == undefined) {
            input_device = 1;
        }
    } else {
        if (game_is_jianpan == 1) {
            input_device = 1;
        }
        if (game_is_shoubing == 1) {
            input_device = 0;
        }
    }

    game_gs_id = msg.gs_id;
    gmc_client.userdata = 'abc';
    gmc_client.userid = account_id;
    gmc_client.username = nickname;
    gmc_client.level = user_level;
    gmc_client.viplevel = user_vip_level;
    gmc_client.reconnect = user_is_reconnect;
    gmc_client.deviceuuid = device_uuid;
    gmc_client.logintoken = login_token;
    gmc_client.gsmid = msg.gsm_id;
    gmc_client.gsip = msg.gs_ip;
    gmc_client.gsmtoken = msg.gsm_token;
    gmc_client.gameid = msg.game_id;
    gmc_client.gamemode = msg.game_mode;
    gmc_client.gameimggc = gameimggc;
    gmc_client.gameimgkm = gameimgkm;
    gmc_client.width = width;
    gmc_client.height = height;
    gmc_client.payment = msg.payment_type;
    gmc_client.saveid = save_id;
    gmc_client.serialid = serial_id;
    gmc_client.gamename = game_name;
    gmc_client.inputdevice = input_device;
    gmc_client.videobitratefluent = game_low_bitrate;
    gmc_client.videobitratestandard = game_mid_bitrate;
    gmc_client.videobitratehigh = game_high_bitrate;
    gmc_client.videobitrate = videobitrate;
    gmc_client.reconnect = 0;
    is_gls_connect_gls_status = true;
    //网页游戏参数赋值
    web_userid=account_id;
    web_device_uuid= device_uuid;
    web_logintoken=login_token;
    web_gsmid=msg.gsm_id;
    web_gsip=msg.gs_ip;
    web_gsmtoken=msg.gsm_token;
    web_gameid=msg.game_id;
    web_gamemode=msg.game_mode;
    web_width=width;
    web_height=height;
    web_payment=msg.payment_type;
    web_serialid=serial_id;
    web_saveid= save_id;
    web_inputdevice= input_device;
    web_videobitratefluent= game_low_bitrate;
    web_videobitratestandard= game_mid_bitrate;
    web_videobitratehigh= game_high_bitrate;
    web_videobitrate= videobitrate;
    web_reconnect = 0;
    web_gsudpport=gmc_client.gsudpport;
    web_gstcpport=gmc_client.gstcpport;

    web_start_game_url="index.php/Game/startgame/web_userid/"+
    web_userid+"/web_device_uuid/"+web_device_uuid+"/web_logintoken/"+web_logintoken+
    "/web_gsmid/"+web_gsmid+"/web_gsip/"+web_gsip+"/web_gsmtoken/"+web_gsmtoken+
    "/web_gameid/"+web_gameid+"/web_gamemode/"+web_gamemode+"/web_width/"+web_width+
    "/web_height/"+web_height+"/web_payment/"+web_payment+"/web_serialid/"+web_serialid+
    "/web_saveid/"+web_saveid+"/web_inputdevice/"+web_inputdevice+
    "/web_videobitratefluent/"+web_videobitratefluent+"/web_videobitratestandard/"+web_videobitratestandard+
    "/web_videobitratehigh/"+web_videobitratehigh+"/web_videobitrate/"+web_videobitrate+
    "/web_gsudpport/"+web_gsudpport+"/web_gstcpport/"+web_gstcpport;
    $('#open_game').show();
    is_may_start_game=1;//可以开始游戏
    //按钮倒计时 -- 限制 120 秒
    if (user_vip_level == 2) {
        var count = msg.svip_wait_timeout;
    } else if (user_vip_level == 1) {
        var count = msg.vip_wait_timeout;
    } else {
        var count = msg.nonvip_wait_timeout;
    }
    //$('#open_game').text("开始游戏" + count);
    $('#open_game_btn').text("开始游戏" + count);
    function CountDown() {
        //$('#open_game').text("开始游戏" + count);
        $('#open_game_btn').text("开始游戏" + count);

        if (count == 0) {
            //关闭队列信息浮层
            $("#queue_list").hide();
            //重新排队浮层出现
            $("#restart_queue").show();
            select_region_id = store.get('selected_region_id');
            gls_client.dequeue(select_region_id);
            clearInterval(countdown_timer);
        }
        count--;
    }

    countdown_timer = setInterval(CountDown, 1000);
    // }
}
//  服务器推送通知
gls_client.onNotify = function (msg) {
    if (msg.type == 3) {
        var notify = JSON.parse(msg.notify);
        console.log("onNotify: type:" + msg.type + " notify:" + notify.toast + "\n");
    } else if (msg.type == 2) {
        //存档上传完成，改变页面上存档的状态
        var message_html = "<h5>存档上传成功,请刷新页面</h5>";
        $("#gamesave_kong_" + msg.notify.save_id).html(message_html);
    } else
        console.log("onNotify: type:" + msg.type + " notify:" + msg.notify + "\n");
}
